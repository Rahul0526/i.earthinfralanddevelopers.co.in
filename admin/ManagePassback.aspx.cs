using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Web.UI.WebControls;

public partial class admin_ManagePassback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                this._fillPassbackOnLoad();
            }
        }
        catch
        {

        }
    }
    private string RandomString(int size)
    {
        StringBuilder builder = new StringBuilder();
        Random random = new Random();
        char ch;
        for (int i = 0; i < size; i++)
        {
            ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
            builder.Append(ch);
        }
        return builder.ToString();
    }

    private void _fillPassbackOnLoad()
    {
        try
        {
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * from tblPassback where AffiliateId= '" + Session["affiliate_user_id"].ToString() + "'", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtpassback.Text = ds.Tables[0].Rows[0]["PassbackCode"].ToString();
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Warning", "Filltxtpassback();", true);
            }

        }
        catch (Exception sqe)
        {

        }
    }
    protected void InsertPassBackTag(object sender ,EventArgs e)
    {
        try
        {
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * from tblPassback where AffiliateId= '" + Session["affiliate_user_id"].ToString() + "'  ", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count == 0)
            {
                string PassBackId = RandomString(10);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tblPassback (PassbackId, PassbackCode , date , AffiliateId     ) values( '" + PassBackId + "' , '" + txtpassback.Text + "' , '" + System.DateTime.Now + "'  , '" + Session["affiliate_user_id"].ToString() + "'  )");
                cmd.Connection = con;
                int Count = cmd.ExecuteNonQuery();
                con.Close();
              
            }
            else
            {
                if (txtpassback.Text != string.Empty)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update  tblPassback   set PassbackCode='" + txtpassback.Text + "' where  AffiliateId='" + Session["affiliate_user_id"].ToString() + "'");
                    cmd.Connection = con;
                    int Count = cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            _fillPassbackOnLoad();
            
        }

        catch
        {
           
        }
    }
}