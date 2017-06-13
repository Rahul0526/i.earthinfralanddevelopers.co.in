using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_forget_password : System.Web.UI.Page
{ 
    protected string toEmail, EmailSubj, EmailMsg;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {

            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select a.Affiliate_user_name,a.name,a.mail,a.website,b.password,b.user_type,login_status  from Affiliate as a inner join login_table as b on a.mail=b.user_name where a.mail='" + TextBox1.Text + "' ", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {

                string user_name = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                string name = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                string mail_id = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                string password = ds.Tables[0].Rows[0].ItemArray[4].ToString();
                string websites = ds.Tables[0].Rows[0].ItemArray[3].ToString();


                string user_type = ds.Tables[0].Rows[0].ItemArray[5].ToString();
                string login_status = ds.Tables[0].Rows[0].ItemArray[6].ToString();
                     //protected void send_mail(string id, string password,string name, string mail_id,string websites,string user_type,string login_status)
               string response= send_mail(user_name, password, name, mail_id, websites, user_type, login_status);
               if (response == "sucessfull")
               {
                   ScriptManager.RegisterStartupScript(this, this.GetType(), "Showstatus", "javascript:alert('Details Sent Sucessfully')", true);
               }
               else if (response == "fail")
               {
                   ScriptManager.RegisterStartupScript(this, this.GetType(), "Showstatus", "javascript:alert('sending failed')", true);

               }
               else
               {
                   ScriptManager.RegisterStartupScript(this, this.GetType(), "Showstatus", "javascript:alert('unknown error found')", true);

               }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Showstatus", "javascript:alert('This Mail ID Is InValid')", true);

            }
        }
        catch
        {
 
        }
    }



     protected string send_mail(string id, string password,string name, string mail_id,string websites,string user_type,string login_status)
    {
        try
        {
            toEmail = mail_id;
            EmailSubj = Convert.ToString("Campain Affiliate...Registration DEtails");
            EmailMsg = Convert.ToString("Hello '" + name + "'..... You are using   our site Campaign Ad service as a '" + user_type + "'... your  login mail  is  '" + mail_id + "' and password is '" + password + "'....Your login status is currently '"+login_status+"'..you have registered following sites for hosting Ads : '"+websites+"'... plesae click on this link for login http://camp.earthinfralanddevelopers.co.in/admin/login.aspx'");
            //passing parameter to Email Method
            SendEmail.Email_Without_Attachment(toEmail, EmailSubj, EmailMsg);
            return "sucessfull";
        }
        catch
        {
            return "fail";

        }
    }


}