<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Campaign_Ad_Panel_View.aspx.cs"
    EnableEventValidation="false" Inherits="Campaign_Ad_Panel_View" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <META HTTP-EQUIV="Access-Control-Allow-Origin" CONTENT="http://camp.earthinfralanddevelopers.co.in">
    <%if (Request.QueryString["View"] != "0") %>
    <% { %>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <style type="text/css">
        .setDisplay
        {
            display: none;
            /*position: absolute;
            z-index: 9999999;
            width: 100%;
            height: 100%;
            background: transparent !important;
            border: none !important;*/
        }
        /*#LinkButtonAnchorTag_Banner2:before {
            content: '';
            position: absolute;
            z-index: 2;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }*/
        .pointer {cursor: pointer;}
        .hiddenBtn { display:none;}
        .overlay {position: relative; z-index: 999999999;}
        .overlay:before 
        {
            position: absolute;
            content: '';
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 99999;
        }
        
        .img-responsive {
          display: inline !important;
        }
        
        .imgpage
        {
            display: block !important;
            max-width: 100% !important;
            height: 40% !important;
        }
        
        .container
        {
            display: block;
            width: 1170px;
            margin: 0 auto;
        }
        
        .title2-p
        {
            font-weight: bold;
            font-size: 20px;
        }
        
        .card-banner2
        {
            margin-bottom: 4px;
        }
        .card-banner 
        {
            min-height: 
        }
        
        @media (max-width: 1170px)
        {
            .container
            {
                width: 100%;
            }
        }
        
        .no-padding
        {
            padding: 0;
        }
        
        .wrapfont
        {
        }
        
        body
        {
            font-size: 3px;
            font-family: arial;
        }
        
        .player_holder
        {
            float: left;
            overflow: hidden;
            width: 100%;
            position: relative;
        }
        
        #videoPlayer
        {
            position: relative;
            z-index: 1;
            width: 100%;
            height: auto;
        }
        
        #playOverlay
        {
            position: absolute;
            z-index: 2;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }
        
        #afterOverlay
        {
            position: absolute;
            z-index: 5;
            width: 100%;
            height: 100%;
            bottom: 0;
            cursor: pointer;
            left: 0;
            display: none;
            overflow: hidden;
            background-position: center center;
            background-repeat: no-repeat;
        }
        
        #afterOverlay img
        {
            float: left;
            width: 100%;
            min-height: 100%;
        }
        
        .visible
        {
            display: block !important;
        }
        
        .unvisible
        {
            display: none !important;
        }
        
        .fullSize
        {
            height: 100% !important;
        }
        
        #playBtn
        {
            position: absolute;
            top: 15px;
            right: 15px;
            width: 75px;
            height: 75px;
            font-size: 2em;
            color: #fff;
            z-index: 15;
            display: none;
            background-size: 100% 100%;
            background-repeat: no-repeat;
            background-position: center center;
            font-weight: bold;
            cursor: pointer;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            border-radius: 50%;
            -moz-background-clip: padding;
            -webkit-background-clip: padding-box;
            background-clip: padding-box;
            text-align: center;
            overflow: hidden;
        }
        
        @media (max-width: 992px)
        {
            #playBtn
            {
                width: 50px;
                height: 50px;
            }
        }
        
        @media (max-width: 540px)
        {
            #playBtn
            {
                width: 40px;
                height: 40px;
            }
        }
        
        #imgArrow
        {
            position: absolute;
            top: 13px;
            right: 15px;
            width: 75px;
            height: 75px;
            font-size: 2em;
            color: #fff;
            z-index: 15;
            display: none;
            background-size: 100% 100%;
            background-repeat: no-repeat;
            background-position: center center;
            font-weight: bold;
            cursor: pointer;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            border-radius: 50%;
            -moz-background-clip: padding;
            -webkit-background-clip: padding-box;
            background-clip: padding-box;
            text-align: center;
            overflow: hidden;
        }
        
        .visible
        {
            display: block !important;
        }
    </style>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
        integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
        crossorigin="anonymous" />--%>
    <%--<link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />--%>
    <script type="text/javascript">
        function asd(a) {
            alert(a.toString());

        }

    </script>
    <style>
        .fa-info-circle {
          position: relative;
          display: inline-block;
          width: 15px;
          height: 15px;
          border-radius: 100%;
          background-color: #ccc;
          top: 2px;
        }
        .fa-info-circle:before {
          position: absolute;
          text-align: center;
          width: 100%;
          height: 100%;
          top: 0;
          left: 0;
          content: "i";
          color: #FFFFFF;
          font-family: "Times New Roman";
          font-weight: bold;
          font-size: 13px;
          line-height: 15px;
        }
        .carousel-control.right
        {
            background: transparent;
        }
        
        .carousel-control.left
        {
            background: transparent;
        }
        
        .carousel-control .glyphicon-chevron-left, .carousel-control .icon-prev
        {
            display: none;
        }
        
        .carousel-control .glyphicon-chevron-right, .carousel-control .icon-next
        {
            display: none;
        }
        
        .carousel-indicators
        {
            display: none;
        }
        
        .tp-video-play-button
        {
            display: none !important;
        }
        
        .video_line
        {
            position: absolute;
            background-color: rgba(0,0,0, .7);
            left: 0;
            right: 0;
            bottom: 61px;
            height: 47px;
            padding-bottom: 9px;
            padding-top: 9px;
            color: #fff;
            padding-left: 98px;
            font-size: 19px;
        }
    </style>
    <style>
        @media only screen and (min-width : 320px)
        {
            /*.my_frame_Box iframe{ width:100%; height:600px;}*/
            .my_frame_Box iframe
            {
                min-width: 100% !important;
                min-height: 260px !important;
                width: auto !important;
                height: auto !important;
            }
        }
        
        @media only screen and (min-width : 480px)
        {
            /*.my_frame_Box iframe{ width:100%; height:600px;}*/
            .my_frame_Box iframe
            {
                min-width: 100% !important;
                min-height: 260px !important;
                width: auto !important;
                height: auto !important;
            }
        }
        
        @media only screen and (min-width : 768px)
        {
            /*.my_frame_Box iframe{ width:100%; height:600px;}*/
            .my_frame_Box iframe
            {
                min-width: 100% !important;
                min-height: 260px !important;
                width: auto !important;
                height: auto !important;
            }
        }
        
        @media only screen and (min-width : 992px)
        {
            /*.my_frame_Box iframe{ width:600px; height:600px;}*/
            .my_frame_Box iframe
            {
                min-width: 309px !important;
                min-height: 260px !important;
                width: auto !important;
                height: auto !important;
            }
        }
        
        @media only screen and (min-width : 1200px)
        {
            /*.my_frame_Box iframe{ width:600px; height:600px;}*/
            .my_frame_Box iframe
            {
                min-width: 309px !important;
                min-height: 260px !important;
                width: auto !important;
                height: auto !important;
            }
        }
    </style>
    <%} %>
</head>
<body>
    <%if (Request.QueryString["View"] != "0") %>
    <% { %>
    <form id="form1" runat="server">
    <asp:HiddenField ID="sid" runat="server" />
    <asp:ScriptManager ID="scrmAdPage" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        type="text/javascript"></script>
    <%--<script src="js/ViewAddPanelEmoji.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        function clearHtmlBody() {
            var e = document.getElementsByTagName('html')[0];
            e.removeChild(document.body);
        }
    </script>
    <script type="text/javascript">
//        $(document).ready(function () {

//            setEmoji();
//        });
        function RanderBanner1() {

            document.getElementById('sliderBanner1').innerHTML = document.getElementById('hdnfBanner1Code').value;
        }
    </script>
    <asp:UpdatePanel runat="server" ID="AdSection">
        <ContentTemplate>
            <%--  id="AdPageBody" runat="server"--%>
            <asp:HiddenField ID="hdnfClickId" Value="0" runat="server" />
            <asp:HiddenField ID="HiddenViewCount" Value="0" runat="server" />
            <div style="text-align: left;" class=" col-sm-15">
                <%-- <link href="css/bootstrap.min.css" rel="stylesheet" />--%>
                <link href="css/style.css" rel="stylesheet" />
                <style>
                    #owl-demo .item img122
                    {
                        display: block;
                        width: 100%;
                        height: auto;
                    }
                    
                    #owl-demo4 .item
                    {
                        margin: 3px;
                    }
                    
                    #owl-demo4 .item img122
                    {
                        display: block;
                        width: 100%;
                        height: auto;
                    }
                    .owl-item
                    {
                        padding: 5px;
                    }
                    .owl-item .item, .owl-item .item > *
                    {
                        display: inline-block;
                        float: left;
                        width: 100%;
                    }
                    .owl-item .title-container
                    {
                        height: 55px;
                    }
                    
                    .owl-item .card-banner:before
                    {
                        content: "";
                        display: inline-block;
                        float: left;
                        width: 100%;
                        padding-top: 100%;
                    }
                    .owl-item .card-banner
                    {
                        position: relative;
                        float: left;
                        width: 100%;
                    }
                    .owl-item #button_anchor_tag
                    {
                        display: inline-block;
                        float: left;
                        width: 100%;
                    }
                    .owl-item .card-banner img
                    {
                        position: absolute;
                        top: 50%;
                        left: 50%;
                        max-width: 100%;
                        max-height: 100%;
                        transform: translateX(-50%) translateY(-50%);
                    }
                </style>
                <asp:UpdatePanel runat="server" ID="pnlbanner1">
                    <ContentTemplate>
                        <div id="sliderBanner1" runat="server">
                        </div>
                        <asp:Button ID="btnBanner1Click" runat="server" CssClass="hiddenBtn" BorderStyle="None"
                            OnClick="ClickBanner" Style="top: 0; left: 0" />
                        <asp:HiddenField ID="hdnfBanner1Code" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%-- </ContentTemplate>
                </asp:UpdatePanel>--%>
            </div>
            <div id="carousel-example-generic" class="carousel slide">
                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">
                        Previous</span> </a><a class="right carousel-control" href="#carousel-example-generic"
                            role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true">
                            </span><span class="sr-only">Next</span> </a>
            </div>
            <%if (Request.QueryString["banner_id"] == "Banner 1")
              { %>
                <link href="http://i.earthinfralanddevelopers.co.in/admin/css/owl.theme.css" rel="stylesheet" />
                <link href="http://i.earthinfralanddevelopers.co.in/admin/css/owl.carousel.css" rel="stylesheet" />
                <script src="http://i.earthinfralanddevelopers.co.in/admin/js/owl.carousel.min.js"></script>
                <script src="http://i.earthinfralanddevelopers.co.in/admin/js/owl-page.js"></script>
            <%} %>
            <script type="text/javascript">
                function clicked(item) {
                    var id = $(item).attr("id");
                    $('#hdnfBanner1Code').val(id);
                    // document.getElementById('hdnfBanner1Code').value = id;
                    setTimeout(function () {
                        // document.getElementById('btnBanner1Click').click();
                        $('#btnBanner1Click').trigger('click');
                        $("#owl-demo").owlCarousel({ autoPlay: false, pagination: false, items: 5, itemsDesktop: [1199, 5], itemsDesktopSmall: [979, 3], itemsTablet: [768, 1.2], itemsTabletSmall: [500, 1.2], itemsMobile: [479, 1.2] });
                    }, 300);
                }
            </script>
            <script type="text/javascript">

                function call_banner1Function(campID) {

                    alert(campID.toString());
                }
                function OnSuccess(response, userContext, methodName) {
                    alert(response);
                }

                function clicked2(item) {
                    var id = $(item).attr("id");
                    //                    alert(id)
                    $('#camp_id_banner4').val(id);
                    setTimeout(function () { $('#Clickbanner4').trigger('click') }, 300);
                    //                    document.getElementById('Clickbanner4').click();
                }

                function OnSuccess(response, userContext, methodName) {
                }
                function ReloadPage() {

                }
            </script>
            <script language="javascript">
                function WritePassbackCode() {
                    var Passback = document.getElementById('HDNFPassbackCode').value;
                    document.write(Passback);
                }
            </script>
            <asp:HiddenField ID="HDNFPassbackCode" runat="server" Value="" />
            <%--<asp:Button runat="server" ID="Clickbanner" OnClick="Banner_Click" CssClass="setDisplay" />--%>
            <%-- banner 2 start--%>
            <div class="card banner2-wrp-p" runat="server" id="banner2" visible="false">
                <asp:Button runat="server" ID="Clickbanner2" OnClick="Banner_Click" CssClass="setDisplay" />
                <div class="title-container" style="margin: 0">
                    <a href="#" runat="server" id="IconAnchorTag_Banner2" target="_parent" style="float: left; width: 75px; display: inline-block;">
                        <div class="col-xs-3 card-icon" onclick="__doPostBack('install_link_banner2', '');" style="padding: 0; float: left; display: inline-block;">
                            <img src="img/card2-icon.png" style="height: 65px; width: 65px; margin: 5px; float: left;" alt="No Icon"
                                runat="server" id="icon_img_banner2" class="" />
                        </div>
                    </a>
                    <!--card-icon-->
                    <div runat="server" id="adjstTitleBanner2" style="padding: 0; display: inline-block; float: left; width: calc(100% - 130px);">
                        <a href="#" runat="server" id="TitleBanner2Anchor" style="text-decoration: none;"
                            target="_parent" onclick="call2(this)">
                            <div class="title " runat="server" id="title_banner2">
                                Lorem Ipsum
                            </div>
                        </a>
                        <div class="Rating" runat="server" id="DivRateBanner2">
                            <img src="img/rating.png" runat="server" id="rate_img_1_banner2" alt="banner-img"
                                class="img-responsive" />
                            <img src="img/rating.png" runat="server" id="rate_img_2_banner2" alt="banner-img"
                                class="img-responsive" />
                            <img src="img/rating.png" runat="server" id="rate_img_3_banner2" alt="banner-img"
                                class="img-responsive" />
                            <img src="img/rating.png" runat="server" id="rate_img_4_banner2" alt="banner-img"
                                class="img-responsive" />
                            <img src="img/rating.png" runat="server" id="rate_img_5_banner2" alt="banner-img"
                                class="img-responsive" />
                        </div>
                        <div class=" clearfix">
                        </div>
                        <br />
                        <div runat="server" id="sponsore_banner2" style="color: #ccc; margin-top: -14px;"></div>
                    </div>
                    <a href="#" runat="server" id="LinkButtonAnchorTag_Banner2" target='_parent' class="callClick">
                        <div class="col-xs-2 install-btn-new pull-right" id="action_button_banner2" style="margin-top: 20px;
                            position: relative;" runat="server" onclick="__doPostBack('install_link_banner2', '');">
                            <span id="Span1" runat="server" style="text-decoration: none; text-transform: lowercase;
                                font-size: 15px; line-height: 30px;">Go</span>
                            <asp:LinkButton ID="install_link_banner2" runat="server" OnClick="Banner_Click"></asp:LinkButton>
                        </div>
                    </a>
                    <div id="camp_id_banner2" runat="server" style="font-size: 1pt; position: absolute; z-index: -999; opacity: 0;">
                    </div>
                    <div id="os_allowed_banner2" runat="server" style="font-size: 1pt; position: absolute; z-index: -999; opacity: 0;">
                    </div>
                    <div id="sites_allow_banner2" runat="server" style="font-size: 1pt; position: absolute; z-index: -999; opacity: 0;">
                    </div>
                    <div class=" clearfix">
                    </div>
                </div>
            </div>
            <%-- banner 2 close--%>
            <%-- banner 3 start--%>
            <div class="card" id="banner3" runat="server">
                <asp:Button runat="server" ID="Clickbanner3" OnClick="Banner_Click" CssClass="setDisplay" />
                <div class="Sponsored-3 L-R" runat="server" id="sponsers_banner4" style="margin-bottom: 0;">
                    Sponsored <span href="#" class="fa fa-info-circle" data-toggle="popover" title="Message"
                        data-html="true" data-placement="left" data-content="<a href='http://google.com' target='_blank' >Click here to opt out</a>">
                    </span>
                </div>
                <a href="#" runat="server" id="banner3_icon_anchor_tag" target="_parent" class="callClick">
                    <div class="card-banner2">
                        <img src="img/banner-img2.jpg" runat="server" id="image_banner_3" alt="banner-img"
                            class="img-responsive" style='width: 100%;' />
                    </div>
                </a>
                <!--add-banner-->
                <a href="#" runat="server" id="A2" style="text-decoration: none;" target="_parent" class="callClick">
                    <div class="title2-p L-R " runat="server" id="title_banner3">
                        Show Me What A True Hero Looks Like
                    </div>
                </a><a href="#" runat="server" id="A1" style="text-decoration: none;" target="_blank" class="callClick">
                    <div class="card-description L-R" runat="server" id="discription_banner3" style="display: none;">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem
                        Ipsum is simply dummy text of the printing and typesetting industry.
                    </div>
                </a>
                <!--card-description-->
                <div id="camp_id_banner3" runat="server" style="font-size: 1pt; color: White;">
                </div>
                <div id="os_allowed_banner3" runat="server" style="font-size: 1pt; color: White;">
                </div>
                <div id="sites_allow_banner3" runat="server" style="font-size: 1pt; color: White;">
                </div>
            </div>
            <!--card-->
            <%-- banner 3 close--%>
            <%-- banner 4 start--%>
            <div id="sliderBanner4" runat="server">
                <%try %>
                <%{ %>
                <%if (Request.QueryString["banner_id"] == "Banner 4") %>
                <%{ %>
                <asp:Button runat="server" ID="Clickbanner4" OnClick="Banner_Click" CssClass="hiddenBtn" />
                <div class=" clearfix">
                </div>
                <asp:HiddenField ID="camp_id_banner4" runat="server" />
                <%--<div id="" runat="server" style="font-size: 0pt">
                </div>--%>
                <div id="os_allowed_banner4" runat="server" style="font-size: 0pt">
                </div>
                <div id="sites_allow_banner4" runat="server" style="font-size: 0pt">
                </div>
                <div class=" clearfix">
                </div>
                <%Response.Write("<div class='Sponsored-3' runat='server' id='sponsore_banner4' >" + dspage.Tables[0].Rows[0].ItemArray[10].ToString() + "&nbsp;<span href=\"#\" class=\"fa fa-info-circle\" data-toggle=\"popover\" title=\"Message\" data-html=\"true\" data-placement=\"left\" data-content=\"<a href='http://google.com' target='_blank' >Click here to opt out</a>\"></span></div>"); %>
                <div>
                    <%try %>
                    <%{  %>
                    <%for (countLoop = 0; countLoop < NoOfbanner4; countLoop++) %>
                    <%{ %>
                    <%bannerCounter.InnerText = dspage.Tables[0].Rows.Count.ToString(); %>
                    <%if (Request.QueryString["banner_id"] == "Banner 4") %>
                    <%{ %>
                    <%functionPart = "onclick='call_banner1Function('" + dspage.Tables[0].Rows[countLoop].ItemArray[0].ToString() + "')'";%>
                    <%-- // setting icon URL--%>
                    <% IconImgFileName = dspage.Tables[0].Rows[countLoop].ItemArray[14].ToString(); %>
                    <%if (IconImgFileName != "") %>
                    <%{ %>
                    <%iconImgArray = IconImgFileName.Split('/'); %>
                    <% iconImgImageName = iconImgArray[2].ToString(); %>
                    <%--iconURL = "http://i.earthinfralanddevelopers.co.in/Campaign_Images\\" + iconImgImageName.ToString();--%>
                    <%iconURL = domain + "Campaign_Images\\" + iconImgImageName.ToString();%>
                    <%
                        iconURL = RezizeImage(65, 65, domain, iconImgImageName);
                    %>
                    <% } %>
                    <%-- setting image URL--%>
                    <% MainImgFileName = dspage.Tables[0].Rows[countLoop].ItemArray[6].ToString();%>
                    <%if (MainImgFileName != "") %>
                    <%{ %>
                    <%MainImgArray = MainImgFileName.Split('/'); %>
                    <% MainImgImageName = MainImgArray[2].ToString(); %>
                    <%--MainImageURL = "http://i.earthinfralanddevelopers.co.in/Campaign_Images\\" + MainImgImageName.ToString();--%>
                    <%MainImageURL = domain + "Campaign_Images\\" + MainImgImageName.ToString();%>
                    <%
                        MainImageURL = RezizeImage(65, 65, domain, MainImgImageName);
                    %>
                    <% } %>
                    <div>
                        <div id="banner4" class='card' runat="server">
                            <%Response.Write("<div class='item card pointer' runat='server' id='" + dspage.Tables[0].Rows[countLoop].ItemArray[0].ToString() + "'  style='height: 100px; position: relative;' onclick='clicked2(this);'  >");%>
                            <!--add-banner-->
                            <div class="title-container1 L-R">
                                <%Response.Write("<a  href='" + dspage.Tables[0].Rows[countLoop].ItemArray[4].ToString() + Session["sid"].ToString().Trim() + "'  runat='server' id='banner1_anchor_icon' target='_parent'  class='callClick'>" + " <div class='col-xs-2 card-icon' >" + "<img src='" + iconURL + "' style='Height: 65px; Padding-Right:0px; width: 65px; margin-left: 5px; margin-top: 5px;' runat='server' id='icon_img_banner4'   alt='banner-img' class='col-xs-2 card-icon' />" + "</div>" + "</a>"); %>
                            </div>
                            <div class="col-xs-9" style="padding: 0 5px 0 5px; float: right;">
                                <%Response.Write("<a  href='" + dspage.Tables[0].Rows[countLoop].ItemArray[4].ToString() + Session["sid"].ToString().Trim() + "' style='text-decoration:none;'  runat='server' id='banner1_anchor_icon' target='_parent' ><div class='title9' style='color:#" + Request.QueryString["TitleColor"].ToString() + " ; font-weight: bold;font-size: 14px;' runat='server' id='title_banner4'  class='callClick'>" + dspage.Tables[0].Rows[countLoop].ItemArray[2].ToString() + "</div></a>"); %>
                                <%Response.Write("<a  href='" + dspage.Tables[0].Rows[countLoop].ItemArray[4].ToString() + Session["sid"].ToString().Trim() + "' style='text-decoration:none;'  runat='server' id='banner1_anchor_icon' target='_parent' ><div class='title10' style='display:none;color:#" + Request.QueryString["DescriptionColor"].ToString() + "   font-weight: bold;font-size: 14px;' runat='server' id='Bnr4Description" + (countLoop + 1).ToString() + "'  class='callClick'>" + System.Net.WebUtility.HtmlDecode(dspage.Tables[0].Rows[countLoop].ItemArray[3].ToString().Replace("&nbsp;", " ")) + "</div></a>"); %>
                                <%--<%strDescription = System.Net.WebUtility.HtmlDecode(dspage.Tables[0].Rows[countLoop].ItemArray[3].ToString()); %>
                                <%Response.Write("<div class='title10' style='color:#" + Request.QueryString["DescriptionColor"].ToString() + "' runat='server' id='mini_title_banner3'>"); %>
                                <%Response.Write("<p style='height: 20px; overflow: hidden; text-overflow: ellepsis;'> " + strDescription + "</p>");%>
                                <%Response.Write("</div>"); %>--%>
                            </div>
                            <%-- <a href="#" runat="server" id="Anchor_tag_banner4_link" target="_blank">--%>
                            <%ShowHideActiBnr4 = Request.QueryString["ShowCallToAct"].ToString(); %>
                            <%if (ShowHideActiBnr4 == "Show") %>
                            <%{ %>
                            <%Response.Write("<a href='" + dspage.Tables[0].Rows[countLoop].ItemArray[4].ToString() + Session["sid"].ToString().Trim() + "' runat='server' id='Anchor_tag_banner4_link' target='_parent' style='position: absolute; display: inline-block; right: 5px; bottom: 5px;'> ");%>
                            <div class="col-xs-4 install-btn5" id="action_button_banner4" runat="server" style="display: inline-block; width: 100px; margin: 0; text-align: center;">
                                <span id="Link_banner4" runat="server"></span><span id="Span2" runat="server" style="text-transform: lowercase;">
                                    Link</span>
                            </div>
                            <% Response.Write("</a>"); %>
                            <%} %>
                            <div class=" clearfix">
                            </div>
                            <div class=" clearfix">
                            </div>
                        </div>
                        <div class=" clearfix">
                        </div>
                        <!--title-container-->
                        <%-- </div>--%>
                        <%-- <%Response.Write("</div>"); %>--%>
                    </div>
                    <%} %>
                    <%} %>
                    <%} %>
                    <%catch (Exception sqe) %>
                    <%{ %>
                    <%} %>
                </div>
                <%} %>
                <%} %>
                <%catch (Exception sqe) %>
                <%{ %>
                <%--<%Response.Write("Cannot load Ad..");%>--%>
                <%} %>
            </div>
            <%-- banner 4 close--%>
            <%-- banner 5 start--%>
            <div class="card" runat="server" visible="false" id="banner5" onclick="__doPostBack('install_link_banner5', '');">
                <div class="Sponsored-3" runat="server" id="sponserese_banner_5">
                    Sponsored <span href="#" class="fa fa-info-circle" data-toggle="popover" title="Message"
                        data-html="true" data-placement="left" data-content="<a href='http://google.com' target='_blank' >Click here to opt out</a>">
                    </span>
                </div>
                <div class="title-container">
                    <div class="col-xs-2 card-icon">
                        <img style="height: 50px; width: 50px" runat="server" id="icon_image_banner_5" src="img/card2-icon.png"
                            alt="banner-img" class="">
                    </div>
                    <!--card-icon-->
                    <div class="col-xs-10">
                        <div class="title " runat="server" id="title_banner_5">
                            Show Me What A True Hero
                        </div>
                        <div class="card-description" runat="server" id="discription_banner_5">
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                        </div>
                        <!--card-description-->
                    </div>
                    <div class=" clearfix">
                    </div>
                </div>
                <!--title-container-->
                <div class="col-xs-4 install-btn5" id="action_button_banner5" runat="server">
                    <asp:LinkButton ID="install_link_banner5" runat="server" OnClick="Banner_Click" Text="sdfsfd"></asp:LinkButton>
                </div>
                <!--install-btn-->
                <div class=" clearfix">
                </div>
                <div id="camp_id_banner5" runat="server" style="font-size: 1pt">
                </div>
                <div id="os_allowed_banner5" runat="server" style="font-size: 1pt">
                </div>
                <div id="sites_allow_banner5" runat="server" style="font-size: 1pt">
                </div>
                <div class="brd">
                </div>
            </div>
            <!--card-->
            <%-- banner 5 close--%>
            <%-- banner 6 start--%>
            <div class="card" runat="server" id="banner6" visible="false">
                <div class="Sponsored-3" runat="server" id="sponserese_banner6">
                </div>
                <%--<div class="title-container">
                    <div class="col-xs-2 card-icon">
                        <img runat="server" id="icon_img_banner_6" style="display: none; height: 50px; width: 50px"
                            src="img/add-icon.jpg" alt="banner-img" class="" />
                    </div>
                    <!--card-icon-->
                    <div class="col-xs-10" style="display: none;">
                        <div class="title " runat="server" id="title_banner_6">
                            Lorem Ipsum is simply dummy</div>
                        <div class="Rating">
                            <img src="img/rating.png" runat="server" id="star_img_1_banner6" alt="banner-img"
                                class="img-responsive" />
                            <img src="img/rating.png" runat="server" id="star_img_2_banner6" alt="banner-img"
                                class="img-responsive" />
                            <img src="img/rating.png" runat="server" id="star_img_3_banner6" alt="banner-img"
                                class="img-responsive" />
                            <img src="img/rating.png" runat="server" id="star_img_4_banner6" alt="banner-img"
                                class="img-responsive" />
                            <img src="img/rating.png" runat="server" id="star_img_5_banner6" alt="banner-img"
                                class="img-responsive" />
                        </div>
                    </div>
                    <div class=" clearfix">
                    </div>
                </div>--%>
                <div id="DivVideo">
                    <link href="css/animate.css" rel="stylesheet" type="text/css" />
                    <link href="css/bannerAnimate.css" rel="stylesheet" type="text/css" />
                    <div id="playerDiv" runat="server" class="player_holder" style="height: auto">
                        <div id="playOverlay" class="">
                        </div>
                        <asp:Literal ID="LitralVideo" runat="server"></asp:Literal>
                        <asp:HiddenField ID="HiddenVideoCount" runat="server" ClientIDMode="Static" OnValueChanged="HiddenVideoCount_ValueChanged">
                        </asp:HiddenField>
                        <div id="playButton" runat="server"><div id="playVideo" runat="server"></div></div>
                        <a href="#" runat="server" id="vedioAnchorTag" target="_parent">
                            <div id="vedioDiv" runat="server">
                                <asp:LinkButton ID="afterOverlay" runat="server" target="_parent" class="callClick">
                                    <div id="videoBanner1" class="animateBanner overlay" runat="server">
                                        <div id="panel1" class="panel1" runat="server">
                                        </div>
                                        <div class="panel2">
                                            <div id="panel2_1" class="panel2_1" runat="server">
                                            </div>
                                            <div id="panel2_2" class="panel2_2" runat="server">
                                            </div>
                                        </div>
                                    </div>
                                    <div id="videoBanner2" class="animateBanner overlay" runat="server">
                                        <div id="panel3" class="panel3" runat="server">
                                        </div>
                                        <div id="panel4" class="panel4" runat="server">
                                        </div>
                                    </div>
                                </asp:LinkButton>
                            </div>
                        </a>
                        <div id="playBtn">
                        </div>
                    </div>
                </div>
                <asp:Button runat="server" ID="Clickbanner6" OnClick="Banner_Click" CssClass="hiddenBtn" />
                <asp:HiddenField ID="hdnfBanner2Code" runat="server" />
                <div id="os_allowed_banner6" runat="server" style="font-size: 0pt">
                </div>
                <div id="sites_allow_banner6" runat="server" style="font-size: 0pt">
                </div>
            </div>
            </div>
            <div id="data_bannerId" class="setDisplay" runat="server">
            </div>
            <div id="data_campain_id" class="setDisplay" runat="server">
            </div>
            <div id="data_domain_name" class="setDisplay" runat="server">
            </div>
            <div id="data_affiliatedId" class="setDisplay" runat="server">
            </div>
            <div id="data_os_type" class="setDisplay" runat="server">
            </div>
            <div id="data_sid2" class="setDisplay" runat="server">
            </div>
            <div id="data_country_name" class="setDisplay" runat="server">
            </div>
            <script language="javascript" type="text/javascript">

                $('[data-toggle="popover"]').popover();
                $('#playVideo').on('click', function () {
                    $('#videoPlayer').trigger('click');
                    $('#playButton').hide();
                })

                function VideoEvent() {

                    var player = document.getElementById('videoPlayer'),
	    	            playOverlay = document.getElementById('playOverlay'),
	    	            afterOverlay = document.getElementById('afterOverlay'),
	    	            playBtn = document.getElementById('playBtn')
                    bg = afterOverlay.getAttribute("data-bg");
                    afterOverlay.style.backgroundImage = "url('" + bg + "')";
                    afterOverlay.style.backgroundSize = 'cover';

                    afterOverlay.style.backgroundRepeat = 'no-repeat';
                    player.volume = 0.5;
                    player.addEventListener('play', function () { v.play(); }, false);

                    player.onclick = function () {
                        if (player.paused) {
                            player.play();
                            player.controls = null;
                        } else {
                            player.pause();
                            player.controls = "controls";
                        }
                    }

                    playOverlay.addEventListener('click', function (e) {
                        playOverlay.className = "fullSize";
                        if (!player.paused) {
                            player.pause();
                        } else {
                            player.play();
                            //alert('Playing');
                        }
                    });

                    player.addEventListener('ended', function () {
                        var clickCount = document.getElementById('HiddenVideoCount').value;
                        afterOverlay.className = "visible";
                        playBtn.className = "visible";
                        playOverlay.classList.remove("fullSize");
                        clickCount = parseInt(clickCount) + 1;
                        document.getElementById('HiddenVideoCount').value = parseInt(clickCount);
                        var url = "http://i.earthinfralanddevelopers.co.in/Admin/updateVideoView.aspx?camp_id=" + $('#data_campain_id').text() + "&affiliate_id=" + $('#data_affiliatedId').text() + "&sid=" + $('#data_sid2').text() + "&domain_name=" + $('#data_domain_name').text() + "&os_type=" + $('#data_os_type').text() + "&country_name=" + $('#data_country_name').text();
                        $.ajax({ url: url }); // update video view count
                    })


                    playBtn.addEventListener('click', function () {
                        player.play();
                        afterOverlay.classList.remove("visible");
                        playBtn.classList.remove("visible");
                        playOverlay.className = "fullSize";

                    })
                }
                function OnSuccessCallback(res) {
                }
                function OnFailureCallback() {
                }

                function __doPostBack(eventTarget, eventArgument) {
                    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {

                        theForm.__EVENTTARGET.value = eventTarget;
                        theForm.__EVENTARGUMENT.value = eventArgument;
                        theForm.submit();
                    }
                }
                function call(href) {
                    /*$('#Clickbanner6').trigger('click');*/
                    var url = "http://i.earthinfralanddevelopers.co.in/admin/updateAddClicks.aspx?camp_id=" + $('#data_campain_id').text() + "&banner_id=" + $('#data_bannerId').text() + "&affiliate_id=" + $('#data_affiliatedId').text() + "&sid=" + $('#data_sid2').text() + "&domain_name=" + $('#data_domain_name').text() + "&os_type=" + $('#data_os_type').text() + "&country_name=" + $('#data_country_name').text();
                    //alert(url);
                    $.ajax({
                        url: url,
                        success: function () {
                            //alert(href)
                            if (href != "") {
                                $('body').find('#pageRedirect').get(0).click();
                            }
                        }
                    });       // update video view count
                }
                $('.callClick').on('click', function (e) {
                    e.preventDefault();
                    href = $(this).attr('href');
                    if ($('body').find('#pageRedirect').length)
                        $('body').find('#pageRedirect').attr('href', href);
                    else
                        $("body").append("<a href='" + href + "' target='_parent' id='pageRedirect'></a>");
                    call(href);
                })
                /*function callBan1(elem) {
                    //                      elem.closest('.item').trigger('click');
                    call(elem);
                }
                function callBan2(elem) {
                    //                      $('#Clickbanner2').trigger('click');
                    call(elem);
                }
                function callBan3(elem) {
                    //                      $('#Clickbanner3').trigger('click');
                    call(elem);
                }*/
            </script>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#AdSection').attr('data-height', $('#AdSection').innerHeight())
            setTimeout(
          function () {
              $(".wrapfont").each(function (index) {
                  var divWidth = $(this).find('.title').width();
                  var text = $(this).find('span');
                  var character = $(this).find('span').text().length;
                  var fontSize = 12;
                  fontSize = (divWidth / character) + 4
                  text.css("font-size", fontSize);
                  if (fontSize > 14)
                      text.css("font-size", 14);
                  text.css("display", "inline");
              });
          }, 500);

            //$('a').on('click', function (e) {
            //    href = $(this).attr('href');
            //    $.get(href);
            //    e.preventDefault();
            //})

        });
    </script>
    <script type="text/javascript">
        window.onload = function RemoveEmoji() {
            try { // remove emoji on banner 3
                var HTMLContent = document.getElementById('discription_banner3').innerHTML
                var RemovedHTML = HTMLContent.replace(/<img[^>]*>/g, "   ");
                var RemovedHTML = RemovedHTML.replace(/&nbsp;/gi, ' ');
                $('#discription_banner3').html(RemovedHTML);
                document.getElementById('discription_banner3').style.display = "block";
                //            $('#discription_banner_5').html(RemovedHTML);

            }
            catch (err) {
            }

            for (var count = 1; count < 7; count++) {
                try {
                    var DivId = 'Bnr4Description' + count;

                    var _DivName = document.getElementById(DivId);
                    var PassToJQ = '#' + DivId;
                    var HTMLContent = document.getElementById(DivId).innerHTML
                    var RemovedHTML = HTMLContent.replace(/<img[^>]*>/g, "   ");
                    var RemovedHTML = RemovedHTML.replace(/&nbsp;/gi, ' ');
                    $(PassToJQ).html(RemovedHTML);
                    document.getElementById(DivId).style.display = "block";
                }
                catch (err) {
                }
            }
        }
        $(document).ready(function () {
            function inIframe() {
                if (top != self) {
                    var contentHeight = $('html').height(); //Just this part I did with jQuery as I was sure that the document uses it
                    postSize(contentHeight);
                }
            }
            function postSize(height) {
                var target = parent.postMessage ? parent : (parent.document.postMessage ? parent.document : undefined);
                if (typeof target != "undefined" && document.body.scrollHeight) {
                    target.postMessage($('html').height(), "*");
                }
            }
            inIframe();
            iterations = 0;
            var setHeight = setInterval(function () {
                if (iterations >= 10) {
                    clearInterval(setHeight);
                }
                inIframe();
                iterations++;
            }, 500);
        });
    </script>
    <script type="text/javascript">
        //        (function () {
        //            //            var overlayElement = document.getElementById("playerDiv");
        //            document.getElementById("playerDiv").onclick = function (e) {
        //                var el = e.target;
        //                //  el.style.backgroundColor = "blue";
        //                window.setTimeout(function () {
        //                    // el.style.backgroundColor = "green";
        //                }, 750);
        //            };
        //        })();
    </script>
    <%--<script src="http://owlgraphic.com/owlcarousel/assets/js/jquery-1.9.1.min.js"></script> --%>
    <%--<script src="js/owl.carousel.min.js"></script>--%>
    <div id="bannerCounter" style="color: White; font-size: 0px;" runat="server">
    </div>
    <%} %>
    <div id="randomcampid" style="color: White; background-color: White; font-size: 0px"
        runat="server">
    </div>
</body>
</html>
