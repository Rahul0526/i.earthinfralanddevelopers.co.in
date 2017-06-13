using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_view_click_report_details_affilate_wise : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load_details();
            load_affiliate_dd();
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
        string strCmdText = string.Empty;
        try
        {
             con.Open();
             strCmdText = @"select a.campain_id, 
                                    (
	                                    select b.campaigin_name from campaigns b where b.campaign_id = a.campain_id
                                    ) as camp_id 
                                    , a.affiliate_id,
                                    (
	                                    select c.name from Affiliate c where c.Affiliate_user_name = a.affiliate_id
                                     ) as Aff_id ,
                                    a.Website,a.total_clicks,
                                    (
	                                    Select Isnull(Sum(d.Conversion),'0') from GetConversion d Where d.campaignid = a.campain_id and d.affiliateid = a.affiliate_id and Lower(d.Website) = Lower(a.Website)
                                    )total_conversions,
                                    a.total_views,a.status,a.total_revenu  ,
                                    (
	                                    select e.Add_style_formate from campaigns e where e.campaign_id = a.campain_id
                                    ) as banner_type 
                                    from campain_details_Affiliate_wise a where   (a.total_clicks>0 or a.total_conversions>0 or a.total_views>0)";
            SqlDataAdapter adp = new SqlDataAdapter(strCmdText, con);
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
        catch
        {
 
        }
    }

    protected void load_affiliate_dd()
    {
        try
        {
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select Affiliate_user_name,name from Affiliate order by name", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                DropDownList1.DataSource = ds.Tables[0];
                DropDownList1.DataTextField = "name";
                DropDownList1.DataValueField = "Affiliate_user_name";
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
    
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
           
            DataTable dt = (DataTable)ViewState["affiliate_data"];
            if (DropDownList1.SelectedItem.Text != "--Select--")
            {
                DataView dv;
                dv = new DataView(dt, "affiliate_id='" + DropDownList1.SelectedItem.Value + "'", "affiliate_id", DataViewRowState.CurrentRows);

                GridView1.DataSource = dv;
                GridView1.DataBind();
                load_color();
                Label1.Text = GridView1.Rows.Count.ToString();

                con.Open();
                SqlDataAdapter adp = new SqlDataAdapter("select distinct Website from Affiliate where Affiliate_user_name='" + DropDownList1.SelectedItem.Value + "'", con);
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
            else
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                load_color();
                Label1.Text = GridView1.Rows.Count.ToString();

                DropDownList2.DataSource = null;
                DropDownList2.DataBind();
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

    protected void banner_dd_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            DataTable dt = (DataTable)ViewState["affiliate_data"];
            if (banner_dd.SelectedItem.Text != "--Select--")
            {
                DataView dv;
                dv = new DataView(dt, "banner_type='" + banner_dd.SelectedItem.Text + "'", "banner_type", DataViewRowState.CurrentRows);

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