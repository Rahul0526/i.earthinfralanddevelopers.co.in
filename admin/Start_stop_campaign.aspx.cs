using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_Start_stop_campaign : System.Web.UI.Page
{
    BALCampaignDetails blCampData = new BALCampaignDetails();
    DALCampaignDetails dlCampData = new DALCampaignDetails();
    DataTable dtGatReturnedData;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.BindAllcampaigns();
            this.LoadCampaigns();
            this.RegisterPostBackControl();
        }
    }


    #region UDFs
    private void BindAllcampaigns()
    {
        try
        {
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select campaign_id , campaigin_name from campaigns where campaigin_name !=''  order by title asc", con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            con.Close();
            ddlCampaigns.Items.Clear();
            ddlCampaigns.DataSource = dt;
            ddlCampaigns.DataTextField = "campaigin_name";
            ddlCampaigns.DataValueField = "campaign_id";
            ddlCampaigns.DataBind();
            ddlCampaigns.Items.Insert(0, "--Select Campaign--");
        }
        catch (Exception sqe)
        {

        }
    }
    public SortDirection direction
    {
        get
        {
            if (ViewState["directionState"] == null)
                ViewState["directionState"] = SortDirection.Ascending;
            return (SortDirection)ViewState["directionState"];
        }
        set
        {
            ViewState["directionState"] = value;
        }
    }

    private void BindCampaignData()
    {
        try
        {
            if (GridCampaigns.Rows.Count > 0)
            {
                for (int a = 0; a < GridCampaigns.Rows.Count; a++)
                {
                    CheckBox cb = (CheckBox)GridCampaigns.Rows[a].Cells[7].FindControl("cb");
                    Label hidden_status = (Label)GridCampaigns.Rows[a].Cells[7].FindControl("lb_hidden_status");
                    Label set_status = (Label)GridCampaigns.Rows[a].Cells[7].FindControl("lb_status");
                    Label st = (Label)GridCampaigns.Rows[a].Cells[8].FindControl("running_status");
                    string click = GridCampaigns.Rows[a].Cells[4].Text;
                    string views = GridCampaigns.Rows[a].Cells[5].Text;
                    Label ctr = (Label)GridCampaigns.Rows[a].Cells[9].FindControl("ctr");
                    //ctr
                    if (click != "0" && views != "0")
                    {
                        try
                        {
                            decimal clickDecimal = Convert.ToDecimal(click.ToString()) * 100;
                            decimal viewDecimal = Convert.ToDecimal(views.ToString());
                            decimal totalCTR = clickDecimal / viewDecimal;
                            ctr.Text = (Math.Round(totalCTR, 2)).ToString() + " %";
                        }
                        catch
                        {
                            ctr.Text = "0%";
                        }
                    }
                    else
                    {
                        ctr.Text = "0%";
                    }

                    if (hidden_status.Text == "Running")
                    {
                        set_status.Text = "Running";
                        set_status.ForeColor = System.Drawing.Color.Green;
                        cb.Checked = true;
                        st.Text = "ACTIVE";
                    }
                    else
                    {
                        set_status.Text = "Stopped";
                        set_status.ForeColor = System.Drawing.Color.Red;
                        cb.Checked = false;
                        st.Text = "PAUSED";
                    }
                }
            }
        }
        catch
        {
        }
    }

    private void LoadCampaigns()
    {
        try
        {
            blCampData._Action = "getDataOnload";
            dtGatReturnedData = dlCampData.GetDataOnLoad(blCampData);
            if (dtGatReturnedData.Rows.Count > 0)
            {
                GridCampaigns.DataSource = dtGatReturnedData;
                GridCampaigns.DataBind();
                ViewState["VsCampaignData"] = dtGatReturnedData;
                if (Session["SessionTable"] == null)
                    Session.Add("SessionTable", dtGatReturnedData as DataTable);
                else
                    Session["SessionTable"] = dtGatReturnedData as DataTable;
                BindCampaignData();

            }
            else
            {
                GridCampaigns.DataSource = null;
                GridCampaigns.DataBind();
                ViewState["VsCampaignData"] = null;
            }
        }
        catch
        {

        }
    }
    private void load_filter_dd(string query)
    {
        try
        {
            if(con.State != ConnectionState.Open)
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridCampaigns.DataSource = ds.Tables[0];
                GridCampaigns.DataBind();
                ViewState["VsCampaignData"] = ds.Tables[0];
                if (Session["SessionTable"] == null)
                    Session.Add("SessionTable", ds.Tables[0] as DataTable);
                else
                    Session["SessionTable"] = ds.Tables[0] as DataTable;
                BindCampaignData();
            }
            else
            {
                GridCampaigns.DataSource = null;
                GridCampaigns.DataBind();
                ViewState["VsCampaignData"] = null;
            }
        }
        catch
        {

        }
    }
    private void RegisterPostBackControl()
    {
        foreach (GridViewRow row in GridCampaigns.Rows)
        {
        }
    }

    #endregion

    #region Click Events
    protected void gvTeacher_Sorting(object sender, GridViewSortEventArgs e)
    {
        string sortingDirection = string.Empty;
        if (direction == SortDirection.Ascending)
        {
            direction = SortDirection.Descending;
            sortingDirection = "Desc";
        }
        else
        {
            direction = SortDirection.Ascending;
            sortingDirection = "Asc";
        }
        DataTable dt = (DataTable)ViewState["VsCampaignData"];
        DataView sortedView = new DataView(dt);
        sortedView.Sort = e.SortExpression + " " + sortingDirection;
        Session["SortedView"] = sortedView;
        GridCampaigns.DataSource = sortedView;
        GridCampaigns.DataBind();
        BindCampaignData();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);


    }
    protected void load_check_boxes(object sender, EventArgs e)
    {
        try
        {
            CheckBox start = (CheckBox)sender;
            GridViewRow row = (GridViewRow)start.Parent.Parent;
            Label lbId = (Label)GridCampaigns.Rows[row.RowIndex].Cells[2].FindControl("lbId");
            string campaign_id = lbId.Text;
            if (start.Checked == true)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update campain_details set status='Running' where campain_id='" + campaign_id + "'");
                cmd.Connection = con;
                int QueryResponse = cmd.ExecuteNonQuery();
                con.Close();
                if (QueryResponse > 0)
                {
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand("update campain_details_Affiliate_wise set status='Running' where campain_id='" + campaign_id + "'");
                    cmd2.Connection = con;
                    int a2 = cmd2.ExecuteNonQuery();
                    con.Close();
                    DataTable dt = Session["SessionTable"] as DataTable;
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i]["campain_id"].ToString() == campaign_id)
                           dt.Rows[i]["status"] = "Running";
                    }
                    dt.AcceptChanges();
                    GridCampaigns.DataSource = dt;
                    GridCampaigns.DataBind();
                    this.BindCampaignData();
                    this.RegisterPostBackControl();
                }
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update campain_details set status='Stopped' where campain_id='" + campaign_id + "'");
                cmd.Connection = con;
                int QueryResponse = cmd.ExecuteNonQuery();
                con.Close();
                if (QueryResponse > 0)
                {
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand("update campain_details_Affiliate_wise set status='Stopped' where campain_id='" + campaign_id + "'");
                    cmd2.Connection = con;
                    int QueryResponse2 = cmd2.ExecuteNonQuery();
                    con.Close();
                    DataTable dt = Session["SessionTable"] as DataTable;
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i]["campain_id"].ToString() == campaign_id)
                            dt.Rows[i]["status"] = "Stopped";
                    }
                    dt.AcceptChanges();
                    GridCampaigns.DataSource = dt;
                    GridCampaigns.DataBind();
                    this.BindCampaignData();
                    this.RegisterPostBackControl();
                }
                //  this.   LoadCampaigns();
                //DataTable dtFilteredData = Session["SessionTable"] as DataTable;
                //GridCampaigns.DataSource = dtFilteredData;
                //GridCampaigns.DataBind();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);
            }
        }
        catch (Exception sqe)
        {
        }
    }
    protected void GridCampaigns_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {
            Session.Add("updatable_camp_id", GridCampaigns.DataKeys[e.NewSelectedIndex].Value.ToString());
            Response.Redirect("~/admin/EditCampaign.aspx");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);
        }
        catch
        {
        }
    }
    protected void GridCampaigns_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            lbCampaingDeleteID.Text = GridCampaigns.DataKeys[e.RowIndex].Value.ToString();
            ModelConfirmation.Show();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);
        }
        catch (Exception sqe)
        {

        }
    }
    protected void EditCampaignImgBtn(object sender, EventArgs e)
    {
        ImageButton imgBtn = (ImageButton)sender;
        GridViewRow row = (GridViewRow)imgBtn.Parent.Parent;
        Label lbId = (Label)GridCampaigns.Rows[row.RowIndex].Cells[0].FindControl("lbId");
        Session.Add("updatable_camp_id", lbId.Text);
        //Response.Redirect("~/admin/EditCampaign.aspx"); 
        //Response.Write(String.Format("window.open('{0}','_blank')", ResolveUrl("~/admin/EditCampaign.aspx")));
        Response.Write("<script>");
        Response.Write("window.open('EditCampaign.aspx','_blank')");
        Response.Write("</script>");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);
        //Response.Write("<script>window.open('www.google.com','_blank')</script>");


    }
    protected void DeleteCampaignImgBtn(object sender, EventArgs e)
    {
        ImageButton imgBtn = (ImageButton)sender;
        GridViewRow row = (GridViewRow)imgBtn.Parent.Parent;
        Label lbId = (Label)GridCampaigns.Rows[row.RowIndex].Cells[0].FindControl("lbId");
        lbCampaingDeleteID.Text = lbId.Text;
        ModelConfirmation.Show();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);
    }

    protected void getCampDetails(object sender, EventArgs e)
    {
        string[] DateArrey = txtDateSearch.Text.ToString().Split('-');
        string[] FirstDate = DateArrey[0].Split('/');

        string ThSwap = FirstDate[1];
        FirstDate[1] = FirstDate[0];
        FirstDate[0] = ThSwap;
        string NewDate = FirstDate[0].Trim() + "/" + FirstDate[1].Trim() + "/" + FirstDate[2].Trim();
        DateArrey[0] = NewDate;
        string[] secondDate = DateArrey[1].Split('/');
        string ThSwapSecondDate = secondDate[1];
        secondDate[1] = secondDate[0];
        secondDate[0] = ThSwapSecondDate;
        string NewDateSecond = secondDate[0].Trim() + "/" + (Convert.ToInt32(secondDate[1].Trim())+1).ToString() + "/" + secondDate[2].Trim();
        DateArrey[1] = NewDateSecond;


        LinkButton lnkBtn = (LinkButton)sender;
        GridViewRow row = (GridViewRow)lnkBtn.Parent.Parent;
        Label lbId = (Label)GridCampaigns.Rows[row.RowIndex].Cells[0].FindControl("lbId");
        string qry = "select (select campaigin_name from campaigns where campaign_id='" + lbId.Text + "') as camp_name, " +
" website,isnull((select sum(v.clickCost) from dbo.view_click_maintain_on_daily_base as v inner join dbo.getConversion as b on v.ClickId=b.Clickid " +
" where b.Conversion=1 and v.even_type='Click' and v.event_date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "' and b.campaignid='" + lbId.Text + "' and  v.website=a.website),0) as 'Revenue',isnull((select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Click' and  campain_id='" + lbId.Text + "' and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "' and website=a.website),0) as Click, " +
" isnull((select COUNT(DISTINCT(tbl2.ClickId)) from getConversion as tbl1  inner join  dbo.view_click_maintain_on_daily_base  as tbl2 on tbl1.Clickid=tbl2.ClickId and tbl1.Conversion=1  where tbl1.campaignId='" + lbId.Text + "' and  tbl2.website=a.website and tbl2.date  between '" + DateArrey[0] + "' and '" + DateArrey[1] + "' ),0 )  " +
" as 'total_conversions',total_VideoImpressions=case when (select Add_style_formate from dbo.campaigns where campaign_id='"+lbId.Text+"')='Banner 5'  " +
" then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and campain_id='" + lbId.Text + "' AND Website=a.website and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "') else 0 end , " +
" total_Views=case when (select Add_style_formate from dbo.campaigns where campaign_id='"+lbId.Text+"' and  website=a.website)!='Banner 5'  " +
" then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and campain_id='" + lbId.Text + "'  and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "' and website=a.website) else 0 end, " +
" isBlocked = case when(SELECT status FROM tblBlockwebsites WHERE campid = '" + lbId.Text + "' AND websiteName=a.website)=1 then 1 else 0 end  " +
" from dbo.view_click_maintain_on_daily_base a where campain_id='" + lbId.Text + "' and event_date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "' group by website order by website";
        con.Open();
        SqlDataAdapter adp = new SqlDataAdapter(qry, con);
        DataTable dtCampDetails = new DataTable();
        adp.Fill(dtCampDetails);
        con.Close();

        if (dtCampDetails.Rows.Count > 0)
            bannerName.Text = dtCampDetails.Rows[0]["camp_name"].ToString();
        else
            bannerName.Text = "";
        gdvCampDetails.DataSource = dtCampDetails;
        gdvCampDetails.ToolTip = lbId.Text;
        gdvCampDetails.DataBind();
        modalCampDetails.Show();
    }

    protected void DeleteCampaign(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            string camp_id = lbCampaingDeleteID.Text.ToString();
            SqlCommand cmd = new SqlCommand("delete from campaigns where campaign_id='" + camp_id + "' ");
            cmd.Connection = con;
            int a = cmd.ExecuteNonQuery();
            con.Close();
            if (a > 0)
            {
                //campain_details
                //try
                //{
                //    con.Open();
                //    SqlCommand cmd2 = new SqlCommand("delete from campain_details where campain_id='" + camp_id + "' ");
                //    cmd2.Connection = con;
                //    int a2 = cmd2.ExecuteNonQuery();
                //    con.Close();
                //}
                //catch(Exception sqe)
                //{
                //}
                ////campain_details_Affiliate_wise
                //try
                //{
                //    con.Open();
                //    SqlCommand cmd3 = new SqlCommand("delete from campain_details_Affiliate_wise where campain_id='" + camp_id + "' ");
                //    cmd3.Connection = con;
                //    int a3 = cmd3.ExecuteNonQuery();
                //    con.Close();
                //}
                //catch
                //{
                //}
                ////campain_details_Affiliate_wise
                //try
                //{
                //    con.Open();
                //    SqlCommand cmd4 = new SqlCommand("delete from campain_details_Affiliate_wise where campain_id='" + camp_id + "' ");
                //    cmd4.Connection = con;
                //    int a4 = cmd4.ExecuteNonQuery();
                //    con.Close();
                //}
                //catch
                //{
                //}
                ////report_manage_table
                //try
                //{
                //    con.Open();
                //    SqlCommand cmd5 = new SqlCommand("delete from report_manage_table where campain_id='" + camp_id + "' ");
                //    cmd5.Connection = con;
                //    int a5 = cmd5.ExecuteNonQuery();
                //    con.Close();

                //}
                //catch
                //{
                //}
                ////report_manage_table_for_affilaite
                //try
                //{
                //    con.Open();
                //    SqlCommand cmd6 = new SqlCommand("delete from report_manage_table_for_affilaite where campain_id='" + camp_id + "' ");
                //    cmd6.Connection = con;
                //    int a6 = cmd6.ExecuteNonQuery();
                //    con.Close();
                //}
                //catch
                //{
                //}
                ////view_click_maintain_on_daily_base
                //try
                //{
                //    con.Open();
                //    SqlCommand cmd7 = new SqlCommand("delete from view_click_maintain_on_daily_base where campain_id='" + camp_id + "' ");
                //    cmd7.Connection = con;
                //    int a7 = cmd7.ExecuteNonQuery();
                //    con.Close();
                //}
                //catch
                //{

                //}

            }
            else
            {
            }


            //if (Session["SessionTable"] == null)
            //{
            //   // Session.Add("SessionTable", ds.Tables[0] as DataTable);
            //    LoadCampaigns();
            //}
            //else
            //{

            //}

            DataTable dt = Session["SessionTable"] as DataTable;

            foreach (DataRow dr in dt.Rows)
            {
                if (dr["campain_id"].ToString() == camp_id.ToString())
                {
                    dr.Delete();
                }
            }
            dt.AcceptChanges();
            GridCampaigns.DataSource = dt;
            GridCampaigns.DataBind();
            BindCampaignData();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);
        }
        catch
        {
        }
    }
    
    protected void ddTypeOfTarget_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string[] DateArrey = txtDateSearch.Text.ToString().Split('-');
            string[] FirstDate = DateArrey[0].Split('/');

            string ThSwap = FirstDate[1];
            FirstDate[1] = FirstDate[0];
            FirstDate[0] = ThSwap;
            string NewDate = FirstDate[0].Trim() + "/" + FirstDate[1].Trim() + "/" + FirstDate[2].Trim();
            DateArrey[0] = NewDate;
            string[] secondDate = DateArrey[1].Split('/');
            string ThSwapSecondDate = secondDate[1];
            secondDate[1] = secondDate[0];
            secondDate[0] = ThSwapSecondDate;
            string NewDateSecond = secondDate[0].Trim() + "/" + (Convert.ToInt32(secondDate[1].Trim()) + 1).ToString() + "/" + secondDate[2].Trim();
            DateArrey[1] = NewDateSecond;

            TextBox1.Text = "";
            string banner_type = "";
            string ddl1Value = DropDownList1.SelectedItem.Text.Trim();
            string ddTypeOfValue = ddTypeOfTarget.SelectedItem.Text.Trim();

            string banner_style = ddl1Value == "--Select--" ? "LIKE '%'" : "= '" + ddl1Value + "'";
            string typeOfAddTarget = ddTypeOfValue == "--Select--" ? "LIKE '%'" : "= '" + ddTypeOfValue + "'";

            con.Open();
            string query = "select campaign_id , campaigin_name from campaigns where Add_style_formate " + banner_style + " AND TypeOfAdTarget " + typeOfAddTarget + " order by campaigin_name asc";
            SqlDataAdapter adp = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            con.Close();
            ddlCampaigns.Items.Clear();
            ddlCampaigns.DataSource = dt;
            ddlCampaigns.DataTextField = "campaigin_name";
            ddlCampaigns.DataValueField = "campaign_id";
            ddlCampaigns.DataBind();
            ddlCampaigns.Items.Insert(0, "--Select Campaign--");

            banner_type = "select (select campaigin_name from campaigns where campaign_id=campain_details.campain_id) as camp_name ,(select name from Affiliate where Affiliate_user_name=campain_details.affiliate_id) as aff_name ,campain_id ,affiliate_id ,(select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Click' and  campain_id=campain_details.campain_id and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "') as 'total_clicks' ,isnull((select COUNT(DISTINCT(tbl2.ClickId)) from getConversion as tbl1  inner join  dbo.view_click_maintain_on_daily_base  as tbl2 on tbl1.Clickid=tbl2.ClickId and tbl1.Conversion=1  where tbl1.campaignId=campain_details.campain_id   and tbl2.date   between '" + DateArrey[0] + "' and '" + DateArrey[1] + "'),0 ) as 'total_conversions'  ,(select case when LEN(keywords)>2 then 'Yes' else '-' end as keyword from campaigns where campaign_id=campain_details.campain_id) as keywords ,total_views=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Impression' and  campain_id=campain_details.campain_id and date=cast(getdate() as date)) else (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and  campain_id=campain_details.campain_id and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "' )end  ,status ,isnull((select sum(a.clickCost) from dbo.view_click_maintain_on_daily_base as a inner join dbo.getConversion as b on a.ClickId=b.Clickid where b.Conversion=1 and a.even_type='Click' and a.date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "' and b.campaignId=campain_details.campain_id),0) as 'total_revenu' ,last_modification_date ,total_Impression=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and campain_id=campain_details.campain_id and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "') else 0 end from campain_details inner join campaigns on campain_details.campain_id=campaigns.campaign_id   where  campaigns.Add_style_formate " + banner_style + " AND campaigns.TypeOfAdTarget " + typeOfAddTarget + " ORDER BY campaigns.campaigin_name ASC";
            load_filter_dd(banner_type);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);
        }
        catch (Exception ex)
        {

        }
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (DropDownList1.SelectedItem.Text != "--Select--")
            {
                string banner_type = "";
                string like = TextBox1.Text + "%";
                banner_type = "select (select campaigin_name from campaigns where campaign_id=campain_details.campain_id) as camp_name ,(select name from Affiliate where Affiliate_user_name=campain_details.affiliate_id) as aff_name ,campain_id ,affiliate_id ,(select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Click' and  campain_id=campain_details.campain_id and date=cast(getdate()as date) as 'total_clicks' ,isnull((select COUNT(DISTINCT(tbl2.ClickId)) from getConversion as tbl1  inner join  dbo.view_click_maintain_on_daily_base  as tbl2 on tbl1.Clickid=tbl2.ClickId and tbl1.Conversion=1  where tbl1.campaignId=campain_details.campain_id  and tbl2.date=cast(getdate()as date)  ),0 ) as 'total_conversions'   ,(select case when LEN(keywords)>2 then 'Yes' else '-' end as keyword from campaigns where campaign_id=campain_details.campain_id) as keywords ,total_views=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Impression' and  campain_id=campain_details.campain_id and date=cast(getdate() as date)) else (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and  campain_id=campain_details.campain_id and date=cast(getdate() as date) )end  ,status ,isnull((select sum(a.clickCost) from dbo.view_click_maintain_on_daily_base as a inner join dbo.getConversion as b on a.ClickId=b.Clickid where b.Conversion=1 and a.even_type='Click' and a.date=cast(getdate()as date) and b.campaignId=campain_details.campain_id),0) as 'total_revenu' ,last_modification_date ,total_Impression=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and campain_id=campain_details.campain_id and date=cast(getdate()as date)) else 0 end from campain_details    inner join dbo.campaigns on campain_details.campain_id=campaigns.campaign_id   where  campaigns.Add_style_formate='" + DropDownList1.SelectedItem.Text + "' and campaigns.campaigin_name like '" + like + "'";
                load_filter_dd(banner_type);
            }
            else
            {
                string banner_type = "";
                string like = TextBox1.Text + "%";

                banner_type = "select (select campaigin_name from campaigns where campaign_id=campain_details.campain_id) as camp_name ,(select name from Affiliate where Affiliate_user_name=campain_details.affiliate_id) as aff_name ,campain_id ,affiliate_id ,(select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Click' and  campain_id=campain_details.campain_id and date=cast(getdate()as date)) as 'total_clicks' ,isnull((select COUNT(DISTINCT(tbl2.ClickId)) from getConversion as tbl1  inner join  dbo.view_click_maintain_on_daily_base  as tbl2 on tbl1.Clickid=tbl2.ClickId and tbl1.Conversion=1  where tbl1.campaignId=campain_details.campain_id  and tbl2.date=cast(getdate()as date)  ),0 ) as 'total_conversions'  ,(select case when LEN(keywords)>2 then 'Yes' else '-' end as keyword from campaigns where campaign_id=campain_details.campain_id) as keywords ,total_views=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Impression' and  campain_id=campain_details.campain_id and date=cast(getdate() as date)) else (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and  campain_id=campain_details.campain_id and date=cast(getdate() as date) )end  ,status ,isnull((select sum(a.clickCost) from dbo.view_click_maintain_on_daily_base as a inner join dbo.getConversion as b on a.ClickId=b.Clickid where b.Conversion=1 and a.even_type='Click' and a.date=cast(getdate()as date) and b.campaignId=campain_details.campain_id),0) as 'total_revenu' ,last_modification_date ,total_Impression=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and campain_id=campain_details.campain_id and date=cast(getdate()as date)) else 0 end from campain_details inner join dbo.campaigns on campain_details.campain_id=campaigns.campaign_id where   campaigns.campaigin_name like '" + like + "'";
                load_filter_dd(banner_type);
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);
        }
        catch
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);
        }
    }
   
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            LoadCampaigns();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);
        }
        catch
        {
        }
    }

    protected void RadioVedioBanners_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            string banner_type = "";
            banner_type = "select (select campaigin_name from campaigns where campaign_id=campain_details.campain_id) as camp_name ,(select name from Affiliate where Affiliate_user_name=campain_details.affiliate_id) as aff_name ,campain_id ,affiliate_id ,(select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Click' and  campain_id=campain_details.campain_id and date='" + System.DateTime.Now + "') as 'total_clicks' ,isnull((select COUNT(DISTINCT(tbl2.ClickId)) from getConversion as tbl1  inner join  dbo.view_click_maintain_on_daily_base  as tbl2 on tbl1.Clickid=tbl2.ClickId and tbl1.Conversion=1  where tbl1.campaignId=campain_details.campain_id   and tbl2.date  = '" + System.DateTime.Now + "'),0 ) as 'total_conversions'  ,(select case when LEN(keywords)>2 then 'Yes' else '-' end as keyword from campaigns where campaign_id=campain_details.campain_id) as keywords ,total_views=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Impression' and  campain_id=campain_details.campain_id and date=cast(getdate() as date)) else (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and  campain_id=campain_details.campain_id and date='" + System.DateTime.Now + "' )end  ,status ,isnull((select sum(a.clickCost) from dbo.view_click_maintain_on_daily_base as a inner join dbo.getConversion as b on a.ClickId=b.Clickid where b.Conversion=1 and a.even_type='Click' and a.date='" + System.DateTime.Now + "'  and b.campaignId=campain_details.campain_id GROUP BY a.ClickId),0) as 'total_revenu' ,last_modification_date ,total_Impression=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and campain_id=campain_details.campain_id and date='" + System.DateTime.Now + "') else 0 end from campain_details inner join dbo.campaigns on campain_details.campain_id=campaigns.campaign_id  where  campaigns.Add_style_formate='banner 5'";
            load_filter_dd(banner_type);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);
        }
        catch
        {
        }
    }
    protected void RadioOtherBanners_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            string banner_type = "";
            banner_type = "select (select campaigin_name from campaigns where campaign_id=campain_details.campain_id) as camp_name ,(select name from Affiliate where Affiliate_user_name=campain_details.affiliate_id) as aff_name ,campain_id ,affiliate_id ,(select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Click' and  campain_id=campain_details.campain_id and date=cast(getdate()as date)) as 'total_clicks' ,isnull((select COUNT(DISTINCT(tbl2.ClickId)) from getConversion as tbl1  inner join  dbo.view_click_maintain_on_daily_base  as tbl2 on tbl1.Clickid=tbl2.ClickId and tbl1.Conversion=1  where tbl1.campaignId=campain_details.campain_id   and tbl2.date =cast(getdate()as date)),0 ) as 'total_conversions'   ,(select case when LEN(keywords)>2 then 'Yes' else '-' end as keyword from campaigns where campaign_id=campain_details.campain_id) as keywords ,total_views=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Impression' and  campain_id=campain_details.campain_id and date=cast(getdate() as date)) else (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and  campain_id=campain_details.campain_id and date=cast(getdate() as date) )end  ,status ,isnull((select sum(a.clickCost) from dbo.view_click_maintain_on_daily_base as a inner join dbo.getConversion as b on a.ClickId=b.Clickid where b.Conversion=1 and a.even_type='Click' and a.date=cast(getdate()as date)  and b.campaignId=campain_details.campain_id),0) as 'total_revenu' ,last_modification_date ,total_Impression=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and campain_id=campain_details.campain_id and date=cast(getdate()as date)) else 0 end from campain_details     inner join dbo.campaigns on campain_details.campain_id=campaigns.campaign_id    where campaigns.Add_style_formate='Banner 1' or campaigns.Add_style_formate='Banner 2' or campaigns.Add_style_formate='Banner 3' or campaigns.Add_style_formate='Banner 4'";
            load_filter_dd(banner_type);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);
        }
        catch
        {
        }
    }
    protected void GridCampaigns_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridCampaigns.PageIndex = e.NewPageIndex;
        DataTable dt = Session["SessionTable"] as DataTable;
        GridCampaigns.DataSource = dt;
        GridCampaigns.DataBind();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);
    }
    
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        loadData();
    }

    protected void ddlCampaigns_SelectedIndexChanged(object sender, EventArgs e)
    {
             loadData();
    }

    public void loadData()
    {
        try
        {
            string[] DateArrey = txtDateSearch.Text.ToString().Split('-');
            string[] FirstDate = DateArrey[0].Split('/');

            string ThSwap = FirstDate[1];
            FirstDate[1] = FirstDate[0];
            FirstDate[0] = ThSwap;
            string NewDate = FirstDate[0].Trim() + "/" + FirstDate[1].Trim() + "/" + FirstDate[2].Trim();
            DateArrey[0] = NewDate;
            string[] secondDate = DateArrey[1].Split('/');
            string ThSwapSecondDate = secondDate[1];
            secondDate[1] = secondDate[0];
            secondDate[0] = ThSwapSecondDate;
            string NewDateSecond = secondDate[0].Trim() + "/" + (Convert.ToInt32(secondDate[1].Trim()) + 1).ToString() + "/" + secondDate[2].Trim();
            DateArrey[1] = NewDateSecond;

            TextBox1.Text = "";
            string banner_type = "";
            string typeFilter = "";

            if (ddTypeOfTarget.SelectedItem.Text != "--Select--")
                typeFilter = " AND TypeOfAdTarget='" + ddTypeOfTarget.SelectedItem.Text + "'";

            if (ddlCampaigns.SelectedItem.Text != "--Select Campaign--" && ddlCampaigns.SelectedItem.Text != "--Select--")
                banner_type = "select (select campaigin_name from campaigns where campaign_id=campain_details.campain_id) as camp_name ,(select name from Affiliate where Affiliate_user_name=campain_details.affiliate_id) as aff_name ,campain_id ,affiliate_id ,(select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Click' and  campain_id=campain_details.campain_id and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "') as 'total_clicks' ,isnull((select COUNT(DISTINCT(tbl2.ClickId)) from getConversion as tbl1  inner join  dbo.view_click_maintain_on_daily_base  as tbl2 on tbl1.Clickid=tbl2.ClickId and tbl1.Conversion=1  where tbl1.campaignId=campain_details.campain_id   and tbl2.date   between '" + DateArrey[0] + "' and '" + DateArrey[1] + "'),0 ) as 'total_conversions'  ,(select case when LEN(keywords)>2 then 'Yes' else '-' end as keyword from campaigns where campaign_id=campain_details.campain_id) as keywords ,total_views=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Impression' and  campain_id=campain_details.campain_id and date=cast(getdate() as date)) else (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and  campain_id=campain_details.campain_id and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "' )end  ,status ,isnull((select sum(a.clickCost) from dbo.view_click_maintain_on_daily_base as a inner join dbo.getConversion as b on a.ClickId=b.Clickid where b.Conversion=1 and a.even_type='Click' and a.date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "' and b.campaignId=campain_details.campain_id),0) as 'total_revenu' ,last_modification_date ,total_Impression=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and campain_id=campain_details.campain_id and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "') else 0 end from campain_details inner join campaigns on campain_details.campain_id=campaigns.campaign_id where campaigns.campaign_id='" + ddlCampaigns.SelectedItem.Value + "'";
            else if (DropDownList1.SelectedItem.Text == "--Select--")
                banner_type = "select (select campaigin_name from campaigns where campaign_id=campain_details.campain_id) as camp_name ,(select name from Affiliate where Affiliate_user_name=campain_details.affiliate_id) as aff_name ,campain_id ,affiliate_id ,(select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Click' and  campain_id=campain_details.campain_id and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "') as 'total_clicks' ,isnull((select COUNT(DISTINCT(tbl2.ClickId)) from getConversion as tbl1  inner join  dbo.view_click_maintain_on_daily_base  as tbl2 on tbl1.Clickid=tbl2.ClickId and tbl1.Conversion=1  where tbl1.campaignId=campain_details.campain_id   and tbl2.date  between '" + DateArrey[0] + "' and '" + DateArrey[1] + "'),0 ) as 'total_conversions'  ,(select case when LEN(keywords)>2 then 'Yes' else '-' end as keyword from campaigns where campaign_id=campain_details.campain_id) as keywords ,total_views=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Impression' and  campain_id=campain_details.campain_id and date=cast(getdate() as date)) else (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and  campain_id=campain_details.campain_id and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "' )end  ,status ,isnull((select sum(a.clickCost) from dbo.view_click_maintain_on_daily_base as a inner join dbo.getConversion as b on a.ClickId=b.Clickid where b.Conversion=1 and a.even_type='Click' and a.date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "' and b.campaignId=campain_details.campain_id),0) as 'total_revenu' ,last_modification_date ,total_Impression=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and campain_id=campain_details.campain_id and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "') else 0 end from campain_details inner join campaigns on campain_details.campain_id=campaigns.campaign_id where campaigns.campaign_id LIKE '%'" + typeFilter;
            else
                banner_type = "select (select campaigin_name from campaigns where campaign_id=campain_details.campain_id) as camp_name ,(select name from Affiliate where Affiliate_user_name=campain_details.affiliate_id) as aff_name ,campain_id ,affiliate_id ,(select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Click' and  campain_id=campain_details.campain_id and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "') as 'total_clicks' ,isnull((select COUNT(DISTINCT(tbl2.ClickId)) from getConversion as tbl1  inner join  dbo.view_click_maintain_on_daily_base  as tbl2 on tbl1.Clickid=tbl2.ClickId and tbl1.Conversion=1  where tbl1.campaignId=campain_details.campain_id   and tbl2.date   between '" + DateArrey[0] + "' and '" + DateArrey[1] + "'),0 ) as 'total_conversions'  ,(select case when LEN(keywords)>2 then 'Yes' else '-' end as keyword from campaigns where campaign_id=campain_details.campain_id) as keywords ,total_views=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='Impression' and  campain_id=campain_details.campain_id and date=cast(getdate() as date)) else (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and  campain_id=campain_details.campain_id and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "' )end  ,status ,isnull((select sum(a.clickCost) from dbo.view_click_maintain_on_daily_base as a inner join dbo.getConversion as b on a.ClickId=b.Clickid where b.Conversion=1 and a.even_type='Click' and a.date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "' and b.campaignId=campain_details.campain_id),0) as 'total_revenu' ,last_modification_date ,total_Impression=case when (select Add_style_formate from dbo.campaigns where campaign_id=campain_details.campain_id)='Banner 5' then (select count(*) from dbo.view_click_maintain_on_daily_base where even_type='View' and campain_id=campain_details.campain_id and date between '" + DateArrey[0] + "' and '" + DateArrey[1] + "') else 0 end from campain_details inner join campaigns on campain_details.campain_id=campaigns.campaign_id where campaigns.Add_style_formate='" + DropDownList1.SelectedItem.Text + "'" + typeFilter;

            load_filter_dd(banner_type);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:Callback2();", true);

        }
        catch (Exception ex)
        {

        }
    }

    protected void GridCampaigns_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HyperLink hyp = (HyperLink)e.Row.FindControl("HyperLinkEdit");
                Label lbId = (Label)e.Row.FindControl("lbId");
                hyp.Target = "_blank";
                hyp.NavigateUrl = "~/admin/EditCampaign.aspx?CampId=" + lbId.Text.ToString();
            }
        }
        catch (Exception sqe)
        {

        }
    }

    #endregion

    protected void Block_Unblock_Campain(object sender, EventArgs e)
    {
        try {
            Button Block_Btn = (Button)sender;
            string website = Block_Btn.ToolTip;
            int queryType = int.Parse(Block_Btn.Attributes["data-id"]);
            string camp_id = gdvCampDetails.ToolTip;
            string Block_Query = "";
            string successMessage = "";
            con.Open();
            if (queryType == 0)
            {
                Block_Query = "IF EXISTS (SELECT * FROM tblBlockwebsites WHERE campid='" + camp_id + "' AND websiteName='" + website + "') BEGIN UPDATE tblBlockwebsites SET status=1 WHERE campid='" + camp_id + "' AND websiteName='" + website + "'; END ELSE BEGIN INSERT INTO tblBlockwebsites VALUES ('" + camp_id + "','" + website + "',1); END";
                successMessage = "Campain blocked on " + website;
            }
            else {
                Block_Query = "UPDATE tblBlockwebsites SET status=0 WHERE campid='" + camp_id + "' AND websiteName='" + website + "'";
                successMessage = "Campain unblocked on " + website;
            }
            SqlCommand cmd = new SqlCommand(Block_Query);
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex) { }
    }

    protected void gdvCampDetails_RowCreated(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int isBlocked = (int)DataBinder.Eval(e.Row.DataItem, "isBlocked");
                Button BlockBtn = (Button)e.Row.FindControl("Btn_Block");
                if (isBlocked == 0)
                {
                    BlockBtn.Text = "Block";
                }
                else
                {
                    BlockBtn.Text = "Unlock";
                }
                BlockBtn.Attributes["data-blocked"] = isBlocked.ToString();
            }
        }
        catch (Exception ex) { }
    }
}