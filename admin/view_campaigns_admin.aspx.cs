using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_view_campaigns_admin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load_grid_data();
        }
    }
    protected void load_grid_data()
    {
        try
        {

            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * from campaigns order by campaigin_name",con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }

        }
        catch
        {
 
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            GridView1.EditIndex = e.NewEditIndex;

            load_grid_data();
        }
        catch
        {
 
        }
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            GridView1.EditIndex = -1;
            load_grid_data();
        }
        catch
        {
 
        }

    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {

            string camp_id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            TextBox camp_name = (TextBox)GridView1.Rows[e.RowIndex].Cells[2].FindControl("camp_name");

            TextBox tb_title = (TextBox)GridView1.Rows[e.RowIndex].Cells[5].FindControl("tb_title");

            TextBox tb_discription = (TextBox)GridView1.Rows[e.RowIndex].Cells[6].FindControl("tb_discription");
            TextBox tb_call_to_action = (TextBox)GridView1.Rows[e.RowIndex].Cells[7].FindControl("tb_call_to_action");
            if (camp_name.Text != "" && tb_title.Text != "" && tb_discription.Text != "" && tb_call_to_action.Text != "")
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("update campaigns set campaigin_name='" + camp_name.Text + "', title='" + tb_title.Text + "' , discription='" + tb_discription.Text + "' , call_to_action='" + tb_call_to_action.Text + "' where campaign_id='" + camp_id + "' ");
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.EditIndex = -1;
                load_grid_data();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Showstatus", "javascript:alert('Campain Details Updated Sucessfully!!!')", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Showstatus", "javascript:alert('Please fill each field ... than update ... !!!')", true);
            }
        }
        catch
        {



        }
    }
}