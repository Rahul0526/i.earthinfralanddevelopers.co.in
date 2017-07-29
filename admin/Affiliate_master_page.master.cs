using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Affiliate_master_page : System.Web.UI.MasterPage
{

    public string appLocation = ConfigurationManager.AppSettings["appLocation"].ToString();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
       
            if (!IsPostBack)
            {
                if (Session["affiliate_user_id"] != "" && Session["affiliate_user_id"] != null)
                {
                    try
                    {
                       this. LoadProfileDetails();
                       this. laod_user_name();
                    }
                    catch
                    {

                    }
                }
                else
                {
                    Response.Redirect("../LoginAffiliate.aspx");
                }
            }
        

    }
    private void LoadProfileDetails()
    {
        try
        {
            string sqlQuery = string.Empty;
            sqlQuery = "select * from Affiliate where Affiliate_user_name='" + Session["affiliate_user_id"].ToString() + "'";
            SqlDataAdapter adpGetAffiliateDetails = new SqlDataAdapter(sqlQuery, con);
            DataTable dtGetAffiliateDetails = new DataTable();
            adpGetAffiliateDetails.Fill(dtGetAffiliateDetails);
            if (dtGetAffiliateDetails.Rows[0]["name"].ToString() != string.Empty && dtGetAffiliateDetails.Rows[0]["mail"].ToString() != string.Empty && dtGetAffiliateDetails.Rows[0]["Address"].ToString() != string.Empty && dtGetAffiliateDetails.Rows[0]["country"].ToString() != string.Empty && dtGetAffiliateDetails.Rows[0]["state"].ToString() != string.Empty && dtGetAffiliateDetails.Rows[0]["city"].ToString() != string.Empty && dtGetAffiliateDetails.Rows[0]["postal_code"].ToString() != string.Empty && dtGetAffiliateDetails.Rows[0]["PaypalAccountName"].ToString() != string.Empty && dtGetAffiliateDetails.Rows[0]["bank_info"].ToString() != string.Empty && dtGetAffiliateDetails.Rows[0]["BankAddress"].ToString() != string.Empty && dtGetAffiliateDetails.Rows[0]["IBAN"].ToString() != string.Empty && dtGetAffiliateDetails.Rows[0]["BIC"].ToString() != string.Empty)
            {
                hdnfProfileIndiCator.Value = "0";
            }
            else
            {
                hdnfProfileIndiCator.Value = "1";
            }
            if (dtGetAffiliateDetails.Rows[0]["ProfileImageUrl"].ToString() != null && dtGetAffiliateDetails.Rows[0]["ProfileImageUrl"].ToString() != string.Empty)
                ProfileImg.Src = dtGetAffiliateDetails.Rows[0]["ProfileImageUrl"].ToString(); 
        }
        catch
        {
 
        }
    }
    protected void logout(object sender ,EventArgs e)
    {
        try
        {
            Session.RemoveAll();
            Session.Clear();
            Session.Abandon();
            Response.Redirect("../LoginAffiliate.aspx");
        }
        catch
        {
 
        }
    }
    protected void laod_user_name()
    {

        try
        {
            string s1 = Session["User_name"].ToString();

                user_name.InnerText = s1;
           
        }
        catch
        {
 
        }
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        try
        {
            Session.RemoveAll();
            Session.Clear();
            Session.Abandon();
            Response.Redirect("../LoginAffiliate.aspx");
        }
        catch
        {

        }
    }
}
