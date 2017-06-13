using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
         con.Open();
         SqlDataAdapter adp = new SqlDataAdapter("Select * from login_table where user_name='" + TextBox1.Text + "' and password='"+TextBox2.Text+"'", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                string sq = ds.Tables[0].Rows[0].ItemArray[3].ToString();

                if (sq == "Affiliate")
                {


                    con.Open();
                    SqlDataAdapter adp2 = new SqlDataAdapter("Select Affiliate_user_name from Affiliate where mail='" + TextBox1.Text + "' ", con);
                    DataSet ds2 = new DataSet();
                    adp2.Fill(ds2);
                    con.Close();


                    string status = ds.Tables[0].Rows[0].ItemArray[5].ToString();
                    if (status == "True")
                    {

                        Session.Add("User_name", ds.Tables[0].Rows[0].ItemArray[1].ToString());
                        Session.Add("affiliate_user_id", ds2.Tables[0].Rows[0].ItemArray[0].ToString());
                        Session.Add("user_id", TextBox1.Text);
                        Response.Redirect("~//Admin/chart_view_Affiliate.aspx");
                    }
                    else
                    {

                    }

                }
                else
                {
                    Response.Redirect("~//Admin/Chart_view_admin.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Not Valid Login Details')</script>");
            }
    }

}