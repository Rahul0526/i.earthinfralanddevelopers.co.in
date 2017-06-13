using System;
using System.Net;
using System.Net.Mail;
using System.Configuration;




public static class SendEmail
{
    public static string Pass, FromEmailid, HostAdd;

    public static void Email_Without_Attachment(String ToEmail, String Subj, string Message)
    {
       
        HostAdd = ConfigurationManager.AppSettings["Host"].ToString();
        FromEmailid = ConfigurationManager.AppSettings["FromMail"].ToString();
        Pass = ConfigurationManager.AppSettings["Password"].ToString();

        
        MailMessage mailMessage = new MailMessage();

        mailMessage.From = new MailAddress(FromEmailid); 
        mailMessage.Subject = Subj;
        mailMessage.Body = Message; 
        mailMessage.IsBodyHtml = true;
        mailMessage.To.Add(new MailAddress(ToEmail)); 

        SmtpClient smtp = new SmtpClient(); 
        smtp.Host = HostAdd; 

        

        smtp.EnableSsl = true;
        NetworkCredential NetworkCred = new NetworkCredential();
        NetworkCred.UserName = mailMessage.From.Address;
        NetworkCred.Password = Pass;
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 587;
        smtp.Send(mailMessage); 
    }

}