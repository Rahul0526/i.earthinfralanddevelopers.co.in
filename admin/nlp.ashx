<%@ WebHandler Language="C#" Class="nlp" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using HtmlAgilityPack;


public class DeepTraining
{
    public string entity { get; set; }
    public int category { get; set; }
    public string sub_category { get; set; }
    public string super_entity { get; set; }
}

public class nlp : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string URL = context.Request["page"];
        string apikey = context.Request["apikey"];
        //string URL = "http://news.nationalgeographic.com/2017/04/jungle-dogs-peru-amazon-rare";
        string returnNewWords = "";
        string returnError = "";
        string _return = "";

        //string requestingIP = HttpContext.Current.Request.UserHostAddress;
        //string requestType = HttpContext.Current.Request.RequestType;
        if (apikey == "4a5075dbb713f58f60e3acf8f924fa41c9555287")
        {
            string textContent = "";
            int newWordsCount = 0;
            List<string> newWords = new List<string>();
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | (SecurityProtocolType)192 | (SecurityProtocolType)768 | (SecurityProtocolType)3072;

                string[] prepositionsArray = { "after", "the", "before", "at", "by", "for", "during", "from", "in", "except", "as", "like", "about", "with", "without", "above", "across", "along", "among", "at", "away from", "behind", "below", "beside", "between", "by", "for", "beyond", "by", "down", "from", "in", "in front of", "inside", "into", "near", "off", "on", "opposite", "out", "of", "outside", "over", "around", "through", "to", "towards", "under", "up" };
                List<string> prepotions = prepositionsArray.ToList();

                WebClient web = new WebClient();
                string pageContent = web.DownloadString(URL);
                // removeing content after footer tag
                //string[] content_arr = pageContent.Split(new[] { "<footer" }, StringSplitOptions.None);
                string html = pageContent;
                html = Regex.Replace(html, "Â", "");

                HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
                doc.LoadHtml(html);
                HtmlNodeCollection nodes = doc.DocumentNode.SelectNodes("//body//p[not(@class) and not(ancestor::div[contains(@style,'display:none')]) and not(ancestor::div[contains(@style,'display: none')]) and not(ancestor::header) and not(ancestor::footer) and not(ancestor::h1) and not(ancestor::h2) and not(ancestor::h3) and not(ancestor::h4) and not(ancestor::h5) and not(ancestor::h6)]//text()");
                foreach (HtmlNode node in nodes)
                {
                    textContent += node.InnerText + Environment.NewLine;
                }
                textContent = Regex.Replace(textContent, "â€™", "'");
                textContent = Regex.Replace(textContent, "â€œ", "\"");
                //textContent = Regex.Replace(textContent, "Â", " ");
                textContent = Regex.Replace(textContent, "â€", "\"");
                textContent = Regex.Replace(textContent, @"(&quot;)", "\"");

                con.Open();
                string testString = Regex.Replace(textContent, "['’]", " ");
                testString = Regex.Replace(testString, "[0-9!@#$%^&*():;,.\"’'\\/\r\t\n|]", "");
                List<string> testContent = testString.Split(' ').Where(s => !string.IsNullOrWhiteSpace(s)).ToList();
                string testQuery = string.Empty;
                if (testContent.Count < 15)
                {
                    string x = "";
                    for (int i = 0; i < testContent.Count; i++)
                    {
                        x += x == "" ? "'" + testContent[i] + "'" : ",'" + testContent[i] + "'";
                    }
                    testQuery = string.Format("SELECT word FROM words_list WHERE word in ({0})", x);
                }
                else
                {
                    testQuery = string.Format("SELECT word FROM words_list WHERE word in ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}')", testContent[0], testContent[1], testContent[2], testContent[3], testContent[4], testContent[5], testContent[6], testContent[7], testContent[8], testContent[9], testContent[10], testContent[11], testContent[12], testContent[13], testContent[14]);
                }
                SqlCommand testCommand = new SqlCommand(testQuery);
                testCommand.Connection = con;
                SqlDataReader readerCheck = testCommand.ExecuteReader();
                int foundWords = 0;
                if (readerCheck.HasRows)
                {
                    while (readerCheck.Read()) { foundWords++; }
                }
                readerCheck.Close();
                con.Close();

                if (foundWords >= 7)
                {
                    string[] textualContent = getEnglishString(textContent);

                    string pageText = textualContent[0];
                    string keywordsString = textualContent[1];
                    //string entitiesString = ". " + textualContent[2];

                    con.Open();
                    string queryBlacklisted = "SELECT word FROM words_list WHERE blocked=1";
                    SqlCommand BlkLstWords = new SqlCommand(queryBlacklisted);
                    BlkLstWords.Connection = con;
                    SqlDataReader reader = BlkLstWords.ExecuteReader();
                    List<string> blacklistedWords = new List<string>();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            string blacklistedWord = reader[0].ToString();
                            blacklistedWords.Add(blacklistedWord);
                        }
                    }
                    reader.Close();
                    con.Close();

                    List<string> keywordsArray = new List<string>(keywordsString.Split(' '));
                    keywordsArray = keywordsArray.Where(s => !string.IsNullOrWhiteSpace(s)).ToList();
                    bool isCaps = false;
                    char ch;
                    bool check = false;
                    //
                    // FETCHING KEYWORDS
                    //
                    string keywords = string.Empty;
                    string entities = string.Empty;
                    int wordsCount = 0;
                    int iterationCount = 0;
                    while (iterationCount < keywordsArray.Count)
                    {
                        string listItem = keywordsArray[iterationCount].Trim();
                        ch = listItem[0];
                        check = blacklistedWords.Any(item => item == listItem.ToLower()); // not found in blacklist : true
                        if ((ch >= 'a' && ch <= 'z' || ch >= 'A' && ch <= 'Z') && !check)
                        {
                            int[] result = { };
                            if (ch >= 'A' && ch <= 'Z')
                            {
                                result = Enumerable.Range(0, keywordsArray.Count).Where(i => keywordsArray[i] == listItem).ToArray();
                            }
                            else
                            {
                                result = Enumerable.Range(0, keywordsArray.Count).Where(i => keywordsArray[i].ToLower() == listItem.ToLower()).ToArray();
                            }
                            if (result.Length >= 3)
                            {
                                if (!isCaps)
                                {
                                    keywords += listItem + ",";
                                }
                                foreach (int x in result)
                                {
                                    try
                                    {
                                        string testItem = keywordsArray[x];
                                        int y = x + 1;
                                        listItem = "";
                                        do
                                        {
                                            wordsCount = 0;
                                            if (keywordsArray[y].Trim() != "." && !blacklistedWords.Any(item => item == keywordsArray[y].Trim()))
                                            {
                                                testItem += testItem != "" ? " " + keywordsArray[y] : keywordsArray[y];
                                                foreach (Match m in Regex.Matches(pageText, @"\b" + testItem + @"\b")) { wordsCount++; }
                                                if (wordsCount >= 3)
                                                {
                                                    listItem = testItem;
                                                }
                                                y++;
                                            }
                                        }
                                        while (wordsCount >= 3);

                                        if (listItem != "")
                                        {
                                            keywords += listItem + ",";
                                        }
                                    }
                                    catch { }
                                }
                            }
                        }
                        iterationCount++;
                    }
                    List<string> keywordsList = new List<string>(keywords.Split(',')).ToList();
                    keywordsList = keywordsList.Where(s => !string.IsNullOrEmpty(s)).Distinct().ToList();

                    string keyWordsQueryString = "'" + String.Join("','", keywordsList.ToArray()) + "'"; // query to fetch keywords data

                    // fetching image and sub-category associated to keyword
                    int[] catagories = { 0, 0, 0, 0, 0, 0, 0, 0 };
                    string[] catagoryName = { "Business", "Economy", "Politics", "Entertainment", "Sport", "Technology", "Science-Environment", "Health" };
                    List<string> images = new List<string>();

                    con.Open();
                    if (keyWordsQueryString != "''")
                    {
                        string query = string.Format("SELECT Id,word,category,sub_category,[image]  FROM words_list WHERE word COLLATE SQL_Latin1_General_CP1_CS_AS in ({0}) "
                                        + "union "
                                        + "select null as id,Data as word,null as category, null as sub_category,null as [image] from [dbo].[Split]({1},',') where Data COLLATE SQL_Latin1_General_CP1_CS_AS not in "
                                        + "(SELECT word FROM words_list WHERE word COLLATE SQL_Latin1_General_CP1_CS_AS in ({0})) option (maxrecursion 0)", keyWordsQueryString, keyWordsQueryString.Replace("','", ","));
                        SqlCommand cmd = new SqlCommand(query);
                        cmd.Connection = con;
                        SqlDataReader r = cmd.ExecuteReader();
                        if (r.HasRows)
                        {
                            int count = 0;
                            while (r.Read())
                            {
                                string tbl_id = r[0].ToString();
                                string tbl_word = r[1].ToString();

                                returnNewWords += "<keyword>" + tbl_word + "</keyword>";
                                count++;
                                if (tbl_id == "") // checking new words
                                {
                                    newWords.Add(tbl_word);
                                    returnNewWords += "<keyword>" + tbl_word + "</keyword>";
                                    newWordsCount++;
                                }
                            }
                        }

                        r.Close();
                    }

                    AddNewWords(newWords);
                }
                else
                {
                    returnError = "Page not in English";
                }
            }
            catch (Exception ex)
            {
                returnError = ex.Message;
            }
            _return = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                        +"<results>"
                            +"<keywords>" + returnNewWords + "</keywords>"
                        +"</results>";
        }
        context.Response.Write(_return);
    }


    public static string[] getEnglishString(string str)
    {
        StringBuilder sb = new StringBuilder();
        StringBuilder sb_keywords = new StringBuilder();
        StringBuilder sb_entities = new StringBuilder();
        bool numeric = false;
        foreach (char c in str)
        {
            if ((c >= '0' && c <= '9'))
            {
                sb.Append(c);
                sb_keywords.Append(c);
                sb_entities.Append(c);
                numeric = true;
            }
            else if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || c == '_' || c == '-')
            {
                sb.Append(c);
                sb_keywords.Append(c);
                sb_entities.Append(c);
                numeric = false;
            }
            else if (c == '(' || c == ')' || c == ',' || c == '"' || c == ';' || c == ':')
            {
                sb.Append(c);
                sb_keywords.Append(" " + c + " ");
                sb_entities.Append(" " + c);
                numeric = false;
            }
            else if (c == '.' || c == '!')
            {
                sb.Append(c);
                if (numeric == true)
                {
                    sb_keywords.Append(c);
                    sb_entities.Append(c);
                }
                else
                {
                    sb_keywords.Append(" . ");
                    sb_entities.Append(" . ");
                }
                numeric = false;
            }
            else if (c == '\'' || c == '’')
            {
                sb.Append(c);
                sb_keywords.Append(" ");
                sb_entities.Append(" ");
                numeric = false;
            }
            else
            {
                sb.Append(" ");
                sb_keywords.Append(" ");
                sb_entities.Append(" ");
                numeric = false;
            }

        }
        string[] result = { sb.ToString(), sb_keywords.ToString(), sb_entities.ToString() };
        return result;
    }


    public static void AddNewWords(List<string> li)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            string checkSetting = "SELECT * FROM NLP_Settings WHERE settingName='data storage' AND value='1'";
            cmd.CommandText = checkSetting.ToString();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Close();
                StringBuilder insertQuery = new StringBuilder(string.Empty);
                foreach (string item in li)
                {
                    //const string query = "INSERT INTO words_new(word) VALUES";
                    const string query = "IF NOT EXISTS ( SELECT 1 FROM words_new WHERE word = '{0}' COLLATE SQL_Latin1_General_CP1_CS_AS )"
                                + " BEGIN"
                                + " INSERT INTO words_new (word) OUTPUT INSERTED.ID VALUES ('{0}')"
                                + " END; ";
                    insertQuery.AppendFormat(query, item);
                }
                cmd.CommandText = insertQuery.ToString();
                int a = cmd.ExecuteNonQuery();
            }
            else
            {
                reader.Close();
            }
            con.Close();
        }
        catch { }
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}