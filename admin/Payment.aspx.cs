using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Data.OleDb;
using System.Diagnostics;
using System.Resources;
using System.Globalization;
using System.Threading;
using System.Reflection;
using ClosedXML.Excel;
using System.Text;


public partial class admin_Payment : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            this.load_data();
    }
    protected void Loadchk(object sender, EventArgs e)
    {
        try
        {
            CheckBox chk = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chk.Parent.Parent;
            try
            {
                Label ReqestId = (Label)GridPayment.Rows[row.RowIndex].Cells[0].FindControl("lbreqid");
                if (chk.Checked == true)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update tblPaymentRequest set PayingStatus='True' where ReqestId='" + ReqestId.Text + "'");
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    load_data();
                    //Response.Write("<script>alert('Payment confirmed successfully.')</script>");
                }
                else if (chk.Checked == false)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update tblPaymentRequest set PayingStatus='false' where ReqestId='" + ReqestId.Text + "'");
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    load_data();
                    //Response.Write("<script>alert('Payment confirmed successfully.')</script>");
                }
            }
            catch (Exception sqe)
            {
            }
        }
        catch
        {

        }
    }
    protected void GridPayment_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox cbstatus = ((CheckBox)e.Row.FindControl("cbcheck"));
            Label id = (Label)e.Row.Cells[0].FindControl("lbreqid");

            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select PayingStatus from tblPaymentRequest where ReqestId=" + Convert.ToInt32(id.Text) + "", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                string lb = ds.Tables[0].Rows[0]["PayingStatus"].ToString();
                if (lb == "True")
                    cbstatus.Checked = true;
                else
                    cbstatus.Checked = false;
            }
            else
                cbstatus.Checked = false;
        }
    }
    protected void load_data()
    {
        try
        {
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select ReqestId,AffiliateId,  (select SUBSTRING(name, 1, CHARINDEX(' ', name) - 1) from Affiliate  where  Affiliate_user_name=tbl1.AffiliateId )  as 'AffiliateName', (select SUBSTRING(name, CHARINDEX(' ', name) + 1, 8000)  from Affiliate  where  Affiliate_user_name=tbl1.AffiliateId )  as 'SurName'  ,(select mail  from Affiliate  where  Affiliate_user_name=tbl1.AffiliateId )  as 'affimail'   ,case when RequestedAmt<500 then 'paypal' else 'Wire Transfer' end   as 'paytype'   ,RequestedAmt   ,Status=case PayingStatus when 'True' then 'Paid' else 'Unpaid' end    , DaysRemain=case when PayingStatus=1 then 0 else  (select (30- (select DATEDIFF( day, tbl1.RequestDate,getdate()  )))) end , RequestedAmt  , bankInfo =case when RequestedAmt>500 then   'Bank Name : '+ (select BankAcName from dbo.Affiliate where Affiliate_user_name=tbl1.AffiliateId) +'   Account Number : '   +(select BankAcName from dbo.Affiliate where Affiliate_user_name=tbl1.AffiliateId)   else    'Paypal Id : '+ (select paypal_mail_id from dbo.Affiliate where Affiliate_user_name=tbl1.AffiliateId)+'AcNo : '+   (select PaypalAccountName from dbo.Affiliate where Affiliate_user_name=tbl1.AffiliateId)  end    from  tblPaymentRequest  as tbl1", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ViewState["affiliate_data"] = ds.Tables[0];//for searching purpose
                GridPayment.DataSource = ds.Tables[0];
                GridPayment.DataBind();
                decimal d = 0;
                for (int count = 0; count < GridPayment.Rows.Count; count++)
                {
                    CheckBox chk = (CheckBox)GridPayment.Rows[count].Cells[8].FindControl("cbcheck");
                    Label lbreqAmt = (Label)GridPayment.Rows[count].Cells[7].FindControl("lbreqAmt");
                    Label lbstatus = (Label)GridPayment.Rows[count].Cells[5].FindControl("lbstatus");
                    
                    if (chk.Checked == false)
                        d = d + Convert.ToDecimal(lbreqAmt.Text);

                    if (lbstatus.Text == "Unpaid")
                        chk.Enabled = true;
                    else
                        chk.Enabled = false;
                }
                TotalUnpaid.Text = d.ToString();
            }
        }
        catch
        {
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {

            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attatchment;filename={0}", "Affiliate_Payment_Details.xls"));
            Response.Charset = "";
            Response.ContentType = "application/ms-excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridPayment.AllowPaging = false;
            for (int a = 0; a < GridPayment.Rows.Count; a++)
            {
                GridViewRow row = GridPayment.Rows[a];
            }
            GridPayment.RenderControl(htw);
            Response.Output.Write(sw.ToString());
            Response.End();
        }
        catch
        {
        }
    }
    protected void Button1_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {

            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attatchment;filename={0}", "payment_details.xls"));
            Response.Charset = "";
            Response.ContentType = "application/ms-excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridPayment.AllowPaging = false;
            GridPayment.Columns[7].Visible = false;
            for (int a = 0; a < GridPayment.Rows.Count; a++)
            {
                GridViewRow row = GridPayment.Rows[a];
            }
            GridPayment.RenderControl(htw);
            Response.Output.Write(sw.ToString());
            Response.End();
        }
        catch
        {
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            if (DropDownList1.SelectedItem.Text == "Paypal")
            {
                for (int a = 0; a < GridPayment.Rows.Count; a++)
                {
                    try
                    {
                        Label paytype = (Label)GridPayment.Rows[a].Cells[3].FindControl("lbmode");
                        if (paytype.Text == "paypal")
                        {
                            GridPayment.Rows[a].Visible = true;

                        }
                        else
                        {
                            GridPayment.Rows[a].Visible = false;

                        }

                    }
                    catch
                    {

                    }
                }
            }
            else if (DropDownList1.SelectedItem.Text == "Wired Transfer")
            {
                for (int a = 0; a < GridPayment.Rows.Count; a++)
                {
                    try
                    {
                        Label paytype = (Label)GridPayment.Rows[a].Cells[3].FindControl("lbmode");
                        if (paytype.Text == "Wire Transfer")
                            GridPayment.Rows[a].Visible = true;
                        else
                            GridPayment.Rows[a].Visible = false;
                    }
                    catch
                    {

                    }
                }
            }
            else
            {
                for (int a = 0; a < GridPayment.Rows.Count; a++)
                {
                    try
                    {
                        GridPayment.Rows[a].Visible = true;
                    }
                    catch
                    {
                    }
                }
            }
        }
        catch
        {
        }
    }
    protected void gvPayment_Sorting(object sender, GridViewSortEventArgs e)
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
        con.Open();
        SqlDataAdapter adp = new SqlDataAdapter("select ReqestId,AffiliateId,  (select SUBSTRING(name, 1, CHARINDEX(' ', name) - 1) from Affiliate  where  Affiliate_user_name=tbl1.AffiliateId )  as 'AffiliateName', (select SUBSTRING(name, CHARINDEX(' ', name) + 1, 8000)  from Affiliate  where  Affiliate_user_name=tbl1.AffiliateId )  as 'SurName'  ,(select mail  from Affiliate  where  Affiliate_user_name=tbl1.AffiliateId )  as 'affimail'   ,case when RequestedAmt<500 then 'paypal' else 'Wire Transfer' end   as 'paytype'   ,RequestedAmt   ,Status=case PayingStatus when 'True' then 'Paid' else 'Unpaid' end    , DaysRemain=case when PayingStatus=1 then 0 else  (select (30- (select DATEDIFF( day, tbl1.RequestDate,getdate()  )))) end , RequestedAmt  , bankInfo =case when RequestedAmt>500 then   'Bank Name : '+ (select BankAcName from dbo.Affiliate where Affiliate_user_name=tbl1.AffiliateId) +'   Account Number : '   +(select BankAcName from dbo.Affiliate where Affiliate_user_name=tbl1.AffiliateId)   else    'Paypal Id : '+ (select paypal_mail_id from dbo.Affiliate where Affiliate_user_name=tbl1.AffiliateId)+'AcNo : '+   (select PaypalAccountName from dbo.Affiliate where Affiliate_user_name=tbl1.AffiliateId)  end    from  tblPaymentRequest  as tbl1", con);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        con.Close();
        DataView sortedView = new DataView(ds.Tables[0]);
        sortedView.Sort = e.SortExpression + " " + sortingDirection;
        Session["SortedView"] = sortedView;
        GridPayment.DataSource = sortedView;
        GridPayment.DataBind();
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
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt1 = new DataTable("GridView_Data");
            dt1.Columns.Add("Name");
            dt1.Columns.Add("Bank Name");
            dt1.Columns.Add("Iban");
            dt1.Columns.Add("Swift Code");
            dt1.Columns.Add("Bank Address");
            dt1.Columns.Add("Amount");
            if (GridPayment.Rows.Count > 0)
            {
                StringBuilder sbQuery = new StringBuilder();
                for (int count = 0; count < GridPayment.Rows.Count; count++)
                {
                    Label lbpaymode = (Label)GridPayment.Rows[count].Cells[4].FindControl("lbmode");
                    Label lbstatus = (Label)GridPayment.Rows[count].Cells[5].FindControl("lbstatus");
                    Label lbreqAmt = (Label)GridPayment.Rows[count].Cells[7].FindControl("lbreqAmt");
                    CheckBox chkSelect = (CheckBox)GridPayment.Rows[count].Cells[1].FindControl("chkSelect");
                    Label lbreqid = (Label)GridPayment.Rows[count].Cells[1].FindControl("lbreqid");
                    if (chkSelect.Checked == true && Convert.ToDecimal(lbreqAmt.Text) >= 500 && lbpaymode.Text == "Wire Transfer")
                    {
                        if (sbQuery.Length == 0)
                            sbQuery.Append("select a.name,a.PaypalAccountName,a.paypal_mail_id,'$ '+cast(b.RequestedAmt as nvarchar) as 'Amount' from dbo.Affiliate as a inner join dbo.tblPaymentRequest as b  on b.AffiliateId=a.Affiliate_user_name where b.ReqestId='" + lbreqid.Text + "'");
                        else
                            sbQuery.Append("or b.ReqestId='" + lbreqid.Text + "'");
                    }
                }
                if (sbQuery.Length != 0)
                {
                    con.Open();
                    SqlDataAdapter adp = new SqlDataAdapter("select a.name,a.BankAcName,a.IBAN,a.BIC,a.BankAddress,'$ '+cast(b.RequestedAmt as nvarchar) as 'Amount' from dbo.Affiliate as a inner join dbo.tblPaymentRequest as b  on b.AffiliateId=a.Affiliate_user_name where a.payment_type='Wired Transfer'", con);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    con.Close();
                    for (int count = 0; count < GridPayment.Rows.Count; count++)
                    {
                        Label lbpaymode = (Label)GridPayment.Rows[count].Cells[4].FindControl("lbmode");
                        Label lbstatus = (Label)GridPayment.Rows[count].Cells[5].FindControl("lbstatus");
                        Label lbreqAmt = (Label)GridPayment.Rows[count].Cells[7].FindControl("lbreqAmt");
                        CheckBox chkSelect = (CheckBox)GridPayment.Rows[count].Cells[1].FindControl("chkSelect");
                        Label lbreqid = (Label)GridPayment.Rows[count].Cells[1].FindControl("lbreqid");
                        if (GridPayment.Rows[count].Visible == true && chkSelect.Checked == true && lbpaymode.Text == "Wire Transfer")
                        {
                            DataRow dr = dt1.NewRow();
                            dr["Name"] = dt.Rows[count]["name"].ToString();
                            dr["Bank Name"] = dt.Rows[count]["BankAcName"].ToString();
                            dr["Iban"] = dt.Rows[count]["IBAN"].ToString();
                            dr["Swift Code"] = dt.Rows[count]["BIC"].ToString();
                            dr["Bank Address"] = dt.Rows[count]["BankAddress"].ToString();
                            dr["Amount"] = dt.Rows[count]["Amount"].ToString();
                            dt1.Rows.Add(dr);
                        }
                    }
                    using (XLWorkbook wb = new XLWorkbook())
                    {
                        wb.Worksheets.Add(dt1);
                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                        Response.AddHeader("content-disposition", "attachment;filename=BankWirePaymentDetails.xlsx");
                        using (MemoryStream MyMemoryStream = new MemoryStream())
                        {
                            wb.SaveAs(MyMemoryStream);
                            MyMemoryStream.WriteTo(Response.OutputStream);
                            Response.Flush();
                            Response.End();
                        }
                    }
                }
                else
                {

                }
            }
            else
                Response.Write("<script>alert('No Record Found.')</script>");
        }
        catch(Exception sqe)
        {
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            if (DropDownList2.SelectedItem.Text == "Latest Paid")
            {
                for (int a = 0; a < GridPayment.Rows.Count; a++)
                {
                    try
                    {
                        Label paytype = (Label)GridPayment.Rows[a].Cells[4].FindControl("lbstatus");
                        if (paytype.Text == "Paid")
                        {
                            GridPayment.Rows[a].Visible = true;

                        }
                        else
                        {
                            GridPayment.Rows[a].Visible = false;

                        }

                    }
                    catch
                    {

                    }
                }
            }
            else if (DropDownList2.SelectedItem.Text == "Pending")
            {
                for (int a = 0; a < GridPayment.Rows.Count; a++)
                {
                    try
                    {
                        Label paytype = (Label)GridPayment.Rows[a].Cells[4].FindControl("lbstatus");
                        if (paytype.Text == "Unpaid")
                        {
                            GridPayment.Rows[a].Visible = true;
                        }
                        else
                        {
                            GridPayment.Rows[a].Visible = false;
                        }
                    }
                    catch(Exception sqe)
                    {

                    }
                }
            }
            else if (DropDownList2.SelectedItem.Text == "All")
            {
                for (int a = 0; a < GridPayment.Rows.Count; a++)
                {
                    try
                    {
                        GridPayment.Rows[a].Visible = true;
                    }
                    catch
                    {
                    }
                }
            }
        }
        catch
        {

        }
    }
    protected void btnPaypal_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt1 = new DataTable("GridView_Data");
           
            dt1.Columns.Add("MailId");
            dt1.Columns.Add("Amount");
            dt1.Columns.Add("Currency");
            if (GridPayment.Rows.Count > 0)
            {
                StringBuilder sbQuery = new StringBuilder();
                for (int count = 0; count < GridPayment.Rows.Count; count++)
                {
                    Label lbpaymode = (Label)GridPayment.Rows[count].Cells[4].FindControl("lbmode");
                    Label lbstatus = (Label)GridPayment.Rows[count].Cells[5].FindControl("lbstatus");
                    Label lbreqAmt = (Label)GridPayment.Rows[count].Cells[7].FindControl("lbreqAmt");
                    CheckBox chkSelect = (CheckBox)GridPayment.Rows[count].Cells[1].FindControl("chkSelect");
                    Label lbreqid = (Label)GridPayment.Rows[count].Cells[1].FindControl("lbreqid");
                    if (chkSelect.Checked == true && Convert.ToDecimal(lbreqAmt.Text) <= 499 && lbpaymode.Text == "paypal")
                    {
                        if (sbQuery .Length==0)
                            sbQuery.Append("select a.name,a.PaypalAccountName,a.paypal_mail_id, cast(b.RequestedAmt as nvarchar) as 'Amount' from dbo.Affiliate as a inner join dbo.tblPaymentRequest as b  on b.AffiliateId=a.Affiliate_user_name where b.ReqestId='" + lbreqid.Text+ "'");
                        else
                            sbQuery.Append("or b.ReqestId='" + lbreqid.Text + "'");
                    }
                }
                if (sbQuery.Length!=0)
                {
                    con.Open();
                    SqlDataAdapter adp = new SqlDataAdapter(sbQuery.ToString(), con);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    con.Close();
                    for (int count = 0; count < GridPayment.Rows.Count; count++)
                    {
                        Label lbpaymode = (Label)GridPayment.Rows[count].Cells[4].FindControl("lbmode");
                        Label lbstatus = (Label)GridPayment.Rows[count].Cells[5].FindControl("lbstatus");
                        Label lbreqAmt = (Label)GridPayment.Rows[count].Cells[7].FindControl("lbreqAmt");
                        CheckBox chkSelect = (CheckBox)GridPayment.Rows[count].Cells[1].FindControl("chkSelect");
                        Label lbreqid = (Label)GridPayment.Rows[count].Cells[1].FindControl("lbreqid");
                        if (GridPayment.Rows[count].Visible == true && chkSelect.Checked == true && lbpaymode.Text == "paypal")
                        {
                            DataRow dr = dt1.NewRow();

                            dr["MailId"] = dt.Rows[count]["paypal_mail_id"].ToString();
                            dr["Amount"] = dt.Rows[count]["Amount"].ToString();
                            dr["Currency"] = "USD";
                            dt1.Rows.Add(dr);
                        }

                    }
                    using (XLWorkbook wb = new XLWorkbook())
                    {
                        wb.Worksheets.Add(dt1);
                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                        Response.AddHeader("content-disposition", "attachment;filename=PaypalPaymentDetails.xlsx");
                        using (MemoryStream MyMemoryStream = new MemoryStream())
                        {
                            wb.SaveAs(MyMemoryStream);
                            MyMemoryStream.WriteTo(Response.OutputStream);
                            Response.Flush();
                            Response.End();
                        }
                    }
                }
                else
                {
                }
            }
            else
                Response.Write("<script>alert('No Record Found.')</script>");
        }
        catch
        {
        }
    }
    private void LoadVariial()
    {
        
    }
}