using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Xml.Linq;
using System.Data;
using System.Xml.Serialization;
using AlchemyAPI;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net;
using System.Xml;


public class DALGetKeyWords
{
    string strcon;
    public DALGetKeyWords()
    {
        strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    }

    #region GetSiteKeyWords
    public DataSet MatchedCampaigns(string PageUrl, string BannerType, string Country, string OsType, int NoOfAds, int maxConversions)
    {
        try
        {
            string todaysConversions = "(SELECT count(AffiliateId) FROM getConversion as gCon JOIN view_click_maintain_on_daily_base as clicks ON gCon.Clickid = clicks.ClickId WHERE gCon.campaignId =campaigns.campaign_id AND [date]=CAST(GETDATE() AS DATE))";
            bool CombinationFlag = CheckCombination(BannerType, Country, OsType, todaysConversions, maxConversions);
            if (CombinationFlag == true)
            {
                #region Get keywords from web page

                #region Setting page Url
                // PageUrl = "http://camp.otsinfra.org/Admin/create_new_campaign.aspx";
                #endregion


                string Apikey = "4a5075dbb713f58f60e3acf8f924fa41c9555287";                                   //"e9370cd124274b2dcd0cc7735ad912eb6be52f79";
                string ApiUrl = "https://gateway-a.watsonplatform.net/calls/url/URLGetRankedKeywords?apikey=" + Apikey + "&url=" + PageUrl;
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
                                if (keyList == string.Empty)
                                    keyList = keys.Element("text").Value.ToString();
                                else
                                    keyList = keyList + "," + keys.Element("text").Value.ToString();
                            }
                            catch
                            {
                                continue;
                            }
                        }
                    }
                }
                DataSet dsReturnCampaigns = GetMatchedCampaigns(keyList, BannerType, Country, OsType, NoOfAds);
                #endregion Get keywords from web page
                return dsReturnCampaigns;

            }
            else
            {
                #region Get Possible Combinations
                string Query = "SELECT top(" + NoOfAds + ") [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url] FROM [dbo].[campaigns]  where Add_style_formate='" + BannerType + "' and country_targeted like '%" + Country + "%' and device_and_action like '%" + OsType + "%'     and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + todaysConversions + " <= " + maxConversions + " ORDER BY NEWID() ";
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlDataAdapter adp = new SqlDataAdapter(Query, con);
                DataSet dsGetData = new System.Data.DataSet();
                adp.Fill(dsGetData);
                con.Close();
                #endregion

                if (BannerType == "Banner 1" || BannerType == "Banner 4")
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
            Query = "SELECT top(" + NoOfAdsBanner + ") [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url]  FROM [dbo].[campaigns]  where Add_style_formate='" + BannerType + "' and country_targeted like '%" + Country + "%'  and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running'      ORDER BY NEWID() ";

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
                Query = "SELECT top(" + NoOfAdsBanner + ") [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url]  FROM [dbo].[campaigns]  where Add_style_formate='" + BannerType + "' and country_targeted like '%" + Country + "%'  and (" + OrCondition + ")  and (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running'  ORDER BY NEWID() ";
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