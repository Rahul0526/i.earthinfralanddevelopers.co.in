using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class DALCampaignPriorityList
{

    DataSet dtPriorCampaigns = new DataSet();

    string strcon;
    //----------------------------------For banner1 and Banner4 (Carousel Banners)------------------------------------------------
    //-----------------------Priority =  Cookie Ads -->keywords Ads-->Random Ads-------------------------------

    public DALCampaignPriorityList()
    {
        strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    }
    public DataSet GetPriorityCampaignList(string pageUrl, string bannerType, string country, string osType, int noOfAds, DataSet keyWordCampaigns, string[] cookieCampaigns, string computerId, string limitConversionsInQuery)
    {
        DataTable dtAvailCookieAds = GetCookiesCampList(cookieCampaigns, bannerType, country, osType, limitConversionsInQuery);

        for (int arrCount = cookieCampaigns.Length - 1; arrCount >= 0; arrCount--)
        {
            if (cookieCampaigns[arrCount] != null)
            {
                InsertCookieTagImpression(computerId, cookieCampaigns[arrCount]);
            }
            else
            {
                break;
            }
        }

        var campaignList = dtAvailCookieAds;
        if (campaignList.Rows.Count >= noOfAds)
        {
            DataTable dtReturn = GetCampaignDetails(bannerType, country, osType, campaignList, limitConversionsInQuery);
            if (dtPriorCampaigns.Tables.Count > 0)
                dtPriorCampaigns.Tables.RemoveAt(0);

            dtPriorCampaigns.Tables.Add(dtReturn);
            return dtPriorCampaigns;
        }
        else
        {
            if (campaignList.Rows.Count > 0)
                dtPriorCampaigns.Tables.Add(dtAvailCookieAds);

            if (keyWordCampaigns != null) // now keyword camapign has only one campaign . so this loop will run for 1 time .
            {
                for (int RowCounter = 0; RowCounter < keyWordCampaigns.Tables[0].Rows.Count; RowCounter++)
                {

                    DataRow drCampId = campaignList.NewRow();
                    drCampId["campId"] = keyWordCampaigns.Tables[0].Rows[RowCounter]["campaign_id"].ToString();
                    int IsExists = 0;
                    foreach (DataRow dr in campaignList.Rows)
                    {
                        if (dr["campId"].ToString() == keyWordCampaigns.Tables[0].Rows[RowCounter]["campaign_id"].ToString())
                        { IsExists++; }
                        else
                            continue;
                    }
                    if (IsExists == 0)
                        campaignList.Rows.Add(drCampId);
                    // dtPriorCampaigns.Tables[0].Rows.Add(KeyWordCampaigns.Tables[0].Rows[RowCounter] as DataRow);
                }
            }



            if (campaignList.Rows.Count >= noOfAds) // now in the main list , both campaigns are has been added . but see this condition . list count is 2 ,,, and requested load need 4 . so we have to choose 2 more campaigns . 
            {
                // return dtPriorCampaigns;
                DataTable dtReturn = GetCampaignDetails(bannerType, country, osType, campaignList, limitConversionsInQuery);
                if (dtPriorCampaigns.Tables.Count > 0)
                    dtPriorCampaigns.Tables.RemoveAt(0);

                dtPriorCampaigns.Tables.Add(dtReturn);
                return dtPriorCampaigns; // if condition was setisfied ... it  return from here . 
            }
            else
            {
                int GetMoreIds = noOfAds - campaignList.Rows.Count; // more needed camps 
                DataTable _RandomCamps = GetRendomCamps(bannerType, country, osType, campaignList, GetMoreIds, limitConversionsInQuery);
                if (_RandomCamps != null)
                {
                    for (int RowCounter = 0; RowCounter < _RandomCamps.Rows.Count; RowCounter++)
                    {

                        DataRow dr = campaignList.NewRow();
                        dr["campId"] = _RandomCamps.Rows[RowCounter]["campaign_id"].ToString();
                        campaignList.Rows.Add(dr);
                    }
                }
                DataTable dtReturn = GetCampaignDetails(bannerType, country, osType, campaignList, limitConversionsInQuery);
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
            string andCondition = string.Empty;
            string _query = string.Empty;

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (andCondition == string.Empty)
                        andCondition = " campaign_id!='" + dr["campId"] + "'";
                    else
                        andCondition += " and campaign_id!='" + dr["campId"] + "'";
                }
                _query = "SELECT top(" + rEMAINnO + ") [campaign_id], [campaigin_name], [title], [discription], [url], [call_to_action], [action], [device_and_action], [stars], [cost], [sponsers_adv], [country_targeted], [Add_style_formate], [date], [icon_img], [vedio_url] FROM [dbo].[campaigns] where Add_style_formate='" + BannerType + "' and country_targeted like '%" + Country + "%' and  " + andCondition + " and device_and_action like '%" + OsType + "%'  and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + LimitConversionsInQuery;
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

    private DataTable GetCampaignDetails(string bannerType, string country, string osType, DataTable dt, string limitConversionsInQuery)// now 
    {
        try
        {
            //string AndCondition = string.Empty;
            string _query = string.Empty; DataTable dsGetData ;
            if (dt.Rows.Count > 0)
            {
                _query = "SELECT  [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url] FROM [dbo].[campaigns] where Add_style_formate='" + bannerType + "' and " + limitConversionsInQuery;

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

                    _query = "SELECT  [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url] FROM [dbo].[campaigns]  where  Add_style_formate='" + bannerType + "' and campaign_id='" + dr["campId"].ToString() + "'   and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + limitConversionsInQuery;

                    con.Open();
                    SqlDataAdapter addData = new SqlDataAdapter(_query, con);
                    DataTable dsGetDataCamp = new System.Data.DataTable();
                    addData.Fill(dsGetDataCamp);
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

                        dsGetData.Rows.Add(drCamp);
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
                _query = "SELECT  [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url] FROM [dbo].[campaigns] where Add_style_formate='" + bannerType + "' and country_targeted like '%" + country + "%' and device_and_action like '%" + osType + "%' and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + limitConversionsInQuery;

                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlDataAdapter adpRandom = new SqlDataAdapter(_query, con);
                DataTable dsRendomRecords = new System.Data.DataTable();
                adpRandom.Fill(dsRendomRecords);
                con.Close();
                if (dsRendomRecords.Rows.Count > 0)
                {
                    return dsRendomRecords;
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
    
    private DataTable GetCookiesCampList(string[] cookieCampaigns, string bannerType, string country, string osType, string limitConversionsInQuery)
    {
        DataTable dtValidCampaigns = new System.Data.DataTable();
        dtValidCampaigns.Columns.Add("campId");
        try
        {
            for (int count = 0; count < cookieCampaigns.Length; count++)
            {
                string cookieCampId = string.Empty; string cookieBannerType = string.Empty;
                if (cookieCampaigns[count] != null)
                {
                    if (cookieCampaigns[count] != "InvalidCampaign")
                    {
                        cookieCampId = cookieCampaigns[count].ToString();

                        cookieBannerType = GetCookieBannerType(cookieCampId, country);
                        if (bannerType == cookieBannerType)
                        {
                            string query = "SELECT  [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url] FROM [dbo].[campaigns] where campaign_id='" + cookieCampId + "' Add_style_formate='" + bannerType + "' and and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + limitConversionsInQuery;
                            SqlConnection con = new SqlConnection(strcon);
                            con.Open();
                            SqlDataAdapter adp = new SqlDataAdapter(query, con);
                            DataSet dsGetData = new System.Data.DataSet();
                            adp.Fill(dsGetData);
                            con.Close();
                            if (dsGetData.Tables[0].Rows.Count > 0)
                            {
                                DataRow drCampId = dtValidCampaigns.NewRow();
                                drCampId["campId"] = dsGetData.Tables[0].Rows[0]["campaign_id"].ToString();
                                dtValidCampaigns.Rows.Add(drCampId);
                            }

                        }
                        else
                        {
                            cookieCampId = string.Empty;
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


        return dtValidCampaigns;// the cookie campaign's id it will return ... which was available in tag . 
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
    
    private void InsertCookieTagImpression(string ComputerId, string CampaignOnLoad)
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