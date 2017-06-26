<%@ WebHandler Language="C#" Class="nlp" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Xml;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using HtmlAgilityPack;
using System.Web.Services;
using System.Collections;
using System.Linq.Expressions;
using System.Globalization;


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
        //string URL = "http://news.nationalgeographic.com/2017/04/jungle-dogs-peru-amazon-rare";
        string returnPageCategory = "";
        string returnPageLanguage = "";
        string returnPageText = "";
        string returnKeywords = "";
        string returnEntities = "";
        string returnImages = "";
        string returnNewWords = "";
        string returnError = "";

        //string requestingIP = HttpContext.Current.Request.UserHostAddress;
        //string requestType = HttpContext.Current.Request.RequestType;

        string textContent = "";
        string tempImg = "";
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
                string entitiesString = ". " + textualContent[2];

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

                returnPageText = pageText;

                List<string> keywordsArray = new List<string>(keywordsString.Split(' '));
                keywordsArray = keywordsArray.Where(s => !string.IsNullOrWhiteSpace(s)).ToList();

                // start entity filteration
                List<string> entitiesList = new List<string>(entitiesString.Split(' ')).ToList();
                entitiesList = entitiesList.Where(s => !string.IsNullOrWhiteSpace(s)).ToList();

                bool considerNextWord = true;
                bool isCaps = false;
                bool addWord = false; // for blacklisted words
                string entities_arr = "";
                string lastWord = "";
                char ch;
                bool check = false;
                bool isPreposition = false;
                string lastPreposition = "";
                string word = "";
                for (int i = 0; i < entitiesList.Count; i++)
                {
                    word = entitiesList[i];
                    ch = word[0];
                    addWord = true;
                    if (isCaps)
                    {
                        isPreposition = prepotions.Any(item => item == word);
                        if (isPreposition) lastPreposition += " " + word;
                        else lastPreposition = "";
                        isCaps = (ch >= 'A' && ch <= 'Z' || ch >= '0' && ch <= '9') ? true : false; // check with numbers
                    }
                    else
                    {
                        isPreposition = false;
                        isCaps = (ch >= 'A' && ch <= 'Z') ? true : false;
                        check = blacklistedWords.Any(item => item == word);
                    }
                    if (check)
                    {
                        addWord = false;
                    }

                    if (considerNextWord == true)
                    {
                        if (isCaps)
                        {
                            if (addWord == true)
                            {
                                entities_arr += lastPreposition + " " + word;
                                lastPreposition = "";
                            }
                            lastWord = word;
                        }
                        else
                        {
                            if (!isPreposition)
                            {
                                if (lastWord != "\n") entities_arr += ",";
                                lastWord = "\n";
                                lastPreposition = "";
                            }
                        }
                    }
                    else
                    {
                        considerNextWord = true;
                    }

                    if (ch == '.')
                    {
                        considerNextWord = false;
                    }
                }
                entitiesList = new List<string>(entities_arr.Split(',')).ToList();
                entitiesList = entitiesList.Where(s => !string.IsNullOrEmpty(s)).Where(s => !string.IsNullOrWhiteSpace(s)).Distinct().Select(s => s.Trim()).ToList();
                string entitiesSearchQuery = "SELECT word FROM [words_list] WHERE (word COLLATE SQL_Latin1_General_CP1_CS_AS LIKE '" + String.Join("%' OR word COLLATE SQL_Latin1_General_CP1_CS_AS LIKE '", entitiesList.ToArray()) + "%') AND blocked != 1";
                con.Open();
                SqlCommand DBEntities = new SqlCommand(entitiesSearchQuery);
                DBEntities.Connection = con;
                SqlDataReader DBEntityReader = DBEntities.ExecuteReader();
                if (DBEntityReader.HasRows)
                {
                    while (DBEntityReader.Read())
                    {
                        if (pageText.Contains(DBEntityReader[0].ToString()))
                            entitiesList.Add(DBEntityReader[0].ToString());
                    }
                }
                DBEntityReader.Close();
                con.Close();

                entitiesList = entitiesList.Where(s => !string.IsNullOrEmpty(s)).Where(s => !string.IsNullOrWhiteSpace(s)).Distinct().Select(s => s.Trim()).ToList();
                entitiesList.Sort();

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


                int[] catagories = { 0, 0, 0, 0, 0, 0, 0, 0 };
                string[] catagoryName = { "Business", "Economy", "Politics", "Entertainment", "Sport", "Technology", "Science-Environment", "Health" };
                List<string> images = new List<string>();
                string imgPath = "http://i.earthinfralanddevelopers.co.in/";
                int imgCount = 0;

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
                            string tbl_catagory = r[2].ToString();
                            string tbl_subCategory = r[3].ToString() != "" ? r[3].ToString() : "no sub-catagory";

                            if (r[4].ToString() != "")
                            {
                                tempImg = "\"" + imgCount + "\":{\"img\":\"" + imgPath + r[4].ToString() + "\",\"word\":\"" + tbl_word + "\"}";
                                returnImages += returnImages == "" ? tempImg : "," + tempImg;
                                imgCount++;
                            }

                            returnKeywords += returnKeywords == "" ? "\"" + count + "\":\"" + tbl_word + "\"" : ",\"" + count + "\":\"" + tbl_word + "\"";
                            count++;
                            if (tbl_id == "") // checking new words
                            {
                                newWords.Add(tbl_word);
                                returnNewWords += returnNewWords == "" ? "\"" + newWordsCount + "\":\"" + tbl_word + "\"" : ",\"" + newWordsCount + "\":\"" + tbl_word + "\"";
                                newWordsCount++;
                            }

                            if (tbl_catagory != "" && tbl_catagory != "0")
                            {
                                int catagory = Convert.ToInt32(tbl_catagory);
                                catagories[catagory - 1]++;
                            }
                        }
                    }

                    r.Close();
                }

                // deeptraining start
                string entitiesQueryString = "'" + String.Join("','", entitiesList.ToArray()) + "'";
                string trainingQuery = string.Format("SELECT * FROM words_deeptraining WHERE [entity] IN ({0})", entitiesQueryString);
                SqlCommand training = new SqlCommand(trainingQuery);
                training.Connection = con;
                SqlDataReader trainingReader = training.ExecuteReader();
                List<DeepTraining> deepTraining = new List<DeepTraining>();
                if (trainingReader.HasRows)
                {
                    while (trainingReader.Read())
                    {
                        deepTraining.Add(new DeepTraining { entity = trainingReader[1].ToString(), category = Convert.ToInt32(trainingReader[2].ToString()), sub_category = trainingReader[3].ToString(), super_entity = trainingReader[4].ToString().ToLower() });
                    }
                }
                trainingReader.Close();
                // deeptraining end

                if (entitiesQueryString != "''")
                {
                    string query = string.Format("SELECT Id,word,category,sub_category,[image]  FROM words_list WHERE word COLLATE SQL_Latin1_General_CP1_CS_AS in ({0}) "
                                    + "union "
                                    + "select null as id,Data as word,null as category, null as sub_category,null as [image] from [dbo].[Split]({1},',') where Data COLLATE SQL_Latin1_General_CP1_CS_AS not in "
                                    + "(SELECT word FROM words_list WHERE word COLLATE SQL_Latin1_General_CP1_CS_AS in ({0})) option (maxrecursion 0)", entitiesQueryString, entitiesQueryString.Replace("','", ","));
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
                            string tbl_catagory = r[2].ToString();
                            string tbl_subCategory = r[3].ToString() != "" ? r[3].ToString() : "no sub-category";


                            if (r[4].ToString() != "")
                            {
                                tempImg = "\"" + imgCount + "\":{\"img\":\"" + imgPath + r[4].ToString() + "\",\"word\":\"" + tbl_word + "\"}";
                                returnImages += returnImages == "" ? tempImg : "," + tempImg;
                                imgCount++;
                            }

                            if (tbl_catagory != "")
                            {
                                int category = 0;
                                List<DeepTraining> dt = deepTraining.Where(s => s.entity == tbl_word).ToList();
                                if (dt.Count > 0)
                                {
                                    foreach (var a in dt)
                                    {
                                        Regex reg = new Regex(@"\b" + a.super_entity + @"\b");
                                        CultureInfo culture = CultureInfo.CurrentCulture;
                                        if (reg.IsMatch(pageText))
                                        {
                                            category = a.category;
                                            tbl_subCategory = a.sub_category;
                                        }
                                    }
                                }
                                if (category == 0)
                                {
                                    category = Convert.ToInt32(tbl_catagory);
                                }
                                catagories[category - 1]++;
                            }
                            string entity = "\"" + count + "\":{\"entity\":\"" + tbl_word + "\",\"sub-category\":\"" + tbl_subCategory + "\"}";
                            returnEntities += returnEntities == "" ? entity : "," + entity;
                            count++;

                            if (tbl_id == "") // checking new words
                            {
                                newWords.Add(tbl_word);
                                returnNewWords += returnNewWords == "" ? "\"" + newWordsCount + "\":\"" + tbl_word + "\"" : ",\"" + newWordsCount + "\":\"" + tbl_word + "\"";
                                newWordsCount++;
                            }
                        }
                    }
                    r.Close();
                }
                con.Close();

                returnPageLanguage = "English";
                if (catagories.Max() > 0)
                {
                    returnPageCategory = catagoryName[catagories.ToList().IndexOf(catagories.Max())];
                }
                else
                {
                    returnPageCategory = "No Category Found";
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
        string _return = "";
        _return += "{";
        _return += "\"page-category\":\"" + returnPageCategory + "\"";
        _return += ",\"page-language\":\"" + returnPageLanguage + "\"";
        //_return += ",\"page-text\":\"" + returnPageText + "\"";
        _return += ",\"keywords\":{" + returnKeywords + "}";
        _return += ",\"entities\":{" + returnEntities + "}";
        _return += ",\"images\":{" + returnImages + "}";
        _return += ",\"new-words\":{" + returnNewWords + "}";
        //_return += ",\"request-ip\":\"" + HttpContext.Current.Request.UserHostAddress + "\"";
        //_return += ",\"request-hostname\":\"" + HttpContext.Current.Request.UserHostName + "\"";
        //_return += ",\"request-type\":\"" + HttpContext.Current.Request.RequestType + "\"";
        //_return += ",\"request-httpMethod\":\"" + HttpContext.Current.Request.HttpMethod + "\"";
        _return += ",\"error\":\"" + returnError + "\"";
        _return += "}";
        //return _return;
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