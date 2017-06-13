using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_view_click_report_for_affiliate : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load_details();
            //load_Distict_campaigns_dd();
            load_sites();
        }
    }


    protected void load_Distict_campaigns_dd()
    {
        try
        {
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select campaign_id,campaigin_name from campaigns order by campaigin_name", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                DropDownList1.DataSource = ds.Tables[0];
                DropDownList1.DataTextField = "campaigin_name";
                DropDownList1.DataValueField = "campaign_id";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, "--Select--");

            }
            else
            {

            }
        }
        catch
        {

        }
    }

    protected void load_color()
    {
        try
        {


            if (GridView1.Rows.Count > 0)
            {
                for (int a = 0; a < GridView1.Rows.Count; a++)
                {
                    string status = GridView1.Rows[a].Cells[8].Text;
                    if (status == "Running")
                    {
                        GridView1.Rows[a].Cells[8].ForeColor = System.Drawing.Color.White;
                        GridView1.Rows[a].Cells[8].BackColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        GridView1.Rows[a].Cells[8].ForeColor = System.Drawing.Color.White;
                        GridView1.Rows[a].Cells[8].BackColor = System.Drawing.Color.Red;
                    }
                }
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
            if (Session["affiliate_user_id"] != "" && Session["affiliate_user_id"] != null)
            {
                string affiliate_id = Session["affiliate_user_id"].ToString();

                con.Open();
                SqlDataAdapter adp = new SqlDataAdapter("select campain_id, (select campaigin_name from campaigns where campaign_id=a.campain_id) as camp_id , affiliate_id,(select name from Affiliate where Affiliate_user_name=a.affiliate_id) as Aff_id ,Website,total_clicks,( "
	                                   +" Select Isnull(Sum(d.Conversion),'0') from GetConversion d Where d.campaignid = a.campain_id and d.affiliateid = a.affiliate_id and Lower(d.Website) = Lower(a.Website) "
                                   + " )total_conversions,total_views,status,total_revenu ,(select Add_style_formate from campaigns where campaign_id=a.campain_id) as banner_type,total_Impression  from campain_details_Affiliate_wise a  where affiliate_id='" + affiliate_id + "' and (total_clicks>0 or total_conversions>0 or total_views>0) ", con);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                con.Close();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ViewState["affiliate_data"] = ds.Tables[0];//for searching purpose
                    GridView1.DataSource = ds.Tables[0];
                    GridView1.DataBind();
                    load_color();
                    Label1.Text = GridView1.Rows.Count.ToString();

                }
            }
            else
            {
 
            }



        }
        catch
        {
            Response.Redirect("~/admin/login.aspx");
        }
    }



    protected void load_sites()
    {
        try
        {
            string affiliate_id = Session["affiliate_user_id"].ToString();


            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select distinct Website from Affiliate where Affiliate_user_name='" + affiliate_id + "'", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {


                string websites = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                string[] strArr = websites.Split(',');
                DropDownList2.Items.Clear();

                for (int count_site = 0; count_site <= strArr.Length - 1; count_site++)
                {


                    string site_name = strArr[count_site].ToString();
                    DropDownList2.Items.Add(strArr[count_site]);
                }
                DropDownList2.Items.Insert(0, "--Select--");

                //DropDownList2.DataSource = ds.Tables[0];
                //DropDownList2.DataTextField = "Website";
                //DropDownList2.DataValueField = "Website";
                //DropDownList2.DataBind();
                //DropDownList2.Items.Insert(0, "--Select--");

            }
            else
            {

            }

        }
        catch
        {

            Response.Redirect("~/admin/login.aspx");
        }



         
          


        
      
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            DataTable dt = (DataTable)ViewState["affiliate_data"];
            if (DropDownList1.SelectedItem.Text != "--Select--")
            {
                DataView dv;
                dv = new DataView(dt, "banner_type='" + DropDownList1.SelectedItem.Text + "'", "banner_type", DataViewRowState.CurrentRows);

                GridView1.DataSource = dv;
                GridView1.DataBind();
                load_color();
                Label1.Text = GridView1.Rows.Count.ToString();
            }
            else
            {

                GridView1.DataSource = dt;
                GridView1.DataBind();
                load_color();
                Label1.Text = GridView1.Rows.Count.ToString();
            }
                


        }
        catch
        {


        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {


            DataTable dt = (DataTable)ViewState["affiliate_data"];
            if (DropDownList2.SelectedItem.Text != "--Select--")
            {
                DataView dv;
                dv = new DataView(dt, "Website='" + DropDownList2.SelectedItem.Text + "'", "Website", DataViewRowState.CurrentRows);

                GridView1.DataSource = dv;
                GridView1.DataBind();
                load_color();
                Label1.Text = GridView1.Rows.Count.ToString();
            }
            else
            {

                GridView1.DataSource = dt;
                GridView1.DataBind();
                load_color();
                Label1.Text = GridView1.Rows.Count.ToString();
            }




        }
        catch
        {


        }
    }
}