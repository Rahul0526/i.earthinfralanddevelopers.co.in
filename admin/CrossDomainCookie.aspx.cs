using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Collections;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class admin_CrossDomainCookie : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
           this. SetCookies();
    }

    private void SetCookies()
    {
        try
        {
            string ComputerId = string.Empty;
            ArrayList colCookies = new ArrayList();
            for (int i = 0; i < Request.Cookies.Count; i++)
                colCookies.Add(Request.Cookies[i]);
            string[] Arr;

            foreach (var item in colCookies)
            {
                HttpCookie c1 = item as HttpCookie;
                if (c1.Name == "UniqueIdentification")
                    ComputerId = c1.Value;

            }
            if (ComputerId == string.Empty)
            {

               ComputerId= CreateComputerId();
                CreateAdCookie(ComputerId);
            }
            else
            {
                CreateAdCookie(ComputerId);
            }
        }
        catch (Exception sqe)
        {

        }
    }

    private string CreateComputerId()
    {
        try
        {
            string QueryData = Request.QueryString["DomainName"].ToString();
            string[] Arr;
            Arr = QueryData.Split(',');
            string uniqueComputerId = Arr[3].ToString().Substring(0, 4) + GenerateOTP();
            
            HttpCookie CreateComputerId = new HttpCookie("UniqueIdentification");
            CreateComputerId.Value = uniqueComputerId;
            // CreateComputerId.Domain = "camp.earthinfralanddevelopers.co.in";
            CreateComputerId.Path = "/";
            DateTime expireyDate = System.DateTime.Now.AddDays(10000);
            CreateComputerId.Expires = expireyDate;
            Response.Cookies.Add(CreateComputerId);
            return uniqueComputerId;
        }
        catch
        {
            return "";
        }
    }

    public void CreateAdCookie(string ComputerId)
    {
        try
        {
            string QueryData = Request.QueryString["DomainName"].ToString();
            string[] Arr;
            Arr = QueryData.Split(',');
            string UniquetagId = RandomString(8);
            string tagSpecification = Arr[3].ToString();
            string Interestcategories = Arr[4].ToString();
            HttpCookie CreateAdCookie = new HttpCookie("TagNO" + UniquetagId);
            //   CreateAdCookie.Domain = "camp.earthinfralanddevelopers.co.in";
            CreateAdCookie.Path = "/";
            CreateAdCookie.Expires = System.DateTime.Now.AddDays(Convert.ToInt32(Arr[2]));
            string AdTagValue = Arr[0].ToString() + "," + Arr[1].ToString() + "," + Arr[2].ToString() + "," + Arr[3].ToString()+","+Interestcategories;
            CreateAdCookie.Value = AdTagValue;
            string StrCommand = "insert into tblCookieTags values('" + ComputerId + "' , '" + UniquetagId + "' , '" + AdTagValue + "' ,'" + Arr[0].ToString() + "' ,'" + System.DateTime.Now.AddDays(Convert.ToInt32(Arr[2])) + "' , '" + System.DateTime.Now + "' )";
            int InsertResponse = InsertTagDetails(StrCommand, ComputerId, UniquetagId, AdTagValue, Arr[0].ToString(), System.DateTime.Now.AddDays(Convert.ToInt32(Arr[2])), System.DateTime.Now);
            if (InsertResponse > 0)
                Response.Cookies.Add(CreateAdCookie);
            else
            {
                //do not Add cookie
            }
        }
        catch
        {

        }
    }

    private int InsertTagDetails(string command, string ComputerId, string UniquetagId, string AdTagValue , string domainName   ,  DateTime DateOfExpireation , DateTime TodayDate )
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("Select * from tblCookieTags where uniqueComputerId='" + ComputerId + "' and AdTagValue='" + AdTagValue + "'", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            int Response=0;
            if (ds.Tables[0].Rows.Count == 0)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(command, con);
                cmd.Connection = con;
                Response = cmd.ExecuteNonQuery();
                con.Close();
            }
            return Response;
        }
        catch
        {
            return 0;
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

    protected string GenerateOTP()
    {
        string alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        string small_alphabets = "abcdefghijklmnopqrstuvwxyz";
        string numbers = "1234567890";
        string SpecialCharacters = "#$%@&^*";
        
        string characters = numbers;

        characters += alphabets + small_alphabets + numbers + SpecialCharacters;

        int length = 41;
        string otp = string.Empty;
        for (int i = 0; i < length; i++)
        {
            string character = string.Empty;
            do
            {
                int index = new Random().Next(0, characters.Length);
                character = characters.ToCharArray()[index].ToString();
            } while (otp.IndexOf(character) != -1);
            otp += character;
        }
        return otp;
    }
}