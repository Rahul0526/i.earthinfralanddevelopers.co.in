using System;
using System.Collections.Generic;

using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DL_affiliate
/// </summary>
public class DL_affiliate
{



    string strcon;


	public DL_affiliate()
	{
        strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
	}

    public DataTable get_affiliate()
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("[dbo].[affiliates]", cn);
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@action", "get_affliliates");
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

    public int insert_affiliate(BL_affiliates obj)
    {

        try
        {


            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.InsertCommand = new SqlCommand("[dbo].[affiliates]", cn);
            da.InsertCommand.Parameters.AddWithValue("@action", obj.action);
            da.InsertCommand.Parameters.AddWithValue("@affiliate_id", obj.aff_id);
            da.InsertCommand.Parameters.AddWithValue("@name", obj.aff_name);
            da.InsertCommand.Parameters.AddWithValue("@mail", obj.mail);
            da.InsertCommand.Parameters.AddWithValue("@age", obj.age);
            da.InsertCommand.Parameters.AddWithValue("@bank_info", obj.bank_info);
            da.InsertCommand.Parameters.AddWithValue("@acc", obj.acc);
            da.InsertCommand.Parameters.AddWithValue("@payment", obj.payment);
            da.InsertCommand.Parameters.AddWithValue("@website", obj.website);
            da.InsertCommand.Parameters.AddWithValue("@address", obj.address);
            da.InsertCommand.Parameters.AddWithValue("@date", obj.date);

            da.InsertCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            int res = da.InsertCommand.ExecuteNonQuery();
            cn.Close();
            if (res > 0)
            {
                return res;
            }
            else
            {
                return 0;
            }
        }
        catch (Exception)
        {
            return 0;
        }


    }





    public int update_affiliate(BL_affiliates obj)
    {

        try
        {


            SqlConnection cn = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.InsertCommand = new SqlCommand("[dbo].[affiliates]", cn);
            da.InsertCommand.Parameters.AddWithValue("@action", obj.action);
            da.InsertCommand.Parameters.AddWithValue("@affiliate_id", obj.aff_id);
            da.InsertCommand.Parameters.AddWithValue("@name", obj.aff_name);
            da.InsertCommand.Parameters.AddWithValue("@mail", obj.mail);
            da.InsertCommand.Parameters.AddWithValue("@age", obj.age);
            da.InsertCommand.Parameters.AddWithValue("@bank_info", obj.bank_info);
            da.InsertCommand.Parameters.AddWithValue("@acc", obj.acc);
            da.InsertCommand.Parameters.AddWithValue("@payment", obj.payment);
            da.InsertCommand.Parameters.AddWithValue("@website", obj.website);
            da.InsertCommand.Parameters.AddWithValue("@address", obj.address);
            da.InsertCommand.Parameters.AddWithValue("@date", obj.date);

            da.InsertCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            int res = da.InsertCommand.ExecuteNonQuery();
            cn.Close();
            if (res > 0)
            {
                return res;
            }
            else
            {
                return 0;
            }
        }
        catch (Exception)
        {
            return 0;
        }


    }


















}