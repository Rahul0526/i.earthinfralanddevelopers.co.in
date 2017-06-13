using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class admin_SearchClickIdDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindIPList();
        }
    }
    protected void txtClickId_TextChanged(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * ,mail, (select campaigin_name from campaigns where campaign_id=(select distinct campaignId from getConversion where Clickid='" + txtClickId.Text.Trim() + "')) as 'campaigin_name' from Affiliate where Affiliate_user_name=(select distinct AffiliateId from getConversion where Clickid='" + txtClickId.Text.Trim() + "')", con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                lbStatus.Text="This conversion comes from this Affiliate:<b>"+dt.Rows[0]["mail"].ToString()+"</b>";
                GridAffiliate.DataSource = dt;
                GridAffiliate.DataBind();
            }
            else
            {  

            }
        }
        catch
        {
            
        }
    }

    private void bindIPList()
    {
        con.Open();
        SqlDataAdapter adp = new SqlDataAdapter("select  IP,sum(conversion) as converted from getConversion gc where (select sum(conversion) from getConversion where IP=gc.IP)>1 and (select top(1) isWhitelist from getConversion where IP=gc.IP order by Id)=1 group by IP", con);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        con.Close();
        if (dt.Rows.Count > 0)
        {
            lblSuspiciousCount.Text = dt.Rows.Count.ToString();
            GridBlockDetails.DataSource = dt;
            GridBlockDetails.DataBind();
        }
    }

    protected void GridBlockDetails_DataBound(object sender, EventArgs e)
    {
        string strCount = string.Empty;
        foreach (GridViewRow row in GridBlockDetails.Rows)
        {
            strCount = ((Label)row.FindControl("lblCount")).Text.Trim();
            if (strCount == "2")
                row.BackColor = Color.Orange;
            else
                row.BackColor = Color.Red;
        }
    }

    protected void GridBlockDetails_SelectIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("UPDATE [dbo].[getConversion] set [isWhitelist]=0 where IP = '" + GridBlockDetails.DataKeys[e.NewSelectedIndex].Value + "' ", con);
        cmd.ExecuteNonQuery();
        con.Close();
        bindIPList();
    }
}