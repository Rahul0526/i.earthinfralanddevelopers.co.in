using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Xml.Linq;
using System.Data;
using System.Xml.Serialization;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net;
using System.Xml;
using AlchemyAPI;
public class DALCampaignPriorityList
{

    DataSet dtPriorCampaigns = new System.Data.DataSet();

    string strcon;
    //----------------------------------For banner1 and Banner4 (Carousel Banners)------------------------------------------------
    //-----------------------Priority =  Cookie Ads -->keywords Ads-->Random Ads-------------------------------

    public DALCampaignPriorityList()
    {
        strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    }
    public DataSet GetPriorityCampaignList(string PageUrl, string BannerType, string Country, string OsType, int NoOfAds, DataSet KeyWordCampaigns, string[] CookieCampaigns, string ComputerId, string LimitConversionsInQuery)
    {
        DataTable CampaignList = new System.Data.DataTable();
        DataTable dtAvailCookieAds = GetCookiesCampList(CookieCampaigns, BannerType, Country, OsType, LimitConversionsInQuery);

        for (int ArrCount = 0; ArrCount < CookieCampaigns.Length; ArrCount++)
        { if (CookieCampaigns[ArrCount] != null) { insertCookieTagImpression(ComputerId, CookieCampaigns[ArrCount]); } else { break; } }

            CampaignList = dtAvailCookieAds;
        if (CampaignList.Rows.Count >= NoOfAds)
        {
            DataTable dtReturn = getCampaignDetails(BannerType, Country, OsType, CampaignList, LimitConversionsInQuery);
            if (dtPriorCampaigns.Tables.Count > 0)
                dtPriorCampaigns.Tables.RemoveAt(0);

            dtPriorCampaigns.Tables.Add(dtReturn);
            return dtPriorCampaigns;
        }
        else
        {
            if (CampaignList.Rows.Count > 0)
                dtPriorCampaigns.Tables.Add(dtAvailCookieAds);

            if (KeyWordCampaigns != null) // now keyword camapign has only one campaign . so this loop will run for 1 time .
            {
                for (int RowCounter = 0; RowCounter < KeyWordCampaigns.Tables[0].Rows.Count; RowCounter++)
                {

                    DataRow drCampId = CampaignList.NewRow();
                    drCampId["campId"] = KeyWordCampaigns.Tables[0].Rows[RowCounter]["campaign_id"].ToString();
                    int IsExists = 0;
                    foreach (DataRow dr in CampaignList.Rows)
                    {
                        if (dr["campId"].ToString() == KeyWordCampaigns.Tables[0].Rows[RowCounter]["campaign_id"].ToString())
                        { IsExists++; }
                        else
                            continue;
                    }
                    if (IsExists == 0)
                        CampaignList.Rows.Add(drCampId);
                    // dtPriorCampaigns.Tables[0].Rows.Add(KeyWordCampaigns.Tables[0].Rows[RowCounter] as DataRow);
                }
            }



            if (CampaignList.Rows.Count >= NoOfAds) // now in the main list , both campaigns are has been added . but see this condition . list count is 2 ,,, and requested load need 4 . so we have to choose 2 more campaigns . 
            {
                // return dtPriorCampaigns;
                DataTable dtReturn = getCampaignDetails(BannerType, Country, OsType, CampaignList, LimitConversionsInQuery);
                if (dtPriorCampaigns.Tables.Count > 0)
                    dtPriorCampaigns.Tables.RemoveAt(0);

                dtPriorCampaigns.Tables.Add(dtReturn);
                return dtPriorCampaigns; // if condition was setisfied ... it  return from here . 
            }
            else
            {
                int GetMoreIds = NoOfAds - CampaignList.Rows.Count; // more needed camps 
                DataTable _RandomCamps = GetRendomCamps(BannerType, Country, OsType, CampaignList, GetMoreIds, LimitConversionsInQuery);
                if (_RandomCamps != null)
                {
                    for (int RowCounter = 0; RowCounter < _RandomCamps.Rows.Count; RowCounter++)
                    {

                        DataRow dr = CampaignList.NewRow();
                        dr["campId"] = _RandomCamps.Rows[RowCounter]["campaign_id"].ToString();
                        CampaignList.Rows.Add(dr);
                    }
                }
                DataTable dtReturn = getCampaignDetails(BannerType, Country, OsType, CampaignList, LimitConversionsInQuery);
                if (dtPriorCampaigns.Tables.Count > 0)
                    dtPriorCampaigns.Tables.RemoveAt(0);
                dtPriorCampaigns.Tables.Add(dtReturn);
                return dtPriorCampaigns;
            }



        }

        //   return null;
    }

    private DataTable GetRendomCamps(string BannerType, string Country, string OsType, DataTable dt, int rEMAINnO, string LimitConversionsInQuery)// now time to choose 2 more 
    {
        try
        {
            string AndCondition = string.Empty;
            string _query = string.Empty;

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    //if (dr["campId"].ToString() == KeyWordCampaigns.Tables[0].Rows[RowCounter]["campaign_id"].ToString())
                    //{ IsExists++; }
                    //else
                    //    continue;
                    if (AndCondition == string.Empty)
                        AndCondition = " campaign_id!='" + dr["campId"] + "'";
                    else
                        AndCondition += " and campaign_id!='" + dr["campId"] + "'";

                }



                _query = "SELECT top(" + rEMAINnO + ") [campaign_id], [campaigin_name], [title], [discription], [url], [call_to_action], [action], [device_and_action], [stars], [cost], [sponsers_adv], [country_targeted], [Add_style_formate], [date], [icon_img], [vedio_url] FROM [dbo].[campaigns] where Add_style_formate='" + BannerType + "' and country_targeted like '%" + Country + "%' and  " + AndCondition + " and device_and_action like '%" + OsType + "%'  and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + LimitConversionsInQuery;
            }
            else
                _query = "SELECT top(" + rEMAINnO + ") [campaign_id], [campaigin_name], [title], [discription], [url], [call_to_action], [action], [device_and_action], [stars], [cost], [sponsers_adv], [country_targeted], [Add_style_formate], [date], [icon_img], [vedio_url] FROM [dbo].[campaigns] where Add_style_formate='" + BannerType + "' and country_targeted like '%" + Country + "%'  and device_and_action like '%" + OsType + "%'  and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + LimitConversionsInQuery;

            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter(_query, con);
            DataTable dsGetData = new System.Data.DataTable();
            adp.Fill(dsGetData);
            con.Close();
            if (dsGetData.Rows.Count > 0)
            {
                return dsGetData;
            }
            else
                return null;
        }
        catch
        {
            return null;
        }
    }




    private DataTable getCampaignDetails(string BannerType, string Country, string OsType, DataTable dt, string LimitConversionsInQuery)// now 
    {
        try
        {
            string AndCondition = string.Empty;
            string _query = string.Empty; DataTable dsGetData ;
            if (dt.Rows.Count > 0)
            {
                _query = "SELECT  [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url] FROM [dbo].[campaigns] where Add_style_formate='" + BannerType + "' and " + LimitConversionsInQuery;

                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlDataAdapter adp = new SqlDataAdapter(_query, con);
                dsGetData = new System.Data.DataTable();
                adp.Fill(dsGetData);
                con.Close();
                foreach (DataRow dr in dt.Rows)
                {
                    //if (dr["campId"].ToString() == KeyWordCampaigns.Tables[0].Rows[RowCounter]["campaign_id"].ToString())
                    //{ IsExists++; }
                    //else
                    //    continue;


                    _query = "SELECT  [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url] FROM [dbo].[campaigns]  where  Add_style_formate='" + BannerType + "' and campaign_id='" + dr["campId"].ToString() + "'   and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + LimitConversionsInQuery;

                    con.Open();
                    SqlDataAdapter AddData = new SqlDataAdapter(_query, con);
                    DataTable dsGetDataCamp = new System.Data.DataTable();
                    AddData.Fill(dsGetDataCamp);
                    con.Close();
                    if (dsGetDataCamp.Rows.Count > 0)
                    {
                        DataRow drCamp = dsGetData.NewRow();
                        //drCamp = dsGetDataCamp.Rows[0];

                        drCamp["campaign_id"] = dsGetDataCamp.Rows[0]["campaign_id"].ToString();
                        drCamp["campaigin_name"] = dsGetDataCamp.Rows[0]["campaigin_name"].ToString();
                        drCamp["title"] = dsGetDataCamp.Rows[0]["title"].ToString();
                        drCamp["discription"] = dsGetDataCamp.Rows[0]["discription"].ToString();
                        drCamp["url"] = dsGetDataCamp.Rows[0]["url"].ToString();
                        drCamp["call_to_action"] = dsGetDataCamp.Rows[0]["call_to_action"].ToString();
                        drCamp["action"] = dsGetDataCamp.Rows[0]["action"].ToString();
                        drCamp["device_and_action"] = dsGetDataCamp.Rows[0]["device_and_action"].ToString();
                        drCamp["stars"] = dsGetDataCamp.Rows[0]["stars"].ToString();
                        drCamp["cost"] = dsGetDataCamp.Rows[0]["cost"].ToString();
                        drCamp["sponsers_adv"] = dsGetDataCamp.Rows[0]["sponsers_adv"].ToString();
                        drCamp["country_targeted"] = dsGetDataCamp.Rows[0]["country_targeted"].ToString();
                        drCamp["Add_style_formate"] = dsGetDataCamp.Rows[0]["Add_style_formate"].ToString();
                        drCamp["date"] = dsGetDataCamp.Rows[0]["date"].ToString();
                        drCamp["icon_img"] = dsGetDataCamp.Rows[0]["icon_img"].ToString();
                        drCamp["vedio_url"] = dsGetDataCamp.Rows[0]["vedio_url"].ToString();
                       
                     dsGetData.Rows.Add(drCamp );
                    }
                       



                    //if (AndCondition == string.Empty)
                    //    AndCondition = " campaign_id='" + dr["campId"] + "'";
                    //else
                    //    AndCondition += " or campaign_id ='" + dr["campId"] + "'";

                }
                return dsGetData;
            }
            else
            {
                _query = "SELECT  [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url] FROM [dbo].[campaigns] where Add_style_formate='" + BannerType + "' and country_targeted like '%" + Country + "%' and device_and_action like '%" + OsType + "%' and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + LimitConversionsInQuery;

                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlDataAdapter AdpRandom = new SqlDataAdapter(_query, con);
                DataTable DsRendomRecords = new System.Data.DataTable();
                AdpRandom.Fill(DsRendomRecords);
                con.Close();
                if (DsRendomRecords.Rows.Count > 0)
                {
                    return DsRendomRecords;
                }
                else
                    return null;
            }
        }
        catch
        {
            return null;
        }
    }
    private DataTable GetCookiesCampList(string[] CookieCampaigns, string BannerType, string Country, string OsType, string LimitConversionsInQuery)
    {
        DataTable DtValidCampaigns = new System.Data.DataTable();
        DtValidCampaigns.Columns.Add("campId");
        try
        {
            for (int Count = 0; Count < CookieCampaigns.Length; Count++)
            {
                string CookieCampId = string.Empty; string CookieBannerType = string.Empty;
                if (CookieCampaigns[Count] != null)
                {
                    if (CookieCampaigns[Count] != "InvalidCampaign")
                    {
                        CookieCampId = CookieCampaigns[Count].ToString();

                        CookieBannerType = GetCookieBannerType(CookieCampId, Country);
                        if (BannerType == CookieBannerType)
                        {
                            string Query = "SELECT  [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url] FROM [dbo].[campaigns] where campaign_id='" + CookieCampId + "' Add_style_formate='" + BannerType + "' and and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + LimitConversionsInQuery;
                            SqlConnection con = new SqlConnection(strcon);
                            con.Open();
                            SqlDataAdapter adp = new SqlDataAdapter(Query, con);
                            DataSet dsGetData = new System.Data.DataSet();
                            adp.Fill(dsGetData);
                            con.Close();
                            if (dsGetData.Tables[0].Rows.Count > 0)
                            {
                                DataRow drCampId = DtValidCampaigns.NewRow();
                                drCampId["campId"] = dsGetData.Tables[0].Rows[0]["campaign_id"].ToString();
                                DtValidCampaigns.Rows.Add(drCampId);
                            }

                        }
                        else
                        {
                            CookieCampId = string.Empty;
                            continue;
                        }
                    }
                }
                else
                {
                    break;
                }
            }
        }
        catch
        {

        }


        return DtValidCampaigns;// the cookie campaign's id it will return ... which was available in tag . 
    }
    private string GetCookieBannerType(string CookieBannerId, string Country)
    {
        try
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            string query = "SELECT  [Add_style_formate]  FROM [dbo].[campaigns]  where campaign_id='" + CookieBannerId + "' and country_targeted like '%" + Country + "%' ORDER BY NEWID() ";

            SqlDataAdapter adp = new SqlDataAdapter(query, con);

            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            return ds.Tables[0].Rows[0].ItemArray[0].ToString();
        }
        catch
        {
            return null;
        }
    }
    private void insertCookieTagImpression(string ComputerId, string CampaignOnLoad)
    {
        try
        {SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select AdtagName from tblCookieTags where AdTagValue like '%" + CampaignOnLoad + "%' and uniqueComputerId='" + ComputerId + "'", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();

            con.Open();
            string command = "insert into  tbltagImperassions(uniqueComputerId,AdtagName , Datetime) values('" + ComputerId + "' , '" + ds.Tables[0].Rows[0]["AdtagName"].ToString() + "' , getdate())";
            SqlCommand cmd = new SqlCommand(command, con);
            cmd.Connection = con;
            int Response = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception sqe)
        {

        }
    }
}