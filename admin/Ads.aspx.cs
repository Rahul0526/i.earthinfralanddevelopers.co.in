using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class admin_Ads : System.Web.UI.Page
{


    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load_data();
           
        }
    }



    protected void load_Affilate_websites()
    {
        try
        {


            con.Open();
           string user_id_affilate=Session["affiliate_user_id"].ToString();
           SqlDataAdapter adp = new SqlDataAdapter("SELECT website from  Affiliate  where Affiliate_user_name='" + user_id_affilate + "'", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {

                string websites = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                string[] strArr = websites.Split(',');
                for (int count = 0; count <= strArr.Length - 1; count++)
                {
                   

                    
                }
                

            }
            else
            {
 
            }



        }
        catch
        {
 
        }
    }





    protected void load_data()
    {
        try
        {
            con.Open();

            SqlDataAdapter adp = new SqlDataAdapter("SELECT TOP 6 [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[call_to_action],[Add_style_formate]   FROM [dbo].[campaigns] ORDER BY NEWID()", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                try
                {
                    GridView1.DataSource = ds.Tables[0];
                    GridView1.DataBind();

                }
                catch
                {


                }
            }
            else
            {
 
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
           
                string s1 = GridView1.DataKeys[e.RowIndex].Value.ToString();
                string camp_name = GridView1.Rows[e.RowIndex].Cells[2].Text;
                string title = GridView1.Rows[e.RowIndex].Cells[3].Text;
                string des = GridView1.Rows[e.RowIndex].Cells[4].Text;

                if (Session["affiliate_user_id"] != "" && Session["affiliate_user_id"] != null)
                {
                    string user_id_affilate = Session["affiliate_user_id"].ToString();
                   
                        // if exist then do nothing.....just redirect to copy_ad page 
                        Session.Add("camp_id", s1);
                        Session.Add("camp_name", camp_name);
                        Session.Add("title", title);
                        Session.Add("des", des);
                        Response.Redirect("~/Admin/Copy_ad.aspx");


                    }
                    else
                    {
                        Response.Write("<script>alert('session has been expired ... please logged in again')</script>");
                      

                    }

                


            





        }
        catch
        {

        }
    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            load_data();
        }
        catch
        {
 
        }
    }
}