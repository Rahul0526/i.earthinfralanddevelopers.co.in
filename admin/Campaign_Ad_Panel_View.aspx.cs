using System;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Drawing;
using System.IO;
using System.Drawing.Drawing2D;

public partial class Campaign_Ad_Panel_View : System.Web.UI.Page
{

    public DataSet dspage;
    public int countLoop = 5;
    public string[] MainImgArray;
    public decimal rateCount = 0;
    public string[] iconImgArray;
    public DataSet KeyWordBasedCampId;
    public string IconImgFileName = string.Empty;
    public string iconImgImageName = string.Empty;
    public string iconURL = string.Empty;
    public string MainImgFileName = string.Empty;
    public string MainImgImageName = string.Empty;
    public string MainImageURL = string.Empty;
    public string functionPart = string.Empty;
    public string strDescription = string.Empty;
    public int NoOfbanner4 = 0;
    public string ShowHideActiBnr4 = string.Empty;
    public int maxConversions = 10;
    //public string domain = "../";

    //public string domain = "http://localhost:51628/camp17march2017/";

    //public string domain = "http://i.earthinfralanddevelopers.co.in/";
    public string domain = "d:\\WebSpace\\kkstudies\\camp.earthinfralanddevelopers.co.in\\wwwroot\\";
    DALGetKeyWords dlGetKeyWords = new DALGetKeyWords();
    readonly DALCampaignPriorityList _dlPriorityList = new DALCampaignPriorityList();
    readonly DalValidateAdTags _dlValidateTags = new DalValidateAdTags();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(Request.QueryString["width"]))
            {

            }
            if (!Page.IsPostBack)
            {
                Session["sid"] = RandomString(24);

                sid.Value = Session["sid"].ToString();
                data_sid2.InnerText = Session["sid"].ToString();
                string IP = ""; 
                string isp = Request.QueryString["isp"].ToString(); 
                string campId = "";
                string website = Request.QueryString["domain_name"].ToString();
                string qry = "select count(serial)as blockedDomains, (select count(id) from IpBlackList where ipAddress='" + IP + "' and status='True')as IpBlackList, "
                    + " (select count(id) from ISpIBlackList where iSpAddress='" + isp + "' and status='True')as ISpIBlackList from dbo.tblBlockwebsites where campid='" + campId + "' "
                    + " and websiteName='" + website + "' and status='True'";
                SqlDataAdapter adp = new SqlDataAdapter(qry, con);
                DataTable dtBlockedDomains = new DataTable();
                adp.Fill(dtBlockedDomains);
                con.Close();
                if (Convert.ToInt32(dtBlockedDomains.Rows[0]["blockedDomains"]) == 0 && Convert.ToInt32(dtBlockedDomains.Rows[0]["IpBlackList"]) == 0 && Convert.ToInt32(dtBlockedDomains.Rows[0]["ISpIBlackList"]) == 0)
                {
                    ViewState["VidCount"] = "0";
                    HiddenVideoCount.Value = ViewState["VidCount"].ToString();
                    if (Request.QueryString["banner_id"] == "Banner 1" || Request.QueryString["banner_id"] == "Banner 4")
                    {
                        this.load_data_banner();
                        Session.Add("DescriptionColor", Request.QueryString["DescriptionColor"].ToString());
                        Session.Add("TitleColor", Request.QueryString["TitleColor"].ToString());
                        Session.Add("NoOfBanners", Request.QueryString["NoOfBanner1"].ToString());
                        Session.Add("AdbgColor", Request.QueryString["bg_color"].ToString());
                        NoOfbanner4 = Convert.ToInt32(Request.QueryString["NoOfBanner1"].ToString());
                        Session.Add("Banner2BorderColor", Request.QueryString["Banner2BorderColor"].ToString());
                        Session.Add("button_color", Request.QueryString["button_color"].ToString());
                        Session.Add("ButtonBorderColor", Request.QueryString["BorderColor"].ToString());

                        this.PagePanelObj();
                        RanderColasualbanner1(sid.Value.ToString(), Request.QueryString["banner_id"].ToString(), Session["dspage"] as DataSet);
                    }
                    else
                    {
                        randomcampid.InnerHtml = load_ad_copy();
                        if (Request.QueryString["View"].ToString() == "0") {
                            Response.Write(randomcampid.InnerHtml);
                        }
                        if (randomcampid.InnerHtml == string.Empty)
                        {
                            banner2.Visible = false;
                            banner3.Visible = false;
                            banner4.Visible = false;
                            banner5.Visible = false;
                            banner6.Visible = false;

                            #region getPassback based on Id
                            if(con.State != ConnectionState.Open) con.Open();
                            SqlDataAdapter adp2 = new SqlDataAdapter("select * from tblPassback where PassbackId='" + Request.QueryString["PassbackId"].ToString() + "'", con);
                            DataTable dtpassbackCode = new DataTable();
                            adp2.Fill(dtpassbackCode);
                            con.Close();
                            if (dtpassbackCode.Rows.Count > 0)
                            {
                                HDNFPassbackCode.Value = dtpassbackCode.Rows[0]["PassbackCode"].ToString();
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Warning", "WritePassbackCode();", true);
                            }

                            #endregion
                        }
                        else
                            this.load_data_banner();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Warning", "clearHtmlBody();", true);
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message.ToString() + "')</script>");
        }
    }
    public static string RandomString(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        var random = new Random();

        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }
    private string load_ad_copy()
    {
        try
        {
        //back here if os didnt match.
        backToStart:

            //System.IO.Directory.CreateDirectory(domain + "Campaign_Images/image_catche");
            string CookieBannerType = "";
            string[] campArr = new string[10];
            string banner_id = Request.QueryString["banner_id"];
            #region ReadCookies
            string ComputerId = this.ReadCookies();
            if (ComputerId != string.Empty)
                campArr = _dlValidateTags.SetCookiePriority(ComputerId, banner_id);
            #endregion
            int noOfAds = Convert.ToInt32(Request.QueryString["NoOfBanner1"]);
            string query = string.Empty;
            string campign_id = string.Empty;
            string campIdFilter = "";
            bool checkConversions = true;
            string todaysConversions = "(SELECT count(AffiliateId) FROM getConversion as gCon JOIN view_click_maintain_on_daily_base as clicks ON gCon.Clickid = clicks.ClickId WHERE gCon.campaignId =campaigns.campaign_id AND [date]=CAST(GETDATE() AS DATE)) as ConversionsDoneToday";
            string LimitConversionsInQuery = "(campaigns.dailyCapping IS NULL OR campaigns.dailyCapping = 0 OR (campaigns.dailyCapping IS not null AND campaigns.dailyCapping > (SELECT count(AffiliateId) FROM getConversion as gCon JOIN view_click_maintain_on_daily_base as clicks ON gCon.Clickid = clicks.ClickId WHERE gCon.campaignId = campaigns.campaign_id AND [date]=CAST(GETDATE() AS DATE))))";
            DataSet ds = new DataSet();
            string HostedPageUrl = Request.QueryString["AdPageUrl"];
            if (Request.QueryString["camp_id"].ToString() != "undefined" && Request.QueryString["camp_id"].ToString() != "0")
            {
                campign_id = Request.QueryString["camp_id"].ToString();
                campIdFilter = "' and campaign_id='" + campign_id;
                con.Open();
                string checkClicksCountQuery = "SELECT dailyCapping, ( SELECT count(AffiliateId) FROM getConversion as gCon JOIN view_click_maintain_on_daily_base as clicks ON gCon.Clickid = clicks.ClickId WHERE gCon.campaignId = campaigns.campaign_id AND [date]=CAST(GETDATE() AS DATE)) AS conversions FROM campaigns WHERE campaign_id='" + campign_id + "'";
                SqlCommand chkClick = new SqlCommand(checkClicksCountQuery);
                chkClick.Connection = con;
                SqlDataReader reader = chkClick.ExecuteReader();
                reader.Read();
                int conversions = 0;
                int capping = 0;
                bool checkConversion = false;
                if (reader.HasRows)
                {
                    if (!reader.IsDBNull(0))
                    {
                        checkConversion = true;
                        conversions = reader.GetInt32(1);
                        capping = (int)reader.GetDecimal(0);
                    }
                }
                reader.Close();
                con.Close();
                if (checkConversion && capping != 0 && conversions >= capping) {
                    return "";
                }
            }
                
            #region Banner Keywords section
            try
            {
                if (banner_id == "Banner 1" || banner_id == "Banner 4")
                {
                    //another ad from here. we got 
                    query = "select top(" + noOfAds + ") [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url]  FROM [dbo].[campaigns]  where Add_style_formate='" + banner_id + "' and (country_targeted like '%" + Request.QueryString["country_name"] + "%' OR country_targeted = '') AND (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' ORDER BY NEWID() ";
                    KeyWordBasedCampId = dlGetKeyWords.MatchedCampaigns(HostedPageUrl, banner_id, Request.QueryString["country_name"], Request.QueryString["os_type"], noOfAds, maxConversions);

                    dspage = _dlPriorityList.GetPriorityCampaignList(Request.QueryString["AdPageUrl"], banner_id, Request.QueryString["country_name"], Request.QueryString["os_type"], noOfAds, KeyWordBasedCampId, campArr, ComputerId, LimitConversionsInQuery);
                    //dspage = KeyWordBasedCampId;                                   
                    ds = dspage;
                    checkConversions = false;
                    goto KeySucceded;
                }
                else if (banner_id == "Banner 5")
                {
                    query = "SELECT  [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url],[imageA],[imageB],[imageC],[imageD],[imageE],[animationA],[animationB],[animationC],[animationD],[animationE],[bannerType],[videoPlayBtn] FROM [dbo].[campaigns]  where Add_style_formate='" + banner_id + campIdFilter + "' and (country_targeted like '%" + Request.QueryString["country_name"] + "%' OR country_targeted = '') AND (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + LimitConversionsInQuery + " ORDER BY NEWID() ";
                    KeyWordBasedCampId = dlGetKeyWords.MatchedCampaigns(Request.QueryString["domain_name"], banner_id, Request.QueryString["country_name"], Request.QueryString["os_type"], noOfAds, maxConversions);
                    if (KeyWordBasedCampId != null && KeyWordBasedCampId.Tables[0].Rows.Count > 0)
                    {
                        ds = KeyWordBasedCampId;
                        dspage = KeyWordBasedCampId;
                        goto KeySucceded;
                    }
                    else
                        goto Keyfailed;
                }
                else
                {
                    string CookieCampId = "";
                    for (int Count = 0; Count < campArr.Length; Count++)
                    {
                        if (campArr[Count] != null)
                        {
                            if (campArr[Count] != "InvalidCampaign")
                            {
                                CookieCampId = campArr[Count].ToString();

                                CookieBannerType = GetCookieBannerType(CookieCampId);
                                if (banner_id == CookieBannerType)
                                {
                                    this.insertCookieTagImpression(ComputerId, CookieCampId);
                                    break;
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
                    if (CookieCampId != string.Empty)
                    {
                        query = "SELECT  [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url],[ShowCallToAction]," + todaysConversions + " FROM [dbo].[campaigns]  where Add_style_formate='" + banner_id + campIdFilter + "' and campaign_id='" + CookieCampId + "' and (country_targeted like '%" + Request.QueryString["country_name"] + "%' OR country_targeted = '') AND (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + LimitConversionsInQuery + " ORDER BY NEWID() ";

                    }
                    else
                    {

                        query = "SELECT  [campaign_id],  [campaigin_name]  ,[title]  ,[discription],[url] ,[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url],[ShowCallToAction]," + todaysConversions + " FROM [dbo].[campaigns]  where Add_style_formate='" + banner_id + campIdFilter + "' and (country_targeted like '%" + Request.QueryString["country_name"] + "%' OR country_targeted = '') AND (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + LimitConversionsInQuery + " ORDER BY NEWID() ";

                        KeyWordBasedCampId = dlGetKeyWords.MatchedCampaigns(Request.QueryString["domain_name"], banner_id, Request.QueryString["country_name"], Request.QueryString["os_type"], noOfAds, maxConversions);
                        if (KeyWordBasedCampId != null && KeyWordBasedCampId.Tables[0].Rows.Count > 0)
                        {
                            ds = KeyWordBasedCampId;
                            dspage = KeyWordBasedCampId;
                            goto KeySucceded;
                        }
                        else
                        {
                            goto Keyfailed;
                        }
                    }
                }
            }
            catch
            {
                string CookieCampId = "";

                for (int Count = 0; Count < campArr.Length; Count++)
                {
                    CookieCampId = campArr[Count].ToString();
                    CookieBannerType = GetCookieBannerType(CookieCampId);
                    if (banner_id == CookieBannerType)
                    {
                        this.insertCookieTagImpression(ComputerId, CookieCampId);
                        break;
                    }
                    else
                        continue;
                }

                if (CookieCampId != string.Empty)
                    query = "SELECT  [campaign_id],[campaigin_name],[title],[discription],[url],[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url],[ShowCallToAction]," + todaysConversions + " FROM [dbo].[campaigns]  where Add_style_formate='" + banner_id + campIdFilter + "' and campaign_id='" + Request.QueryString["CookieCampId"].ToString() + "' and country_targeted like '%" + Request.QueryString["country_name"] + "%' AND (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + LimitConversionsInQuery + " ORDER BY NEWID() ";
                else
                    query = "SELECT  [campaign_id],[campaigin_name],[title],[discription],[url],[call_to_action],[action],[device_and_action],[stars],[cost],[sponsers_adv],[country_targeted],[Add_style_formate],[date],[icon_img],[vedio_url],[ShowCallToAction]," + todaysConversions + " FROM [dbo].[campaigns]  where Add_style_formate='" + banner_id + campIdFilter + "' and country_targeted like '%" + Request.QueryString["country_name"] + "%' AND (select status from dbo.campain_details where campain_id=campaigns.campaign_id)='Running' AND " + LimitConversionsInQuery + " ORDER BY NEWID() ";
            }
            #endregion

            #region Keywords Response section
        Keyfailed:
            #region Optional Query Part
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter(query, con);
            ds.Clear();
            adp.Fill(ds);
            con.Close();
            dspage = ds;
            #endregion
        KeySucceded:
            
        if (ds.Tables[0].Rows.Count > 0)
            {
                string os_ = ds.Tables[0].Rows[0].ItemArray[7].ToString();
                string _ClientSystemOs = Request.QueryString["os_type"];
                int response_os = 0;
                string[] strArr0 = os_.Split(',');
                for (int count_os = 0; count_os <= strArr0.Length - 1; count_os++)
                {
                    try
                    {
                        string os = strArr0[count_os].ToString();
                        if (os == _ClientSystemOs)
                        {
                            response_os++;
                        }
                    }
                    catch
                    {
                    }
                }
                if (response_os == 0)
                {
                    if (banner_id == "Banner 5" || banner_id == "Banner 1")
                        goto Keyfailed;
                    else
                        goto backToStart;
                }
            #endregion
                Session.Add("dspage", dspage);
                #region Add Session Details
                Session.Add("bnrID", banner_id.ToString());
                Session.Add("UserWebsite", Request.QueryString["domain_name"].ToString());
                Session.Add("affID", Request.QueryString["affiliate_id"].ToString());
                Session.Add("domName", Request.QueryString["domain_name"].ToString());
                Session.Add("OsType", Request.QueryString["os_type"].ToString());
                Session.Add("CountryName", Request.QueryString["Country"].ToString());
                #endregion


                if (ds.Tables[0].Rows.Count > 0)
                {
                    campign_id = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                    data_campain_id.InnerText = campign_id;
                    data_bannerId.InnerText = Request.QueryString["banner_id"].ToString();
                    data_domain_name.InnerText = Request.QueryString["domain_name"].ToString();
                    data_affiliatedId.InnerText = Request.QueryString["affiliate_id"].ToString();
                    data_os_type.InnerText = Request.QueryString["os_type"].ToString();
                    data_country_name.InnerText = Request.QueryString["country_name"].ToString();
                    //campign_id = "Ap1017012726092";

                    #region assembling Sponsered / Adv
                    string sponsered_or_adv = ds.Tables[0].Rows[0].ItemArray[10].ToString();
                    if (sponsered_or_adv == "Sponsored" || sponsered_or_adv == "sponsored")
                    {
                        //sponsore_banner2.InnerHtml = "Sponsored <span href=\"#\" class=\"fa fa-info-circle\" data-toggle=\"popover\" title=\"Message\" data-html=\"true\" data-placement=\"right\" data-content=\"<a href='http://google.com' target='_blank' >Click here to opt out</a>\"></span>";
                        sponsore_banner2.InnerHtml = "Sponsored";

                        sponsers_banner4.InnerHtml = "Sponsored <span href=\"#\" class=\"fa fa-info-circle\" data-toggle=\"popover\" title=\"Message\" data-html=\"true\" data-placement=\"left\" data-content=\"<a href='http://google.com' target='_blank' >Click here to opt out</a>\"></span>";
                        sponserese_banner_5.InnerHtml = "Sponsored <span href=\"#\" class=\"fa fa-info-circle\" data-toggle=\"popover\" title=\"Message\" data-html=\"true\" data-placement=\"left\" data-content=\"<a href='http://google.com' target='_blank' >Click here to opt out</a>\"></span>";
                        sponserese_banner6.InnerHtml = "Sponsored <span href=\"#\" class=\"fa fa-info-circle\" data-toggle=\"popover\" title=\"Message\" data-html=\"true\" data-placement=\"left\" data-content=\"<a href='http://google.com' target='_blank' >Click here to opt out</a>\"></span>";
                    }
                    else if (sponsered_or_adv == "adv")
                    {
                        //sponsore_banner2.InnerHtml = "Adv <span href=\"#\" class=\"fa fa-info-circle\" data-toggle=\"popover\" title=\"Message\" data-html=\"true\" data-placement=\"right\" data-content=\"<a href='http://google.com' target='_blank' >Click here to opt out</a>\"></span>";
                        sponsore_banner2.InnerHtml = "Adv";
                        //sponsore_banner3.InnerHtml = "Adv";
                        sponsers_banner4.InnerHtml = "Adv <span href=\"#\" class=\"fa fa-info-circle\" data-toggle=\"popover\" title=\"Message\" data-html=\"true\" data-placement=\"left\" data-content=\"<a href='http://google.com' target='_blank' >Click here to opt out</a>\"></span>";
                        sponserese_banner_5.InnerHtml = "Adv <span href=\"#\" class=\"fa fa-info-circle\" data-toggle=\"popover\" title=\"Message\" data-html=\"true\" data-placement=\"left\" data-content=\"<a href='http://google.com' target='_blank' >Click here to opt out</a>\"></span>";
                        sponserese_banner6.InnerHtml = "Adv <span href=\"#\" class=\"fa fa-info-circle\" data-toggle=\"popover\" title=\"Message\" data-html=\"true\" data-placement=\"left\" data-content=\"<a href='http://google.com' target='_blank' >Click here to opt out</a>\"></span>";
                    }

                    #endregion

                    #region setting Up Banners Icons And Images
                    string banner_style = ds.Tables[0].Rows[0].ItemArray[12].ToString();
                    string file_name = "";
                    string main_banner_img_string = ds.Tables[0].Rows[0].ItemArray[6].ToString();
                    if (main_banner_img_string != "")
                    {
                        string[] strArr = main_banner_img_string.Split('/');
                        file_name = strArr[2].ToString();
                    }
                    string icon_img_file_name = ds.Tables[0].Rows[0].ItemArray[14].ToString();
                    string file_name_icon = "";
                    if (icon_img_file_name != "")
                    {
                        string[] str2 = icon_img_file_name.Split('/');
                        file_name_icon = str2[2].ToString();
                    }

                    #endregion

                    #region assembling banner 2

                    icon_img_banner2.Src = "http://camp.earthinfralanddevelopers.co.in/Campaign_Images/" + file_name_icon;
                    title_banner2.InnerText = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                    if (banner_id == "Banner 2")
                    {
                        if (Convert.ToBoolean(ds.Tables[0].Rows[0]["ShowCallToAction"]) == false)
                        {
                            action_button_banner2.Style.Add("display", "none");
                            DivRateBanner2.Style.Add("display", "none");
                        }
                    }

                    //install_link_banner2.Text = ds.Tables[0].Rows[0].ItemArray[5].ToString();
                    camp_id_banner2.InnerText = campign_id;
                    //icon_img_banner2.Src = "http://camp.earthinfralanddevelopers.co.in/Campaign_Images/" + file_name;
                    icon_img_banner2.Src = RezizeImage(65, 65, domain, file_name);
                    rate_img_1_banner2.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    rate_img_2_banner2.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    rate_img_3_banner2.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    rate_img_4_banner2.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    rate_img_5_banner2.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";

                    #endregion

                    #region assembling banner 3
                    title_banner3.InnerText = ds.Tables[0].Rows[0].ItemArray[2].ToString();

                    //mini_title_banner3.InnerText = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                    discription_banner3.InnerHtml = System.Net.WebUtility.HtmlDecode(dspage.Tables[0].Rows[0].ItemArray[3].ToString().Replace("&nbsp;", " "));
                    camp_id_banner3.InnerText = campign_id; 
                    //image_banner_3.Src = "http://camp.earthinfralanddevelopers.co.in/Campaign_Images/" + file_name;
                    if (Request.QueryString["width"] != null)
                    {
                        int imgWidth = Int32.Parse(Request.QueryString["width"]);
                        int imgHeight = (imgWidth * 138) / 347;
                        image_banner_3.Src = RezizeImage(imgWidth, imgHeight, domain, file_name);
                    }
                    else
                    {
                        image_banner_3.Src = domain + "Campaign_Images\\" + file_name;
                    }
                    //icon_img_banner3.Src = "http://camp.earthinfralanddevelopers.co.in/Campaign_Images/" + file_name_icon;
                    //star_img_1_banner3.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    //star_img_2_banner3.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    //star_img_3_banner3.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    //star_img_4_banner3.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    //star_img_5_banner3.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    #endregion

                    #region assembling banner 4

                    //camp_id_banner4.InnerText = campign_id;
                    #endregion

                    #region assembling banner 5 (formly banner 6)
                    // title_banner_6.InnerText = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                    hdnfBanner2Code.Value = campign_id;

                    if (banner_id == "Banner 5")
                    {
                        string banT = ds.Tables[0].Rows[0].ItemArray[26].ToString();
                        int bannerType = Convert.ToInt32(banT);
                        string playBtnClass = ds.Tables[0].Rows[0].ItemArray[27].ToString();
                        string osType = Request.QueryString["os_type"].ToString();
                        if (playBtnClass == "" || !(osType == "Windows" || osType == "Android")) { playButton.Attributes.Add("style", "display: none;"); }
                        else { playVideo.Attributes.Add("class", playBtnClass); }
                        if (bannerType == 1)
                        {
                            string panel1_img = ds.Tables[0].Rows[0].ItemArray[16].ToString();
                            string panel1_ImageName = string.Empty;
                            string panel1ImgURL = "";
                            if (panel1_img != "")
                            {
                                string[] panel1_img_Array = panel1_img.Split('/');
                                panel1_ImageName = panel1_img_Array[2].ToString().Trim();
                            }
                            if (System.IO.File.Exists((domain + "Campaign_Images\\" + panel1_ImageName.ToString())))
                            {
                                panel1ImgURL = RezizeImage(15000, 15000, domain, panel1_ImageName);
                            }

                            string panel2_1_img = ds.Tables[0].Rows[0].ItemArray[17].ToString();
                            string panel2_1_ImageName = string.Empty;
                            string panel2_1ImgURL = "";
                            if (panel2_1_img != "")
                            {
                                string[] panel2_1_img_Array = panel2_1_img.Split('/');
                                panel2_1_ImageName = panel2_1_img_Array[2].ToString().Trim();
                            }
                            if (System.IO.File.Exists((domain + "Campaign_Images\\" + panel2_1_ImageName.ToString())))
                            {
                                panel2_1ImgURL = RezizeImage(15000, 15000, domain, panel2_1_ImageName);
                            }

                            string panel2_2_img = ds.Tables[0].Rows[0].ItemArray[18].ToString();
                            string panel2_2_ImageName = string.Empty;
                            string panel2_2ImgURL = "";
                            if (panel2_2_img != "")
                            {
                                string[] panel2_2_img_Array = panel2_2_img.Split('/');
                                panel2_2_ImageName = panel2_2_img_Array[2].ToString().Trim();
                            }
                            if (System.IO.File.Exists((domain + "Campaign_Images\\" + panel2_2_ImageName.ToString())))
                            {
                                panel2_2ImgURL = RezizeImage(15000, 15000, domain, panel2_2_ImageName);
                            }

                            videoBanner1.Visible = true;
                            videoBanner2.Visible = false;
                            panel1.Attributes.Add("style", "background-image:url('" + panel1ImgURL + "')");
                            string panel1Animation = ds.Tables[0].Rows[0].ItemArray[21].ToString();
                            if (panel1Animation.Contains(","))
                            {
                                string[] p1 = panel1Animation.Split(',');
                                panel1.Attributes.Add("class", "animated");
                                panel1.Attributes.Add("data-animation", p1[1]);
                                panel1.Attributes.Add("data-delay", p1[0]);
                            }
                            else
                            {
                                panel1.Attributes.Add("class", "animated");
                                panel1.Attributes.Add("data-animation", panel1Animation);
                                panel1.Attributes.Add("data-delay", "0");
                            }
                            
                            panel2_1.Attributes.Add("style", "background-image:url('" + panel2_1ImgURL + "')");
                            string panel21Animation = ds.Tables[0].Rows[0].ItemArray[22].ToString();
                            if (panel21Animation.Contains(","))
                            {
                                string[] p1 = panel21Animation.Split(',');
                                panel2_1.Attributes.Add("class", "animated");
                                panel2_1.Attributes.Add("data-animation", p1[1]);
                                panel2_1.Attributes.Add("data-delay", p1[0]);
                            }
                            else
                            {
                                panel2_1.Attributes.Add("class", "animated");
                                panel2_1.Attributes.Add("data-animation", panel21Animation);
                                panel2_1.Attributes.Add("data-delay", "0");
                            }

                            panel2_2.Attributes.Add("style", "background-image:url('" + panel2_2ImgURL + "')");
                            string panel22Animation = ds.Tables[0].Rows[0].ItemArray[23].ToString();
                            if (panel22Animation.Contains(","))
                            {
                                string[] p1 = panel22Animation.Split(',');
                                panel2_2.Attributes.Add("class", "animated");
                                panel2_2.Attributes.Add("data-animation", p1[1]);
                                panel2_2.Attributes.Add("data-delay", p1[0]);
                            }
                            else
                            {
                                panel2_2.Attributes.Add("class", "animated" + panel22Animation);
                                panel2_2.Attributes.Add("data-animation", panel22Animation);
                                panel2_2.Attributes.Add("data-delay", "0");
                            }
                            //panel2_2.Attributes.Add("class", "animated " + ds.Tables[0].Rows[0].ItemArray[23].ToString());
                        }
                        else if (bannerType == 2)
                        {
                            string panel3_img = ds.Tables[0].Rows[0].ItemArray[19].ToString();
                            string panel3_ImageName = string.Empty;
                            string panel3ImgURL = "";
                            if (panel3_img != "")
                            {
                                string[] panel3_img_Array = panel3_img.Split('/');
                                panel3_ImageName = panel3_img_Array[2].ToString().Trim();
                            }
                            if (System.IO.File.Exists((domain + "Campaign_Images\\" + panel3_ImageName.ToString())))
                            {
                                panel3ImgURL = RezizeImage(15000, 15000, domain, panel3_ImageName);
                            }
                            string panel4_img = ds.Tables[0].Rows[0].ItemArray[20].ToString();
                            string panel4_ImageName = string.Empty;
                            string panel4ImgURL = "";
                            if (panel4_img != "")
                            {
                                string[] panel4_img_Array = panel4_img.Split('/');
                                panel4_ImageName = panel4_img_Array[2].ToString().Trim();
                            }
                            if (System.IO.File.Exists((domain + "Campaign_Images\\" + panel4_ImageName.ToString())))
                            {
                                panel4ImgURL = RezizeImage(15000, 15000, domain, panel4_ImageName);
                            }

                            videoBanner1.Visible = false;
                            videoBanner2.Visible = true;
                            panel3.Attributes.Add("style", "background-image:url('" + panel3ImgURL + "')");
                            string panel3Animation = ds.Tables[0].Rows[0].ItemArray[24].ToString();
                            if (panel3Animation.Contains(","))
                            {
                                string[] p1 = panel3Animation.Split(',');
                                panel3.Attributes.Add("class", "animated");
                                panel3.Attributes.Add("data-animation", p1[1]);
                                panel3.Attributes.Add("data-delay", p1[0]);
                            }
                            else
                            {
                                panel3.Attributes.Add("class", "animated");
                                panel3.Attributes.Add("data-animation", panel3Animation);
                                panel3.Attributes.Add("data-delay", "0");
                            }
                            //panel3.Attributes.Add("class", "animated " + ds.Tables[0].Rows[0].ItemArray[24].ToString());

                            panel4.Attributes.Add("style", "background-image:url('" + panel4ImgURL + "')");
                            string panel4Animation = ds.Tables[0].Rows[0].ItemArray[25].ToString();
                            if (panel4Animation.Contains(","))
                            {
                                string[] p1 = panel4Animation.Split(',');
                                panel4.Attributes.Add("class", "animated");
                                panel3.Attributes.Add("data-animation", p1[1]);
                                panel4.Attributes.Add("data-delay", p1[0]);
                            }
                            else
                            {
                                panel4.Attributes.Add("class", "animated");
                                panel3.Attributes.Add("data-animation", panel4Animation);
                                panel4.Attributes.Add("data-delay", "0");
                            }
                            //panel4.Attributes.Add("class", "animated " + ds.Tables[0].Rows[0].ItemArray[25].ToString());
                        }
                        else
                        {
                            videoBanner1.Visible = false;
                            videoBanner2.Visible = false;
                        }
                    }
                    //star_img_1_banner6.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    //star_img_2_banner6.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    //star_img_3_banner6.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    //star_img_4_banner6.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    //star_img_5_banner6.Src = "http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png";
                    //icon_img_banner_6.Src = "http://camp.earthinfralanddevelopers.co.in/Campaign_Images/" + file_name_icon;
                    #endregion

                    HiddenViewCount.Value = campign_id.ToString() + ";" + Request.QueryString["affiliate_id"].ToString() + ";" + Request.QueryString["domain_name"].ToString() + ";" + _ClientSystemOs.ToString();// +";" + Request.QueryString["Website"].ToString();
                    return campign_id;
                }
                else
                    return "";
            }
            else
                return null;
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    public string RezizeImage(int maxWidth, int maxHeight, string domain, string imgName)
    {
        try
        {
            System.Drawing.Image img = System.Drawing.Image.FromFile((domain + "Campaign_Images\\" + imgName.ToString()));
            string imageUrl = "";
            if (img.Height < maxHeight && img.Width < maxWidth) imageUrl = domain + "Campaign_Images\\" + imgName;
            else
            {
                using (img)
                {
                    Double xRatio = (double)img.Width / maxWidth;
                    Double yRatio = (double)img.Height / maxHeight;
                    Double ratio = Math.Max(xRatio, yRatio);
                    int nnx = (int)Math.Floor(img.Width / ratio);
                    int nny = (int)Math.Floor(img.Height / ratio);
                    Bitmap target = new Bitmap(nnx, nny);
                    Graphics g = Graphics.FromImage(target);
                    g.SmoothingMode = SmoothingMode.HighQuality;
                    g.CompositingQuality = CompositingQuality.HighQuality;
                    g.InterpolationMode = InterpolationMode.High;
                    Rectangle rect = new Rectangle(0, 0, nnx, nny);
                    g.DrawImage(img, rect, 0, 0, img.Width, img.Height, GraphicsUnit.Pixel);

                    //Bitmap cpy = new Bitmap(nnx, nny, PixelFormat.Format32bppArgb);
                    //using (Graphics gr = Graphics.FromImage(cpy))
                    //{
                    //    gr.Clear(Color.Transparent);

                    //    gr.InterpolationMode = InterpolationMode.HighQualityBicubic;

                    //    gr.DrawImage(img,
                    //        new Rectangle(0, 0, nnx, nny),
                    //        new Rectangle(0, 0, img.Width, img.Height),
                    //        GraphicsUnit.Pixel);
                    //}

                    target.Save((domain + "Campaign_Images\\image_catche\\" + imgName));
                    imageUrl = domain + "Campaign_Images\\image_catche\\" + imgName;

                }
            }
            using (System.Drawing.Image image = System.Drawing.Image.FromFile((imageUrl)))
            {
                using (MemoryStream m = new MemoryStream())
                {
                    image.Save(m, image.RawFormat);
                    byte[] imageBytes = m.ToArray();

                    // Convert byte[] to Base64 String
                    string base64String = Convert.ToBase64String(imageBytes);
                    return "data:image/png;base64, " + base64String;
                }
            }
        }
        catch (Exception ex) { return ""; }
    }

    private string ReadCookies()
    {
        try
        {
            string ComputerId = string.Empty;
            System.Collections.ArrayList colCookies = new System.Collections.ArrayList();
            for (int i = 0; i < Request.Cookies.Count; i++)
                colCookies.Add(Request.Cookies[i]);
            string[] Arr;

            foreach (var item in colCookies)
            {
                HttpCookie c1 = item as HttpCookie;
                if (c1.Name == "UniqueIdentification")
                    ComputerId = c1.Value;
            }
            return ComputerId;
        }
        catch
        {
            return "";

        }
    }
    private string[] RaedCookieCampaignList(string ComputerId)
    {

        //string ArrcampList=
        return null;

        //try
        //{

        //    con.Open();
        //    SqlDataAdapter adp = new SqlDataAdapter("select AdTagValue , AdtagName,  DATEDIFF(day,getdate(),expireydate) as 'daysRemain'  from dbo.tblCookieTags where uniqueComputerId='" + ComputerId + "' and DATEDIFF(day,getdate(),expireydate)>0", con);
        //    DataSet ds = new DataSet();
        //    adp.Fill(ds);
        //    con.Close();
        //    string[] CampaignArr = new string[100];
        //    if (ds.Tables[0].Rows.Count != 0)
        //    {
        //        for (int count = 0; count < ds.Tables[0].Rows.Count; count++)
        //        {
        //            string[] RowArr;
        //            RowArr = (ds.Tables[0].Rows[count]["AdTagValue"].ToString()).Split(',');
        //            if (dlValidateTags.isValidCamp(ComputerId, RowArr[1], ds.Tables[0].Rows[count]["AdtagName"].ToString()))
        //            {
        //                CampaignArr[count] = RowArr[1];
        //            }
        //            else
        //            {
        //                CampaignArr[count] = "InvalidCampaign";
        //            }

        //        }
        //    }
        //    return CampaignArr;
        //}
        //catch
        //{
        //    return null;
        //}
    }
    private void insertCookieTagImpression(string ComputerId, string CampaignOnLoad)
    {
        try
        {
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
    private void load_data_banner()
    {
        try
        {
            string s1 = string.Empty;
            btnBanner1Click.Style.Add("background-color", "white");
            if (Request.QueryString["banner_id"] == "Banner 1" || Request.QueryString["banner_id"] == "Banner 4")
                s1 = load_ad_copy();
            else
                s1 = randomcampid.InnerHtml.ToString();


            if (s1 != null)
            {
                string bg_color = Request.QueryString["bg_color"];
                string colorDescription = Request.QueryString["bg_color"];
                string button_color = Request.QueryString["button_color"];
                string banner_id = Request.QueryString["banner_id"];
                string showCallToAction = Request.QueryString["ShowCallToAct"];
                con.Open();
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [dbo].[campaigns] where campaign_id='" + s1 + "'", con);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                con.Close();
                string sessionId = sid.Value.ToString();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string banner_style = ds.Tables[0].Rows[0].ItemArray[12].ToString();
                    if (banner_style == "Banner 1")
                    {
                        pnlbanner1.Visible = true;
                        banner2.Visible = false;
                        banner3.Visible = false;
                        banner4.Visible = false;
                        banner5.Visible = false;
                        banner6.Visible = false;
                        if (bg_color != "no color")
                            if (button_color != "no color ")
                            {

                            }
                    }
                    else if (banner_style == "Banner 2")
                    {


                        banner2.Visible = true;
                        banner3.Visible = false;
                        banner4.Visible = false;
                        banner5.Visible = false;
                        banner6.Visible = false;
                        pnlbanner1.Visible = false;
                        if (bg_color != "No")
                            banner2.Style.Add("background-color", "#" + bg_color);
                        if (button_color != "No")
                        {
                            action_button_banner2.Style["background-color"] = "#" + button_color.ToString() + "";
                            action_button_banner2.Style["border-color"] = "#" + Request.QueryString["Banner2BorderColor"].ToString() + "";
                            Span1.Style.Add("color", "#" + Request.QueryString["banner2TextColor"].ToString());
                        }
                        IconAnchorTag_Banner2.HRef = ds.Tables[0].Rows[0].ItemArray[4].ToString() + sessionId;
                        LinkButtonAnchorTag_Banner2.HRef = ds.Tables[0].Rows[0].ItemArray[4].ToString() + sessionId;
                        //LinkButtonAnchorTag_Banner2.Visible = false;
                        TitleBanner2Anchor.HRef = ds.Tables[0].Rows[0].ItemArray[4].ToString() + sessionId;
                        //   A1.HRef = ds.Tables[0].Rows[0].ItemArray[4].ToString() + Session["sid"].ToString().Trim();
                    }
                    else if (banner_style == "Banner 3")
                    {
                        banner2.Visible = false;
                        banner3.Visible = true;
                        banner4.Visible = false;
                        banner5.Visible = false;
                        banner6.Visible = false;
                        pnlbanner1.Visible = false;
                        if (bg_color != "No")
                        {
                            banner3.Style.Add("background-color", "#" + bg_color);
                            camp_id_banner3.Style.Add("color", "#" + bg_color); os_allowed_banner3.Style.Add("color", "#" + bg_color); sites_allow_banner3.Style.Add("color", "#" + bg_color);

                        }

                        if (showCallToAction == "Show")
                        {
                            LinkButtonAnchorTag_Banner3.Visible = true;
                            action_button_banner3.Visible = true;
                            install_link_banner3.Visible = true;
                            if (button_color != "No")
                            {
                                action_button_banner3.Style["background-color"] = "#" + button_color.ToString() + "";
                                action_button_banner3.Style["border-color"] = "#" + Request.QueryString["Banner2BorderColor"].ToString() + "";
                                Span3.Style.Add("color", "#" + Request.QueryString["banner2TextColor"].ToString());
                            }
                            LinkButtonAnchorTag_Banner3.HRef = ds.Tables[0].Rows[0].ItemArray[4].ToString() + "?sid=" + sessionId;
                        }
                        else {
                            LinkButtonAnchorTag_Banner3.Visible = false;
                            action_button_banner3.Visible = false;
                            install_link_banner3.Visible = false;
                        }

                        banner3_icon_anchor_tag.HRef = ds.Tables[0].Rows[0].ItemArray[4].ToString() + "?sid=" + sessionId;
                        A1.HRef = ds.Tables[0].Rows[0].ItemArray[4].ToString() + "?sid=" + sessionId;
                        A2.HRef = ds.Tables[0].Rows[0].ItemArray[4].ToString() + "?sid=" + sessionId;

                        if (Request.QueryString["showImage"].ToString() == "Show")
                        {
                            image_banner_3.Style.Add("display", "block");
                        }
                        else
                        {
                            image_banner_3.Style.Add("display", "none");
                        }

                    }
                    else if (banner_style == "Banner 4")
                    {
                        banner2.Visible = false;
                        banner3.Visible = false;
                        banner4.Visible = true;
                        banner5.Visible = false;
                        banner6.Visible = false;
                        pnlbanner1.Visible = false;
                        if (bg_color != "No")
                            banner4.Style.Add("background-color", "#" + bg_color);
                    }

                    else if (banner_style == "Banner 5")
                    {
                        //banner1.Visible = false;
                        banner2.Visible = false;
                        banner3.Visible = false;
                        banner4.Visible = false;
                        banner5.Visible = false;
                        banner6.Visible = true;
                        pnlbanner1.Visible = false;

                        string strVideoUrl = ds.Tables[0].Rows[0]["vedio_url"].ToString();
                        string strPoster = string.Empty;
                        if (Request.QueryString["os_type"].ToString() == "Apple")
                        {
                            strPoster = ds.Tables[0].Rows[0]["PosterWithPlay"].ToString();
                        }
                        else
                        {
                            strPoster = ds.Tables[0].Rows[0]["action"].ToString();
                        }
                        if (strPoster != "")
                        {
                            string[] imgArray = strPoster.Split('/');
                            strPoster = imgArray[2].ToString().Trim();
                        }

                        string strUrl = ds.Tables[0].Rows[0]["url"].ToString();
                        string strIcon = "";
                        if (ds.Tables[0].Rows[0]["icon_img"].ToString() != "")
                        {
                            string[] imgArray2 = ds.Tables[0].Rows[0]["icon_img"].ToString().Split('/');
                            strIcon = imgArray2[2].ToString().Trim();
                        }

                        if (sessionId != "")
                        {
                            strUrl = strUrl + sessionId;
                        }
                        StringBuilder Sbuild = new StringBuilder();
                        Sbuild.Append("<video id = 'videoPlayer' class='iframe_video_2' ");

                        int imgWidth = int.Parse(Request.QueryString["width"].ToString()) - 40;
                        int imgHeight = (int)((imgWidth * 450) / 800);

                        string posterImage = RezizeImage(15000, 15000, domain, strPoster);
                        Sbuild.Append("poster = '" + posterImage + "'>");

                        Sbuild.Append("<source src ='" + strVideoUrl.ToString().Trim() + "' type='video/mp4' >Your browser does not support the video tag.");
                        Sbuild.Append("</video>");
                        LitralVideo.Text = Sbuild.ToString();


                        string PosterBg = RezizeImage(15000, 15000, domain, strIcon.ToString().Trim());
                        afterOverlay.Attributes.Add("data-bg", PosterBg);

                        afterOverlay.Attributes.Add("href", ds.Tables[0].Rows[0].ItemArray[4].ToString() + sessionId);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Warning", "VideoEvent();", true);
                    }

                    title_banner2.Style.Add("color", "#" + Request.QueryString["TitleColor"].ToString());
                    title_banner3.Style.Add("color", "#" + Request.QueryString["TitleColor"].ToString());
                    title_banner_5.Style.Add("color", "#" + Request.QueryString["TitleColor"].ToString());
                    // title_banner_6.Style.Add("color", "#" + Request.QueryString["TitleColor"].ToString());
                    discription_banner_5.Style.Add("color", "#" + Request.QueryString["DescriptionColor"].ToString());
                    discription_banner3.Style.Add("color", "#" + Request.QueryString["DescriptionColor"].ToString());

                    int a = Convert.ToInt32(ds.Tables[0].Rows[0].ItemArray[8]);
                    banener_visible_check(s1);
                    string strBannerName = string.Empty;
                    if (banner2.Visible == true)
                        strBannerName = banner2.ID.ToString();
                    else if (banner3.Visible == true)
                        strBannerName = banner3.ID.ToString();
                    else if (banner4.Visible == true)
                        strBannerName = banner4.ID.ToString();
                    else if (banner5.Visible == true)
                        strBannerName = banner5.ID.ToString();
                    else if (banner6.Visible == true)
                        strBannerName = banner6.ID.ToString();
                    if (Request.QueryString["View"] != null)
                    {   
                        int viewState = int.Parse(Request.QueryString["View"].ToString().Trim());
                        string affiliate_id = Request.QueryString["affiliate_id"];
                        string domain_name = Request.QueryString["domain_name"];
                        string os_type = Request.QueryString["os_type"];
                        string country = Request.QueryString["country_name"];
                        string state = Request.QueryString["state_name"];
                        string city = Request.QueryString["city_name"];
                        string ISP = Request.QueryString["isp"];
                        string lon = Request.QueryString["lon"];
                        string lat = Request.QueryString["lat"];
                        if (viewState == 1)
                        {
                            if (banner_id == "Banner 1" || banner_id == "Banner 4")
                            {
                                for (int countLoop = 0; countLoop < int.Parse(Request.QueryString["NoOfBanner1"].ToString().Trim()); countLoop++)
                                {
                                    increase_view_of_ad(dspage.Tables[0].Rows[countLoop].ItemArray[0].ToString(), banner_id, sessionId);
                                }
                            }
                            else
                            {
                                increase_view_of_ad(s1, banner_id, sessionId);
                            }
                            storeRequestLocation(s1, affiliate_id, domain_name, os_type, country, state, city, ISP, lon, lat);
                        }
                        else
                        {
                            if (viewState != 0)
                            {
                                string event_type = "";
                                if (banner_id == "Banner 5")
                                    event_type = "Impression";
                                else
                                    event_type = "View";
                                if (banner_id == "Banner 1" || banner_id == "Banner 4")
                                {
                                    for (int countLoop = 0; countLoop < int.Parse(Request.QueryString["NoOfBanner1"].ToString().Trim()); countLoop++)
                                    {
                                        IncreaseAdRequest(dspage.Tables[0].Rows[countLoop].ItemArray[0].ToString(), affiliate_id, domain_name, event_type, os_type, country, sessionId);
                                    }
                                }
                                else
                                {
                                    IncreaseAdRequest(s1, affiliate_id, domain_name, event_type, os_type, country, sessionId);
                                }
                                storeRequestLocation(s1, affiliate_id, domain_name, os_type, country, state, city, ISP, lon, lat);
                            }
                        }
                    }

                }
            }
            else
            {
                banner2.Visible = false;
                banner3.Visible = false;
                banner4.Visible = false;
                banner5.Visible = false;
                banner6.Visible = false;
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error Found:" + ex.Message.ToString() + "')</script>");
        }
    }
    protected void Banner_Click(object sender, EventArgs e)
    {

        // LinkButton LnkBtn = (LinkButton)sender;
        //  string RedirectUrl = LnkBtn.Attributes["PostBackUrl"];
        string affiliate_id = "N/A";
        string domain_name = "N/A";
        string Website = "N/A";
        try
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Warning", "VideoEvent();", true);
            string campaign_id = "";
            if (banner2.Visible == true)
                campaign_id = camp_id_banner2.InnerText;
            else if (banner3.Visible == true)
                campaign_id = camp_id_banner3.InnerText;
            else if (banner4.Visible == true)
                campaign_id = camp_id_banner4.Value;
            else if (banner5.Visible == true)
                campaign_id = camp_id_banner5.InnerText;
            else if (banner6.Visible == true)
                campaign_id = hdnfBanner2Code.Value;
            if (Request.QueryString["Website"] != null)
                Website = Request.QueryString["Website"];
            affiliate_id = Request.QueryString["affiliate_id"];
            domain_name = Request.QueryString["domain_name"];
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * from campain_details where campain_id='" + campaign_id + "'", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)// cheking that  campaign id is valid or not
            {
                //if campaign exist for the the transmitted id from client ad end... than look about the ad description in 'campain_details_Affiliate_wise' table that campaign ,affiliate and website are  matching or not
                con.Open();
                SqlDataAdapter adp2 = new SqlDataAdapter("select * from campain_details_Affiliate_wise where campain_id='" + campaign_id + "' and affiliate_id='" + affiliate_id + "' and Website='" + domain_name + "'", con);
                DataSet ds2 = new DataSet();
                adp2.Fill(ds2);
                con.Close();
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    string check_running_mode = ds2.Tables[0].Rows[0].ItemArray[6].ToString();

                    if (check_running_mode == "Running")//checking that the ad is in running mode or not
                    {
                        //now increasing the view for affiliate table as well
                        //start
                        int get_total_clicks = Convert.ToInt32(ds2.Tables[0].Rows[0].ItemArray[3]);

                        get_total_clicks = get_total_clicks + 1;  //increasing total view by 1
                        decimal Revenue = 0;
                        SqlDataAdapter adp1 = new SqlDataAdapter("select cost from campaigns where campaign_id='" + campaign_id + "' ", con);
                        DataSet ds1 = new DataSet();
                        adp1.Fill(ds1);
                        con.Close();
                        if (ds1.Tables[0].Rows.Count > 0)
                        {
                            string s1 = ds1.Tables[0].Rows[0].ItemArray[0].ToString();
                            if (s1 != "")
                            {
                                decimal d1 = Convert.ToDecimal(s1);
                                Revenue = Convert.ToDecimal(get_total_clicks) * d1;
                            }
                        }

                        //updaing view for campaign.....
                        con.Open();
                        SqlCommand cmd = new SqlCommand("update campain_details_Affiliate_wise set total_clicks=" + Convert.ToInt32(get_total_clicks) + ",total_conversions=" + Convert.ToInt32(get_total_clicks) + " , total_revenu='" + Revenue + "', last_modification_date=CURRENT_TIMESTAMP where campain_id='" + campaign_id + "' and affiliate_id='" + affiliate_id + "' and Website='" + domain_name + "' ");
                        cmd.Connection = con;
                        int a = cmd.ExecuteNonQuery();
                        con.Close();
                        string event_type1 = "Click";
                        //maintain_report(string camp_id, string affiliate_id, string domain_name, string event_name,string current_clicks,string current_conversions,string current_revenue)
                        maintain_report(campaign_id, affiliate_id, domain_name, event_type1, get_total_clicks, get_total_clicks, Revenue);
                    }
                }

                //now increasing the view in main view click table for admin ...
                //start
                string running_status = ds.Tables[0].Rows[0].ItemArray[5].ToString();
                if (running_status == "Running")
                {
                    int get_total_clicks = Convert.ToInt32(ds.Tables[0].Rows[0].ItemArray[2]);

                    get_total_clicks = get_total_clicks + 1;  //increasing total view by 1
                    //total_conversion
                    decimal conversion = 0;
                    SqlDataAdapter adp1 = new SqlDataAdapter("select cost from campaigns where campaign_id='" + campaign_id + "' ", con);
                    DataSet ds1 = new DataSet();
                    adp1.Fill(ds1);
                    con.Close();
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        string s1 = ds1.Tables[0].Rows[0].ItemArray[0].ToString();
                        if (s1 != "")
                        {
                            decimal d1 = Convert.ToDecimal(s1);
                            conversion = Convert.ToDecimal(get_total_clicks) * d1;

                        }
                    }
                    //updaing clicks and conversions for campaign....
                    con.Open();
                    string updateQuery = "update campain_details set total_clicks=" + Convert.ToInt32(get_total_clicks) + " , total_conversions=" + Convert.ToInt32(get_total_clicks) + ", total_revenu='" + conversion + "', last_modification_date=current_timestamp where campain_id='" + campaign_id + "'";

                    SqlCommand cmd = new SqlCommand(updateQuery);
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    cmd.Cancel();

                    string checkClicksCountQuery = "SELECT count(AffiliateId) FROM getConversion as gCon JOIN view_click_maintain_on_daily_base as clicks ON gCon.Clickid = clicks.ClickId WHERE gCon.campaignId = '" + campaign_id.ToString() + "' AND [date]=CAST(GETDATE() AS DATE)";
                    SqlCommand chkClick = new SqlCommand(checkClicksCountQuery);
                    chkClick.Connection = con;
                    SqlDataReader reader = chkClick.ExecuteReader();
                    reader.Read();
                    int TodaysConversions = reader.GetInt32(0);
                    reader.Close();
                    if (!(TodaysConversions >= maxConversions)) {
                        cmd.Cancel();
                        string str = "insert into getConversion values('" + affiliate_id.ToString().Trim() + "','" + campaign_id.ToString() + "','" + domain_name + "','" + sid.Value.ToString() + "',0,'',NULL,1)";
                        cmd = new SqlCommand(str.ToString().Trim());
                        cmd.Connection = con;
                        cmd.ExecuteNonQuery();
                    }

                    //string affiliate_id = Request.QueryString["affiliate_id"];   SCFIDDQC3QU2
                    con.Close();
                    string eve_type = "Click";
                    maintain_report_admin(campaign_id, eve_type, get_total_clicks, get_total_clicks, conversion);

                }
                //end
                //well ... now calling the function of maintain the daily base report for view.   function is right below of the current  function
                //start
                string event_type = "Click";
                maintain_per_view(campaign_id, affiliate_id, domain_name, event_type, Session["OsType"].ToString(), Session["CountryName"].ToString(), sid.Value.ToString());//this function will return nothing
                //if (Request.QueryString["banner_id"] == "Banner 5")
                //{
                //    event_type = "View";
                //    IncreaseViewVideo(campaign_id, affiliate_id, domain_name, event_type, Session["OsType"].ToString(), Session["CountryName"].ToString(), Session["sid"].ToString());
                //}
                //end 
                //now redirection on the call on action
                con.Open();
                SqlDataAdapter adp21 = new SqlDataAdapter("select url from campaigns  where campaign_id='" + campaign_id + "' ", con);
                DataSet ds21 = new DataSet();
                adp21.Fill(ds21);
                con.Close();
                if (ds21.Tables[0].Rows.Count > 0)
                {
                    if (sid.Value.ToString() != "")
                    {
                        string call_on_action = ds21.Tables[0].Rows[0].ItemArray[0].ToString();
                    }
                }
            }
            else
            {
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message.ToString() + "')</script>");
        }
        finally
        {
            string banner_id = Request.QueryString["banner_id"];

            if (banner_id == "Banner 5")
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Warning", "VideoEvent();", true);
            Response.Redirect(Request.RawUrl);
        }
    }


    [System.Web.Services.WebMethod(EnableSession = true)]
    //public static string callBanner1Click(string campID)
    //{
    //    Campaign_Ad_Panel_View c1 = new Campaign_Ad_Panel_View();
    //    string banner_id = HttpContext.Current.Session["bnrID"].ToString();
    //    //string sid = HttpContext.Current.Session["sid"].ToString();
    //    string sid = HttpContext.Current.Session["sid"].ToString();
    //    HttpContext.Current.Session["sid"] = RandomString(24);
    //    string Website = HttpContext.Current.Session["UserWebsite"].ToString();
    //    string affiliate_id = HttpContext.Current.Session["affID"].ToString();
    //    string domain_name = HttpContext.Current.Session["domName"].ToString();
    //    string OsType = HttpContext.Current.Session["OsType"].ToString();
    //    string CountryName = HttpContext.Current.Session["CountryName"].ToString();
    //    DataSet dspage = HttpContext.Current.Session["dspage"] as DataSet;
    //    c1.clicklbanner1(campID, Website, affiliate_id, domain_name, banner_id, OsType, CountryName, sid, dspage);
    //    return "success";
    //}
    private void clicklbanner1(string campID, string webSite, string affiliateId, string domainName, string bannerId, string OsType, string CountryName, string sid, DataSet dspage)
    {

        string affiliate_id = "N/A";
        string domain_name = "N/A";
        string Website = "N/A";
        try
        {
            string CurrentClickId = sid;
            Session["sid"] = RandomString(24);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Warning", "VideoEvent();", true);
            string campaign_id = "";
            campaign_id = campID.ToString().Trim();
            if (webSite != null)
                Website = webSite.ToString();
            affiliate_id = affiliateId.ToString();
            domain_name = domainName;
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * from campain_details where campain_id='" + campaign_id + "'", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)// cheking that  campaign id is valid or not
            {
                //if campaign exist for the the transmitted id from client ad end... than look about the ad description in 'campain_details_Affiliate_wise' table that campaign ,affiliate and website are  matching or not
                con.Open();
                SqlDataAdapter adp2 = new SqlDataAdapter("select * from campain_details_Affiliate_wise where campain_id='" + campaign_id + "' and affiliate_id='" + affiliate_id + "' and Website='" + domain_name + "'", con);
                DataSet ds2 = new DataSet();
                adp2.Fill(ds2);
                con.Close();
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    string check_running_mode = ds2.Tables[0].Rows[0].ItemArray[6].ToString();

                    if (check_running_mode == "Running")//checking that the ad is in running mode or not
                    {
                        //now increasing the view for affiliate table as well
                        //start
                        if (check_running_mode == "Running")
                        {
                            int get_total_clicks = Convert.ToInt32(ds2.Tables[0].Rows[0].ItemArray[3]);

                            get_total_clicks = get_total_clicks + 1;  //increasing total view by 1
                            decimal Revenue = 0;
                            SqlDataAdapter adp1 = new SqlDataAdapter("select cost from campaigns where campaign_id='" + campaign_id + "' ", con);
                            DataSet ds1 = new DataSet();
                            adp1.Fill(ds1);
                            con.Close();
                            if (ds1.Tables[0].Rows.Count > 0)
                            {
                                string s1 = ds1.Tables[0].Rows[0].ItemArray[0].ToString();
                                if (s1 != "")
                                {
                                    decimal d1 = Convert.ToDecimal(s1);
                                    Revenue = Convert.ToDecimal(get_total_clicks) * d1;
                                }
                            }
                            //updaing view for campaign.....
                            con.Open();
                            SqlCommand cmd = new SqlCommand("update campain_details_Affiliate_wise set total_clicks=" + Convert.ToInt32(get_total_clicks) + ",total_conversions=" + Convert.ToInt32(get_total_clicks) + " , total_revenu='" + Revenue + "',last_modification_date=CURRENT_TIMESTAMP where campain_id='" + campaign_id + "' and affiliate_id='" + affiliate_id + "' and Website='" + domain_name + "' ");
                            cmd.Connection = con;
                            int a = cmd.ExecuteNonQuery();
                            con.Close();
                            string event_type1 = "Click";
                            //maintain_report(string camp_id, string affiliate_id, string domain_name, string event_name,string current_clicks,string current_conversions,string current_revenue)
                            maintain_report(campaign_id, affiliate_id, domain_name, event_type1, get_total_clicks, get_total_clicks, Revenue);
                        }
                    }
                }
                //now increasing the view in main view click table for admin ...
                //start
                string running_status = ds.Tables[0].Rows[0].ItemArray[5].ToString();


                if (running_status == "Running")
                {
                    int get_total_clicks = Convert.ToInt32(ds.Tables[0].Rows[0].ItemArray[2]);

                    get_total_clicks = get_total_clicks + 1;  //increasing total view by 1
                    //total_conversion
                    decimal conversion = 0;
                    SqlDataAdapter adp1 = new SqlDataAdapter("select cost from campaigns where campaign_id='" + campaign_id + "' ", con);
                    DataSet ds1 = new DataSet();
                    adp1.Fill(ds1);
                    con.Close();

                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        string s1 = ds1.Tables[0].Rows[0].ItemArray[0].ToString();
                        if (s1 != "")
                        {
                            decimal d1 = Convert.ToDecimal(s1);
                            conversion = Convert.ToDecimal(get_total_clicks) * d1;

                        }
                    }

                    //updaing clicks and conversions for campaign....
                    con.Open();
                    string updateQuery = "update campain_details set total_clicks=" + Convert.ToInt32(get_total_clicks) + " , total_conversions=" + Convert.ToInt32(get_total_clicks) + ", total_revenu='" + conversion + "', last_modification_date=CURRENT_TIMESTAMP where campain_id='" + campaign_id + "'";
                    //string updateQuery = "update campain_details set total_clicks=" + Convert.ToInt32(get_total_clicks) + " , total_conversions=" + Convert.ToInt32(get_total_clicks) + ", total_revenu='" + conversion + "', last_modification_date=CURRENT_TIMESTAMP where campain_id='" + campaign_id + "' AND affiliate_id='" + affiliateId + "'";

                    SqlCommand cmd = new SqlCommand(updateQuery);
                    //SqlCommand cmd = new SqlCommand("update campain_details set total_clicks=" + Convert.ToInt32(get_total_clicks) + " , total_conversions=" + Convert.ToInt32(get_total_clicks) + ", total_revenu='" + conversion + "' where campain_id='" + campaign_id + "' ");
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    cmd.Cancel();
                    //string affiliate_id = Request.QueryString["affiliate_id"];

                    //string str = "insert into getConversion values('" + affiliate_id.ToString().Trim() + "','" + campaign_id.ToString() + "','" + Website + "','" + CurrentClickId + "',0,'',NULL,1)";


                    string checkClicksCountQuery = "SELECT count(AffiliateId) FROM getConversion as gCon JOIN view_click_maintain_on_daily_base as clicks ON gCon.Clickid = clicks.ClickId WHERE gCon.campaignId = '" + campaign_id.ToString() + "' AND [date]=CAST(GETDATE() AS DATE)";
                    SqlCommand chkClick = new SqlCommand(checkClicksCountQuery);
                    chkClick.Connection = con;
                    SqlDataReader reader = chkClick.ExecuteReader();
                    reader.Read();
                    int TodaysConversions = reader.GetInt32(0);
                    reader.Close();
                    if (!(TodaysConversions >= maxConversions))
                    {
                        cmd.Cancel();
                        string str = "insert into getConversion values('" + affiliate_id.ToString().Trim() + "','" + campaign_id.ToString() + "','" + domain_name + "','" + CurrentClickId + "',0,'',NULL,1)";
                        SqlCommand cmdINSERTcONVERSION = new SqlCommand(str.ToString().Trim());
                        cmdINSERTcONVERSION.Connection = con;
                        int InsertStatus = cmdINSERTcONVERSION.ExecuteNonQuery();
                    }

                    con.Close();
                    string eve_type = "Click";
                    maintain_report_admin(campaign_id, eve_type, get_total_clicks, get_total_clicks, conversion);

                }

                //end
                //well ... now calling the function of maintain the daily base report for view.   function is right below of the current  function
                //start
                string event_type = "Click";
                maintain_per_view(campaign_id, affiliate_id, domain_name, event_type, OsType, CountryName, CurrentClickId);//this function will return nothing
                //end
            }
            else
            {
            }

        }
        catch (Exception ex)
        {
            string banner_id = bannerId.ToString();

            if (banner_id == "Banner 5")
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Warning", "VideoEvent();", true);
        }
        //if (bannerId == "Banner 1")
        //    RanderColasualbanner1(sid.ToString(), bannerId.ToString(), dspage);

    }
    //protected void banner1_click(object sender, EventArgs e)
    //{
    //    string affiliate_id = "N/A";
    //    string domain_name = "N/A";
    //    string Website = "N/A";
    //    try
    //    {
    //        Button theButton = (Button)sender;
    //        string ID = theButton.Attributes["ID"];
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Warning", "VideoEvent();", true);
    //        string campaign_id = "";
    //        if (banner3.Visible == true)
    //        {
    //            campaign_id = camp_id_banner3.InnerText;
    //        }
    //        else if (banner4.Visible == true)
    //        {
    //            campaign_id = camp_id_banner4.Value;
    //        }
    //        else if (banner5.Visible == true)
    //        {
    //            campaign_id = camp_id_banner5.InnerText;
    //        }
    //        else if (banner6.Visible == true)
    //        {
    //            campaign_id = hdnfBanner2Code.Value;
    //        }
    //        if (Request.QueryString["Website"] != null)
    //        {
    //            Website = Request.QueryString["Website"];
    //        }
    //        affiliate_id = Request.QueryString["affiliate_id"];
    //        domain_name = Request.QueryString["domain_name"];

    //        con.Open();
    //        SqlDataAdapter adp = new SqlDataAdapter("select * from campain_details where campain_id='" + campaign_id + "'", con);
    //        DataSet ds = new DataSet();
    //        adp.Fill(ds);
    //        con.Close();
    //        if (ds.Tables[0].Rows.Count > 0)
    //        {
    //            con.Open();
    //            SqlDataAdapter adp2 = new SqlDataAdapter("select * from campain_details_Affiliate_wise where campain_id='" + campaign_id + "' and affiliate_id='" + affiliate_id + "' and Website='" + domain_name + "'", con);
    //            DataSet ds2 = new DataSet();
    //            adp2.Fill(ds2);
    //            con.Close();
    //            if (ds2.Tables[0].Rows.Count > 0)
    //            {
    //                string check_running_mode = ds2.Tables[0].Rows[0].ItemArray[6].ToString();

    //                if (check_running_mode == "Running")
    //                {
    //                    if (check_running_mode == "Running")
    //                    {
    //                        int get_total_clicks = Convert.ToInt32(ds2.Tables[0].Rows[0].ItemArray[3]);

    //                        get_total_clicks = get_total_clicks + 1;
    //                        decimal Revenue = 0;
    //                        SqlDataAdapter adp1 = new SqlDataAdapter("select cost from campaigns where campaign_id='" + campaign_id + "' ", con);
    //                        DataSet ds1 = new DataSet();
    //                        adp1.Fill(ds1);
    //                        con.Close();
    //                        if (ds1.Tables[0].Rows.Count > 0)
    //                        {
    //                            string s1 = ds1.Tables[0].Rows[0].ItemArray[0].ToString();
    //                            if (s1 != "")
    //                            {
    //                                decimal d1 = Convert.ToDecimal(s1);
    //                                Revenue = Convert.ToDecimal(get_total_clicks) * d1;
    //                            }
    //                        }
    //                        con.Open();
    //                        SqlCommand cmd = new SqlCommand("update campain_details_Affiliate_wise set total_clicks=" + Convert.ToInt32(get_total_clicks) + ",total_conversions=" + Convert.ToInt32(get_total_clicks) + " , total_revenu='" + Revenue + "' where campain_id='" + campaign_id + "' and affiliate_id='" + affiliate_id + "' and Website='" + domain_name + "' ");
    //                        cmd.Connection = con;
    //                        int a = cmd.ExecuteNonQuery();
    //                        con.Close();
    //                        string event_type1 = "Click";
    //                        maintain_report(campaign_id, affiliate_id, domain_name, event_type1, get_total_clicks, get_total_clicks, Revenue);
    //                    }
    //                }
    //            }
    //            string running_status = ds.Tables[0].Rows[0].ItemArray[5].ToString();


    //            if (running_status == "Running")
    //            {
    //                int get_total_clicks = Convert.ToInt32(ds.Tables[0].Rows[0].ItemArray[2]);

    //                get_total_clicks = get_total_clicks + 1;
    //                decimal conversion = 0;
    //                SqlDataAdapter adp1 = new SqlDataAdapter("select cost from campaigns where campaign_id='" + campaign_id + "' ", con);
    //                DataSet ds1 = new DataSet();
    //                adp1.Fill(ds1);
    //                con.Close();

    //                if (ds1.Tables[0].Rows.Count > 0)
    //                {
    //                    string s1 = ds1.Tables[0].Rows[0].ItemArray[0].ToString();
    //                    if (s1 != "")
    //                    {
    //                        decimal d1 = Convert.ToDecimal(s1);
    //                        conversion = Convert.ToDecimal(get_total_clicks) * d1;

    //                    }
    //                }
    //                con.Open();
    //                SqlCommand cmd = new SqlCommand("update campain_details set total_clicks=" + Convert.ToInt32(get_total_clicks) + " , total_conversions=" + Convert.ToInt32(get_total_clicks) + ", total_revenu='" + conversion + "' where campain_id='" + campaign_id + "' ");
    //                cmd.Connection = con;
    //                cmd.ExecuteNonQuery();
    //                cmd.Cancel();
    //                string sessionID = sid.Value.ToString();
    //                string str = "insert into getConversion values('" + affiliate_id.ToString().Trim() + "','" + campaign_id.ToString() + "','" + Website + "','" + sessionID + "',0,'')";
    //                SqlCommand cmdGetConversion = new SqlCommand(str.ToString().Trim());
    //                cmdGetConversion.Connection = con;
    //                int InsertStatus = cmdGetConversion.ExecuteNonQuery();
    //                con.Close();
    //                string eve_type = "Click";
    //                maintain_report_admin(campaign_id, eve_type, get_total_clicks, get_total_clicks, conversion);

    //            }
    //            string event_type = "Click";
    //            maintain_per_view(campaign_id, affiliate_id, domain_name, event_type, Request.QueryString["os_type"].ToString(), Request.QueryString["Country"].ToString(), sid.Value.ToString());//this function will return nothing

    //            con.Open();
    //            SqlDataAdapter adp21 = new SqlDataAdapter("select url from campaigns  where campaign_id='" + campaign_id + "' ", con);
    //            DataSet ds21 = new DataSet();
    //            adp21.Fill(ds21);
    //            con.Close();
    //            if (ds21.Tables[0].Rows.Count > 0)
    //            {
    //                if (sid.Value.ToString() != "")
    //                {
    //                    string call_on_action = ds21.Tables[0].Rows[0].ItemArray[0].ToString();

    //                }
    //            }
    //        }
    //        else
    //        {

    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write("<script>alert('" + ex.Message.ToString() + "')</script>");
    //    }
    //    finally
    //    {
    //        string banner_id = Request.QueryString["banner_id"];
    //        if (banner_id == "Banner 5")
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Warning", "VideoEvent();", true);
    //    }
    //}
    protected void maintain_report(string camp_id, string affiliate_id, string domain_name, string event_name, int current_clicks, int current_conversions, decimal current_revenue)
    {
        try
        {

            //maitaining report_table 

            con.Open();
            string imp = "0";
            SqlCommand cmd_report = new SqlCommand("insert into report_manage_table_for_affilaite(campain_id,affiliate_id,Website,event_found,even_type,event_date,current_clicks,current_conversion,current_revenue)  values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "'," + Convert.ToInt32(current_clicks) + "," + Convert.ToInt32(current_conversions) + ", " + current_revenue + ")");
            cmd_report.Connection = con;
            int result = cmd_report.ExecuteNonQuery();
            con.Close();

        }
        catch
        {
        }
    }
    protected void maintain_report_admin(string camp_id, string event_name, int current_clicks, int current_conversions, decimal current_revenue, int intCurrentImp = 0)
    {
        try
        {
            //maitaining report_table 

            con.Open();
            string query = "insert into report_manage_table  values('" + camp_id + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "'," + Convert.ToInt32(current_clicks) + "," + Convert.ToInt32(current_conversions) + ", '" + Convert.ToDecimal(current_revenue) + "','" + intCurrentImp.ToString() + "')";
            SqlCommand cmd_report = new SqlCommand(query);
            cmd_report.Connection = con;
            cmd_report.ExecuteNonQuery();
            con.Close();

        }
        catch
        {

        }
    }
    protected void maintain_per_view(string camp_id, string affiliate_id, string domain_name, string event_name, string OsType, string CountryName, string sid)
    {
        try
        {
            try
            {

                if (con.State == ConnectionState.Closed)
                    con.Open();

                #region Get Campaign Cost
                SqlDataAdapter adp = new SqlDataAdapter("select cost from campaigns where campaign_id='" + camp_id + "'", con);
                DataTable dtGetCost = new DataTable();
                adp.Fill(dtGetCost);
                #endregion

                string sqlQuery = string.Empty;
                if (event_name == "View" || event_name == "Impression")
                {
                    sqlQuery = "insert into view_click_maintain_on_daily_base (campain_id,affiliate_id,Website,event_found,even_type,event_date,date,OS_type,CountryName) values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "','" + System.DateTime.Now + "','" + OsType + "','" + CountryName + "');";
                    if (event_name == "View")
                    {
                        sqlQuery += "UPDATE campain_details SET total_views=total_views+1 WHERE campain_id='" + camp_id + "'";
                    }
                }
                else if (event_name == "Click")
                {
                    sqlQuery = "insert into view_click_maintain_on_daily_base (campain_id,affiliate_id,Website,event_found,even_type,event_date,date,OS_type,CountryName,ClickId,clickCost) values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "','" + System.DateTime.Now + "','" + OsType + "','" + CountryName + "','" + sid + "','" + dtGetCost.Rows[0]["cost"].ToString() + "');";
                    //sqlQuery += "UPDATE campain_details SET total_views=total_views+1 WHERE campain_id='" + camp_id + "'";
                }
                else if (event_name == "AdRequest")
                {
                    sqlQuery = "insert into view_click_maintain_on_daily_base (campain_id,affiliate_id,Website,event_found,even_type,event_date,date,OS_type,CountryName) values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "','" + System.DateTime.Now + "','" + OsType + "','" + CountryName + "')";
                }

                SqlCommand cmd = new SqlCommand(sqlQuery);
                cmd.Connection = con;
                int confirmation = cmd.ExecuteNonQuery();
                con.Close();


            }
            catch
            {

            }
        }
        catch
        {

        }
    }
    private void IncreaseViewVideo(string camp_id, string affiliate_id, string domain_name, string event_name, string OsType, string CountryName, string sid)
    {
        try
        {
            try
            {

                if (con.State == ConnectionState.Closed)
                    con.Open();



                string sqlQuery = string.Empty;
                if (event_name == "View")
                {
                    sqlQuery = "insert into view_click_maintain_on_daily_base (campain_id,affiliate_id,Website,event_found,even_type,event_date,date,OS_type,CountryName) values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', '" + event_name + "', '" + System.DateTime.Now + "','" + System.DateTime.Now + "','" + OsType + "','" + CountryName + "');";
                    sqlQuery += "UPDATE campain_details SET total_views=total_views+1 WHERE campain_id='" + camp_id + "'";
                }
                SqlCommand cmd = new SqlCommand(sqlQuery);
                cmd.Connection = con;
                int confirmation = cmd.ExecuteNonQuery();
                con.Close();


            }
            catch
            {

            }
        }
        catch
        {

        }
    }


    protected void storeRequestLocation(string camp_id, string affiliate_id, string domain_name, string os_type, string country, string state, string city, string ISP, string lon, string lat) {
        try
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string sqlQuery = string.Empty;
            sqlQuery = "insert into add_request_origions (affiliate_id,campaign_id,country_name,state_name,city_name,OS_type,domain_name,ISP,longitude,latitude,date_time) values(@affiliate_id,@campaign_id,@country_name,@state_name,@city_name,@OS_type,@domain_name,@ISP,@longitude,@latitude,GETDATE())";
            SqlCommand cmd = new SqlCommand(sqlQuery, con);
            cmd.Parameters.AddWithValue("@affiliate_id",affiliate_id);
            cmd.Parameters.AddWithValue("@campaign_id",camp_id);
            cmd.Parameters.AddWithValue("@country_name", country);
            cmd.Parameters.AddWithValue("@state_name",state);
            cmd.Parameters.AddWithValue("@city_name",city);
            cmd.Parameters.AddWithValue("@OS_type",os_type);
            cmd.Parameters.AddWithValue("@domain_name",domain_name);
            cmd.Parameters.AddWithValue("@ISP",ISP);
            cmd.Parameters.AddWithValue("@longitude",lon);
            cmd.Parameters.AddWithValue("@latitude",lat);
            cmd.CommandType = CommandType.Text;
            int confirmation = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch
        {
        }
    }


    protected void IncreaseAdRequest(string camp_id, string affiliate_id, string domain_name, string event_name, string OsType, string CountryName, string sid)
    {
        try
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                    con.Open();
                string sqlQuery = string.Empty;
                sqlQuery = "insert into view_click_maintain_on_daily_base (campain_id,affiliate_id,Website,event_found,even_type,event_date,date,OS_type,CountryName) values('" + camp_id + "', '" + affiliate_id + "', '" + domain_name + "','Yes', 'AdRequest', '" + System.DateTime.Now + "','" + System.DateTime.Now + "','" + OsType + "','" + CountryName + "')";

                SqlCommand cmd = new SqlCommand(sqlQuery);
                cmd.Connection = con;
                int confirmation = cmd.ExecuteNonQuery();
                con.Close();
            }
            catch
            {

            }
        }
        catch
        {

        }
    }
    protected void increase_view_of_ad(string campaign_id, string banner_id, string sid)
    {
        try
        {
            string affiliate_id = Request.QueryString["affiliate_id"];
            string domain_name = Request.QueryString["domain_name"];
            string event_type = "";
            if (banner_id == "Banner 5")
                event_type = "Impression";
            else
                event_type = "View";
            maintain_per_view(campaign_id, affiliate_id, domain_name, event_type, Request.QueryString["os_type"].ToString(), Request.QueryString["Country"].ToString(), sid);
            IncreaseAdRequest(campaign_id, affiliate_id, domain_name, event_type, Request.QueryString["os_type"].ToString(), Request.QueryString["Country"].ToString(), sid);

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message.ToString().Trim() + "')</script>");
        }
    }
    private string banener_visible_check(string S1)
    {
        try
        {
            string banner_id = Request.QueryString["banner_id"];
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM [dbo].[campaigns] where campaign_id='" + S1 + "' ", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                string banner_style = ds.Tables[0].Rows[0].ItemArray[12].ToString();
                decimal a = Convert.ToDecimal(ds.Tables[0].Rows[0].ItemArray[8]);
                if (banner2.Visible == true)
                {
                    if (a.ToString() == "0.00" || a.ToString() == "0")
                    {
                        rate_img_1_banner2.Visible = false;

                        rate_img_2_banner2.Visible = false;
                        rate_img_3_banner2.Visible = false;

                        rate_img_4_banner2.Visible = false;
                        rate_img_5_banner2.Visible = false;
                    }
                    if (a.ToString() == "1.00" || a.ToString() == "1")
                    {
                        rate_img_1_banner2.Src = "img/rating-100.png";

                        rate_img_2_banner2.Src = "img/star-empty.png";
                        rate_img_3_banner2.Src = "img/star-empty.png";

                        rate_img_4_banner2.Src = "img/star-empty.png";
                        rate_img_5_banner2.Src = "img/star-empty.png";
                    }
                    if (a.ToString() == "1.50" || a.ToString() == "1.5")
                    {
                        rate_img_1_banner2.Src = "img/rating-100.png";

                        rate_img_2_banner2.Src = "img/rating-50.png";
                        rate_img_3_banner2.Src = "img/star-empty.png";

                        rate_img_4_banner2.Src = "img/star-empty.png";
                        rate_img_5_banner2.Src = "img/star-empty.png";

                    }
                    else if (a.ToString() == "2.00" || a.ToString() == "2")
                    {
                        rate_img_1_banner2.Src = "img/rating-100.png";

                        rate_img_2_banner2.Src = "img/rating-100.png";
                        rate_img_3_banner2.Src = "img/star-empty.png";

                        rate_img_4_banner2.Src = "img/star-empty.png";
                        rate_img_5_banner2.Src = "img/star-empty.png";
                    }
                    else if (a.ToString() == "2.50" || a.ToString() == "2.5")
                    {
                        rate_img_1_banner2.Src = "img/rating-100.png";

                        rate_img_2_banner2.Src = "img/rating-100.png";
                        rate_img_3_banner2.Src = "img/rating-50.png";

                        rate_img_4_banner2.Src = "img/star-empty.png";
                        rate_img_5_banner2.Src = "img/star-empty.png";
                    }
                    else if (a.ToString() == "3.00" || a.ToString() == "3")
                    {
                        rate_img_1_banner2.Src = "img/rating-100.png";

                        rate_img_2_banner2.Src = "img/rating-100.png";
                        rate_img_3_banner2.Src = "img/rating-100.png";

                        rate_img_4_banner2.Src = "img/star-empty.png";
                        rate_img_5_banner2.Src = "img/star-empty.png";
                    }
                    else if (a.ToString() == "3.50" || a.ToString() == "3.5")
                    {
                        rate_img_1_banner2.Src = "img/rating-100.png";

                        rate_img_2_banner2.Src = "img/rating-100.png";
                        rate_img_3_banner2.Src = "img/rating-100.png";

                        rate_img_4_banner2.Src = "img/rating-50.png";
                        rate_img_5_banner2.Src = "img/star-empty.png";
                    }
                    else if (a.ToString() == "4.00" || a.ToString() == "4")
                    {
                        rate_img_1_banner2.Src = "img/rating-100.png";

                        rate_img_2_banner2.Src = "img/rating-100.png";
                        rate_img_3_banner2.Src = "img/rating-100.png";

                        rate_img_4_banner2.Src = "img/rating-100.png";
                        rate_img_5_banner2.Src = "img/star-empty.png";
                    }
                    else if (a.ToString() == "4.50" || a.ToString() == "4.5")
                    {
                        rate_img_1_banner2.Src = "img/rating-100.png";

                        rate_img_2_banner2.Src = "img/rating-100.png";
                        rate_img_3_banner2.Src = "img/rating-100.png";

                        rate_img_4_banner2.Src = "img/rating-100.png";
                        rate_img_5_banner2.Src = "img/rating-50.png";
                    }
                    else if (a.ToString() == "5.00" || a.ToString() == "5")
                    {
                        rate_img_1_banner2.Src = "img/rating-100.png";

                        rate_img_2_banner2.Src = "img/rating-100.png";
                        rate_img_3_banner2.Src = "img/rating-100.png";

                        rate_img_4_banner2.Src = "img/rating-100.png";
                        rate_img_5_banner2.Src = "img/rating-100.png";
                    }
                }


                return null;
            }
            return null;
        }
        catch
        {
            return null;
        }
    }
    protected void HiddenVideoCount_ValueChanged(object sender, EventArgs e)
    {

    }
    private void RanderColasualbanner1(string ClickId, string BannerId, DataSet dspage)
    {
        try
        {
            StringBuilder sbBanner1 = new StringBuilder();
            if (BannerId == "Banner 1")
            {
                sbBanner1.Append("<div class='Sponsored-3'  id='sponsore_banner1' >" + dspage.Tables[0].Rows[0].ItemArray[10].ToString() + "&nbsp;<span href=\"#\" class=\"fa fa-info-circle\" data-toggle=\"popover\" title=\"Message\" data-html=\"true\" data-placement=\"left\" data-content=\"<a href='http://google.com' target='_blank' >Click here to opt out</a>\"></span> </div>");

                sbBanner1.Append("<div id='owl-demo'>");

                try
                {
                    int AdToLoad = Convert.ToInt32(HttpContext.Current.Session["NoOfBanners"].ToString());
                    for (countLoop = 0; countLoop < AdToLoad; countLoop++)
                    {
                        string strDescription = System.Net.WebUtility.HtmlDecode(dspage.Tables[0].Rows[countLoop].ItemArray[3].ToString().Replace("&nbsp;", " "));
                        string functionPart = "onclick='call_banner1Function('" + dspage.Tables[0].Rows[countLoop].ItemArray[0].ToString() + "')'";
                        string IconImgFileName = dspage.Tables[0].Rows[countLoop].ItemArray[14].ToString();
                        if (IconImgFileName != "")
                        {
                            iconImgArray = IconImgFileName.Split('/');
                            iconImgImageName = iconImgArray[2].ToString().Trim();
                            iconURL = "";
                            if (System.IO.File.Exists((domain + "Campaign_Images\\" + iconImgImageName.ToString())))
                            {
                                iconURL = RezizeImage(65, 65, domain, iconImgImageName);
                            }

                        }
                        string MainImgFileName = dspage.Tables[0].Rows[countLoop].ItemArray[6].ToString();
                        if (MainImgFileName != "")
                        {
                            MainImgArray = MainImgFileName.Split('/');
                            MainImgImageName = MainImgArray[2].ToString().Trim();
                            MainImageURL = "";
                            if (System.IO.File.Exists((domain + "Campaign_Images\\" + MainImgImageName.ToString())))
                            {
                                MainImageURL = RezizeImage(322, 322, domain, MainImgImageName);
                            }
                            //MainImageURL = "http://camp.earthinfralanddevelopers.co.in/Campaign_Images/" + MainImgImageName.ToString();
                        }
                        sbBanner1.Append("<div  id='" + dspage.Tables[0].Rows[countLoop].ItemArray[0].ToString() + "' class='item pointer' style=' background-color : #" + HttpContext.Current.Session["AdbgColor"].ToString() + " ; border: thin solid # " + HttpContext.Current.Session["Banner2BorderColor"].ToString() + " ; '  onclick='clicked(this)'>");
                        sbBanner1.Append("<div id='banner1' class='card' runat='server' style='border: solid 3px #CCC4C4;'>");
                        sbBanner1.Append("<div class='card'    >");
                        sbBanner1.Append("<div class='title-container'>");
                        sbBanner1.Append(" <div class='col-xs-2 card-icon'>" + "<img src='" + iconURL + "' style='height: 50px; width: 50px;  margin-right: 5px; margin-top: 5px; margin-left: 5px;' runat='server' id='icon_img_banner1'   alt='banner-img' class='' />" + "</div>");
                        sbBanner1.Append("<div class='col-xs-10 wrapfont'>");
                        if (dspage.Tables[0].Rows[countLoop].ItemArray[8].ToString() == "0.00")
                            sbBanner1.Append("<a href='" + dspage.Tables[0].Rows[countLoop].ItemArray[4].ToString() + ClickId + "' runat='server' target='_parent' id='button_anchor_tag'  style='text-decoration: none; ' onclick='callBan1(this)'> <div class='title'  style='color:#" + HttpContext.Current.Session["TitleColor"].ToString() + ";padding-top: 20px;padding-left: 5px;'><span id='banner1Title' style='font-size: 15px;display: inline;'>" + dspage.Tables[0].Rows[countLoop].ItemArray[2].ToString() + "</span></div></a>");
                        else
                            sbBanner1.Append("<a href='" + dspage.Tables[0].Rows[countLoop].ItemArray[4].ToString() + ClickId + "' runat='server' target='_parent' id='button_anchor_tag' style='text-decoration: none;' onclick='callBan1(this)'><div class='title' style='color:#" + HttpContext.Current.Session["TitleColor"].ToString() + ";padding-top: 1px;padding-left: 5px;'><span id='banner1Title'  style='font-size: 15px;display: inline;'>" + dspage.Tables[0].Rows[countLoop].ItemArray[2].ToString() + "</span></div></a>");

                        sbBanner1.Append("<div class='Rating' style='padding-left: 5px;'>");
                        decimal rateCount = Convert.ToDecimal(dspage.Tables[0].Rows[countLoop].ItemArray[8].ToString());

                        #region StarRating rander
                        if ((rateCount.ToString()) == "0.00" || (rateCount.ToString()) == "0")
                        {

                        }
                        if ((rateCount.ToString()) == "1.00" || (rateCount.ToString()) == "1")
                        {
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                        }
                        else if ((rateCount.ToString()) == "1.50" || (rateCount.ToString()) == "1.5")
                        {
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating-50.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");

                        }
                        else if ((rateCount.ToString()) == "2.00" || (rateCount.ToString()) == "2")
                        {
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                        }
                        else if ((rateCount.ToString()) == "2.50" || (rateCount.ToString()) == "2.5")
                        {
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating-50.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                        }
                        else if ((rateCount.ToString()) == "3.00" || (rateCount.ToString()) == "3")
                        {
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                        }
                        else if ((rateCount.ToString()) == "3.50" || (rateCount.ToString()) == "3.5")
                        {
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating-50.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                        }
                        else if ((rateCount.ToString()) == "4.00" || (rateCount.ToString()) == "4")
                        {
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/star-empty.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                        }
                        else if ((rateCount.ToString()) == "4.50" || (rateCount.ToString()) == "4.5")
                        {
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating-50.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                        }
                        else if ((rateCount.ToString()) == "5.00" || (rateCount.ToString()) == "5")
                        {
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                            sbBanner1.Append("<img src='img/rating.png' runat='server' id='Img40' alt='banner-img' class='img-responsive' />");
                        }
                        #endregion

                        sbBanner1.Append("</div>");
                        sbBanner1.Append("</div>");
                        sbBanner1.Append("<div class='clearfix'></div>");
                        sbBanner1.Append("</div>");

                        sbBanner1.Append("<a href='" + dspage.Tables[0].Rows[countLoop].ItemArray[4].ToString() + ClickId + "' runat='server' target='_parent' id='button_anchor_tag'  style='text-decoration: none;' onclick='callBan1(this)'><div class='card-description' style='min-height: 115px; margin-left: 5px; color:#" + HttpContext.Current.Session["DescriptionColor"].ToString() + "'><div>");
                        sbBanner1.Append(strDescription);
                        sbBanner1.Append("</div></div></a>");
                        sbBanner1.Append("<div class='card-banner'>");
                        sbBanner1.Append("<img src='" + MainImageURL.ToString() + "' runat='server' id='banner_img_banner1' alt='banner-img'  class='img-responsive' style=' width:100%;'/>");
                        sbBanner1.Append(" </div>");
                        sbBanner1.Append("<div id='camp_id_banner1'  runat='server' style='font-size: 0pt'> " + dspage.Tables[0].Rows[countLoop].ItemArray[0].ToString() + " </div>");
                        sbBanner1.Append("<div id='camp_id_banner1' runat='server' style='font-size: 0pt'> </div>");
                        sbBanner1.Append("<div id='os_allowed_banner1' runat='server' style='font-size: 0pt'> </div>");
                        sbBanner1.Append("<div id='sites_allow_banner1' runat='server' style='font-size: 0pt'> </div>");
                        sbBanner1.Append("<a href='" + dspage.Tables[0].Rows[countLoop].ItemArray[4].ToString() + ClickId + "' runat='server' target='_parent' id='button_anchor_tag'  style='text-decoration: none;' onclick='callBan1(this)'> ");
                        sbBanner1.Append("<div class='install-btn' style=' background-color : #" + HttpContext.Current.Session["button_color"].ToString() + " ; border: thin solid # " + HttpContext.Current.Session["ButtonBorderColor"].ToString() + " ;' >");
                        sbBanner1.Append("<span id='install_link_banner1' style='text-transform: lowercase;' runat='server'>" + dspage.Tables[0].Rows[countLoop]["call_to_action"].ToString() + "</span>");
                        sbBanner1.Append("</div></a></div></div></div>");
                    }
                }
                catch (Exception sqe)
                {

                }
                sbBanner1.Append("</div>");

                if (HttpContext.Current != null)
                {
                    HtmlGenericControl divFinal = HttpContext.Current.Session["divFinal"] as HtmlGenericControl;
                    divFinal.InnerHtml = sbBanner1.ToString();
                }

            }

        }
        catch (Exception eqe)
        {

        }
    }
    private void PagePanelObj()
    {
        HtmlGenericControl divFinal = new HtmlGenericControl("div");
        divFinal.ID = "Banner1Ad";
        sliderBanner1.Controls.Add(divFinal);
        Session.Add("divFinal", divFinal);
    }
    protected void ClickBanner(object sender, EventArgs e)
    {
        HtmlGenericControl divFinal = new HtmlGenericControl("div");
        divFinal.ID = "Banner1Ad";
        sliderBanner1.Controls.Add(divFinal);
        Session.Add("divFinal", divFinal);
        string _sid = sid.Value.ToString();
        Campaign_Ad_Panel_View c1 = new Campaign_Ad_Panel_View();
        string banner_id = HttpContext.Current.Session["bnrID"].ToString();
        //string sid = HttpContext.Current.Session["sid"].ToString();
        HttpContext.Current.Session["sid"] = RandomString(24);//updating click id
        string Website = HttpContext.Current.Session["UserWebsite"].ToString();
        string affiliate_id = HttpContext.Current.Session["affID"].ToString();
        string domain_name = HttpContext.Current.Session["domName"].ToString();
        string OsType = HttpContext.Current.Session["OsType"].ToString();
        string CountryName = HttpContext.Current.Session["CountryName"].ToString();
        DataSet dspage = HttpContext.Current.Session["dspage"] as DataSet;
        //string camp_id = "";
        //if (banner_id == "Banner 1")
        //    camp_id = hdnfBanner1Code.Value;
        //else camp_id = hdnfBanner2Code.Value;
        string camp_id = banner_id == "Banner 1" ? hdnfBanner1Code.Value : hdnfBanner2Code.Value;
        c1.clicklbanner1(camp_id, Website, affiliate_id, domain_name, banner_id, OsType, CountryName, _sid, dspage);
        return;
    }
    private string GetCookieBannerType(string CookieBannerId)
    {
        try
        {
            con.Open();
            string query = "SELECT  [Add_style_formate]  FROM [dbo].[campaigns]  where campaign_id='" + CookieBannerId + "' and country_targeted like '%" + Request.QueryString["country_name"] + "%' ORDER BY NEWID() ";

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
    private void _AdsCookies()
    {
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter("select * from tbltagImperassions where serial=1", con);
            DataTable dt = new DataTable();
        }
        catch (Exception e)
        {
            // ScriptManager.Equals();
        }
    }
}