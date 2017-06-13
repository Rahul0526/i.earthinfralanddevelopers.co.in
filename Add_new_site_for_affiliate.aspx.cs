using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Add_new_site_for_affiliate : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    public string[] strArr;
    public int loopcounter = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["affiliate_user_id"] != "" || Session["affiliate_user_id"] != null)
                load_details();
            else
                Response.Redirect("~/LoginAffiliate.aspx");
        }
    }

    protected int CheckForValidDomain()
    {

        string url = "http://www." + TextBox1.Text.Trim();

        WebResponse response = null;

        string data = string.Empty;

        try
        {
            WebRequest request = WebRequest.Create(url);

            response = request.GetResponse();

            using (StreamReader reader = new StreamReader(response.GetResponseStream()))
            {

                data = reader.ReadToEnd();
            }

            // domain exists, this is valid domain
            load_details();
            lblResponse.Text = "<font color=\"green\"><b>Valid domain name !</b></font>";
            return 1;
        }

        catch (WebException ee)
        {

            // return false, most likely this domain doesn't exists
            load_details();
            lblResponse.Text = "<br /><b>Most probably this domain name doesn't exists.</b> <br />";
            return 0;
        }

        catch (Exception ee)
        {

            // Some error occured, the domain might exists 

            lblResponse.Text = "Invalid Domain Name. ";
            lblResponse.ForeColor = System.Drawing.Color.Red;
            load_details();
            return 0;
        }

        finally
        {
            if (response != null) response.Close();
            load_details();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (CheckForValidDomain() == 1)
        {
            #region Add New Site
            try
            {
                if (TextBox1.Text != "")
                {

                    con.Open();
                    string affiliate_id = Session["affiliate_user_id"].ToString();
                    SqlDataAdapter adp = new SqlDataAdapter("select website from Affiliate where Affiliate_user_name='" + affiliate_id + "'", con);
                    DataSet ds = new DataSet();
                    adp.Fill(ds);
                    con.Close();
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        int counter = 0;
                        string websites = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                        string[] strArr = websites.Split(',');
                        for (int count_site = 0; count_site <= strArr.Length - 1; count_site++)
                        {
                            if (strArr[count_site].ToString() == TextBox1.Text.ToString())
                            {
                                counter++;
                                break;
                            }
                            else
                                continue;
                        }
                        if (counter == 0)
                        {
                            con.Open();
                            string site_string = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                            site_string = site_string + "," + TextBox1.Text;
                            SqlCommand cmd = new SqlCommand(" update Affiliate set website='" + site_string + "' where Affiliate_user_name='" + affiliate_id + "' ");
                            cmd.Connection = con;
                            cmd.ExecuteNonQuery();
                            con.Close();
                           
                            insert_affilaite_campaing_details_website_wise(affiliate_id, TextBox1.Text);

                            TextBox1.Text = "";
                            lblResponse.Text = "Registered Sucessfully!!!!";
                        }
                        else
                        {
                            Response.Write("<script>alert('Enter a new site ... this site is already registered by you!!!!')</script>");
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Enter Website Name First')</script>");
                }
                load_details();

            }
            catch
            {

            }
            #endregion
        }
        else
        {
            lblResponse.Text = "Invalid Domain name.";
            load_details();
        }
    }
    protected void insert_affilaite_campaing_details_website_wise(string affiliate_id, string websites_registering)
    {
        try
        {
            int total_view = 0;
            int total_click = 0;
            int total_conversions = 0;
            decimal total_revenue = 0;
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select distinct  campaign_id from campaigns", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            //end
            if (ds.Tables[0].Rows.Count > 0)//if campaingns exists.
            {
                for (int count = 0; count < ds.Tables[0].Rows.Count; count++)//this loop will run for all campaings 
                {
                    //start campaingn loop
                    con.Open();
                    string camp_id = ds.Tables[0].Rows[count].ItemArray[0].ToString();
                    string site_name = websites_registering.ToString();
                    SqlCommand cmd3 = new SqlCommand("insert into campain_details_Affiliate_wise values('" + camp_id + "','" + affiliate_id + "' , '" + site_name + "' , " + total_click + " , " + total_conversions + ", " + total_view + " , 'Running','" + total_revenue + "', '" + System.DateTime.Now + "')");
                    cmd3.Connection = con;
                    cmd3.ExecuteNonQuery();
                    con.Close();
                }//end campaign loop
            }
        }
        catch
        {
        }
    }
    protected void load_details()
    {
        try
        {
            con.Open();
            string affiliate_id = Session["affiliate_user_id"].ToString();
            SqlDataAdapter adp = new SqlDataAdapter("SELECT Affiliate_user_name as 'User_Name',mail,date,   status=cast(case when cast((select count(*) from dbo.tblAffiliateDomains  where DomainName=LTRIM(RTRIM(m.n.value('.[1]','varchar(8000)'))) )as int)>0 then 1  else 0 end  as bit),   LTRIM(RTRIM(m.n.value('.[1]','varchar(8000)'))) AS 'Websites' FROM( SELECT Affiliate_user_name,mail,date,CAST('<XMLRoot><RowData>' + REPLACE(website,',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS x FROM   dbo.Affiliate   where Affiliate_user_name='" + affiliate_id + "')t CROSS APPLY x.nodes('/XMLRoot/RowData')m(n)", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            GridWebsites.DataSource = ds.Tables[0];
            GridWebsites.DataBind();
            this.CheckStatus();
        }
        catch
        {

        }
    }


    private void CheckStatus()
    {
        try
        {
            for(int count=0; count<GridWebsites.Rows.Count; count++)
            {
                Label lbStatus = (Label)GridWebsites.Rows[count].Cells[1].FindControl("lbStatus");
                SqlDataAdapter adp = new SqlDataAdapter("select * from tblAffiliateDomains where DomainName='" + GridWebsites.Rows[count].Cells[2].Text + "'", con);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    if (Convert.ToBoolean(dt.Rows[0]["Status"]) ==true)
                    {
                        lbStatus.Text = "Approved";
                        lbStatus.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lbStatus.Text = "Denied";
                        lbStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lbStatus.Text = "Pending";
                    lbStatus.ForeColor = System.Drawing.Color.Orange;
                }
            }

        }
        catch(Exception sqe)
        {
 
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

}