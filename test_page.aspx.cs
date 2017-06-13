using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;


public partial class test_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {

        }
    }





  




    

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this, typeof(string), "Error","LoadAd()", true);
    }

    protected void load_asd(object sender , EventArgs e)
    {
        //Response.Redirect("google.com", "_blank", "menubar=1,scrollbars=1,width=1000,height=900,top=10");
    }

}