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

public partial class admin_FetchTextFomWebpage : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        pageTextContent.InnerHtml = "";
        keywords_Count.InnerHtml = "";
        divKeywords.InnerHtml = "";
        entities_Count.InnerHtml = "";
        divEntities.InnerHtml = "";
        pageLanguage.InnerHtml = "";
        pageCategory.InnerHtml = "";
        imageContainer.InnerHtml = "";
        exceptionMessage.InnerHtml = "";

        pageTextContent.Visible = false;
        listContainer1.Visible = false;
        listContainer2.Visible = false;
        imageContainer.Visible = false;
        exceptionMessage.Visible = false;
        pageLanguage.Visible = false;
        pageCategory.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string textContent = "";
            try
            {
                
                HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
                HtmlWeb hw = new HtmlWeb();
                doc = hw.Load(TextBox1.Text);
                HtmlNodeCollection nodes = doc.DocumentNode.SelectNodes("//body//p[not(ancestor::div[contains(@style,'display:none')]) and not(ancestor::div[contains(@style,'display: none')]) and not(ancestor::header) and not(ancestor::footer)]//text()");
                textContent = "";
                foreach (var item in nodes)
                {
                    textContent += item.InnerText + Environment.NewLine;
                }
            }
            catch {
                textContent = "";

                WebClient web = new WebClient();
                string pageContent = web.DownloadString(TextBox1.Text);
                // removeing content after footer tag
                //string[] content_arr = pageContent.Split(new[] { "<footer" }, StringSplitOptions.None);
                string html = pageContent;
                html = Regex.Replace(html, "Â", "");


                HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
                doc.LoadHtml(html);
                HtmlNodeCollection nodes = doc.DocumentNode.SelectNodes("//body//p[not(ancestor::div[contains(@style,'display:none')]) and not(ancestor::div[contains(@style,'display: none')]) and not(ancestor::header) and not(ancestor::footer)]//text()");
                foreach (HtmlNode node in nodes) {
                    textContent += node.InnerText + Environment.NewLine;
                }
                textContent = Regex.Replace(textContent, "â€™", "'");
                textContent = Regex.Replace(textContent, "â€œ", "\"");
                //textContent = Regex.Replace(textContent, "Â", " ");
                textContent = Regex.Replace(textContent, "â€", "\"");

                pageTextContent.InnerText = textContent;
                //string[] content_arr = pageContent.Split(new[] { "<footer" }, StringSplitOptions.None);
                //string html = content_arr[0];
                //html = Regex.Replace(html, @"<[^>!p]*>", "");
                //MatchCollection m1 = Regex.Matches(html, @"<p[^>]*>\s*(.*?)\s*</p>", RegexOptions.Singleline);
                //string regx = "<[^>]*>";
                ////string regx = "";
                //foreach (Match m in m1)
                //{
                //    if (m.Groups[1].Value.Trim() != "")
                //    {
                //        string tempText = Regex.Replace(m.Groups[1].Value, regx, "").Trim();
                //        tempText = Regex.Replace(tempText, @"(\n|\t|â€|â€œ|â€™)", "").Trim();
                //        //tempText = Regex.Replace(tempText, "\t", "");
                //        //tempText = Regex.Replace(tempText, "â€", "");
                //        //tempText = Regex.Replace(tempText, "â€œ", "");
                //        //tempText = Regex.Replace(tempText, "â€™", "").Trim();
                //        if (tempText != "")
                //        {
                //            if (tempText[tempText.Length - 1] == '.')
                //                textContent += tempText + " ";
                //            else
                //                textContent += tempText + ". ";
                //        }
                //    }
                //}
            }
            //pageTextContent.InnerHtml = textContent;


            //WebClient web = new WebClient();
            //byte[] raw = web.DownloadData(TextBox1.Text);
            //string webData = System.Text.Encoding.UTF8.GetString(raw);

            ////XmlDocument document = new XmlDocument();
            ////document.Load(TextBox1.Text);
            ////string allText = document.InnerText;

            //HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
            //doc.LoadHtml(webData);
            //string allText = doc.DocumentNode.SelectSingleNode("//body").InnerText;


            //var pageContent = "{html content goes here}";
            //var pageDoc = new HtmlDocument();
            //pageDoc.LoadHtml(pageContent);
            //var pageText = pageDoc.DocumentNode.InnerText;

            //string pageContent = WebUtility.HtmlDecode(web.DownloadString(TextBox1.Text));
            //string[] content_arr = pageContent.Split(new[] { "<footer" }, StringSplitOptions.None);
            //string html = content_arr[0];
            //html = Regex.Replace(html, @"<[^>!p]*>", "");
            //MatchCollection m1 = Regex.Matches(html, @"<p[^>]*>\s*(.*?)\s*</p>", RegexOptions.Singleline);
            //string regx = "<[^>]*>";
            ////string regx = "";
            //foreach (Match m in m1)
            //{
            //    if (m.Groups[1].Value.Trim() != "")
            //    {
            //        string tempText = Regex.Replace(m.Groups[1].Value, regx, "").Trim();
            //        tempText = Regex.Replace(tempText, @"(\n|\t|â€|â€œ|â€™)", "").Trim();
            //        //tempText = Regex.Replace(tempText, "\t", "");
            //        //tempText = Regex.Replace(tempText, "â€", "");
            //        //tempText = Regex.Replace(tempText, "â€œ", "");
            //        //tempText = Regex.Replace(tempText, "â€™", "").Trim();
            //        if (tempText != "")
            //        {
            //            if (tempText[tempText.Length - 1] == '.')
            //                textContent += tempText + " ";
            //            else
            //                textContent += tempText + ". ";
            //        }
            //    }
            //}
            //textContent = Regex.Replace(textContent, "Â", " ");
            //textContent = textContent.Trim();

            con.Open();
            string testString = Regex.Replace(textContent, "['’]", " ");
            testString = Regex.Replace(testString, "[0-9!@#$%^&*():;,.\"’'\\/\r\t\n|]", "");
            //testString = textContent;
            List<string> testContent = testString.Split(' ').Where(s => !string.IsNullOrWhiteSpace(s)).ToList();
            string testQuery = string.Format("SELECT word FROM words_list WHERE word in ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}')", testContent[0], testContent[1], testContent[2], testContent[3], testContent[4], testContent[5], testContent[6], testContent[7], testContent[8], testContent[9], testContent[10], testContent[11], testContent[12], testContent[13], testContent[14]);
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

                pageTextContent.Visible = true;
                pageTextContent.InnerHtml = pageText;
                //keywordsString = "end end end end formula formula formula Grand Grand Grand Grand";
                List<string> keywordsArray = new List<string>(keywordsString.Split(' '));
                keywordsArray = keywordsArray.Where(s => !string.IsNullOrWhiteSpace(s)).ToList();
                //keywordsArray.Sort();
                //entitiesListEntries.InnerText = string.Join("\n", keywordsArray.ToArray());

                // start entity filteration
                List<string> entitiesList = new List<string>(entitiesString.Split(' ')).ToList();
                entitiesList = entitiesList.Where(s => !string.IsNullOrWhiteSpace(s)).ToList();
                //entitiesList = entitiesList.Where(s => !string.IsNullOrEmpty(s)).ToList();
                bool considerNextWord = true;
                bool dotChecked = true;
                bool isCaps = false;
                bool addWord = false; // for blacklisted words
                string entities_arr = "";
                string temp_entities = "";
                string lastWord = "";
                char ch;
                string word = "";
                for (int i = 0; i < entitiesList.Count; i++)
                {
                    word = entitiesList[i];
                    ch = word[0];
                    addWord = true;
                    if (word == "When")
                    {
                        word = "When";
                    }
                    isCaps = (ch >= 'A' && ch <= 'Z') ? true : false;
                    bool check = blacklistedWords.Any(item => item == word);
                    if (check)
                    {
                        addWord = false;
                    }

                    if (considerNextWord == true)
                    {
                        if (dotChecked == true)
                        {
                            if (isCaps)
                            {
                                if (addWord == true)
                                {
                                    entities_arr += " " + word;
                                }
                                lastWord = word;
                            }
                            else
                            {
                                if (lastWord != "\n") entities_arr += ",";
                                lastWord = "\n";
                            }
                        }
                        else
                        {
                            dotChecked = true;
                            //if (isCaps)
                            //{
                            //    if (addWord == true)
                            //    {
                            //        if (temp_entities != "")
                            //        {
                            //            entities_arr += " " + temp_entities + " " + word;
                            //        }
                            //        else
                            //        {
                            //            entities_arr += " " + word;
                            //        }
                            //    }
                            //    temp_entities = "";
                            //    lastWord = word;
                            //}
                        }
                    }
                    else
                    {
                        considerNextWord = true;
                        if (addWord) temp_entities = isCaps ? word : "";
                    }

                    if (ch == '.')
                    {
                        considerNextWord = false;
                        dotChecked = false;
                    }
                }
                entitiesList = new List<string>(entities_arr.Split(',')).ToList();
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
                    bool check = blacklistedWords.Any(item => item == listItem.ToLower()); // not found in blacklist : true
                    if ((ch >= 'a' && ch <= 'z' || ch >= 'A' && ch <= 'Z') && !check)
                    {
                        var result = Enumerable.Range(0, keywordsArray.Count).Where(i => keywordsArray[i].ToLower() == listItem.ToLower()).ToArray();
                        if (result.Length >= 3)
                        {
                            if (!isCaps)
                            {
                                keywords += listItem.ToLower() + ",";
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
                                        keywords += listItem.ToLower() + ",";
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

                // removig entities from keywords
                //for (int i = 0; i < keywordsList.Count; i++)
                //{
                //    word = keywordsList[i].Trim();
                //    var result = Enumerable.Range(0, entitiesList.Count).Where(j => entitiesList[j].Trim() == word).ToArray();
                //    if (result.Count() <= 0)
                //    {
                //        //divKeywords.InnerHtml += "<span>" + keywordsList[i].ToLower() + "</span>";
                //        keyWordsQueryString += keyWordsQueryString == "" ? "'" + keywordsList[i].Trim() + "'" : ",'" + keywordsList[i].Trim() + "'";

                //    }
                //}



                int[] catagories = { 0, 0, 0, 0, 0, 0, 0, 0 };
                string[] catagoryName = { "Business", "Economy", "Politics", "Entertainment", "Sport", "Technology", "Science-Environment", "Health" };
                List<string> images = new List<string>();
                string imgPath = "../";
                // printing data start
                // Business = 0
                // Economy = 1
                // Politics = 2
                // Entertainment = 3
                // Sport = 4
                // Technology = 5
                // Science-Environment = 6
                // Health = 7
                con.Open();
                divKeywords.InnerHtml = "";
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
                        while (r.Read())
                        {
                            string tbl_id = r[0].ToString();
                            string tbl_word = r[1].ToString();
                            string tbl_catagory = r[2].ToString();
                            string tbl_subCategory = r[3].ToString() != "" ? r[3].ToString() : "no sub-catagory";
                            string tbl_img = r[4].ToString() != "" ? string.Format("<img src='{0}{1}' alt='{2}' />", imgPath, r[4].ToString(), tbl_word) : "";
                            if (tbl_img != "" && images.Count <= 10)
                            {
                                images.Add(tbl_img);
                            }
                            if (tbl_id != "")
                            {
                                divKeywords.InnerHtml += string.Format("<li><span>{0}</span></li>", tbl_word);
                            }
                            else
                            {
                                divKeywords.InnerHtml += string.Format("<li><span>{0}</span></li>", tbl_word);
                            }
                            if (tbl_catagory != "")
                            {
                                int catagory = Convert.ToInt32(tbl_catagory);
                                catagories[catagory - 1]++;
                            }
                        }
                    }

                    r.Close();
                }

                string entitiesQueryString = "'" + String.Join("','", entitiesList.ToArray()) + "'";
                divEntities.InnerHtml = "";
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
                        while (r.Read())
                        {
                            string tbl_id = r[0].ToString();
                            string tbl_word = r[1].ToString();
                            string tbl_catagory = r[2].ToString();
                            string tbl_subCategory = r[3].ToString() != "" ? r[3].ToString() : "no sub-catagory";
                            string tbl_img = r[4].ToString() != "" ? string.Format("<img src='{0}{1}' alt='{2}' />", imgPath, r[4].ToString(), tbl_word) : "";
                            if (tbl_img != "" && images.Count <= 10)
                            {
                                images.Add(tbl_img);
                            }
                            if (tbl_id != "")
                            {
                                divEntities.InnerHtml += string.Format("<li><span>{0}</span> - \"{1}\"</li>", tbl_word, tbl_subCategory);
                            }
                            else
                            {
                                divEntities.InnerHtml += string.Format("<li><span>{0}</span> - \"{1}\"</li>", tbl_word, "not in database");
                            }
                            if (tbl_catagory != "")
                            {
                                int catagory = Convert.ToInt32(tbl_catagory);
                                catagories[catagory - 1]++;
                            }
                        }
                    }
                    r.Close();
                }
                con.Close();

                if (images.Count > 0)
                {
                    imageContainer.Visible = true;
                    imageContainer.InnerHtml = "<div>" + string.Join("<i></i></div><div>", images.ToArray()) + "<i></i></div>";
                    //imageContainer.InnerHtml += "<div>" + string.Join("<i></i></div><div>", images.ToArray()) + "<i></i></div>";
                    //imageContainer.InnerHtml += "<div>" + string.Join("<i></i></div><div>", images.ToArray()) + "<i></i></div>";
                    //imageContainer.InnerHtml += "<div>" + string.Join("<i></i></div><div>", images.ToArray()) + "<i></i></div>";
                    //imageContainer.InnerHtml += "<div>" + string.Join("<i></i></div><div>", images.ToArray()) + "<i></i></div>";
                    //imageContainer.InnerHtml += "<div>" + string.Join("<i></i></div><div>", images.ToArray()) + "<i></i></div>";
                    //imageContainer.InnerHtml += "<div>" + string.Join("<i></i></div><div>", images.ToArray()) + "<i></i></div>";
                }

                pageLanguage.InnerHtml = "Language : <span>English</span>";
                if (catagories.Max() > 0)
                {
                    pageCategory.InnerHtml = "Category : <span>" + catagoryName[catagories.ToList().IndexOf(catagories.Max())] + "</span>";
                }
                else
                {
                    pageCategory.InnerHtml = "";
                }

                listContainer1.Visible = true;
                listContainer2.Visible = true;
                keywords_Count.InnerHtml = keywordsList.Count.ToString();
                entities_Count.InnerHtml = entitiesList.Count.ToString();
            }
            else
            {
                exceptionMessage.Visible = true;
                exceptionMessage.InnerHtml = "<h1>Page not in English</h1>";
            }
        }
        catch (Exception ex) {
            exceptionMessage.Visible = true;
            exceptionMessage.InnerText = ex.Message;
        }
    }

    public static string[] getEnglishString(string str)
    {
        StringBuilder sb = new StringBuilder();
        StringBuilder sb_keywords = new StringBuilder();
        StringBuilder sb_entities = new StringBuilder();
        foreach (char c in str)
        {
            if ((c >= '0' && c <= '9') || c == '"' || c == ';' || c == ':')
            {
                sb.Append(c);
            }
            else if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || c == '_' || c == '-' )
            {
                sb.Append(c);
                sb_keywords.Append(c);
                sb_entities.Append(c);
            }
            else if (c == '(' || c == ')' || c == ',') {
                sb.Append(c);
                sb_keywords.Append(" " + c + " ");
                sb_entities.Append(" " + c);
            }
            else if (c == '.' || c == '!')
            {
                sb.Append(c);
                sb_keywords.Append(" . ");
                sb_entities.Append(" . ");
            }
            else if (c == '\'')
            {
                sb.Append(c);
                sb_keywords.Append(" ");
                sb_entities.Append(" ");
            }
            else
            {
                sb.Append(" ");
                sb_keywords.Append(" ");
                sb_entities.Append(" ");
            }

        }
        string[] result = { sb.ToString(), sb_keywords.ToString(), sb_entities.ToString() };
        return result;
    }
}