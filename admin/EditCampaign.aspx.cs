using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Web.UI.HtmlControls;

public partial class admin_create_new_campaign : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!(Request.QueryString["CampId"] == string.Empty || Request.QueryString["CampId"] == null))
            {
                Session.Add("updatable_camp_id", Request.QueryString["CampId"].ToString());
                this.load_data();
            }
            else if (HttpContext.Current.Session["updatable_camp_id"] == string.Empty || HttpContext.Current.Session["updatable_camp_id"] == null)
            {
                Response.Redirect("Start_stop_campaign.aspx");
            }
        }
    }
    [WebMethod]

    public static string submit_function(string camp_name, string title, string description, string camp_url, string vedio_url, string txt_call_to_action, string included_devicess, string adv_sponserce, string cost, string banner_id, string rate, string camp_icon_img, string main_banner_img, string country, string AllBanners, string campkeys, string titleBanner2, string titleBanner3, string titleBanner4, string ShowCallToAction, string TitleVideoBanner, string posterWithPlay, string Poster, string finalPoster, string bannerType, string imageA, string imageB, string imageC, string imageD, string imageE, string animationA, string animationB, string animationC, string animationD, string animationE, string MaxImpressions, string TypeOfAdTarget, string RangeSelected, string GenderSelected, string InterestCategoriesSelected, string CitySelected, string ISPSelected, string videoPlayBtn, string dailyCapping)
    {
        try
        {
            // RangeSelected, GenderSelected, InterestCategoriesSelected
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            //divFinal.InnerHtml = sbBanner1.ToString();
            string getAllBnners = AllBanners;
            string[] splitBanners = getAllBnners.Split(',');
            #region AddNew Campaign section
            for (int outorCount = 0; outorCount <= splitBanners.Length - 1;  outorCount++)
            {
                try
                {
                    con.Open();

                    #region setting Up Ad target

                    if (TypeOfAdTarget == "Keywords")
                    {
                        MaxImpressions = "0";
                        RangeSelected = "";
                        GenderSelected = "";
                        InterestCategoriesSelected = "";


                        //   string MaxImpressions, string TypeOfAdTarget, string RangeSelected, string GenderSelected, string InterestCategoriesSelected)
                    }
                    else if (TypeOfAdTarget == "Cookies")
                    {

                        RangeSelected = "";
                        GenderSelected = "";
                        InterestCategoriesSelected = "";
                        campkeys = "";
                    }
                    else if (TypeOfAdTarget == "AgeRange")
                    {
                        MaxImpressions = "0";

                        GenderSelected = "";
                        InterestCategoriesSelected = "";
                        campkeys = "";

                    }
                    else if (TypeOfAdTarget == "Gender")
                    {
                        MaxImpressions = "";
                        RangeSelected = "";

                        InterestCategoriesSelected = "";
                        campkeys = "";
                    }
                    else if (TypeOfAdTarget == "PublicInterest")
                    {
                        MaxImpressions = "0";
                        RangeSelected = "";
                        GenderSelected = "";

                        campkeys = "";
                    }


                    #endregion


                    string BannerID = splitBanners[outorCount].ToString();
                    //images
                    string imag = main_banner_img;
                    string imag2 = camp_icon_img;
                    //banner decide 
                    string banner_style = string.Empty;
                    string countries = string.Empty;
                    decimal rating = 0;
                    if (rate != string.Empty)
                        rating = Convert.ToDecimal(rate);
                    else
                        rating = 2;

                    string TitleName = string.Empty;
                    if (BannerID == "Banner 1")
                        TitleName = title.ToString();
                    else if (BannerID == "Banner 2")
                        TitleName = titleBanner2.ToString();
                    else if (BannerID == "Banner 3")
                        TitleName = titleBanner3.ToString();
                    else if (BannerID == "Banner 4")
                        TitleName = titleBanner4.ToString();
                    else if (BannerID == "Banner 5")
                    {
                        imag = Poster;
                        imag2 = finalPoster;
                        TitleName = TitleVideoBanner.ToString();
                    }
                    string htmlEncoded = WebUtility.HtmlEncode(description);
                    if (dailyCapping == "")
                    {
                        dailyCapping = "null";
                    }

                    string cmdText = "UPDATE campaigns SET campaigin_name = @campaigin_name, title = @title, discription = @discription, url = @url, call_to_action = @call_to_action, action = @action, device_and_action = @device_and_action, stars = @stars, cost = @cost, sponsers_adv = @sponsers_adv, country_targeted = @country_targeted, Add_style_formate = @Add_style_formate, date = @date, icon_img = @icon_img, vedio_url = @vedio_url, keywords = @keywords, ShowCallToAction = @ShowCallToAction, PosterWithPlay = @PosterWithPlay, MaxCookieImpressions = @MaxCookieImpressions, AgeRange = @AgeRange, AudienceInterest = @AudienceInterest, TargetedGender = @TargetedGender, TypeOfAdTarget = @TypeOfAdTarget, CityTargeted = @CityTargeted, ISPTargeted = @ISPTargeted, imageA = @imageA, imageB = @imageB, imageC = @imageC, imageD = @imageD, imageE = @imageE, animationA = @animationA, animationB = @animationB, animationC = @animationC, animationD = @animationD, animationE = @animationE, bannerType = @bannerType, videoPlayBtn = @videoPlayBtn, dailyCapping = " + dailyCapping + " WHERE campaign_id = @campaign_id";
                    cost = string.IsNullOrEmpty(cost.ToString()) ? "0" : cost;
                    int Count = 0;

                    SqlCommand cmd = new SqlCommand(cmdText, con);
                    cmd.Parameters.AddWithValue("@campaign_id", HttpContext.Current.Session["updatable_camp_id"].ToString());
                    cmd.Parameters.AddWithValue("@campaigin_name", camp_name);
                    cmd.Parameters.AddWithValue("@title", TitleName);
                    cmd.Parameters.AddWithValue("@discription", htmlEncoded);
                    cmd.Parameters.AddWithValue("@url", camp_url);
                    cmd.Parameters.AddWithValue("@call_to_action", txt_call_to_action);
                    cmd.Parameters.AddWithValue("@action", imag);
                    cmd.Parameters.AddWithValue("@device_and_action", included_devicess);
                    cmd.Parameters.AddWithValue("@stars", Convert.ToDecimal(rating.ToString()));
                    cmd.Parameters.AddWithValue("@cost", Convert.ToDecimal(cost));
                    cmd.Parameters.AddWithValue("@sponsers_adv", adv_sponserce);
                    cmd.Parameters.AddWithValue("@country_targeted", country);
                    cmd.Parameters.AddWithValue("@Add_style_formate", BannerID);
                    cmd.Parameters.AddWithValue("@date", System.DateTime.Now.ToString("dd-MMM-yyyy hh:mm:ss"));
                    cmd.Parameters.AddWithValue("@icon_img", imag2);
                    cmd.Parameters.AddWithValue("@vedio_url", vedio_url);
                    cmd.Parameters.AddWithValue("@keywords", campkeys);
                    cmd.Parameters.AddWithValue("@ShowCallToAction", ShowCallToAction);
                    cmd.Parameters.AddWithValue("@PosterWithPlay", posterWithPlay);
                    cmd.Parameters.AddWithValue("@MaxCookieImpressions", Convert.ToInt32(MaxImpressions));
                    cmd.Parameters.AddWithValue("@AgeRange", RangeSelected);
                    cmd.Parameters.AddWithValue("@AudienceInterest", InterestCategoriesSelected);
                    cmd.Parameters.AddWithValue("@TargetedGender", GenderSelected);
                    cmd.Parameters.AddWithValue("@TypeOfAdTarget", TypeOfAdTarget);
                    cmd.Parameters.AddWithValue("@CityTargeted", CitySelected);
                    cmd.Parameters.AddWithValue("@ISPTargeted", ISPSelected);
                    cmd.Parameters.AddWithValue("@imageA", imageA);
                    cmd.Parameters.AddWithValue("@imageB", imageB);
                    cmd.Parameters.AddWithValue("@imageC", imageC);
                    cmd.Parameters.AddWithValue("@imageD", imageD);
                    cmd.Parameters.AddWithValue("@imageE", imageE);
                    cmd.Parameters.AddWithValue("@animationA", animationA);
                    cmd.Parameters.AddWithValue("@animationB", animationB);
                    cmd.Parameters.AddWithValue("@animationC", animationC);
                    cmd.Parameters.AddWithValue("@animationD", animationD);
                    cmd.Parameters.AddWithValue("@animationE", animationE);
                    cmd.Parameters.AddWithValue("@bannerType", bannerType);
                    cmd.Parameters.AddWithValue("@videoPlayBtn", videoPlayBtn);
                    cmd.CommandType = CommandType.Text;
                    Count = cmd.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    return null;
                }
                finally {
                    con.Close();
                }
            }

            return "successfull";
            #endregion

        }
        catch
        {
            HtmlGenericControl spnMessage = HttpContext.Current.Session["spnMessage"] as HtmlGenericControl;
            spnMessage.InnerText = "Invalid Banner Image..";
            return "successfull";
        }
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        try
        {
            Session.RemoveAll();
            Session.Clear();
            Session.Abandon();
            Response.Redirect("LoginAdmin.aspx");
        }
        catch
        {
        }
    }

    #region Update Section

    protected void load_data()
    {
        try
        {
            string camp_id = Request.QueryString["CampId"].ToString();
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * from campaigns where campaign_id='" + camp_id + "'", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {

                txt_camp_name.Value = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                txt_camp_title.Value = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                txt_camp_url.Value = ds.Tables[0].Rows[0].ItemArray[4].ToString();
                vedio_url_link.Value = ds.Tables[0].Rows[0].ItemArray[15].ToString();
                txt_camp_call_To_Action.Value = ds.Tables[0].Rows[0].ItemArray[5].ToString();
                txtKeyWords.Value = ds.Tables[0].Rows[0]["keywords"].ToString();
                cost.Value = ds.Tables[0].Rows[0].ItemArray[9].ToString();
                banner_img_banner1.Src = ds.Tables[0].Rows[0].ItemArray[6].ToString();
                image_banner3.Src = ds.Tables[0].Rows[0].ItemArray[6].ToString();
                image_banner_4.Src = ds.Tables[0].Rows[0].ItemArray[6].ToString();
                PosterUploader_old.Value = ds.Tables[0].Rows[0].ItemArray[6].ToString();
                icon_img_banner1.Src = ds.Tables[0].Rows[0].ItemArray[14].ToString();
                icon_img_banner2.Src = ds.Tables[0].Rows[0].ItemArray[14].ToString();
                icon_img_banner3.Src = ds.Tables[0].Rows[0].ItemArray[14].ToString();
                icon_image_banner_5.Src = ds.Tables[0].Rows[0].ItemArray[14].ToString();
                backgroundImage_old.Value = ds.Tables[0].Rows[0].ItemArray[14].ToString();
                backgroundImage2_old.Value = ds.Tables[0].Rows[0].ItemArray[14].ToString();
                FileUpload1_old.Value = ds.Tables[0].Rows[0].ItemArray[6].ToString();
                FileUpload2_old.Value = ds.Tables[0].Rows[0].ItemArray[14].ToString();
                imageA_old.Value = ds.Tables[0].Rows[0].ItemArray[26].ToString();
                imageB_old.Value = ds.Tables[0].Rows[0].ItemArray[27].ToString();
                imageC_old.Value = ds.Tables[0].Rows[0].ItemArray[28].ToString();
                imageD_old.Value = ds.Tables[0].Rows[0].ItemArray[29].ToString();
                imageE_old.Value = ds.Tables[0].Rows[0].ItemArray[30].ToString();
                int videoBannerType = Convert.ToInt32(ds.Tables[0].Rows[0].ItemArray[36]);
                videoPlayer.Attributes.Add("poster", ds.Tables[0].Rows[0].ItemArray[6].ToString());
                videoButton.Value = ds.Tables[0].Rows[0].ItemArray[37].ToString();
                dailyCapping.Value = ds.Tables[0].Rows[0].ItemArray[38].ToString();
                s1.Attributes.Add("src", ds.Tables[0].Rows[0].ItemArray[15].ToString());
                if (videoBannerType == 1)
                {
                    bannerType1.Checked = true;
                    bannerbackground1.InnerHtml = "<img src='" + ds.Tables[0].Rows[0].ItemArray[14].ToString() + "' >";
                    bannerPart1.InnerHtml = "<img src='" + ds.Tables[0].Rows[0].ItemArray[26].ToString() + "' >";
                    bannerPart3.InnerHtml = "<img src='" + ds.Tables[0].Rows[0].ItemArray[27].ToString() + "' >";
                    bannerPart4.InnerHtml = "<img src='" + ds.Tables[0].Rows[0].ItemArray[28].ToString() + "' >";
                    bannerType1_2.Attributes.Add("style", "background-image: url('" + ds.Tables[0].Rows[0].ItemArray[14].ToString() + "');");
                    bannerPart1_2.Attributes.Add("style", "background-image: url('" + ds.Tables[0].Rows[0].ItemArray[26].ToString() + "');");
                    bannerPart1_2.Attributes.Add("class", "animated " + ds.Tables[0].Rows[0].ItemArray[31].ToString());
                    bannerPart3_2.Attributes.Add("style", "background-image: url('" + ds.Tables[0].Rows[0].ItemArray[27].ToString() + "');");
                    bannerPart3_2.Attributes.Add("class", "animated " + ds.Tables[0].Rows[0].ItemArray[32].ToString());
                    bannerPart4_2.Attributes.Add("style", "background-image: url('" + ds.Tables[0].Rows[0].ItemArray[28].ToString() + "');");
                    bannerPart4_2.Attributes.Add("class", "animated " + ds.Tables[0].Rows[0].ItemArray[33].ToString());
                    bannerTypeSelection.Attributes.Add("style", "display: none");
                    bannerStyle1.Attributes.Add("style", "display: block");
                    bannerStyle2.Attributes.Add("style", "display: none");
                    FinalAnimation1.Value = ds.Tables[0].Rows[0].ItemArray[31].ToString();
                    FinalAnimation2.Value = ds.Tables[0].Rows[0].ItemArray[32].ToString();
                    FinalAnimation3.Value = ds.Tables[0].Rows[0].ItemArray[33].ToString();
                }
                else if (videoBannerType == 2)
                {
                    bannerType2.Checked = true;
                    bannerbackground2.InnerHtml = "<img src='" + ds.Tables[0].Rows[0].ItemArray[14].ToString() + "' >";
                    bannerPart5.InnerHtml = "<img src='" + ds.Tables[0].Rows[0].ItemArray[29].ToString() + "' >";
                    bannerPart6.InnerHtml = "<img src='" + ds.Tables[0].Rows[0].ItemArray[30].ToString() + "' >";
                    bannerType2_2.Attributes.Add("style", "background-image: url('" + ds.Tables[0].Rows[0].ItemArray[14].ToString() + "');");
                    bannerPart5_2.Attributes.Add("style", "background-image: url('" + ds.Tables[0].Rows[0].ItemArray[29].ToString() + "');");
                    bannerPart5_2.Attributes.Add("class", "animated " + ds.Tables[0].Rows[0].ItemArray[34].ToString());
                    bannerPart6_2.Attributes.Add("style", "background-image: url('" + ds.Tables[0].Rows[0].ItemArray[30].ToString() + "');");
                    bannerPart6_2.Attributes.Add("class", "animated " + ds.Tables[0].Rows[0].ItemArray[35].ToString());
                    bannerTypeSelection.Attributes.Add("style", "display: none");
                    bannerStyle1.Attributes.Add("style", "display: none");
                    bannerStyle2.Attributes.Add("style", "display: block");
                    FinalAnimation4.Value = ds.Tables[0].Rows[0].ItemArray[34].ToString();
                    FinalAnimation5.Value = ds.Tables[0].Rows[0].ItemArray[35].ToString();
                }
                string sponserse_or_adv = ds.Tables[0].Rows[0].ItemArray[10].ToString();
                string[] arr = ds.Tables[0].Rows[0].ItemArray[11].ToString().Split(',');
                for (int k = 0; k < arr.Length; k++)
                {
                    ListItem li = sale_1.Items.FindByText(arr[k].ToString());
                    li.Selected = true;
                }
                //txt_included_devices.InnerText = ds.Tables[0].Rows[0].ItemArray[7].ToString();
                string included_devices = ds.Tables[0].Rows[0].ItemArray[7].ToString();
                string[] devices = included_devices.Split(',');
                for (int k = 0; k < devices.Length; k++)
                {
                    try
                    {
                        if (devices[k].ToString() == "Windows" || devices[k].ToString() == "Apple")
                        {
                            if (devices[k].ToString() == "Windows")
                            {
                                ListItem li = ddOs.Items.FindByText("Windows Mobile");
                                li.Selected = true;
                            }
                            else
                            {
                                ListItem li = ddOs.Items.FindByText("ios");
                                li.Selected = true;
                            }
                        }
                        else
                        {
                            ListItem li = ddOs.Items.FindByText(devices[k].ToString());
                            li.Selected = true;
                        }
                    }
                    catch(Exception sqe)
                    {
 
                    }
                }

                //for (int count = 0; count <= devices.Length - 1; count++)
                //{
                //    string device_name = devices[count].ToString();
                //    if (device_name == "Windows")
                //    {
                //        os_1.Checked = true;
                //    }
                //    else if (device_name == "Apple")
                //    {
                //        os2.Checked = true;
                //    }
                //    else if (device_name == "Blackberry")
                //    {
                //        os3.Checked = true;

                //    }
                //    else if (device_name == "ipad")
                //    {
                //        os4.Checked = true;
                //    }
                //    else if (device_name == "ipod")
                //    {
                //        os5.Checked = true;
                //    }
                //    else if (device_name == "Android")
                //    {
                //        os6.Checked = true;
                //    }
                //}
                //txt_included_devices.InnerText = ds.Tables[0].Rows[0].ItemArray[7].ToString();
                //HiddenField1.Value = ds.Tables[0].Rows[0].ItemArray[8].ToString();
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "rate_();", true);
                if (sponserse_or_adv == "adv")
                    adv.Checked = true;
                else if (sponserse_or_adv == "sponsored")
                    sponserse.Checked = true;
                string icon_img_file_name = ds.Tables[0].Rows[0].ItemArray[14].ToString();
                string file_name_icon = "";
                if (icon_img_file_name != "")
                {
                    string[] str2 = icon_img_file_name.Split('/');
                    file_name_icon = str2[2].ToString();
                    ViewState["icon_image_viewstate"] = file_name_icon;
                }

                string file_name = "";
                string main_banner_img_string = ds.Tables[0].Rows[0].ItemArray[6].ToString();
                if (main_banner_img_string != "")
                {
                    string[] strArr = main_banner_img_string.Split('/');
                    file_name = strArr[2].ToString();
                    ViewState["main_banner_image_viewstate"] = file_name;
                }

                load_ad_div(camp_id);

                string banner_style = ds.Tables[0].Rows[0].ItemArray[12].ToString();

                if (banner_style == "Banner 1")
                {
                    b1.Checked = true;
                    banner6.Style.Add("display", "none");
                    banner1.Style.Add("display", "block");
                    banner2.Style.Add("display", "none");
                    banner3.Style.Add("display", "none");
                    banner4.Style.Add("display", "none");
                    banner5.Style.Add("display", "none");

                }
                if (banner_style == "Banner 2")
                {

                    b2.Checked = true;
                    banner6.Style.Add("display", "none");
                    banner1.Style.Add("display", "none");
                    banner2.Style.Add("display", "block");
                    banner3.Style.Add("display", "none");
                    banner4.Style.Add("display", "none");
                    banner5.Style.Add("display", "none");
                }
                if (banner_style == "Banner 3")
                {
                    b3.Checked = true;
                    banner6.Style.Add("display", "none");
                    banner1.Style.Add("display", "none");
                    banner2.Style.Add("display", "none");
                    banner3.Style.Add("display", "none");
                    banner4.Style.Add("display", "block");
                    banner5.Style.Add("display", "none");
                }
                if (banner_style == "Banner 4")
                {
                    b4.Checked = true;
                    banner6.Style.Add("display", "none");
                    banner1.Style.Add("display", "none");
                    banner2.Style.Add("display", "none");
                    banner3.Style.Add("display", "none");
                    banner4.Style.Add("display", "none");
                    banner5.Style.Add("display", "block");
                }

                if (banner_style == "Banner 5")
                {

                    b5.Checked = true;
                    banner6.Style.Add("display", "block");
                    banner1.Style.Add("display", "none");
                    banner2.Style.Add("display", "none");
                    banner3.Style.Add("display", "none");
                    banner4.Style.Add("display", "none");
                    banner5.Style.Add("display", "none");
                }
                if (banner_style == "Banner 6")
                {
                    banner6.Style.Add("display", "none");
                    banner1.Style.Add("display", "none");
                    banner2.Style.Add("display", "none");
                    banner3.Style.Add("display", "none");
                    banner4.Style.Add("display", "none");
                    banner5.Style.Add("display", "none");
                   

                }
            }
        }
        catch
        {
        }
    }
    protected void load_ad_div(string camp_id)
    {
        try
        {
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * from campaigns where campaign_id='" + camp_id + "' ", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            string icon_image = ViewState["icon_image_viewstate"].ToString();
            string main_banner_image = ViewState["main_banner_image_viewstate"].ToString();
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (banner1.Visible == true)
                {
                    title_banner1.InnerText = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                    
                    icon_img_banner1.Src = "http://camp.earthinfralanddevelopers.co.in/Campaign_Images/" + icon_image;
                    discription_banner1.InnerHtml = System.Net.WebUtility.HtmlDecode(ds.Tables[0].Rows[0].ItemArray[3].ToString());
                    banner_img_banner1.Src = "http://camp.earthinfralanddevelopers.co.in/Campaign_Images/" + main_banner_image;
                    install_link_banner1.InnerText = ds.Tables[0].Rows[0].ItemArray[5].ToString();
                    install_link_banner1.HRef = ds.Tables[0].Rows[0].ItemArray[4].ToString();
                    banner1_id.InnerText = camp_id;
                }
                decimal start_rate = Convert.ToDecimal(ds.Tables[0].Rows[0].ItemArray[8]);
                //hdnfStars.Value = start_rate.ToString();
                icon_img_banner2.Src = "http://camp.earthinfralanddevelopers.co.in/Campaign_Images/" + icon_image;
                title_banner2.InnerText = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                sponsore_banner2.InnerText = "Sponsored";
                install_link_banner2.InnerText = ds.Tables[0].Rows[0].ItemArray[5].ToString();
                install_link_banner2.HRef = ds.Tables[0].Rows[0].ItemArray[4].ToString();
                banner_2_id.InnerText = camp_id;
                sponsore_banner3.InnerText = "Sponsored";
                title_banner3.InnerText = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                image_banner3.Src = "http://camp.earthinfralanddevelopers.co.in/Campaign_Images/" + icon_image;
                icon_img_banner3.Src = "http://camp.earthinfralanddevelopers.co.in/Campaign_Images/" + main_banner_image;

                mini_title_banner3.InnerText = ds.Tables[0].Rows[0].ItemArray[2].ToString();

                install_link_banner3.InnerText = ds.Tables[0].Rows[0].ItemArray[5].ToString();
                install_link_banner3.HRef = ds.Tables[0].Rows[0].ItemArray[4].ToString();
                banner_3_id.InnerText = camp_id;
                sponsers_banner4.InnerText = "Sponsored";
                image_banner_4.Src = "http://camp.earthinfralanddevelopers.co.in/Campaign_Images/" + main_banner_image;
                title_banner4.InnerText = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                discription_banner4.InnerHtml = System.Net.WebUtility.HtmlDecode(ds.Tables[0].Rows[0].ItemArray[3].ToString());
                hdnfDescription.Value = System.Net.WebUtility.HtmlDecode(ds.Tables[0].Rows[0].ItemArray[3].ToString());
                banner_4_id.InnerText = camp_id;
                sponserese_banner_5.InnerText = "Sponsored";
                icon_image_banner_5.Src = "http://camp.earthinfralanddevelopers.co.in/Campaign_Images/" + icon_image;
                title_banner_5.InnerText = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                discription_banner_5.InnerHtml = System.Net.WebUtility.HtmlDecode(ds.Tables[0].Rows[0].ItemArray[3].ToString()); ;

                install_link_banner5.InnerText = ds.Tables[0].Rows[0].ItemArray[5].ToString();
                install_link_banner5.HRef = ds.Tables[0].Rows[0].ItemArray[4].ToString();
                banner_5_id.InnerText = camp_id;
                sponserese_banner_5.InnerText = "Sponsored";
                //ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "FillDescription();", true);

            }
            else
            {
            }
        }
        catch
        {
        }
    }
    #endregion

}