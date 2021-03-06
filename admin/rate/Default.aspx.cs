﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class _Default : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=mssql.gipdns.com,1533;Initial Catalog=camp;Integrated Security=False;User ID=camp;Password=Augurs@123"); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    protected void BindData()
    {

        DataSet ds = new DataSet();
        string cmdstr = "SELECT Id,name FROM [country]";
        SqlDataAdapter adp = new SqlDataAdapter(cmdstr, conn);
        adp.Fill(ds);
        
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddchkCountry.DataSource = ds.Tables[0];
            ddchkCountry.DataTextField = "name";
            ddchkCountry.DataValueField = "Id";
            ddchkCountry.DataBind();
        }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        List<String> CountryID_list = new List<string>();
        List<String> CountryName_list = new List<string>();
        
        foreach (System.Web.UI.WebControls.ListItem item in ddchkCountry.Items)
        {
            if (item.Selected)
            {
                CountryID_list.Add(item.Value);
                CountryName_list.Add(item.Text);
            }

            lblCountryID.Text = "Country ID: "+ String.Join(",", CountryID_list.ToArray());
            lblCountryName.Text = "Country Name: "+ String.Join(",", CountryName_list.ToArray());
        }

    }
}