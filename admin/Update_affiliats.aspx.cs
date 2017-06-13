using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using System.Configuration;



public partial class admin_Update_affiliats : System.Web.UI.Page
{


    BL_affiliates bl_aff = new BL_affiliates();
    DL_affiliate dl_aff = new DL_affiliate();




    
    //now we are loading the page  grid data .... which are related to registered affiliates,... for updation asd serching details
    //few details like ceation date and id will be ramain same ... and rest of can be edited by logged in person.
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



           
            DataTable ds = dl_aff.get_affiliate();
            if(ds.Rows.Count>0)
            {
                GridView1.DataSource=ds;
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



            Label id = (Label)GridView1.Rows[e.RowIndex].Cells[2].FindControl("aff_user_id");
            TextBox txt_name = (TextBox)GridView1.Rows[e.RowIndex].Cells[3].FindControl("aff_user_id");
            TextBox txt_mail = (TextBox)GridView1.Rows[e.RowIndex].Cells[4].FindControl("aff_user_id");
            TextBox txt_age = (TextBox)GridView1.Rows[e.RowIndex].Cells[5].FindControl("aff_user_id");
            TextBox txt_bank_info = (TextBox)GridView1.Rows[e.RowIndex].Cells[6].FindControl("aff_user_id");
            TextBox txt_acc_info = (TextBox)GridView1.Rows[e.RowIndex].Cells[7].FindControl("aff_user_id");
            TextBox txt_pay_type = (TextBox)GridView1.Rows[e.RowIndex].Cells[8].FindControl("aff_user_id");
            TextBox txt_website = (TextBox)GridView1.Rows[e.RowIndex].Cells[9].FindControl("aff_user_id");
            TextBox txt_address = (TextBox)GridView1.Rows[e.RowIndex].Cells[10].FindControl("aff_user_id");
            bl_aff.acc = txt_acc_info.Text;
            bl_aff.mail = txt_mail.Text;
            bl_aff.address = txt_address.Text;
            bl_aff.action = "Update_affiliate";
            bl_aff.aff_id = id.Text;
            bl_aff.payment = txt_pay_type.Text;
            bl_aff.website = txt_website.Text;
            bl_aff.age = txt_age.Text;

        }
        catch
        {
 
        }
    }
}