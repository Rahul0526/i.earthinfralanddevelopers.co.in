using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class admin_clearCookies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void LoadData(object sender,EventArgs e)
    {
        try
        {
            string ComputerId = string.Empty;
            ArrayList colCookies = new ArrayList();
            for (int i = 0; i < Request.Cookies.Count; i++)
                colCookies.Add(Request.Cookies[i]);
            string[] Arr;

            foreach (var item in colCookies)
            {
                HttpCookie c1 = item as HttpCookie;
                //if (c1.Name == "UniqueIdentification")
                //    ComputerId = c1.Value;
               // c1.Expires = System.DateTime.Now.AddDays(-1);
              //  Response.Cookies.Remove(c1.Name);
                var cookie = new HttpCookie(c1.Name) { Expires = DateTime.Now.AddDays(-1d) };
                Response.Cookies.Add(cookie);
            }
            PMessage.InnerText = "Browser Cookies Has Been Removed Successfully!!!!";
            PMessage.Style.Add("color", "Green");
        }
        catch( Exception sqe )
        {
 
        }
    }
}