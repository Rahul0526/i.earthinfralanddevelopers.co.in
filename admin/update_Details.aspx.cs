using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class admin_update_Details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user_id"] == null)
                Response.Redirect("~/LoginAffiliate.aspx");
            else
                this.LoadProfileDetails();
        }
    }

    private void LoadProfileDetails()
    {
        try
        {
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter(" select Affiliate_user_name ,name,mail,Address,country  ,state ,city ,postal_code,ProfileImageUrl from dbo.Affiliate  where mail='" + Session["user_id"] + "'", con);
            DataTable dsUserDetails = new DataTable();
            adp.Fill(dsUserDetails);
            con.Close();
            if (dsUserDetails.Rows.Count > 0)
            {
                string UserFullName = dsUserDetails.Rows[0]["name"].ToString();
                string[] SplitName = UserFullName.Split(' ');
                string firstName; string lastName;
                if (SplitName.Length == 2)
                {
                    firstName = SplitName[0].Trim();
                    lastName = SplitName[1].ToString().Trim();
                }
                else
                {
                    firstName = SplitName[0].Trim();
                    lastName = string.Empty;
                }
                hdnfUserName.Value = dsUserDetails.Rows[0]["Affiliate_user_name"].ToString();
                txtFirstName.Text = firstName.ToString();
                txtLastName.Text = lastName.ToString();
                txtMailId.Text = dsUserDetails.Rows[0]["mail"].ToString();
                txtAddress.Text = dsUserDetails.Rows[0]["Address"].ToString();
                lbCurrentCountry.Text = dsUserDetails.Rows[0]["country"].ToString();
                lbCurrentState.Text = dsUserDetails.Rows[0]["state"].ToString();
                txtCity.Text = dsUserDetails.Rows[0]["city"].ToString();
                txtPostalCode.Text = dsUserDetails.Rows[0]["postal_code"].ToString();

                ImgUserImage.Src = dsUserDetails.Rows[0]["ProfileImageUrl"].ToString();


            }
        }
        catch (Exception sqe)
        {
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            #region Updating Details
            con.Open();
            string FullName = "";
            if (txtLastName.Text != string.Empty)
                FullName = txtFirstName.Text + " " + txtLastName.Text;
            else
                FullName = txtFirstName.Text;
            SqlCommand cmd = new SqlCommand("update Affiliate set name='" + FullName + "'     , city='" + txtCity.Text + "'  , postal_code='" + txtPostalCode.Text.Trim() + "' ,Address='" + txtAddress.Text.Trim() + "'   where Affiliate_user_name='" + hdnfUserName.Value + "'   ");
            cmd.Connection = con;
            int a = cmd.ExecuteNonQuery();
            con.Close();

            #endregion

            #region Updating Country If changed

            //if (ddlCountry.SelectedItem.Text != "--Select--" && ddlState.Items.Count > 0)
            //{

            con.Open();
            SqlCommand cmdCountry = new SqlCommand("update Affiliate set country='" + hdfnCountry.Value + "'     , state='" + hdfnState.Value + "'  where Affiliate_user_name='" + hdnfUserName.Value + "'   ");
            cmdCountry.Connection = con;
            int QueryStatus = cmdCountry.ExecuteNonQuery();
            con.Close();

            //}

            #endregion


            #region Update profile Image

            if (hdnfImageUrl.Value != string.Empty && hdnfImageUrl.Value != null)
            {
                con.Open();
                SqlCommand cmdProfilePic = new SqlCommand("update Affiliate set ProfileImageUrl='" + hdnfImageUrl.Value + "'        where Affiliate_user_name='" + hdnfUserName.Value + "'   ");
                cmdProfilePic.Connection = con;
                cmdProfilePic.ExecuteNonQuery();
                con.Close();

            }

            #endregion


            lblResponse.Text = "Details Updated Sucessfully!";
            lblResponse.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception sqe)
        {

        }
    }


}