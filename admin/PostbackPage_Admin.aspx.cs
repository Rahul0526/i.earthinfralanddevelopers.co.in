using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;


public partial class admin_PostbackPage_Admin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load_view_clicks();
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        load_view_clicks();
    }
    protected void load_view_clicks()
    {
        try
        {
             con.Open();

            SqlDataAdapter adp = new SqlDataAdapter("select sum(total_clicks), sum(total_views) from campain_details ", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                Label1.Text = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                Label2.Text = ds.Tables[0].Rows[0].ItemArray[1].ToString();
            }
        }
        catch
        {
 
        }
    }
}