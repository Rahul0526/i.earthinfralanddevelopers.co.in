using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_PieChartTest : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    BLGetMapData BlMap = new BLGetMapData();
    DLGetmapData DlMap = new DLGetmapData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            this.GetPieChartClicks(Convert.ToDateTime(Request.QueryString["StartDate"].ToString()), Convert.ToDateTime(Request.QueryString["EndDate"].ToString()));

    }
    private void GetPieChartClicks(DateTime Startdate, DateTime endDate)
    {
        try
        {
            string Instruct = string.Empty;
            if (Request.QueryString["ReqFrom"].ToString() == "AdminChart")
            {
                Instruct = "GetAdminPieChartClicks";
                BlMap.AffiliateID=string.Empty;
                
            }
            else if (Request.QueryString["ReqFrom"].ToString() == "AffiliateChart")
            {
                Instruct = "GetAffiliatePieChartClicks";
                BlMap.AffiliateID = Request.QueryString["AffiliateId"].ToString();
            }
            BlMap.startDate = Startdate;
            BlMap.EndDate = endDate;
            BlMap.instruction = Instruct.ToString();
            DataSet DsgeteData = DlMap.GetViewDataAdmin(BlMap);
            if (DsgeteData.Tables[0].Rows.Count > 0)
            {
                string countriesString = "";
                string Clicks = "";

                for (int count = 0; count < DsgeteData.Tables[0].Rows.Count; count++)
                {
                    if (count == 0)
                    {
                        countriesString = DsgeteData.Tables[0].Rows[count]["OsType"].ToString();
                        Clicks = DsgeteData.Tables[0].Rows[count]["Clicks"].ToString();
                    }
                    else
                    {
                        countriesString = countriesString + "," + DsgeteData.Tables[0].Rows[count]["OsType"].ToString();
                        Clicks = Clicks + "," + DsgeteData.Tables[0].Rows[count]["Clicks"].ToString();
                    }

                }
                Os.InnerText = countriesString.ToString();
                clicks.InnerText = Clicks.ToString();
            }
            else
            {

            }
        }
        catch (Exception sqe)
        {

        }
    }

}