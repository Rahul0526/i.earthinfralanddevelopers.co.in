using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class admin_MasterPage : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["User_name"] != null && Session["user_id"] != null)
            {
                try
                {
                    laod_user_name();
                }
                catch
                {

                }
            }
            else
            {
                Response.Redirect("LoginAdmin.aspx");
            }
        }


    }


    protected void logout(object sender, EventArgs e)
    {
        try
        {
            Session.RemoveAll();
            Session.Clear();
            Session.Abandon();
            Response.Redirect("../LoginAffiliate.aspx");
        }
        catch
        {

        }
    }

    protected void laod_user_name()
    {

        try
        {
            string s1 = Session["User_name"].ToString();

            user_name.InnerText = s1;

        }
        catch
        {

        }
    }







    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        try
        {
            Session.RemoveAll();
            Session.Clear();
            Session.Abandon();
            Response.Redirect("LoginAdmin.aspx");
        }
        catch
        {

        }
    }
}
