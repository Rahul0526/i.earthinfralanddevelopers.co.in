using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using System.Web.Services;
using System.Text;
using System.Net;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;

public partial class admin_Teach : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            try
            {
                con.Open();
                string query = "SELECT * FROM words_categories";
                SqlDataAdapter adpt = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                adpt.Fill(dt);
                categoriesList1.DataSource = dt;
                categoriesList1.DataBind();
                categoriesList1.DataTextField = "category";
                categoriesList1.DataValueField = "id";
                categoriesList1.DataBind();
                categoriesList1.Items.Insert(0, new ListItem("--select--", "0"));
                categoriesList1.SelectedIndex = 0;

                categoryList.DataSource = dt;
                categoryList.DataBind();
                categoryList.DataTextField = "category";
                categoryList.DataValueField = "id";
                categoryList.DataBind();
                categoryList.Items.Insert(0, new ListItem("--select--", "0"));
                categoryList.SelectedIndex = 0;

                newCategory.DataSource = dt;
                newCategory.DataBind();
                newCategory.DataTextField = "category";
                newCategory.DataValueField = "id";
                newCategory.DataBind();
                newCategory.Items.Insert(0, new ListItem("--select--", "0"));
                newCategory.SelectedIndex = 0;
                //string wordsListQuery = "SELECT * FROM words_list where word like 'a%' ORDER BY word ASC";
                //SqlCommand getList = new SqlCommand(wordsListQuery);
                //getList.Connection = con;
                //SqlDataReader reader = getList.ExecuteReader();
                //string prevChar = "";
                //string curChar = "";
                //string word = "";
                //string html = string.Empty;
                //if (reader.HasRows)
                //{
                //    while (reader.Read()) {
                //        word = (string)reader[1];
                //        curChar = Convert.ToString(word[0]);
                //        if (prevChar == "")
                //        {
                //            html = string.Format("<div class='list' data-target='{0}'><span>{1}</span>", curChar.ToUpper(), word);
                //        }
                //        else if (curChar == prevChar)
                //        {
                //            html += string.Format("<span>{0}</span>", word);
                //        }
                //        else
                //        {
                //            html += string.Format("</div><div class='list' data-target='{0}'><span>{1}</span>", curChar.ToUpper(), word);
                //        }
                //        prevChar = curChar;
                //    }
                //    html += "</div>";
                //}
                //reader.Close();
                //wordList.InnerHtml = html;
            }
            catch (Exception ex) { }
            finally { 
                con.Close();
            }
        }
    }


    [WebMethod]
    public static string Add_Sub_category(string category_Id, string subcategory)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            int categoryId = Convert.ToInt32(category_Id);
            con.Open();
            string command = "IF NOT EXISTS (SELECT * FROM words_sub_categories WHERE category_id='{0}' AND sub_category='{1}') "
                            + "INSERT INTO words_sub_categories(category_id, sub_category) VALUES('{0}','{1}')";
            SqlCommand cmd = new SqlCommand(string.Format(command, category_Id, subcategory), con);
            cmd.Connection = con;
            int Response = cmd.ExecuteNonQuery();
            con.Close();
            return "updated";
        }
        catch
        {
            return "";
        }
    }

    [WebMethod]
    public static string AddNewWord(string word)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
            string command = "IF NOT EXISTS ( SELECT 1 FROM words_list WHERE word = '" + word + "' COLLATE SQL_Latin1_General_CP1_CS_AS )"
                            + " BEGIN"
                            + " INSERT INTO words_list (word) OUTPUT INSERTED.ID VALUES ('" + word + "')"
                            + " END";
            SqlCommand cmd = new SqlCommand(command, con);
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
            return "success";
        }
        catch
        {
            return "";
        }
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
            string wordsListQuery = string.Format("SELECT TOP {2} id,word FROM words_list where word like '{0}%' AND id > {1} ORDER BY word ASC", searchChar, lastId, rowcounts);
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
            if (html == "") {
                html = "No results found";
            }
            reader.Close();
            con.Close();
            return html;
        }
        catch
        {
            return html;
        }
        finally {
        }
    }

    [WebMethod]
    public static string CategoryChanged(string word_id, string category_Id)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            if (word_id.Trim() != "") {
                con.Open();
                string command = "UPDATE words_list SET category='" + category_Id + "' WHERE id=" + word_id;
                SqlCommand cmd = new SqlCommand(command, con);
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            int categoryId = Convert.ToInt32(category_Id);
            con.Open();
            string query = "SELECT * FROM words_sub_categories WHERE category_id = " + categoryId;
            SqlCommand chkClick = new SqlCommand(query);
            chkClick.Connection = con;
            SqlDataReader reader = chkClick.ExecuteReader();
            string html = string.Empty;
            if (reader.HasRows)
            {
                html = "<option value=\"0\">--select--</option>";
                while (reader.Read())
                {
                    html += string.Format("<option value=\"{0}\">{1}</option>", reader[2], reader[2]);
                }
            }
            else
            {
                html = "<option value=\"0\">--no sub-category found--</option>";
            }
            reader.Close();
            con.Close();
            return html;
        }
        catch
        {
            return "error";
        }
    }


    [WebMethod]
    public static string Word_Changed(string word)
    {
        try
        {
             SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
            string command = "SELECT TOP 1 [id],[word],[category],[sub_category],[image],[blocked] FROM words_list wl WHERE word = '" + word + "' COLLATE SQL_Latin1_General_CP1_CS_AS";
            SqlCommand chkClick = new SqlCommand(command);
            chkClick.Connection = con;
            SqlDataReader reader = chkClick.ExecuteReader();
            string html = string.Empty;
            if (reader.HasRows)
            {
                reader.Read();
                html = string.Format("{0},{1},{2},{3},{4},{5}", reader[0], reader[1], reader[2], reader[3], reader[4], reader[5]);
            }
            reader.Close();
            con.Close();
            return html;
        }
        catch
        {
            return "error";
        }
    }

    [WebMethod]
    public static void ChangeSubCategory(string wordId, string subCategory)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
            string command = "UPDATE words_list SET sub_category='" + subCategory + "' WHERE id=" + wordId;
            SqlCommand cmd = new SqlCommand(command, con);
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch
        {
        }
    }

    [WebMethod]
    public static void ChangeBlacklist(string wordId, string blacklist)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
            string command = "UPDATE words_list SET blocked=" + blacklist + " WHERE id=" + wordId;
            SqlCommand cmd = new SqlCommand(command, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch
        {
        }
    }

    [WebMethod]
    public static string GetExtendedWords(string word)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            //string command = "SELECT word FROM words_list WHERE word COLLATE SQL_Latin1_General_CP1_CS_AS LIKE '" + word + " %'";
            //SqlDataReader reader = cmd.ExecuteReader();
            //string html = string.Empty;
            //if (reader.HasRows)
            //{
            //    while (reader.Read())
            //    {
            //        html += string.Format("<li data-full-word='{0}'>{1}</li>", reader[0].ToString(), Regex.Replace(reader[0].ToString(), word + " ", ""));
            //    }
            //}
            //reader.Close();

            string rules = "";
            string currentRulesQuery = string.Format("SELECT TOP 1 super_entity, category, sub_category FROM words_deeptraining wd WHERE entity COLLATE SQL_Latin1_General_CP1_CS_AS = '{0}'", word);
            cmd.CommandText = currentRulesQuery;
            SqlDataReader rulesReader = cmd.ExecuteReader();
            if (rulesReader.HasRows)
            {
                rulesReader.Read();
                rules = string.Format("{0}$#${1}$#${2}", Regex.Replace(rulesReader[0].ToString(), @"\|", "\n"), rulesReader[1], rulesReader[2]);
            }
            rulesReader.Close();
            con.Close();
            return rules;
        }
        catch
        {
            return "error";
        }
    }

    [WebMethod]
    public static string DeepTraining(string entity, string category, string sub_category, string super_entities)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        con.Open();
        try
        {
            string command = "IF EXISTS (SELECT * FROM words_deeptraining WHERE entity = '{0}' AND category={1} AND sub_category = '{2}') "
                            + "UPDATE words_deeptraining SET super_entity = '{3}' WHERE entity = '{0}' AND category={1} AND sub_category = '{2}' "
                            + "ELSE "
                            + "INSERT INTO words_deeptraining(entity, category, sub_category, super_entity) VALUES ('{0}',{1},'{2}','{3}')";
            command = string.Format(command, entity, category, sub_category, super_entities);
            SqlCommand cmd = new SqlCommand(command, con);
            cmd.ExecuteNonQuery();
            con.Close();
            return "success";
        }
        catch
        {
            con.Close();
            return "error";
        }
    }
}