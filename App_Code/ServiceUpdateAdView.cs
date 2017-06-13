using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.Web.Script.Services;
using System.Web.UI;
using System.Text;

/// <summary>
/// Summary description for ServiceUpdateAdView
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class ServiceUpdateAdView : System.Web.Services.WebService {
    SqlConnection con = null;
    private static string strConstr = @"Data Source=mssql.gipdns.com,1533;Initial Catalog=camp;Integrated Security=False;User ID=camp;Password=Augurs@123";
    public ServiceUpdateAdView ()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod, ScriptMethod]
    public void UpdateVideoViews(string strParam)
    {

        try
        {
            
            //var url = "http://localhost:4374/The_campaign/admin/Campaign_Ad_Panel_View.aspx?camp_id=" + camp_id + "&request_type=" + req_type + "&affiliate_id=" + Affiliate_id + "&domain_name=" + domain_name + "&bg_color=" + bg_color + "&button_color=" + button_color;
            string[] strArr = strParam.ToString().ToString().Split(';');
            string strCampaignId = strArr[0].ToString();
            string affiliate_id = strArr[1].ToString(); ;
            string domain_name = strArr[2].ToString();
            string os_type = strArr[3].ToString();
            con = new SqlConnection(strConstr);
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

                    maintain_per_view(strCampaignId, affiliate_id, domain_name, event_type,os_type);//this function will return nothing
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
            throw ex;
           //Response.Write("<script>alert('" + ex.Message.ToString().Trim() + "')</script>");
        }
        //Response.Write("<script>alert('Clicked Saved')</script>");

    }

    //[WebMethod, ScriptMethod]
    //public void increase_view_of_ad(string strParam)
    //{
    //    try
    //    {
    //        //var url = "http://localhost:4374/The_campaign/admin/Campaign_Ad_Panel_View.aspx?camp_id=" + camp_id + "&request_type=" + req_type + "&affiliate_id=" + Affiliate_id + "&domain_name=" + domain_name + "&bg_color=" + bg_color + "&button_color=" + button_color;
    //        //if (banner6.Visible == false)
    //        //{

    //        //string affiliate_id = Request.QueryString["affiliate_id"];
    //        //string domain_name = Request.QueryString["domain_name"];
    //        string[] strArr = strParam.ToString().ToString().Split(';');
    //        string strCampaignId = strArr[0].ToString();
    //        string affiliate_id = strArr[1].ToString(); ;
    //        string domain_name = strArr[2].ToString();
    //        string os_type = strArr[3].ToString();

    //        con.Open();
    //        SqlDataAdapter adp = new SqlDataAdapter("select * from campain_details where campain_id='" + strCampaignId + "'", con);
    //        DataSet ds = new DataSet();
    //        adp.Fill(ds);
    //        con.Close();
    //        if (ds.Tables[0].Rows.Count > 0)// cheking that  campaign id is valid or not
    //        {
    //            //if campaign exist for the the transmitted id from client ad end... than look about the ad description in 'campain_details_Affiliate_wise' table that campaign ,affiliate and website are  matching or not
    //            con.Open();
    //            SqlDataAdapter adp2 = new SqlDataAdapter("select * from campain_details_Affiliate_wise where campain_id='" + strCampaignId + "' and affiliate_id='" + affiliate_id + "' and Website='" + domain_name + "'", con);
    //            DataSet ds2 = new DataSet();
    //            adp2.Fill(ds2);
    //            con.Close();
    //            if (ds2.Tables[0].Rows.Count > 0)
    //            {


    //                string check_running_mode = ds2.Tables[0].Rows[0].ItemArray[6].ToString();
    //                if (check_running_mode == "Running")//checking that the ad is in running mode or not
    //                {

    //                    //now increasing the view in main view click table for admin ...
    //                    //start


    //                    //end




    //                    //now increasing the view for affiliate table as well 


    //                    //start



    //                    if (check_running_mode == "Running")
    //                    {
    //                        int get_total_views = Convert.ToInt32(ds2.Tables[0].Rows[0].ItemArray[5]);

    //                        get_total_views = get_total_views + 1;  //increasing total view by 1


    //                        //updaing view for campaign.....
    //                        con.Open();
    //                        SqlCommand cmd = new SqlCommand("update campain_details_Affiliate_wise set total_views=" + Convert.ToInt32(get_total_views) + " where campain_id='" + strCampaignId + "' and affiliate_id='" + affiliate_id + "' and Website='" + domain_name + "' ");
    //                        cmd.Connection = con;
    //                        cmd.ExecuteNonQuery();
    //                        con.Close();
    //                    }


    //                }



    //                //well ... now calling the function of maintain the daily base report for view.   function is right below of the current  function
    //                //start
    //                string event_type = "View";

    //                maintain_per_view(strCampaignId, affiliate_id, domain_name, event_type, os_type);//this function will return nothing
    //                //end 

    //            }




    //            string running_status = ds.Tables[0].Rows[0].ItemArray[5].ToString();


    //            if (running_status == "Running")
    //            {
    //                int get_total_views = Convert.ToInt32(ds.Tables[0].Rows[0].ItemArray[4]);
    //                int get_total_imp = Convert.ToInt32(ds.Tables[0].Rows[0].ItemArray[5]);
    //                get_total_views = get_total_views + 1;  //increasing total view by 1
    //                get_total_imp += 1;

    //                //updaing view for campaign.....
    //                con.Open();
    //                StringBuilder SBcmdText = new StringBuilder();
    //                SBcmdText.Append("update campain_details set total_views=" + get_total_views.ToString());
    //                SBcmdText.Append(", total_Impression =" + get_total_imp.ToString());
    //                SBcmdText.Append(" where campain_id='" + strCampaignId + "'");
    //                SqlCommand cmd = new SqlCommand(SBcmdText.ToString());
    //                cmd.Connection = con;
    //                cmd.ExecuteNonQuery();
    //                con.Close();
    //            }

    //        }
    //        else
    //        {

    //        }

    //        // }



    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}

    protected void maintain_report(string camp_id, string affiliate_id, string domain_name, string event_name, int current_clicks, int current_conversions, decimal current_revenue)
    {



        try
        {
            //maitaining report_table 
            con = new SqlConnection(strConstr);
            con.Open();

            SqlCommand cmd_report = new SqlCommand("insert into report_manage_table_for_affilaite(campain_id,affiliate_id,Website,event_found,even_type,event_date,current_clicks,current_conversion,current_revenue)  values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "'," + Convert.ToInt32(current_clicks) + "," + Convert.ToInt32(current_conversions) + ", '" + Convert.ToDecimal(current_revenue) + "')");
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
            con = new SqlConnection(strConstr);
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




    protected void maintain_per_view(string camp_id, string affiliate_id, string domain_name, string event_name, string os_type)//this function will maintains records for reporting purpose(for view)
    {
        try
        {


            //inserting record


            try
            {
                con = new SqlConnection(strConstr);
                con.Open();
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

   
    
}
