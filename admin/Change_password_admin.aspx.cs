using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_Change_password_admin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            select_data_();
        }
    }

    protected void select_data_()
    {
        try
        {
            con.Open();

            //SqlDataAdapter adp = new SqlDataAdapter("select website from Affiliate where Affiliate_user_name='" + affiliate_id + "'", con);
            SqlDataAdapter adp = new SqlDataAdapter("Select * from login_table where user_type='Admin'", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                Label5.Text = ds.Tables[0].Rows[0].ItemArray[0].ToString();

            }
           

        }
        catch
        {
            Response.Redirect("~/Admin/login.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
           con.Open();

            //SqlDataAdapter adp = new SqlDataAdapter("select website from Affiliate where Affiliate_user_name='" + affiliate_id + "'", con);
            SqlDataAdapter adp = new SqlDataAdapter("Select * from login_table where user_type='Admin' and user_name='"+Label5.Text+"' and password='"+TextBox1.Text+"'", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update login_table set password='" + TextBox3.Text + "' where user_name='" + Label5.Text + "'");
                cmd.Connection = con;
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {


                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    Response.Write("<script>alert('password Changed Successfully!!!!!')</script>");
                }
                else
                {
                    Response.Write("<script>alert(' Unable to password Change!!!!!')</script>");
                }



            }
            else
            {
                Response.Write("<script>alert('Old Password is incorrect!!!!')</script>");
            }


        }
        catch
        {
 
        }
    }
}