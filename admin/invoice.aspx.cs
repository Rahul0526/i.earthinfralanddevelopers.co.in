using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Diagnostics;
using System.Resources;
using System.Globalization;
using System.Threading;
using System.Reflection;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Text;

public partial class admin_invoice : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            this.load_();
    }
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        try
        {

            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attatchment;filename={0}", "Invoice.xls"));
            Response.Charset = "";
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);

            //divInvoice.RenderControl(htw);
            Response.Output.Write(sw.ToString());
            Response.End();

        }
        catch
        {


        }

    }
    public override void VerifyRenderingInServerForm(Control control)
    {

        //verify that control is randerd
    }


    private void load_()
    {
        try
        {
            int InvioceId = Convert.ToInt32(Request.QueryString["InvioceId"].ToString());
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select a.ReqestId,a.AffiliateId,a.RequestedAmt,a.PayingStatus,a.PayDate, b.bank_info , b.name,Address from tblPaymentRequest as a inner join Affiliate as b on a.AffiliateId=b.Affiliate_user_name  where a.ReqestId=" + Convert.ToInt32(InvioceId.ToString()) + "", con);

            DataTable dtnewtable = new DataTable();
            adp.Fill(dtnewtable);
            con.Close();
            if (dtnewtable.Rows.Count > 0)
            {
                pOurDate.InnerText = dtnewtable.Rows[0]["name"].ToString();
                lbAddress.Text = dtnewtable.Rows[0]["Address"].ToString();
                lbInvoiceDate.Text = System.DateTime.Now.ToShortDateString();
                lbInvoiceNumber.Text ="Inv000"+ dtnewtable.Rows[0]["ReqestId"].ToString();
                lbSubAmt.Text = dtnewtable.Rows[0]["RequestedAmt"].ToString();
                lbTotalAmt.Text = dtnewtable.Rows[0]["RequestedAmt"].ToString();
               
            }


                
        }
        catch
        {
 
        }
    }



    protected void btnGenPdf_Click(object sender, EventArgs e)
    {
        iTextSharp.text.html.simpleparser.StyleSheet styles = new iTextSharp.text.html.simpleparser.StyleSheet();
        styles.LoadStyle("Invoice-Wrp", "width", "1200px");
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=PaymentInvoice.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        this.Page.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 50f, 50f, 50f, 50f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AffiliatePayment.aspx");
    }
}