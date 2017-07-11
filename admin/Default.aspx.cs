using System;
using System.IO;
using System.Net;
using System.Xml.Linq;

public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Apikey = "4a5075dbb713f58f60e3acf8f924fa41c9555287";                                   //"e9370cd124274b2dcd0cc7735ad912eb6be52f79";
        string ApiUrl = "http://i.earthinfralanddevelopers.co.in/admin/nlp.ashx?apikey=" + Apikey + "&page=http://news.nationalgeographic.com/2017/04/jungle-dogs-peru-amazon-rare";

        var ApiRequest = (HttpWebRequest)WebRequest.Create(ApiUrl);
        ApiRequest.Method = "GET";
        ApiRequest.ContentType = "application/xml";
        var webResponse = (HttpWebResponse)ApiRequest.GetResponse();
        string KeyWordsAsString = string.Empty;
        using (StreamReader KayReader = new StreamReader(webResponse.GetResponseStream()))
        {
            KeyWordsAsString = KayReader.ReadToEnd();
            KayReader.Close();
        }
        System.Xml.Linq.XDocument KeyWordsAsXml;
        KeyWordsAsXml = System.Xml.Linq.XDocument.Parse(KeyWordsAsString);
        string keyList = string.Empty;
        foreach (XElement Elm in KeyWordsAsXml.Root.Elements())
        {
            if (Elm.Name == "keywords")
            {
                foreach (XElement keys in Elm.Elements())
                {
                    try
                    {
                        keyList += keyList == string.Empty ? keys.Value.ToString() : "," + keys.Value.ToString();
                    }
                    catch
                    {
                        continue;
                    }
                }
            }
        }
        
        form1.InnerHtml = keyList;
    }
}