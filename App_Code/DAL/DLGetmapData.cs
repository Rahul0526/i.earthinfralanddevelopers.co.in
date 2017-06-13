using System;
using System.Collections.Generic;

using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DLGetmapData
/// </summary>
public class DLGetmapData
{
    string strcon;
	public DLGetmapData()
	{
        strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
	}
    public DataSet GetViewDataAdmin(BLGetMapData obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("[dbo].[GetMapData]", cn);
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@Instruction", obj.instruction);
            da.SelectCommand.Parameters.AddWithValue("@startDate", obj.startDate);
            da.SelectCommand.Parameters.AddWithValue("@AffiliateID", obj.AffiliateID);
            da.SelectCommand.Parameters.AddWithValue("@date", System.DateTime.Now);
            
            da.SelectCommand.Parameters.AddWithValue("@endDate", obj.EndDate);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            da.SelectCommand.ExecuteReader();
            DataSet dt = new DataSet();
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


    public DataSet GetRevenuePieChart(BLGetMapData obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("[dbo].[GetMapData]", cn);
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@Instruction", obj.instruction);
            da.SelectCommand.Parameters.AddWithValue("@startDate", obj.startDate);
            da.SelectCommand.Parameters.AddWithValue("@AffiliateID", obj.AffiliateID);
            da.SelectCommand.Parameters.AddWithValue("@date", System.DateTime.Now);

            da.SelectCommand.Parameters.AddWithValue("@endDate", obj.EndDate);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            da.SelectCommand.ExecuteReader();
            DataSet dt = new DataSet();
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
    public DataTable GetTopCountriesEarning(BLGetMapData obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("[dbo].[GetMapData]", cn);
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@Instruction", obj.instruction);
            da.SelectCommand.Parameters.AddWithValue("@AffiliateID", obj.AffiliateID);
            da.SelectCommand.Parameters.AddWithValue("@startDate", obj.startDate);
            da.SelectCommand.Parameters.AddWithValue("@endDate", obj.EndDate);
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
    public DataSet GetAdReq(BLGetMapData obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("[dbo].[GetMapData]", cn);
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@Instruction", obj.instruction);
            da.SelectCommand.Parameters.AddWithValue("@startDate", obj.startDate);
            da.SelectCommand.Parameters.AddWithValue("@AffiliateID", obj.AffiliateID);
            da.SelectCommand.Parameters.AddWithValue("@date", System.DateTime.Now);

            da.SelectCommand.Parameters.AddWithValue("@endDate", obj.EndDate);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            da.SelectCommand.ExecuteReader();
            DataSet dt = new DataSet();
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
    public DataSet GetdataForGeoChartAdmin(BLGetMapData obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("[dbo].[GetMapData]", cn);
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@Instruction", obj.instruction);
            da.SelectCommand.Parameters.AddWithValue("@startDate", obj.startDate);
            da.SelectCommand.Parameters.AddWithValue("@AffiliateID", obj.AffiliateID);
            da.SelectCommand.Parameters.AddWithValue("@endDate", obj.EndDate);
            da.SelectCommand.Parameters.AddWithValue("@website", obj.website);

            da.SelectCommand.Parameters.AddWithValue("@country", obj.country);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            da.SelectCommand.ExecuteReader();
            DataSet dt = new DataSet();
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



}