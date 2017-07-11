using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_updateAddClicks : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                string campaign_id = Request.QueryString["camp_id"];
                string affiliate_id = Request.QueryString["affiliate_id"];
                string domain_name = Request.QueryString["domain_name"];
                string sid = Request.QueryString["sid"];
                string os_type = Request.QueryString["os_type"];
                string CountryName = Request.QueryString["country_name"];
                string state = Request.QueryString["state"];
                string city = Request.QueryString["city"];
                string ISP = Request.QueryString["ISP"];
                string lon = Request.QueryString["longitude"];
                string lat = Request.QueryString["latitude"];

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
                            int get_total_clicks = Convert.ToInt32(ds2.Tables[0].Rows[0].ItemArray[3]);

                            get_total_clicks = get_total_clicks + 1;  //increasing total view by 1
                            decimal Revenue = 0;
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
                                    Revenue = Convert.ToDecimal(get_total_clicks) * d1;
                                }
                            }

                            //updaing view for campaign.....
                            con.Open();
                            SqlCommand cmd = new SqlCommand("update campain_details_Affiliate_wise set total_clicks=" + Convert.ToInt32(get_total_clicks) + ",total_conversions=" + Convert.ToInt32(get_total_clicks) + " , total_revenu='" + Revenue + "', last_modification_date=CURRENT_TIMESTAMP where campain_id='" + campaign_id + "' and affiliate_id='" + affiliate_id + "' and Website='" + domain_name + "' ");
                            cmd.Connection = con;
                            int a = cmd.ExecuteNonQuery();
                            con.Close();
                            string event_type1 = "Click";
                            //maintain_report(string camp_id, string affiliate_id, string domain_name, string event_name,string current_clicks,string current_conversions,string current_revenue)
                            maintain_report(campaign_id, affiliate_id, domain_name, event_type1, get_total_clicks, get_total_clicks, Revenue);
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
                        //updaing clicks and conversions for campaign....
                        con.Open();
                        string updateQuery = "update campain_details set total_clicks=" + Convert.ToInt32(get_total_clicks) + " , total_conversions=" + Convert.ToInt32(get_total_clicks) + ", total_revenu='" + conversion + "', last_modification_date=current_timestamp where campain_id='" + campaign_id + "'";

                        SqlCommand cmd = new SqlCommand(updateQuery);
                        cmd.Connection = con;
                        cmd.ExecuteNonQuery();
                        cmd.Cancel();
                        //string affiliate_id = Request.QueryString["affiliate_id"];   SCFIDDQC3QU2
                        string str = "insert into getConversion values('" + affiliate_id.ToString().Trim() + "','" + campaign_id.ToString() + "','" + domain_name + "','" + sid + "',0,'',NULL,1)";
                        cmd = new SqlCommand(str.ToString().Trim());
                        cmd.Connection = con;
                        cmd.ExecuteNonQuery();
                        con.Close();
                        string eve_type = "Click";
                        maintain_report_admin(campaign_id, eve_type, get_total_clicks, get_total_clicks, conversion);

                    }
                    //end
                    //well ... now calling the function of maintain the daily base report for view.   function is right below of the current  function
                    //start
                    string event_type = "Click";
                    maintain_per_view(campaign_id, affiliate_id, domain_name, event_type, os_type, CountryName, sid);//this function will return nothing
                    storeRequestLocation(event_type, campaign_id, affiliate_id, domain_name, os_type, CountryName, state, city, ISP, lon, lat);
                    //if (Request.QueryString["banner_id"] == "Banner 5")
                    //{
                    //    event_type = "View";
                    //    IncreaseViewVideo(campaign_id, affiliate_id, domain_name, event_type, Session["OsType"].ToString(), Session["CountryName"].ToString(), Session["sid"].ToString());
                    //}
                    //end 
                    //now redirection on the call on action
                    con.Open();
                    SqlDataAdapter adp21 = new SqlDataAdapter("select url from campaigns  where campaign_id='" + campaign_id + "' ", con);
                    DataSet ds21 = new DataSet();
                    adp21.Fill(ds21);
                    con.Close();
                    if (ds21.Tables[0].Rows.Count > 0)
                    {
                        if (sid != "")
                        {
                            string call_on_action = ds21.Tables[0].Rows[0].ItemArray[0].ToString();
                        }
                    }
                }
                else
                {
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.ToString() + "')</script>");
            }
            finally
            {
                string banner_id = Request.QueryString["banner_id"];
                if (banner_id == "Banner 5")
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Warning", "VideoEvent();", true);
                //Response.Redirect(Request.RawUrl);
            }
        }
    }

    protected void maintain_report(string camp_id, string affiliate_id, string domain_name, string event_name, int current_clicks, int current_conversions, decimal current_revenue)
    {
        try
        {

            //maitaining report_table 

            con.Open();
            SqlCommand cmd_report = new SqlCommand("insert into report_manage_table_for_affilaite(campain_id,affiliate_id,Website,event_found,even_type,event_date,current_clicks,current_conversion,current_revenue)  values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "'," + Convert.ToInt32(current_clicks) + "," + Convert.ToInt32(current_conversions) + ", " + current_revenue + ")");
            cmd_report.Connection = con;
            int result = cmd_report.ExecuteNonQuery();
            con.Close();

        }
        catch
        {
        }
    }

    protected void maintain_report_admin(string camp_id, string event_name, int current_clicks, int current_conversions, decimal current_revenue, int intCurrentImp = 0)
    {
        try
        {
            //maitaining report_table 

            con.Open();
            string query = "insert into report_manage_table  values('" + camp_id + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "'," + Convert.ToInt32(current_clicks) + "," + Convert.ToInt32(current_conversions) + ", '" + Convert.ToDecimal(current_revenue) + "','" + intCurrentImp.ToString() + "')";
            SqlCommand cmd_report = new SqlCommand(query);
            cmd_report.Connection = con;
            cmd_report.ExecuteNonQuery();
            con.Close();

        }
        catch
        {

        }
    }

    protected void maintain_per_view(string camp_id, string affiliate_id, string domain_name, string event_name, string OsType, string CountryName, string sid)
    {
        try
        {
            try
            {

                if (con.State == ConnectionState.Closed)
                    con.Open();

                #region Get Campaign Cost
                SqlDataAdapter adp = new SqlDataAdapter("select cost from campaigns where campaign_id='" + camp_id + "'", con);
                DataTable dtGetCost = new DataTable();
                adp.Fill(dtGetCost);
                #endregion

                string sqlQuery = string.Empty;
                if (event_name == "View" || event_name == "Impression")
                {
                    sqlQuery = "insert into view_click_maintain_on_daily_base (campain_id,affiliate_id,Website,event_found,even_type,event_date,date,OS_type,CountryName) values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "','" + System.DateTime.Now + "','" + OsType + "','" + CountryName + "');";
                    if (event_name == "View")
                    {
                        sqlQuery += "UPDATE campain_details SET total_views=total_views+1 WHERE campain_id='" + camp_id + "'";
                    }
                }
                else if (event_name == "Click")
                {
                    sqlQuery = "insert into view_click_maintain_on_daily_base (campain_id,affiliate_id,Website,event_found,even_type,event_date,date,OS_type,CountryName,ClickId,clickCost) values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "','" + System.DateTime.Now + "','" + OsType + "','" + CountryName + "','" + sid + "','" + dtGetCost.Rows[0]["cost"].ToString() + "');";
                    //sqlQuery += "UPDATE campain_details SET total_views=total_views+1 WHERE campain_id='" + camp_id + "'";
                }
                else if (event_name == "AdRequest")
                {
                    sqlQuery = "insert into view_click_maintain_on_daily_base (campain_id,affiliate_id,Website,event_found,even_type,event_date,date,OS_type,CountryName) values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "','" + System.DateTime.Now + "','" + OsType + "','" + CountryName + "')";
                }

                SqlCommand cmd = new SqlCommand(sqlQuery);
                cmd.Connection = con;
                int confirmation = cmd.ExecuteNonQuery();
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

    protected void storeRequestLocation(string eventType, string camp_id, string affiliate_id, string domain_name, string os_type, string country, string state, string city, string ISP, string lon, string lat)
    {
        try
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string sqlQuery = string.Empty;
            sqlQuery = "insert into add_request_origions (request_type,affiliate_id,campaign_id,country_name,state_name,city_name,OS_type,domain_name,ISP,longitude,latitude,date_time) values(@request_type,@affiliate_id,@campaign_id,@country_name,@state_name,@city_name,@OS_type,@domain_name,@ISP,@longitude,@latitude,GETDATE())";
            SqlCommand cmd = new SqlCommand(sqlQuery, con);
            cmd.Parameters.AddWithValue("@request_type", eventType);
            cmd.Parameters.AddWithValue("@affiliate_id", affiliate_id);
            cmd.Parameters.AddWithValue("@campaign_id", camp_id);
            cmd.Parameters.AddWithValue("@country_name", country);
            cmd.Parameters.AddWithValue("@state_name", state);
            cmd.Parameters.AddWithValue("@city_name", city);
            cmd.Parameters.AddWithValue("@OS_type", os_type);
            cmd.Parameters.AddWithValue("@domain_name", domain_name);
            cmd.Parameters.AddWithValue("@ISP", ISP);
            cmd.Parameters.AddWithValue("@longitude", lon);
            cmd.Parameters.AddWithValue("@latitude", lat);
            cmd.CommandType = CommandType.Text;
            int confirmation = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch
        {
        }
    }

}