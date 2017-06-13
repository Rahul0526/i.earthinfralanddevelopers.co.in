using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_updateVideoView : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string camp_id = Request.QueryString["camp_id"].ToString();
        string affiliate_id = Request.QueryString["affiliate_id"].ToString();
        string domain_name = Request.QueryString["domain_name"].ToString();
        string event_name = "View";
        string OsType = Request.QueryString["os_type"].ToString();
        string CountryName = Request.QueryString["country_name"].ToString();
        string sid = Request.QueryString["sid"].ToString();
        IncreaseViewVideo(camp_id, affiliate_id, domain_name, event_name, OsType, CountryName, sid);
    }
    private void IncreaseViewVideo(string camp_id, string affiliate_id, string domain_name, string event_name, string OsType, string CountryName, string sid)
    {
        try
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string sqlQuery = string.Empty;
            if (event_name == "View")
            {
                sqlQuery = "insert into view_click_maintain_on_daily_base (campain_id,affiliate_id,Website,event_found,even_type,event_date,date,OS_type,CountryName) values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "','" + System.DateTime.Now + "','" + OsType + "','" + CountryName + "');";
                sqlQuery += "UPDATE campain_details SET total_views=total_views+1 WHERE campain_id='" + camp_id + "'";
            }
            SqlCommand cmd = new SqlCommand(sqlQuery);
            cmd.Connection = con;
            int confirmation = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}