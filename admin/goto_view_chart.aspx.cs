using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_goto_view_chart : System.Web.UI.Page
{



    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load_asd();
        }
    }



    protected void load_asd()
    {
        try
        {
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * from campaigns ",con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();

            }


        }
        catch
        {
 
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            string request_type = "click";
            string s1=GridView1.DataKeys[e.RowIndex].Value.ToString();

            Session.Add("Graph_click_camp", s1);
            Session.Add("Req_type", request_type);
            Response.Redirect("~/Admin/Bar_chart_websiteWise.aspx");



        }
        catch

        {
 
        }
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {
            string request_type = "View";
            string s1 = GridView1.DataKeys[e.NewSelectedIndex].Value.ToString();

            Session.Add("Graph_click_camp", s1);
            Session.Add("Req_type", request_type);
            Response.Redirect("~/Admin/Bar_chart_websiteWise.aspx");



        }
        catch
        {

        }
    }
}