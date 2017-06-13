using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using Microsoft.VisualBasic.FileIO;
using SqlUtilities;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Collections;
using System.Linq.Expressions;


class IndexedList<T> : IEnumerable<T>
{
    List<T> _list;
    Dictionary<string, Dictionary<object, List<T>>> _dictionary;
    Dictionary<string, Func<T, object>> _propertyDictionary;

    public IndexedList(IEnumerable<string> propertyNames) : this(propertyNames, new List<T>()) { }

    public IndexedList(IEnumerable<string> propertyNames, IEnumerable<T> source)
    {
        _list = new List<T>();
        _dictionary = new Dictionary<string, Dictionary<object, List<T>>>();
        _propertyDictionary = BuildPropertyDictionary(propertyNames);
        foreach (var item in source)
        {
            Add(item);
        }
    }

    static Dictionary<string, Func<T, object>> BuildPropertyDictionary(IEnumerable<string> keys)
    {
        var propertyDictionary = new Dictionary<string, Func<T, object>>();
        foreach (string key in keys)
        {
            ParameterExpression parameter = Expression.Parameter(typeof(T), "parameter");
            Expression property = Expression.Property(parameter, key);
            Expression converted = Expression.Convert(property, typeof(object));
            Func<T, object> func = Expression.Lambda<Func<T, object>>(converted, parameter).Compile();
            propertyDictionary.Add(key, func);
        }
        return propertyDictionary;
    }

    public void Add(T item)
    {
        _list.Add(item);
        foreach (var kvp in _propertyDictionary)
        {
            object key = kvp.Value(item);
            Dictionary<object, List<T>> propertyIndex;
            if (!_dictionary.TryGetValue(kvp.Key, out propertyIndex))
            {
                propertyIndex = new Dictionary<object, List<T>>();
                _dictionary.Add(kvp.Key, propertyIndex);
            }
            List<T> list;
            if (!propertyIndex.TryGetValue(key, out list))
            {
                list = new List<T>();
                propertyIndex.Add(key, list);
            }
            propertyIndex[key].Add(item);
        }
    }

    public IEnumerable<T> GetByIndex<TIndex>(string propertyName, TIndex index)
    {
        return _dictionary[propertyName][index];
    }

    public IEnumerator<T> GetEnumerator()
    {
        return _list.GetEnumerator();
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return GetEnumerator();
    }
}


public partial class admin_test_page : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

    class DeepTraining {
        public string entity { get; set; }
        public int category { get; set; }
        public string super_entity { get; set; }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        List<DeepTraining> training = new List<DeepTraining>();
        training.Add(new DeepTraining { entity = "Amazon", category = 5, super_entity = "amazon rainforest" });
        training.Add(new DeepTraining { entity = "Amazon", category = 5, super_entity = "amazon forest" });
        training.Add(new DeepTraining { entity = "Amazon", category = 5, super_entity = "amazon jungle" });
        training.Add(new DeepTraining { entity = "Amazon", category = 5, super_entity = "amazon brazil" });
        foreach (var a in training) {
            text.InnerHtml += a.entity + " - " + a.category + " - " + a.super_entity + "<br/>";
        }
    }

    private List<string> ReadCsv(string strFilePath)
    {
        List<string> listA = new List<string>();
        using (var fs = File.OpenRead(strFilePath))
        using (var reader = new StreamReader(fs))
        {
            while (!reader.EndOfStream)
            {
                var line = reader.ReadLine();
                var values = line.Split('\n')[0].Trim();
                if (values != "")
                {
                    if (values.Contains('.'))
                    {
                        values = values.Split('.')[1].Trim();
                    }
                    listA.Add(values);
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
                //const string query = "INSERT INTO words_new(word) VALUES";
                const string query = "IF NOT EXISTS ( SELECT 1 FROM testTable WHERE word = '{0}' COLLATE SQL_Latin1_General_CP1_CS_AS )"
                            + " BEGIN"
                            + " INSERT INTO testTable (word) OUTPUT INSERTED.ID VALUES ('{0}')"
                            + " END; ";
                insertQuery.AppendFormat(query, item);
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
            return "Successfully Added to Database...";
        }
        catch {
            return "Someting went wrong.";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile) {
            string fileName = Server.MapPath("tempFiles//" + FileUpload1.FileName);
            FileUpload1.SaveAs(fileName);
            List<string> dataList = this.ReadCsv(fileName);
            Label1.Text = AddNewWords(dataList);
        }
    }

    public DataTable GetDataTableFromCSVFile(string csv_file_path)
    {
        DataTable csvData = new DataTable();
        try
        {
            using (TextFieldParser csvReader = new TextFieldParser(csv_file_path))
            {
                csvReader.SetDelimiters(new string[] { "," });
                csvReader.HasFieldsEnclosedInQuotes = true;
                //read column names  
                string[] colFields = csvReader.ReadFields();
                foreach (string column in colFields)
                {
                    DataColumn datecolumn = new DataColumn(column);
                    datecolumn.AllowDBNull = true;
                    csvData.Columns.Add(datecolumn);
                }
                while (!csvReader.EndOfData)
                {
                    string[] fieldData = csvReader.ReadFields();
                    
                    csvData.Rows.Add(fieldData);
                }
            }
        }
        catch (Exception ex)
        {
            //MessageBox.Show(ex.Message);  
        }
        return csvData;
    }  
}