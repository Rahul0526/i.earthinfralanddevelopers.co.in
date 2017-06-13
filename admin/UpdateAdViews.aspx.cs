using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;
using System.Configuration;

public partial class admin_UpdateAdViews : System.Web.UI.Page
{
    SqlConnection con = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        //int intBannerMode = 0;
        string strCampaignId = string.Empty;
        if (!Page.IsPostBack)
        {

            if (Request.QueryString["CompaignId"] != null)
            {
                strCampaignId = Request.QueryString["CompaignId"].ToString();
                this.UpdateVideoViews(strCampaignId);
            }
            
            

        }
    }

    protected void UpdateVideoViews(string strCampaignId)
    {
       
            try
            {

                //var url = "http://localhost:4374/The_campaign/admin/Campaign_Ad_Panel_View.aspx?camp_id=" + camp_id + "&request_type=" + req_type + "&affiliate_id=" + Affiliate_id + "&domain_name=" + domain_name + "&bg_color=" + bg_color + "&button_color=" + button_color;
                

                    string affiliate_id = Request.QueryString["affiliate_id"];
                    string domain_name = Request.QueryString["domain_name"];


                    con.Open();
                    SqlDataAdapter adp = new SqlDataAdapter("select * from campain_details where campain_id='" + strCampaignId + "'", con);
                    DataSet ds = new DataSet();
                    adp.Fill(ds);
                    con.Close();
                    if (ds.Tables[0].Rows.Count > 0)// cheking that  campaign id is valid or not
                    {
                        //if campaign exist for the the transmitted id from client ad end... than look about the ad description in 'campain_details_Affiliate_wise' table that campaign ,affiliate and website are  matching or not
                        con.Open();
                        SqlDataAdapter adp2 = new SqlDataAdapter("select * from campain_details_Affiliate_wise where campain_id='" + strCampaignId + "' and affiliate_id='" + affiliate_id + "' and Website='" + domain_name + "'", con);
                        DataSet ds2 = new DataSet();
                        adp2.Fill(ds2);
                        con.Close();
                        if (ds2.Tables[0].Rows.Count > 0)
                        {


                            string check_running_mode = ds2.Tables[0].Rows[0].ItemArray[6].ToString();
                            if (check_running_mode == "Running")//checking that the ad is in running mode or not
                            {

                                //now increasing the view in main view click table for admin ...
                                //start


                                //end




                                //now increasing the view for affiliate table as well 


                                //start



                                if (check_running_mode == "Running")
                                {
                                    int get_total_views = Convert.ToInt32(ds2.Tables[0].Rows[0].ItemArray[5]);

                                    get_total_views = get_total_views + 1;  //increasing total view by 1


                                    //updaing view for campaign.....
                                    con.Open();
                                    SqlCommand cmd = new SqlCommand("update campain_details_Affiliate_wise set total_views=" + Convert.ToInt32(get_total_views) + " where campain_id='" + strCampaignId + "' and affiliate_id='" + affiliate_id + "' and Website='" + domain_name + "' ");
                                    cmd.Connection = con;
                                    cmd.ExecuteNonQuery();
                                    con.Close();
                                }


                            }



                            //well ... now calling the function of maintain the daily base report for view.   function is right below of the current  function
                            //start
                            string event_type = "View";

                            maintain_per_view(strCampaignId, affiliate_id, domain_name, event_type);//this function will return nothing
                            //end 

                        }




                        string running_status = ds.Tables[0].Rows[0].ItemArray[5].ToString();


                        if (running_status == "Running")
                        {
                            int get_total_views = Convert.ToInt32(ds.Tables[0].Rows[0].ItemArray[4]);

                            get_total_views = get_total_views + 1;  //increasing total view by 1


                            //updaing view for campaign.....
                            con.Open();
                            SqlCommand cmd = new SqlCommand("update campain_details set total_views=" + Convert.ToInt32(get_total_views) + " where campain_id='" + strCampaignId + "' ");
                            cmd.Connection = con;
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Warning", "VideoEvent();", true);
                    }
                    else
                    {

                    }

                



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.ToString().Trim() + "')</script>");
            }
            Response.Write("<script>alert('Clicked Saved')</script>");
        
    }

    protected void maintain_report(string camp_id, string affiliate_id, string domain_name, string event_name, int current_clicks, int current_conversions, decimal current_revenue)
    {



        try
        {
            //maitaining report_table 

            con.Open();
            SqlCommand cmd_report = new SqlCommand("insert into report_manage_table_for_affilaite  values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "'," + Convert.ToInt32(current_clicks) + "," + Convert.ToInt32(current_conversions) + ", '" + Convert.ToDecimal(current_revenue) + "')");
            cmd_report.Connection = con;
            cmd_report.ExecuteNonQuery();
            con.Close();

        }
        catch
        {

        }
    }

    protected void maintain_report_admin(string camp_id, string event_name, int current_clicks, int current_conversions, decimal current_revenue)
    {



        try
        {
            //maitaining report_table 

            con.Open();
            SqlCommand cmd_report = new SqlCommand("insert into report_manage_table  values('" + camp_id + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "'," + Convert.ToInt32(current_clicks) + "," + Convert.ToInt32(current_conversions) + ", '" + Convert.ToDecimal(current_revenue) + "')");
            cmd_report.Connection = con;
            cmd_report.ExecuteNonQuery();
            con.Close();

        }
        catch
        {

        }
    }

    protected void maintain_per_view(string camp_id, string affiliate_id, string domain_name, string event_name)//this function will maintains records for reporting purpose(for view)
    {
        try
        {


            //inserting record


            try
            {
                con.Open();
                string os_type = Request.QueryString["os_type"];
                SqlCommand cmd = new SqlCommand("insert into view_click_maintain_on_daily_base  values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "','" + System.DateTime.Now + "','" + os_type + "')");
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch
            {

            }






        }
        catch
        {

        }
    }

    private void SaveClick(string campaign_id)
    {
        try
        {
            string affiliate_id = Request.QueryString["affiliate_id"];
            string domain_name = Request.QueryString["domain_name"];
            string Website = Request.QueryString["Website"];

            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * from campain_details where campain_id='" + campaign_id + "'", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)// cheking that  campaign id is valid or not
            {
                //if campaign exist for the the transmitted id from client ad end... than look about the ad description in 'campain_details_Affiliate_wise' table that campaign ,affiliate and website are  matching or not
                con.Open();
                SqlDataAdapter adp2 = new SqlDataAdapter("select * from campain_details_Affiliate_wise where campain_id='" + campaign_id + "' and affiliate_id='" + affiliate_id + "' and Website='" + domain_name + "'", con);
                DataSet ds2 = new DataSet();
                adp2.Fill(ds2);
                con.Close();
                if (ds2.Tables[0].Rows.Count > 0)
                {


                    string check_running_mode = ds2.Tables[0].Rows[0].ItemArray[6].ToString();
                    if (check_running_mode == "Running")//checking that the ad is in running mode or not
                    {






                        //now increasing the view for affiliate table as well 


                        //start



                        if (check_running_mode == "Running")
                        {
                            int get_total_clicks = Convert.ToInt32(ds2.Tables[0].Rows[0].ItemArray[3]);

                            get_total_clicks = get_total_clicks + 1;  //increasing total view by 1



                            decimal conversion = 0;

                            SqlDataAdapter adp1 = new SqlDataAdapter("select cost from campaigns where campaign_id='" + campaign_id + "' ", con);
                            DataSet ds1 = new DataSet();
                            adp1.Fill(ds1);
                            con.Close();

                            if (ds1.Tables[0].Rows.Count > 0)
                            {
                                string s1 = ds1.Tables[0].Rows[0].ItemArray[0].ToString();
                                if (s1 != "")
                                {


                                    decimal d1 = Convert.ToDecimal(s1);
                                    conversion = Convert.ToDecimal(get_total_clicks) * d1;


                                }


                            }

                            //updaing view for campaign.....
                            con.Open();
                            SqlCommand cmd = new SqlCommand("update campain_details_Affiliate_wise set total_clicks=" + Convert.ToInt32(get_total_clicks) + ",total_conversions=" + Convert.ToInt32(get_total_clicks) + " , total_revenu='" + conversion + "' where campain_id='" + campaign_id + "' and affiliate_id='" + affiliate_id + "' and Website='" + domain_name + "' ");
                            cmd.Connection = con;
                            int a = cmd.ExecuteNonQuery();
                            con.Close();
                            string event_type1 = "Click";
                            //maintain_report(string camp_id, string affiliate_id, string domain_name, string event_name,string current_clicks,string current_conversions,string current_revenue)
                            maintain_report(campaign_id, affiliate_id, domain_name, event_type1, get_total_clicks, get_total_clicks, conversion);
                        }


                    }


                }

                //now increasing the view in main view click table for admin ...
                //start
                string running_status = ds.Tables[0].Rows[0].ItemArray[5].ToString();


                if (running_status == "Running")
                {
                    int get_total_clicks = Convert.ToInt32(ds.Tables[0].Rows[0].ItemArray[2]);

                    get_total_clicks = get_total_clicks + 1;  //increasing total view by 1



                    //total_conversion
                    decimal conversion = 0;

                    SqlDataAdapter adp1 = new SqlDataAdapter("select cost from campaigns where campaign_id='" + campaign_id + "' ", con);
                    DataSet ds1 = new DataSet();
                    adp1.Fill(ds1);
                    con.Close();

                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        string s1 = ds1.Tables[0].Rows[0].ItemArray[0].ToString();
                        if (s1 != "")
                        {


                            decimal d1 = Convert.ToDecimal(s1);
                            conversion = Convert.ToDecimal(get_total_clicks) * d1;


                        }


                    }



                    //updaing clicks and conversions for campaign.....
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update campain_details set total_clicks=" + Convert.ToInt32(get_total_clicks) + " , total_conversions=" + Convert.ToInt32(get_total_clicks) + ", total_revenu='" + conversion + "' where campain_id='" + campaign_id + "' ");
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    //string affiliate_id = Request.QueryString["affiliate_id"];
                    string str = "insert into getConversion values('" + affiliate_id.ToString().Trim() + "','" + campaign_id.ToString() + "','" + Website + "','" + Session["sid"].ToString() + "',0,'')";
                    SqlCommand cmdClick = new SqlCommand("insert into getConversion values('" + affiliate_id.ToString().Trim() + "','" + campaign_id.ToString() + "','" + Website.ToString().Trim() + "','" + Session["sid"].ToString() + "',0,'')");
                    cmdClick.Connection = con;
                    cmdClick.ExecuteNonQuery();

                    con.Close();
                    string eve_type = "Click";
                    maintain_report_admin(campaign_id, eve_type, get_total_clicks, get_total_clicks, conversion);






                }

                //end


                //well ... now calling the function of maintain the daily base report for view.   function is right below of the current  function
                //start
                string event_type = "Click";

                maintain_per_view(campaign_id, affiliate_id, domain_name, event_type);//this function will return nothing
                //end 


                //now redirection on the call on action

                con.Open();
                SqlDataAdapter adp21 = new SqlDataAdapter("select url from campaigns  where campaign_id='" + campaign_id + "' ", con);
                DataSet ds21 = new DataSet();
                adp21.Fill(ds21);
                con.Close();
                if (ds21.Tables[0].Rows.Count > 0)
                {
                    string call_on_action = ds21.Tables[0].Rows[0].ItemArray[0].ToString();
                    //Response.Write("<script language='javascript'> window.open('" + call_on_action + "', 'window','HEIGHT=600,WIDTH=820,top=50,left=50,toolbar=yes,scrollbars=yes,resizable=yes');</script>");
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('" + call_on_action + Session["sid"] + "');", true);
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

    [WebMethod]
    public static void updateView(string campId, string bannerId, string affiliateId, string domain, string os, string country)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        con.Open();
        string event_type = "View";
        if (bannerId == "Banner 5")
        {
            event_type = "Impression";
        }
        string sqlQuery = "insert into view_click_maintain_on_daily_base (campain_id,affiliate_id,Website,event_found,even_type,event_date,date,OS_type,CountryName) values('" + campId + "', '" + affiliateId + "', '" + domain + "','Yes', '" + event_type + "', '" + System.DateTime.Now + "','" + System.DateTime.Now + "','" + os + "','" + country + "');";
        sqlQuery += "UPDATE campain_details SET total_views=total_views+1 WHERE campain_id='" + campId + "'";
        SqlCommand cmd = new SqlCommand(sqlQuery, con);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    
}