﻿using System;
using System.IO;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;


public class DALGetKeyWords
{
    string strcon;
    public DALGetKeyWords()
    {
        strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    }

    #region GetSiteKeyWords
    public DataSet MatchedCampaigns(string pageUrl, string bannerType, string country, string osType, int noOfAds, int maxConversions)
    {
        try
        {
            string todaysConversions = "(SELECT count(AffiliateId) FROM getConversion as gCon JOIN view_click_maintain_on_daily_base as clicks ON gCon.Clickid = clicks.ClickId WHERE gCon.campaignId =campaigns.campaign_id AND [date]=CAST(GETDATE() AS DATE))";
            bool combinationFlag = CheckCombination(bannerType, country, osType, todaysConversions, maxConversions);
            if (combinationFlag == true)
            {
                #region Get keywords from web page

                #region Setting page Url
                pageUrl = "http://news.nationalgeographic.com/2017/04/jungle-dogs-peru-amazon-rare";
                #endregion

                string Apikey = "4a5075dbb713f58f60e3acf8f924fa41c9555287";                                   //"e9370cd124274b2dcd0cc7735ad912eb6be52f79";
                //string ApiUrl = "https://gateway-a.watsonplatform.net/calls/url/URLGetRankedKeywords?apikey=" + Apikey + "&url=" + pageUrl; // ibm api
                string ApiUrl = "http://i.earthinfralanddevelopers.co.in/admin/nlp.ashx?apikey=" + Apikey + "&page=" + pageUrl;

                var ApiRequest = (HttpWebRequest)WebRequest.Create(ApiUrl);
                ApiRequest.Method = "GET";
                ApiRequest.ContentType = "application/xml";
                var webResponse = (HttpWebResponse)ApiRequest.GetResponse();
                string KeyWordsAsString = string.Empty;
                using (StreamReader KayReader = new StreamReader(webResponse.GetResponseStream()))
                {
                    KeyWordsAsString = KayReader.ReadToEnd();
                    KayReader.Close();
                }
                System.Xml.Linq.XDocument KeyWordsAsXml;
                KeyWordsAsXml = System.Xml.Linq.XDocument.Parse(KeyWordsAsString);
                string keyList = string.Empty;
                foreach (XElement Elm in KeyWordsAsXml.Root.Elements())
                {
                    if (Elm.Name == "keywords")
                    {
                        foreach (XElement keys in Elm.Elements())
                        {
                            try
                            {
                                keyList += keyList == string.Empty ? keys.Value.ToString() : "," + keys.Value.ToString();
                                //if (keyList == string.Empty)
                                //    keyList = keys.Element("text").Value.ToString();
                                //else
                                //    keyList = keyList + "," + keys.Element("text").Value.ToString();
                            }
                            catch
                            {
                                continue;
                            }
                        }
                    }
                }
                DataSet dsReturnCampaigns = GetMatchedCampaigns(keyList, bannerType, country, osType, noOfAds);
                #endregion Get keywords from web page
                return dsReturnCampaigns;

            }
            else
            {
                #region Get Possible Combinations
                string Query = "SELECT top(" + noOfAds + ") [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url] FROM [dbo].[campaigns]  where Add_style_formate='" + bannerType + "' and country_targeted like '%" + country + "%' and device_and_action like '%" + osType + "%'     and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + todaysConversions + " <= " + maxConversions + " ORDER BY NEWID() ";
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlDataAdapter adp = new SqlDataAdapter(Query, con);
                DataSet dsGetData = new System.Data.DataSet();
                adp.Fill(dsGetData);
                con.Close();
                #endregion

                if (bannerType == "Banner 1" || bannerType == "Banner 4")
                { return null; }
                else
                {
                    if (dsGetData.Tables[0].Rows.Count > 0)
                        return dsGetData;
                    else
                        return null;
                }
            }
        }
        catch (Exception sqe)
        {
            return null;
        }
    }
    #endregion GetSiteKeyWords

    #region get Top campaings
    private DataSet GetMatchedCampaigns(string KeyList, string BannerType, string Country, string OsType, int NoOfAdsBanner)
    {
        try
        {
            SqlConnection con = new SqlConnection(strcon);
            string[] KeyArray = KeyList.Split(',');
            string Query = string.Empty;
            Query = "SELECT top(" + NoOfAdsBanner + ") [campaign_id],[campaigin_name],[title],[discription],[url],[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url]  FROM [dbo].[campaigns] where Add_style_formate='" + BannerType + "' and country_targeted like '%" + Country + "%' and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' ORDER BY NEWID() ";

            string OrCondition = string.Empty;
            foreach (string Key in KeyArray)
            {
                if (OrCondition == string.Empty)
                    OrCondition = "keywords like '%" + Key + "%'";
                else
                    OrCondition = OrCondition + "or keywords like '%" + Key + "%'";
            }

            if (OrCondition != string.Empty)
            {
                #region Add Condition for  No Keywords
                // OrCondition = OrCondition + "or keywords=''";
                #endregion
                Query = "SELECT top(" + NoOfAdsBanner + ") [campaign_id],[campaigin_name],[title],[discription],[url],[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url]  FROM [dbo].[campaigns] where Add_style_formate='" + BannerType + "' and country_targeted like '%" + Country + "%' and (" + OrCondition + ") and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' ORDER BY NEWID() ";
            }
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter(Query, con);
            DataSet dsGetCampList = new System.Data.DataSet();
            adp.Fill(dsGetCampList);
            con.Close();
            return dsGetCampList;
        }
        catch (Exception)
        {
            return null;
        }
    }
    #endregion get Top5 campaings

    #region CheckCombination

    private bool CheckCombination(string BannerType, string Country, string OsType, string todaysConversions, int maxConversions)
    {
        try
        {

            #region Get Possible Combinations

            string Query = "SELECT  [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url]," + todaysConversions + " as ConversionsDoneToday FROM [dbo].[campaigns]  where Add_style_formate='" + BannerType + "' and country_targeted like '" + Country + "' and device_and_action like '%" + OsType + "%'  and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running'  ORDER BY NEWID() ";
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter(Query, con);
            DataSet dsGetData = new System.Data.DataSet();
            adp.Fill(dsGetData);
            con.Close();

            #endregion
            int conversionsDoneToday = Convert.ToInt32(dsGetData.Tables[0].Rows[0]["ConversionsDoneToday"]);
            if (dsGetData.Tables[0].Rows.Count > 0 && conversionsDoneToday <= maxConversions)
                return true;
            else
                return false;
        }
        catch (Exception sqe)
        {
            return false;
        }
    }

    #endregion

}