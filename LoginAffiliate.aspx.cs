using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class LoginAffiliate : System.Web.UI.Page
{
    BALLogin blLogin=new BALLogin();
    DALLogin dlLogin=new DALLogin();
    DataTable dtLogin;
    int getQueryResponse = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }

    }


    private DataTable LoginTrigger()
    {
        try
        {
            blLogin.Flag = "LoginAffiliate";
            blLogin.MailID = txtAffiliateMail.Text.Trim().ToString();
            blLogin.Password = txtpassword.Text.Trim().ToString();
            dtLogin = dlLogin.Login(blLogin);
            if (dtLogin.Rows.Count > 0)
                this.ResetLoginAttemps();
            return dtLogin;
        }
        catch
        {
            return null;
        }
    
    }
    private int IncreaseLoginAttemps()
    {
        try
        {
            blLogin.Flag = "AddLoginAttempt";
            blLogin.MailID = txtAffiliateMail.Text.Trim().ToString();
           // blLogin.SystemBlockDate = ;

            blLogin.ClientIpAddress = hdnfIpAddress.Value;
            getQueryResponse = dlLogin.AddLoginAttempt(blLogin);
            return getQueryResponse;
        }
        catch
        {
            return 0;
        }

    }
    private int ResetLoginAttemps()
    {
        try
        {
            #region Reset System Attempts
            blLogin.Flag = "ResetSystemBlock";
            blLogin.MailID = txtAffiliateMail.Text.Trim().ToString();
            getQueryResponse = dlLogin.ResetAttemps(blLogin);
            #endregion


            #region Reset Global Block (If any)
            blLogin.Flag = "ResetGlobalBlock";
            blLogin.MailID = txtAffiliateMail.Text.Trim().ToString();
            getQueryResponse = dlLogin.ResetAttemps(blLogin);
            #endregion

            return getQueryResponse;
        }
        catch
        {
            return 0;
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        #region CheckLogin
        blLogin.Flag = "checkLoginBlock";
        blLogin.MailID=txtAffiliateMail.Text.Trim().ToString();
        blLogin.Password=txtpassword.Text.Trim().ToString();
        blLogin.ClientIpAddress = hdnfIpAddress.Value;
        DataTable  dtBlockStatus=dlLogin.CheckBlockStatus(blLogin);
        if (dtBlockStatus != null)
        {
            if (dtBlockStatus.Rows.Count > 0)
            {
                if (dtBlockStatus.Rows[0]["GlobalBlockDate"].ToString() == string.Empty)
                {
                    if (Convert.ToInt32(dtBlockStatus.Rows[0]["SystemBlockStatus"].ToString()) == 0)
                    {
                      DataTable dtLoginState=this.LoginTrigger();
                      if (dtLoginState.Rows.Count > 0)
                      {
                          if (dtLoginState.Rows[0]["login_status"].ToString() == "True")
                          {
                              Session.Add("User_name", dtLoginState.Rows[0]["name"].ToString());
                              Session.Add("affiliate_user_id", dtLoginState.Rows[0]["AffiliateId"].ToString());
                              Session.Add("user_id", dtLoginState.Rows[0]["EmailId"].ToString());
                              Session.Add("UserCode", dtLoginState.Rows[0]["AffiliateId"].ToString());
                              try {this.ResetLoginAttemps(); } catch { }
                              Response.Redirect("~//admin/chart_view_Affiliate.aspx");
                          }
                          else
                              Response.Write("<script>alert('Login has been blocked by admin. please contact..')</script>");
                      }
                      else
                      {
                          this.IncreaseLoginAttemps();
                          Response.Write("<script>alert('Id Invalid for affiliate ....')</script>");
                      }
                    }
                    else
                    {
                        this.IncreaseLoginAttemps();
                        Response.Write("<script>alert('your system has been blocked for next 20 minutes')</script>");
                    }

                }
                else
                {
                    if (Convert.ToDateTime(dtBlockStatus.Rows[0]["GlobalBlockDate"].ToString()) < System.DateTime.Now)
                    {
                        this.ResetLoginAttemps();
                       
                            DataTable dtLoginState = this.LoginTrigger();
                            if (dtLoginState.Rows.Count > 0)
                            {
                                if (dtLoginState.Rows[0]["login_status"].ToString() == "True")
                                {
                                    Session.Add("User_name", dtLoginState.Rows[0]["name"].ToString());
                                    Session.Add("affiliate_user_id", dtLoginState.Rows[0]["AffiliateId"].ToString());
                                    Session.Add("user_id", dtLoginState.Rows[0]["EmailId"].ToString());
                                    Session.Add("UserCode", dtLoginState.Rows[0]["AffiliateId"].ToString());
                                    try { this.ResetLoginAttemps(); }
                                    catch { }
                                    Response.Redirect("~//admin/chart_view_Affiliate.aspx");
                                }
                                else
                                    Response.Write("<script>alert('Login has been blocked by admin. please contact..')</script>");
                            }
                            else
                            {
                                this.IncreaseLoginAttemps();
                                Response.Write("<script>alert('Id Invalid for affiliate ....')</script>");
                            }
                       
                    }
                    else
                    {
                        this.IncreaseLoginAttemps();
                        Response.Write("<script>alert('You are globally blocked for next 24 hours..')</script>");
                    
                    }
                
                }
                //if (Convert.ToDateTime(dtBlockStatus.Rows[0]["ExceedDateTime"].ToString()) >= System.DateTime.Now)
                //{ this.LoginTrigger(); }
                //else
                //{ this.IncreaseLoginAttemps(); }
            }
            else
            { this.LoginTrigger(); }
        }
        else
        {

        }
        #endregion


        //try
        //{
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        //    con.Open();
        //    SqlDataAdapter adp = new SqlDataAdapter("Select * from login_table where user_name='" + txtAffiliateMail.Text.Trim() + "' and password='" + txtpassword.Text + "'", con);
        //    DataSet ds = new DataSet();
        //    adp.Fill(ds);
        //    con.Close();
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {
        //        string sq = ds.Tables[0].Rows[0].ItemArray[3].ToString();

        //        if (sq == "Affiliate")
        //        {


        //            con.Open();
        //            SqlDataAdapter adp2 = new SqlDataAdapter("Select Affiliate_user_name from Affiliate where mail='" + txtAffiliateMail.Text + "' ", con);
        //            DataSet ds2 = new DataSet();
        //            adp2.Fill(ds2);
        //            con.Close();


        //            string status = ds.Tables[0].Rows[0].ItemArray[5].ToString();
        //            if (status == "True")
        //            {

        //                Session.Add("User_name", ds.Tables[0].Rows[0].ItemArray[1].ToString());
        //                Session.Add("affiliate_user_id", ds2.Tables[0].Rows[0].ItemArray[0].ToString());
        //                Session.Add("user_id", txtAffiliateMail.Text);
        //                Session.Add("UserCode", ds2.Tables[0].Rows[0]["Affiliate_user_name"].ToString());
        //                Response.Redirect("~//admin/chart_view_Affiliate.aspx");
        //            }
        //            else
        //            {
        //                Response.Write("<script>alert('Please Contact to admin.. u are not allowed to login yet...')</script>");
        //            }

        //        }
        //        else
        //        {
        //            Response.Write("<script>alert('Id Invalid for affiliate ....')</script>");

        //        }
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('Not Valid Login Details')</script>");
        //    }
        //}
        //catch (Exception ex)
        //{
        //    //Response.Write("<script>alert('"+ex.Message.ToString()+"')</script>");
        //}

    }
    protected void btnGmailLogin_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("Select * from login_table where user_name='" + AffiliateMailId.Value.Trim().ToString() + "' ", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                string sq = ds.Tables[0].Rows[0].ItemArray[3].ToString();

                if (sq == "Affiliate")
                {
                    con.Open();
                    SqlDataAdapter adp2 = new SqlDataAdapter("Select Affiliate_user_name from Affiliate where mail='" + AffiliateMailId.Value.Trim().ToString() + "' ", con);
                    DataSet ds2 = new DataSet();
                    adp2.Fill(ds2);
                    con.Close();


                    string status = ds.Tables[0].Rows[0].ItemArray[5].ToString();
                    if (status == "True")
                    {

                        Session.Add("User_name", ds.Tables[0].Rows[0].ItemArray[1].ToString());
                        Session.Add("affiliate_user_id", ds2.Tables[0].Rows[0].ItemArray[0].ToString());
                        Session.Add("user_id", txtAffiliateMail.Text);
                        Session.Add("UserCode", ds2.Tables[0].Rows[0]["Affiliate_user_name"].ToString());
                        Response.Redirect("~//admin/chart_view_Affiliate.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Please Contact to admin.. u are not allowed to login yet...')</script>");
                    }

                }
                else
                {
                    Response.Write("<script>alert('Id Invalid for affiliate ....')</script>");

                }
            }
            else
            {
                Response.Write("<script>alert('Not Valid Login Details')</script>");
            }
        }
        catch (Exception ex)
        {
            //Response.Write("<script>alert('"+ex.Message.ToString()+"')</script>");
        }
    }
}