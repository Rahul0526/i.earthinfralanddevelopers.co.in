using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public class DALLogin
{
    string strcon;
	public DALLogin()
	{
        strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
	}
    public DataTable Login(BALLogin obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("[dbo].[sp_Login]", cn);
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@flag", obj.Flag);
            da.SelectCommand.Parameters.AddWithValue("@LoginId", obj.MailID);
            da.SelectCommand.Parameters.AddWithValue("@Password", obj.Password);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            da.SelectCommand.ExecuteReader();
            DataTable dt = new DataTable();
            cn.Close();
            da.Fill(dt);

            if (dt != null)
                return dt;
            else
                return null;
        }
        catch (Exception)
        {
            return null;
        }

    }

    public DataTable CheckBlockStatus(BALLogin obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("[dbo].[sp_Login]", cn);
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@flag", obj.Flag);
            da.SelectCommand.Parameters.AddWithValue("@LoginId", obj.MailID);

            da.SelectCommand.Parameters.AddWithValue("@ClientIpAddress", obj.ClientIpAddress);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            da.SelectCommand.ExecuteReader();
            DataTable dt = new DataTable();
            cn.Close();
            da.Fill(dt);

            if (dt != null)
                return dt;
            else
                return null;
        }
        catch (Exception)
        {
            return null;
        }
    }

    public int UpdateLoginAttempt(BALLogin obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.InsertCommand = new SqlCommand("[dbo].[sp_Login]", cn);
            da.InsertCommand.Parameters.AddWithValue("@flag", obj.Flag);
            da.InsertCommand.Parameters.AddWithValue("@LoginId", obj.MailID);
            da.InsertCommand.Parameters.AddWithValue("@ClientIpAddress", obj.ClientIpAddress);
            da.InsertCommand.Parameters.AddWithValue("@AttemptdateTime", System.DateTime.Now);
            da.InsertCommand.Parameters.AddWithValue("@BlockDateTime", obj.SystemBlockDate);
            da.InsertCommand.Parameters.AddWithValue("@blockStatus", obj.SystemBlockStatus);
            da.InsertCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            int res = da.InsertCommand.ExecuteNonQuery();
            cn.Close();
            if (res > 0)
                return res;
            else
                return 0;
        }
        catch (Exception)
        {
            return 0;
        }

    }
    public int AddLoginAttempt(BALLogin obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.InsertCommand = new SqlCommand("[dbo].[sp_Login]", cn);
            da.InsertCommand.Parameters.AddWithValue("@flag", obj.Flag);
            da.InsertCommand.Parameters.AddWithValue("@LoginId", obj.MailID);
            da.InsertCommand.Parameters.AddWithValue("@ClientIpAddress", obj.ClientIpAddress);
            da.InsertCommand.Parameters.AddWithValue("@AttemptdateTime", System.DateTime.Now);
         //   da.InsertCommand.Parameters.AddWithValue("@BlockDateTime", obj.SystemBlockDate);
            da.InsertCommand.Parameters.AddWithValue("@blockStatus", obj.SystemBlockStatus);
            da.InsertCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            int res = da.InsertCommand.ExecuteNonQuery();
            cn.Close();
            if (res > 0)
                return res;
            else
                return 0;
        }
        catch (Exception)
        {
            return 0;
        }

    }
    public int ResetAttemps(BALLogin obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.UpdateCommand = new SqlCommand("[dbo].[sp_Login]", cn);
            da.UpdateCommand.Parameters.AddWithValue("@flag", obj.Flag);
            da.UpdateCommand.Parameters.AddWithValue("@LoginId", obj.MailID);

            da.UpdateCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            int res = da.UpdateCommand.ExecuteNonQuery();
            cn.Close();
            if (res > 0)
                return res;
            else
                return 0;
        }
        catch (Exception)
        {
            return 0;
        }

    }
}