<%@ WebHandler Language="C#" Class="camp" %>

using System;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class camp : IHttpHandler {
    
    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];
                string fname;
                if (HttpContext.Current.Request.Browser.Browser.ToUpper() == "IE" || HttpContext.Current.Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                {
                    string[] testfiles = file.FileName.Split(new char[] { '\\' });
                    fname = testfiles[testfiles.Length - 1];
                }
                else
                {
                    fname = file.FileName;
                }
                
                string wordId = context.Request.Form["word_id"];
                string[] testfiles2 = file.FileName.Split(new char[] { '\\' });
                fname = wordId +"_"+ testfiles2[testfiles2.Length - 1];
                string f_name = Path.Combine(context.Server.MapPath("~/words_images/"), fname);
                file.SaveAs(f_name);

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
                con.Open();
                string command = "UPDATE words_list SET image='words_images/" + fname + "' WHERE id=" + wordId;
                SqlCommand cmd = new SqlCommand(command, con);
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write("File Uploaded Successfully!");
    }
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}