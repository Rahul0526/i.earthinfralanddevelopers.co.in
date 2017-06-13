using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Register_affiliate : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    BL_affiliates bl_aff = new BL_affiliates();
    DL_affiliate dl_aff = new DL_affiliate();

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {

            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * from login_table where user_name='" + txt_mail.Text + "' ", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Showstatus", "javascript:alert('This mail ID Already Exist ... Please Enter Another mail ID')", true);
            else
            {
                bl_aff.action = "insert";
                bl_aff.acc = string.Empty;
                bl_aff.address = string.Empty;
                bl_aff.aff_name = string.Empty;
                bl_aff.age = string.Empty;
                bl_aff.bank_info = string.Empty;
                bl_aff.date = Convert.ToDateTime(System.DateTime.Now);
                bl_aff.mail = txt_mail.Text.Trim();
                bl_aff.payment = string.Empty;
                string websites = string.Empty;
                bl_aff.website = websites.Trim();
                string user_name = tb_website_1.Value.Trim().Substring(0, 2) + DateTime.Now.ToString("MMddhhmmssfff");
                bl_aff.aff_id = user_name;
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Affiliate ( Affiliate_user_name, name,mail,Age,website,Address,date ) values('" + user_name + "' , '' , '" + txt_mail.Text + "' , '' , '" + websites + "','', '" + System.DateTime.Now.ToString("dd-MMM-yyyy") + "')");
                cmd.Connection = con;
                int a = cmd.ExecuteNonQuery();
                con.Close();
                if (a > 0)
                {
                    //maintaing  user credentials
                    enter_login_credentials(user_name, pass_txt.Text);
                    // this function will maintain records(for all registerd campaigns till yet.. for view-click purpose) in  'campain_details_Affiliate_wise' table . for all website entered here on registration time 
                    insert_affilaite_campaing_details_website_wise(user_name, websites);
                    txt_mail.Text = string.Empty;
                    tb_website_1.Value = string.Empty;
                    try
                    {
                        ViewState["website_tb_count"] = 0;
                    }
                    catch (Exception sqe)
                    {
                    }
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Registration successful.');window.location ='../LoginAffiliate.aspx';", true);
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Showstatus", "javascript:alert('Opppppssss.... please check your entries!!!!')", true);
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Showstatus", "javascript:alert('Oppps ... please fill each and every field in proper way!!!!!')", true);
        }
    }
    protected void insert_affilaite_campaing_details_website_wise(string affiliate_id, string websites_registering)
    {
        try
        {
            int total_view = 0;
            int total_click = 0;
            int total_conversions = 0;
            int total_impressions = 0;
            decimal total_revenue = 0;
            //now retriving all the campaigns (id) from main campaign table .
            //start
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select distinct  campaign_id from campaigns", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            //end
            if (ds.Tables[0].Rows.Count > 0)//if campaingns exists.
            {
                for (int count = 0; count < ds.Tables[0].Rows.Count; count++)//this loop will run for all campaings 
                {//start campaingn loop
                    string websites = websites_registering;//websites passed by submit function above 
                    string[] strArr = websites.Split(',');
                    for (int count_site = 0; count_site <= strArr.Length - 1; count_site++)
                    {
                        con.Open();
                        string camp_id = ds.Tables[0].Rows[count].ItemArray[0].ToString();
                        string site_name = strArr[count_site].ToString();
                        SqlCommand cmd3 = new SqlCommand("insert into campain_details_Affiliate_wise values('" + camp_id + "','" + affiliate_id + "' , '" + site_name + "' , " + total_click + " , " + total_conversions + ", " + total_view + " , 'Running','" + total_revenue + "', '" + System.DateTime.Now + "','" + total_impressions + "')");
                        cmd3.Connection = con;
                        cmd3.ExecuteNonQuery();
                        con.Close();
                    }
                }//end campaign loop
            }
        }
        catch
        {
        }

    }
    protected void enter_login_credentials(string user_name, string password)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into login_table values('" + txt_mail.Text.Trim() + "' , '' , '" + password + "' , 'Affiliate', '" + Convert.ToDateTime(System.DateTime.Now) + "', 'True')");
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch
        {
        }
    }
    protected void GmailLoginCredentials(string user_name, string password)
    {
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("insert into login_table values('" + txtGmailId.Text.Trim() + "' , '" + txtGmailName.Text.Trim() + "' , 'Demo Login' , 'Affiliate', '" + Convert.ToDateTime(System.DateTime.Now) + "', 'True')");

            cmd.Connection = con;
            int status = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch
        {
        }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void btnSubmitGmail_Click(object sender, EventArgs e)
    {
        try
        {

            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * from login_table where user_name='" + txtGmailId.Text.Trim() + "' ", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Showstatus", "javascript:alert('This mail ID Already Exist ... Please Enter Another mail ID')", true);
            else
            {
                bl_aff.action = "insert";
                bl_aff.acc = string.Empty;
                bl_aff.address = string.Empty;
                bl_aff.aff_name = txtGmailName.Text.Trim();
                bl_aff.age = string.Empty;
                bl_aff.bank_info = string.Empty;
                bl_aff.date = Convert.ToDateTime(System.DateTime.Now);
                bl_aff.mail = txtGmailId.Text.Trim();
                bl_aff.payment = string.Empty;

                bl_aff.website = txtWebsiteGmailReg.Text.Trim();
                string user_name = txtGmailName.Text.Trim().Substring(0, 2) + DateTime.Now.ToString("MMddhhmmssfff");
                bl_aff.aff_id = user_name;
                //int a = dl_aff.insert_affiliate(bl_aff);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Affiliate ( Affiliate_user_name, name,mail,Age,website,Address,date ) values('" + user_name + "' , '" + txtGmailName.Text + "' , '" + txtGmailId.Text + "' , '' , '" + txtWebsiteGmailReg.Text.Trim().ToString() + "','', '" + System.DateTime.Now.ToString("dd-MMM-yyyy") + "')");
                cmd.Connection = con;
                int a = cmd.ExecuteNonQuery();
                con.Close();
                if (a > 0)
                {

                    //maintaing  user credentials
                    GmailLoginCredentials(user_name, txtPassGmail.Text);
                    // this function will maintain records(for all registerd campaigns till yet.. for view-click purpose) in  'campain_details_Affiliate_wise' table . for all website entered here on registration time 
                    insert_affilaite_campaing_details_website_wise(user_name, txtWebsiteGmailReg.Text.Trim());
                    LoginToDashBoard(txtGmailId.Text, txtPassGmail.Text);
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Registration successfull, wait for admin approval.');window.location ='../LoginAffiliate.aspx';", true);
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Showstatus", "javascript:alert('Opppppssss.... please check your entries!!!!')", true);
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Showstatus", "javascript:alert('Oppps ... please fill each and every field in proper way!!!!!')", true);
        }
    }
    private void LoginToDashBoard(string UsrName, string Password)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("Select * from login_table where user_name='" + UsrName.ToString() + "' ", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                string sq = ds.Tables[0].Rows[0].ItemArray[3].ToString();

                if (sq == "Affiliate")
                {
                    con.Open();
                    SqlDataAdapter AdpAffiliateData = new SqlDataAdapter("Select Affiliate_user_name from Affiliate where mail='" + UsrName + "' ", con);
                    DataSet dsAffiliateData = new DataSet();
                    AdpAffiliateData.Fill(dsAffiliateData);
                    con.Close();
                    string status = ds.Tables[0].Rows[0].ItemArray[5].ToString();
                    if (status == "True")
                    {
                        Session.Add("User_name", ds.Tables[0].Rows[0].ItemArray[1].ToString());
                        Session.Add("affiliate_user_id", dsAffiliateData.Tables[0].Rows[0].ItemArray[0].ToString());
                        Session.Add("user_id", UsrName);
                        Session.Add("UserCode", dsAffiliateData.Tables[0].Rows[0]["Affiliate_user_name"].ToString());
                        Response.Redirect("~//admin/chart_view_Affiliate.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Please Contact to admin.. u are not allowed to login yet...')</script>");
                    }
                }
                else
                    Response.Write("<script>alert('Id Invalid for affiliate ....')</script>");
            }
            else
                Response.Write("<script>alert('Not Valid Login Details')</script>");
        }
        catch (Exception ex)
        {
        }
    }

}