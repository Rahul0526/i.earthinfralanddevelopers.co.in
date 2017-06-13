using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.IO;

public partial class admin_newWords : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        string wordsListQuery = string.Format("SELECT TOP 1 * FROM NLP_Settings where settingName = 'data storage'");
        SqlCommand getList = new SqlCommand(wordsListQuery);
        getList.Connection = con;
        SqlDataReader reader = getList.ExecuteReader();
        if (reader.HasRows)
        {
            reader.Read();
            dataStorage.Checked = (Convert.ToInt32(reader[2].ToString()) == 1) ? true : false;
        }
        reader.Close();
        con.Close();
    }

    [WebMethod]
    public static string Get_Word(string searchChar, string lastId)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        con.Open();
        string html = "";
        int rowcounts = 500;
        try
        {
            string wordsListQuery = string.Format("SELECT TOP {2} id,word FROM words_new where word like '{0}%' AND id > {1} ORDER BY word ASC", searchChar, lastId, rowcounts);
            SqlCommand getList = new SqlCommand(wordsListQuery);
            getList.Connection = con;
            int rowCount = 0;
            SqlDataReader reader = getList.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    html += string.Format("<span data-id='{0}'>{1}</span>", reader[0], reader[1]);
                    rowCount++;
                }
                if (rowCount == rowcounts) html += "<span class='loadMore'>--show more--</span>";
            }
            if (html == "")
            {
                html = "<div class='no-results'>No results found</div>";
            }
            reader.Close();
            con.Close();
            return html;
        }
        catch
        {
            con.Close();
            return html;
        }
        finally
        {
        }
    }


    [WebMethod]
    public static string NewWordAction(string word, string wordId, string blocked)
    {
        try {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            string insertQuery = "IF NOT EXISTS ( SELECT 1 FROM words_list WHERE word = '{0}' COLLATE SQL_Latin1_General_CP1_CS_AS )"
                            + " BEGIN"
                            + " INSERT INTO words_list (word,blocked) OUTPUT INSERTED.ID VALUES ('{0}',{1})"
                            + " END; ";
            insertQuery = string.Format(insertQuery, word, blocked);

            cmd.CommandText = insertQuery.ToString();
            cmd.ExecuteNonQuery();

            // delete value from words_new table
            string deleteQuery = string.Format("DELETE words_new WHERE id={0}", wordId);
            cmd.CommandText = deleteQuery.ToString();
            cmd.ExecuteNonQuery();

            return "success";
        }
        catch {
            return "";
        }
    }

    [WebMethod]
    public static string EnableDisableDataStorage(string value)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            string UpdateQuery = string.Format("UPDATE NLP_Settings SET [value]='{0}' WHERE settingName = 'data storage'", value);

            cmd.CommandText = UpdateQuery.ToString();
            cmd.ExecuteNonQuery();

            return "success";
        }
        catch
        {
            return "";
        }
    }

    protected void uploadCsv_Click(object sender, EventArgs e)
    {
        if (csvFile.HasFile)
        {
            string fileName = Server.MapPath("tempFiles//" + csvFile.FileName);
            csvFile.SaveAs(fileName);
            List<string> dataList = this.ReadCsv(fileName);
            UploadMessage.InnerHtml = AddNewWords(dataList);
            File.Delete(fileName);
        }
    }

    private List<string> ReadCsv(string strFilePath)
    {
        List<string> listA = new List<string>();
        IDictionary<string, int> categorits = new Dictionary<string, int>();
        categorits["Business"] = 1;
        categorits["Economy"] = 2;
        categorits["Politics"] = 3;
        categorits["Entertainment"] = 4;
        categorits["Sport"] = 5;
        categorits["Technology"] = 6;
        categorits["Science-Environment"] = 7;
        categorits["Health"] = 8;
        string category = "";
        using (var fs = File.OpenRead(strFilePath))
        using (var reader = new StreamReader(fs))
        {
            while (!reader.EndOfStream)
            {
                var line = reader.ReadLine();
                var values = line.Split('\n')[0].Trim();
                if (values != "")
                {
                    if (values.Contains(','))
                    {
                        string[] val = values.Split(',');
                        const string query = "IF NOT EXISTS ( SELECT 1 FROM words_list WHERE word = '{0}' COLLATE SQL_Latin1_General_CP1_CS_AS )"
                            + " BEGIN"
                            + " INSERT INTO words_list (word,category,[sub_category]) OUTPUT INSERTED.ID VALUES ('{0}','{1}','{2}')"
                            + " END; ";
                        if (val[1].ToString().Trim() != "")
                        {
                            category = categorits[val[1].ToString().Trim()].ToString();
                        }
                        else
                        {
                            category = "";
                        }
                        listA.Add(string.Format(query, val[0].ToString().Trim(), category, val[2].ToString().Trim()));
                    }
                }
            }
        }
        return listA;
    }


    public string AddNewWords(List<string> li)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            StringBuilder insertQuery = new StringBuilder(string.Empty);
            int count = 0;
            foreach (string item in li)
            {
                insertQuery.AppendFormat(item);
                count++;
                if (count == 100)
                {
                    cmd.CommandText = insertQuery.ToString();
                    cmd.ExecuteNonQuery();
                    insertQuery = new StringBuilder(string.Empty);
                    count = 0;
                }
            }
            if (count > 0)
            {
                cmd.CommandText = insertQuery.ToString();
                cmd.ExecuteNonQuery();
            }
            con.Close();
            return "<span style='color: #32B659'>Successfully Added to Database...</span>";
        }
        catch
        {
            return "<span style='color: #FF552A'>Someting went wrong.</span>";
        }
    }
}