using System;
using System.Collections.Generic;

using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public class DALCampaignDetails
{
    string strcon;
	public DALCampaignDetails()
	{
        strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
	}


    public DataTable GetDataOnLoad(BALCampaignDetails obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("[dbo].[SpCampaignData]", cn);
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@action", obj._Action);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            da.SelectCommand.ExecuteReader();
            DataTable dt = new DataTable();
            cn.Close();
            da.Fill(dt);

            if (dt != null)
            {
                return dt;
            }
            else
            {
                return null;
            }
        }
        catch (Exception)
        {
            return null;
        }

    }

    public DataTable getCampaignDetails(BALCampaignDetails obj)
    {

        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("ProCampaignDetails", cn);
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@Action", obj._Action);
            da.SelectCommand.Parameters.AddWithValue("@Add_style_formate", obj._Banner);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            da.SelectCommand.ExecuteReader();
            DataTable dt = new DataTable();
            cn.Close();
            da.Fill(dt);

            if (dt != null)
            {
                return dt;
            }
            else
            {
                return null;
            }
        }
        catch (Exception)
        {
            return null;
        }
    }

    public DataTable getWebsites(BALCampaignDetails obj)
    {

        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("ProCampaignDetails", cn);
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@Action", obj._Action);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            da.SelectCommand.ExecuteReader();
            DataTable dt = new DataTable();
            cn.Close();
            da.Fill(dt);

            if (dt != null)
            {
                return dt;
            }
            else
            {
                return null;
            }
        }
        catch (Exception)
        {
            return null;
        }
    }

    public int InsertBlockWebDetails(BALCampaignDetails obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.InsertCommand = new SqlCommand("ProCampaignDetails", cn);
            da.InsertCommand.Parameters.Clear();
            da.InsertCommand.Parameters.AddWithValue("@Action", obj._Action);
            da.InsertCommand.Parameters.AddWithValue("@campid", obj._CampId);
            da.InsertCommand.Parameters.AddWithValue("@websiteName", obj._WebSiteName);
            da.InsertCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            int a = da.InsertCommand.ExecuteNonQuery();         
            cn.Close();
            return a;

            if (a != 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
        catch(Exception ex)
        {
            return 0;
        }
    }

}