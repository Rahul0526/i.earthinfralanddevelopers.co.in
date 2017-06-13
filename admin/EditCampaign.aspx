<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditCampaign.aspx.cs"
    Inherits="admin_create_new_campaign" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="no-js sidebar-large" ng-app="demoApp">
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <title>Campaign Application</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="lib/css/nanoscroller.css" rel="stylesheet">
    <link href="assets/css/mCustomScrollbar.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/rkvLightbox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="lib/js/nanoscroller.min.js"></script>
    <%---- new Emoji -- end -----%>
    <script src="src/jquery.tagsinput.min.js" type="text/javascript"></script>
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js'></script>
    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/themes/start/jquery-ui.css" />
    <link rel="icon" href="img/Iconsmind-Outline-Flag-2.ico" type="img/Iconsmind-Outline-Flag-2.ico"
        sizes="16x16">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="" name="description" />
    <meta content="themes-lab" name="author" />
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <%--<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
        rel="stylesheet">--%>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
    <link href="assets/css/icons/icons.min.css" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/plugins.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <!-- BEGIN PAGE LEVEL STYLE -->
    <link href="assets/plugins/datetimepicker/jquery.datetimepicker.css" rel="stylesheet">
    <link href="assets/plugins/pickadate/themes/default.css" rel="stylesheet">
    <link href="assets/plugins/pickadate/themes/default.date.css" rel="stylesheet">
    <link href="assets/plugins/pickadate/themes/default.time.css" rel="stylesheet">
    <script src="assets/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <style>
        .Suspended-Btn
        {
            color: #fff !important;
            font-size: 11px !important;
            background-color: #e89c38 !important;
            line-height: 16px !important;
            text-align: center !important;
        }
        
        .Pending-Btn
        {
            color: #fff !important;
            font-size: 11px !important;
            background-color: #f40000 !important;
            line-height: 16px !important;
            text-align: center !important;
        }
        
        .Approved-Btn
        {
            color: #fff !important;
            font-size: 11px !important;
            background-color: #54ac45 !important;
            line-height: 16px !important;
            text-align: center !important;
        }
        
        .Action-wrp
        {
            background-color: #bd857b !important;
            clear: both;
            float: none;
            height: 60px;
            margin-top: 20px;
            padding: 15px 0 15px 0;
        }
        
        .ui-checkbox
        {
            float: left;
            width: 30px;
        }
        
        .carousel-inner > .item > img, .carousel-inner > .item > a > img
        {
            display: inline !important;
        }
        
        .raddiooo
        {
        }
        
        .FinalPosterUploader_preview .image-preview img
        {
            display: table;
            float: none;
            margin: auto;
            max-width: 80%;
        }
        #UpdatePanel2 > .table-responsive > div {
          display: inline-block;
          width: 100%;
          float: left;
          margin-bottom: 20px;
        }
    </style>
    <style type="text/css">
        .blankstar
        {
            background-image: url(blank_star.png);
            width: 24px;
            height: 24px;
            background-repeat: no-repeat;
        }
        
        .waitingstar
        {
            background-image: url(half_star.png);
            width: 24px;
            height: 24px;
            background-repeat: no-repeat;
        }
        
        .shiningstar
        {
            background-image: url(shining_star.png);
            width: 24px;
            height: 24px;
            background-repeat: no-repeat;
        }
    </style>
    <style>
        .ontop
        {
            z-index: 999;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            display: none;
            position: absolute;
            background-color: #cccccc;
            color: #aaaaaa; /* opacity: .4;
            filter: alpha(opacity = 50);*/
        }
        
        #popup
        {
            width: 200px;
            height: 200px;
            position: absolute;
            color: Black;
            background-color: Green; /* To align popup window at the center of screen*/
            top: 30%;
            left: 30%;
            margin-top: -100px;
            margin-left: -150px;
        }
        
        .tblPopup
        {
            background-color: #F50904;
        }
        
        .video_box
        {
            position: relative;
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
        #replay 
        {
            display: none;
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-content: center;
            text-align: center;
            background: rgba(0,0,0,0.3);
            cursor: pointer;
            }
        #replay img 
        {
            display: table;
            margin: auto;
            float: none;
        }
        #afterOverlay {display: none;}
        #DivVideo {position: relative; overflow: hidden; }
        #bannerType1_2, #bannerType2_2 {
          position: absolute;
          width: 100%;
          height: 100%;
          top: 0;
          left: 0;
        }
        #bannerType1_2 #bannerPart1_2 {
          position: absolute;
          width: 37.5%;
          height: 100%;
          top: 0;
          left: 0;
        }
        #bannerType1_2 *,
        #bannerType2_2 *{
          background-size: cover;
          background-position: center;
          background-repeat: no-repeat;
        }
        #bannerType1_2 .bannerPart2_2 {
          position: absolute;
          width: 62.5%;
          height: 100%;
          top: 0;
          right: 0;
        }
        #bannerType1_2 .bannerPart2_2 #bannerPart3_2,
        #bannerType1_2 .bannerPart2_2 #bannerPart4_2,
        #bannerType2_2 #bannerPart5_2,
        #bannerType2_2 #bannerPart6_2 {
          position: absolute;
          width: 100%;
          height: 50%;
          left: 0;
        }
        #bannerType1_2 .bannerPart2_2 #bannerPart3_2,
        #bannerType2_2 #bannerPart5_2 {
          top: 0;
        }
        #bannerType1_2 .bannerPart2_2 #bannerPart4_2,
        #bannerType2_2 #bannerPart6_2 {
          bottom: 0;
        }
        #playButton 
        {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 9;    
        }
        #playVideo {
          position: absolute;
          overflow: hidden;
          width: 23%;
          border-radius: 100%;
          background-size: contain;
          background-position: center;
          background-repeat: no-repeat;
          cursor: pointer;
        }
        #playVideo:before {
          content: "";
          float: left;
          width: 100%;
          padding-top: 100%;
        }
        #playVideo.bigBottomLeft {
          background-image: url('img/bigplaybutton.png');
          left: 7px;
          bottom: 3px;
        }
        #playVideo.bigCenter {
          background-image: url('img/bigplaybutton.png');
          left: 50%;
          top: calc(50% + 4px);
          transform: translateX(-50%) translateY(-50%);
        }
        #playVideo.smallBottomRight {
          background-image: url('img/smallplaybutton.png');
          right: -2px;
          bottom: -4px;
        }
        .bannerSelectors input { pointer-events: none; opacity: 0.3; }
        
        input[type="file"] {
            cursor: pointer;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.2.8/jquery.form-validator.min.js"
        type="text/javascript">
    </script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#sale_1').selectpicker();
            $('#ddOs').selectpicker();
            $('#selectCity').selectpicker();
            $('#selectISP').selectpicker();
            $('#ddlAgeRange').selectpicker();
            $('#ddlGender').selectpicker();
            $('#ddlInterestCategories').selectpicker();
            $('#videoButton').selectpicker();

            //document.getElementById('divAgeRange').style.display = 'none';
            //document.getElementById('divAudience').style.display = 'none';
            //document.getElementById('divGender').style.display = 'none';
            $('.bootstrap-select').on('click', function (e) {
                $('.bootstrap-select').toggleClass("open"); //you can list several class names 
                e.preventDefault();
            });
            $('#inputid').bind('rating.change', function (event, value, caption) {
                alert(value);
            });
        });



        function abc(action, value) {
            $('#input-id').rating(action, value);
        }

        function pop(div) {
            document.getElementById(div).style.display = 'block';
        }
        function hide(div) {
            document.getElementById(div).style.display = 'none';
        }
        //To detect escape button
        document.onkeydown = function (evt) {
            evt = evt || window.event;
            if (evt.keyCode == 27) {
                hide('popDiv');
            }
        };
    </script>
    <script>
        function showhideCTA(a) {
            if (a == "1") {
                action_button_banner2.style.display = "block";

                document.getElementById("ddstars").disabled = false;


                document.getElementById('strRatingBanner2').style.display = "block";
                document.getElementById('hdnfShowHideBanner2').value = "1";
            }
            else if (a == "2") {
                action_button_banner2.style.display = "none";
                document.getElementById("ddstars").disabled = true;
                document.getElementById('strRatingBanner2').style.display = "none";
                document.getElementById('hdnfShowHideBanner2').value = "0";
            }
            else {
                action_button_banner2.style.display = "block";
                document.getElementById("ddstars").disabled = false;
                document.getElementById('strRatingBanner2').style.display = "block";
                document.getElementById('hdnfShowHideBanner2').value = "1";
            }
        }
    </script>
    <script src="js/Emoji.js" type="text/javascript"></script>
    <script src="js/KeyPressEvents.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="js/jquery.tagsinput.css" />
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js'></script>
    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/themes/start/jquery-ui.css" />
</head>
<body data-page="dashboard" ng-controller="emojiController">
    <form id="myform" name="myform" runat="server">
    <div>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#sidebar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a id="menu-medium" class="sidebar-toggle tooltips">
                            <i class="fa fa-outdent"></i>
                        </a>
                        <a class="navbar-brand" href="#"></a>
                    </div>
                    <div class="navbar-center"></div>
                    <div class="navbar-collapse collapse">
                        
                        <ul class="nav navbar-nav pull-right header-menu">
                          
                            <li class="dropdown" id="Li1">
                        <a href="#" class="dropdown-toggle c-white" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <img src="assets/img/avatars/avatar2.png" alt="user avatar" width="30" class="p-r-5">
                            <span class="username">Admin</span>
                            <i class="fa fa-angle-down p-r-10"></i>
                        </a>
                        <ul class="dropdown-menu">
                           
                          
                           <li>
                                        <a href="update_Details.aspx">
                                            <i class="fa fa-user"></i>My Profile
                                        </a>
                                    </li>
                                    <li>
                                        <a href="change_password_afilaite.aspx">
                                            <i class="fa fa-cog"></i>Account Settings
                                        </a>
                                    </li>
                                    <li class="dropdown-footer clearfix">
                                            <i class="fa fa-power-off"></i><asp:LinkButton ID="lnkLogout" 
                                            runat="server" onclick="lnkLogout_Click" CausesValidation="false">Logout</asp:LinkButton>
                                    </li>
                        </ul>
                    </li>
                            
                        </ul>
                      
                    </div>
                </div>
            </nav>
        <div id="wrapper">
            <!-- BEGIN MAIN SIDEBAR -->
            <nav id="sidebar">

                    <div id="main-menu">
                       <ul class="sidebar-nav">
                    <li class="current">
                        <a href="PostbackPage_Admin.aspx"><i class="fa fa-dashboard"></i><span class="sidebar-text">PostBack Page</span></a>
                    </li>
                    <li>
                        <a href="create_new_campaign.aspx"><i class="fa fa-flag-o"></i><span class="sidebar-text">Manage Campaign</span>
                        <span class="fa arrow"></span><span class="label label-danger pull-right m-r-20 w-300">New</span></a>
                      
                    </li>
                      <li>
                        <a href="Start_stop_campaign.aspx" ><i class="fa fa-lock"></i><span class="sidebar-text">Start/Stop Campaign</span><span class="fa arrow"></span></a>
                    </li>
                    <li>
                        <a href="Affiliate_login_details.aspx" ><i class="fa fa-lock"></i><span class="sidebar-text">Affiliate Login</span><span class="fa arrow"></span></a>
                    </li>
                     <li>
                        <a href="Affiliate_ctr.aspx" ><i class="fa fa-lock"></i><span class="sidebar-text">Affiliate ctr</span><span class="fa arrow"></span></a>
                    </li>
                     <li>
                        <a href="Payment.aspx" ><i class="fa fa-flag-o"></i><span class="sidebar-text">Payment</span><span class="fa arrow"></span></a>
                    </li>
                    <li>
                        <a href="Chart_view_admin.aspx" ><i class="fa fa-flag-o"></i><span class="sidebar-text">Chart View(All Affiliate)</span><span class="fa arrow"></span></a>
                    </li>
                    <li>
                        <a href="DataAnalytics.aspx" ><i class="fa fa-flag-o"></i><span class="sidebar-text">Data Analytics</span><span class="fa arrow"></span></a>
                    </li>
                     <li>
                        <a href="BackEndReport.aspx" ><i class="fa fa-flag-o"></i><span class="sidebar-text">Backend Report</span><span class="fa arrow"></span></a>
                    </li>
                    <li>
                        <a href="Approvals.aspx" ><i class="fa fa-flag-o"></i><span class="sidebar-text">Website Approval</span><span class="fa arrow"></span></a>
                    </li>
                      <li>
                        <a href="SearchClickIdDetails.aspx" ><i class="fa fa-flag-o"></i><span class="sidebar-text">Search Click Id</span><span class="fa arrow"></span></a>
                    </li>
                      <li>
                        <a href="JsTagGenrator.aspx" ><i class="fa fa-flag-o"></i><span class="sidebar-text">Create Js Tags</span><span class="fa arrow"></span></a>
                    </li>
                    <li>
                        <a href="GenerateHtml.aspx"><i class="fa fa-flag-o"></i><span class="sidebar-text">Generate HTML page</span><span class="fa arrow"></span></a>
                    </li>
                    <li>
                        <a href="blackListIpISP.aspx" ><i class="fa fa-flag-o"></i><span class="sidebar-text">IP/ISP Blacklist</span><span class="fa arrow"></span></a>
                    </li>
                    <li>
                        <a href="blockCampForWeb.aspx"><i class="fa fa-flag-o"></i><span class="sidebar-text">Block website</span><span class="fa arrow"></span></a>
                    </li>
                </ul>
                    </div>
                </nav>
            <div id="main-content" class="dashboard">
                <div class="bg-white row m-0">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div style="height: 65px;">
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="col-md-4 col-sm-12 col-xs-12 table-responsive" style="overflow-x: hidden;">
                                        <h4>Create/edit campaign</h4>
                                        <div>
                                            <h5>
                                                Campaign name</h5>
                                            <input type="text" id="txt_camp_name" runat="server" maxlength="50" class="form-control" placeholder="Campaign Name" />
                                        </div>
                                        <div id="divchooseCallToAct">
                                            <br />
                                            <select id="show" class="form-control" onchange="showhideCTA(this.value)">
                                                <option value="0">-handle call to action-</option>
                                                <option value="1">show call To action</option>
                                                <option value="2">hide call to action</option>
                                            </select>
                                        </div>
                                        <div id="divBannerTitle">
                                            <h5>
                                                Title
                                            </h5>
                                            <input type="text" id="txt_titlebanner1" maxlength="25" onkeypress="javascript:OnChangetxt(this.value)"
                                                class="form-control" placeholder="Title  banner 1 " style="display: block" />
                                            <input type="text" id="txt_TitleBanner2" maxlength="50" onkeypress="javascript:BannerTitle2(this.value)"
                                                class="form-control" placeholder="Title  banner 2 " style="display: none" />
                                            <input type="text" id="txt_titleBanner3" maxlength="50" onkeypress="javascript:BannerTitle3(this.value)"
                                                class="form-control" placeholder="Title  banner  3" style="display: none" />
                                            <input type="text" id="txt_titleBanner4" maxlength="25" onkeypress="javascript:OnChangetxtBanner4(this.value)"
                                                class="form-control" placeholder="Title  banner 4 " style="display: none" />
                                            <input type="text" id="txtTitleVideo" maxlength="25" class="form-control" placeholder="Title  video"
                                                style="display: none" />
                                        </div>
                                        <script>
                                            function OnChangetxt(val) {
                                                document.getElementById('title_banner1').innerText = val;
                                            }
                                            function OnChangetxtBanner4(val) {
                                                document.getElementById('title_banner_5').innerText = val;
                                            }
                                            function BannerTitle2(val) {
                                                document.getElementById('title_banner2').innerText = val;
                                            }
                                            function BannerTitle3(val) {
                                                document.getElementById('title_banner4').innerText = val;
                                            }

                                        </script>
                                        <div id="divDescription">
                                            <h5>
                                                Description</h5>
                                            <div emoji-form emoji-message="emojiMessage" style="height: 100px; position: relative;">
                                                <textarea class="form-control textarea-control" maxlength="150" style="height: 78px;
                                                    width: 80%" ng-model="emojiMessage.messagetext" placeholder="Description with emoji  input"
                                                    id="messageInput" data-emojiable="true"></textarea>
                                                <div>
                                                    <%--<div style="width: 50px; float: left;">
                                                        <button id="emojibtn">
                                                            <img src="img/blank.gif" class="img" style="display: inline-block; width: 20px; height: 20px;
                                                                background: url('img/emojisprite_0.png') -120px 0px no-repeat; background-size: 540px 140px;"
                                                                alt=":heart_eyes:">
                                                        </button>
                                                         <input  type="button" value="Emo" id="emojibtn" style="color:White" />
                                                    </div>--%>
                                                    <div id="charCount" style="width: 30px; float: left;">
                                                        150
                                                    </div>
                                                    <div style="width: 50px; float: left;">
                                                        remaining...
                                                    </div>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <h5>
                                                <span id="urlspan" runat="server">Action URL</span></h5>
                                            <input type="text" id="txt_camp_url" runat="server" class="form-control" placeholder="URL" />
                                        </div>
                                        <div id="divVideoLinkUrl">
                                            <h5>
                                                <span id="Span1" runat="server">Video URL</span></h5>
                                            <input type="text" id="vedio_url_link" runat="server" class="form-control" placeholder="Vedio Link URL" />
                                        </div>
                                        <div id="divCallToAction">
                                            <h5>
                                                Call to Action</h5>
                                            <input type="text" id="txt_camp_call_To_Action" runat="server" maxlength="11" class="form-control"
                                                placeholder="Call In Action" />
                                            <asp:HiddenField ID="hdnfShowHideBanner2" Value="1" runat="server" />
                                        </div>
                                        <div id="div1">
                                            <h5>
                                                Type Of Targeting</h5>
                                            <select id="ddlTypeTarget" class="form-control" onchange="SetTypeTarget(this.value)">
                                                <option value="0">All</option>
                                                <option value="1">Keywords</option>
                                                <option value="2">Cookies</option>
                                                <option value="3">Age Range</option>
                                                <option value="4">Gender</option>
                                                <option value="5">Audience Interest</option>
                                            </select>
                                            <asp:HiddenField ID="HdnfTypeOfTargeting" Value="All" runat="server" />
                                        </div>
                                        <div id="divMaxImpression">
                                            <h5>
                                                Maximum impression
                                            </h5>
                                            <input type="text" id="txtMaxImpressions" maxlength="25" class="form-control" placeholder="Maximum impressions During Cookie Tag"
                                                style="display: block" />
                                        </div>
                                        <div id="divAgeRange">
                                            <h5>
                                                Age Range
                                            </h5>
                                            <select name="ddlAgeRange" id="ddlAgeRange" size="4" tabindex="1" class="form-control"
                                                multiple>
                                                <option value="1">A. 18-24</option>
                                                <option value="2">B. 25-34</option>
                                                <option value="3">C. 35-44</option>
                                                <option value="4">D. 45-54</option>
                                                <option value="5">E. 55-64</option>
                                                <option value="6">F. 65+</option>
                                            </select>
                                        </div>
                                        <div id="divGender">
                                            <h5>
                                                Gender
                                            </h5>
                                            <select name="ddlGender" id="ddlGender" size="4" tabindex="1" class="form-control"
                                                single>
                                                <option value="">--Select--</option>
                                                <option value="1">Male</option>
                                                <option value="2">Female</option>
                                            </select>
                                        </div>
                                        <div id="divAudience">
                                            <h5>
                                                Audience
                                            </h5>
                                            <%--<input type="text" id="Text3" maxlength="25"
                                                    class="form-control" placeholder="Maximum impressions During Cookie Tag" style="display: block" />--%>
                                            <select name="ddlInterestCategories" id="ddlInterestCategories" size="4" tabindex="1"
                                                class="form-control" multiple>
                                                <option value="1">Auto Shoppers</option>
                                                <option value="2">Boat Shoppers</option>
                                                <option value="3">Ticket Shoppers</option>
                                                <option value="4">Designer Shoppers</option>
                                                <option value="5">Fashion & Style Lovers</option>
                                                <option value="6">Hair & Makeup Shoppers</option>
                                                <option value="7">Medical Supplies Shoppers</option>
                                                <option value="8">Investment Seekers</option>
                                                <option value="9">Insurance Seekers </option>
                                                <option value="10">Loan Seekers </option>
                                                <option value="11">Apartment Seekers </option>
                                                <option value="12">Home Seekers </option>
                                                <option value="13">Auction Shoppers </option>
                                                <option value="14">Avid Shoppers </option>
                                                <option value="15">Bargain Shoppers</option>
                                                <option value="16">Catalog Shoppers </option>
                                                <option value="17">Children Products</option>
                                                <option value="18">Coupon Shoppers </option>
                                                <option value="19">Department Store Shoppers </option>
                                                <option value="20">Flower Shoppers </option>
                                                <option value="21">Health & Beauty Shoppers</option>
                                                <option value="22">Home Furnishing & Accessories Shoppers </option>
                                                <option value="23">Jewelry Shoppers </option>
                                                <option value="24">Apparel Shoppers </option>
                                                <option value="25">Retail and In-Store Buyers </option>
                                                <option value="26">Shoppers </option>
                                                <option value="27">Computer Shoppers </option>
                                                <option value="28">Tech & Gadget Shoppers </option>
                                                <option value="29">Wireless Products Buyers </option>
                                                <option value="30">Electronic Shoppers </option>
                                                <option value="31">Flight Shoppers </option>
                                                <option value="32">Hotel Shoppers </option>
                                                <option value="33">Cruise Shoppers </option>
                                                <option value="34">Vacation Shoppers </option>
                                                <option value="35">Rental Car Shoppers</option>
                                                <option value="36">Business Professionals</option>
                                                <option value="37">Job Seekers </option>
                                                <option value="38">Small Business Owners </option>
                                                <option value="39">College Students </option>
                                                <option value="40">Empty Nester </option>
                                                <option value="41">New Parents </option>
                                                <option value="42">Parents to Be </option>
                                                <option value="43">Pet Owners </option>
                                                <option value="44">Dog Owners </option>
                                                <option value="45">Cat Owners </option>
                                                <option value="46">High Net Worth Individuals </option>
                                                <option value="47">Brides to be</option>
                                                <option value="48">Married </option>
                                                <option value="49">Singles </option>
                                                <option value="50">Home Owners</option>
                                                <option value="51">Apartment Renters</option>
                                                <option value="52">Movers </option>
                                                <option value="53">Readers</option>
                                                <option value="54">Collectors </option>
                                                <option value="55">Movie Lovers </option>
                                                <option value="56">Online Streamers </option>
                                                <option value="57">Music Lovers </option>
                                                <option value="58">Photo & Video Enthusiasts </option>
                                                <option value="59">Science Enthusiasts </option>
                                                <option value="60">Theater Lovers </option>
                                                <option value="61">Art & Craft Lovers</option>
                                                <option value="62">Boat Owners </option>
                                                <option value="63">DIY Auto </option>
                                                <option value="64">Vehicle Owners </option>
                                                <option value="65">Auto Enthusiasts </option>
                                                <option value="67">Green Living </option>
                                                <option value="68">Active Investors </option>
                                                <option value="69">Credit Card Owners </option>
                                                <option value="70">Insurance Owners </option>
                                                <option value="71">Mobile Banking Users </option>
                                                <option value="72">Mobile Payment Users </option>
                                                <option value="73">Casual Investors</option>
                                                <option value="74">Coffee Enthusisats </option>
                                                <option value="75">Cooking Enthusiasts </option>
                                                <option value="76">Foodies</option>
                                                <option value="77">Natural Food Enthusiasts </option>
                                                <option value="78">Card & Board Gamers </option>
                                                <option value="79">Sweepstakes & Contest Seekers </option>
                                                <option value="80">Computer & Video Gamers </option>
                                                <option value="81">IT Decision Makers (Cloud, Office Hardware, Software) </option>
                                                <option value="82">Fitness Enthusiasts </option>
                                                <option value="83">Dieters </option>
                                                <option value="84">Gardeners</option>
                                                <option value="85">Home Improvement Enthusiasts </option>
                                                <option value="86">Car Sharers </option>
                                                <option value="87">Religious and Inspirational </option>
                                                <option value="88">Baseball Fans</option>
                                                <option value="89">Basketball Fans </option>
                                                <option value="90">Golf Fans </option>
                                                <option value="91">Camping Enthusiasts </option>
                                                <option value="92">College Sports Fans </option>
                                                <option value="93">Fishing Enthusiasts </option>
                                                <option value="94">Football Fans </option>
                                                <option value="95">Hockey Fans </option>
                                                <option value="96">Hunting Enthusiasts </option>
                                                <option value="97">Motocycle Enthusiasts </option>
                                                <option value="98">Outdoor Enthusiasts </option>
                                                <option value="99">Ski & Snowboard Enthusiasts </option>
                                                <option value="100">Soccer Fans </option>
                                                <option value="101">Sports Fans </option>
                                                <option value="102">Tennis Lovers </option>
                                                <option value="103">Charity Donors </option>
                                                <option value="104">Political Junkies </option>
                                                <option value="105">High Tech Living </option>
                                                <option value="106">Tech & Gadget Enthusiasts </option>
                                                <option value="107">Vacationers </option>
                                                <option value="108">Nightlife Lovers</option>
                                            </select>
                                        </div>
                                        <div id="divKeyWords">
                                            <h5>
                                                keywords</h5>
                                            <input type="text" id="txtKeyWords" runat="server" class="form-control" placeholder="Keyword1,keyword2,keyword3,..." />
                                        </div>
                                        <div id="divPlayBtn">
                                            <h5>
                                                <span>Play Button</span>
                                            </h5>
                                            <select name="" id="videoButton" runat="server" class="form-control">
                                                <option value="">--Select--</option>
                                                <option value="bigBottomLeft">Big play button corner left</option>
                                                <option value="bigCenter">Big play button at the center</option>
                                                <option value="smallBottomRight">Small play button at the right corner</option>
                                            </select>
                                            &nbsp;
                                            <asp:HiddenField ID="videoPlayButton" runat="server" />
                                            <div class=" col-sm-4">
                                            </div>
                                            <div class=" clearfix">
                                            </div>
                                        </div>
                                        <div id="DivAdImage">
                                            <h5>
                                                <span id="spnUploader1">Upload Ad Image</span>
                                            </h5>
                                            <div class="">
                                                <input type="file" id="FileUpload1" runat="server" onchange="validateImg1()" class="form-control" />
                                                &nbsp;
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div id="DivIcon">
                                            <h5>
                                                <span id="spnUploader2">Upload Icon</span>
                                            </h5>
                                            <div class="">
                                                <input type="file" id="FileUpload2" onchange="validateImg2()" class="form-control" />
                                                &nbsp;
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div id="DivPoster1">
                                            <h5>
                                                <span id="Span2">Poster</span>
                                            </h5>
                                            <div class="">
                                                <input type="file" id="PosterUploader" runat="server" class="form-control" />
                                                &nbsp;
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div id="diVFinalPoster">
                                            <h5>
                                                <span id="Span3">Final Poster</span>
                                            </h5>
                                            <div class="">
                                                <div class=" col-sm-12">
                                                    <%--<input type="file" id="FinalPosterUploader" runat="server" class="btn btn-primary" />--%>&nbsp;
                                                    <div class="createPoster">
                                                        Create Poster</div>
                                                </div>
                                                <div class=" col-sm-4">
                                                </div>
                                                <%--<div class="col-sm-12 FinalPosterUploader_preview" style="display: none">
                                                    <div class="image-preview">
                                                        <img src="#" alt="Alternate Text"/>
                                                    </div>
                                                    <select class="input input-dropdown form-control" id="FinalAnimation" runat="server">
                                                        <option value="bounce">bounce</option>
                                                        <option value="flash">flash</option>
                                                        <option value="pulse">pulse</option>
                                                        <option value="rubberBand">rubberBand</option>
                                                        <option value="shake">shake</option>
                                                        <option value="swing">swing</option>
                                                        <option value="tada">tada</option>
                                                        <option value="wobble">wobble</option>
                                                        <option value="jello">jello</option>
                                                        <option value="bounceIn">bounceIn</option>
                                                        <option value="bounceInDown">bounceInDown</option>
                                                        <option value="bounceInLeft">bounceInLeft</option>
                                                        <option value="bounceInRight">bounceInRight</option>
                                                        <option value="bounceInUp">bounceInUp</option>
                                                        <option value="fadeIn">fadeIn</option>
                                                        <option value="fadeInDown">fadeInDown</option>
                                                        <option value="fadeInDownBig">fadeInDownBig</option>
                                                        <option value="fadeInLeft">fadeInLeft</option>
                                                        <option value="fadeInLeftBig">fadeInLeftBig</option>
                                                        <option value="fadeInRight">fadeInRight</option>
                                                        <option value="fadeInRightBig">fadeInRightBig</option>
                                                        <option value="fadeInUp">fadeInUp</option>
                                                        <option value="fadeInUpBig">fadeInUpBig</option>
                                                        <option value="flip">flip</option>
                                                        <option value="flipInX">flipInX</option>
                                                        <option value="flipInY">flipInY</option>
                                                        <option value="lightSpeedIn">lightSpeedIn</option>
                                                        <option value="rotateIn">rotateIn</option>
                                                        <option value="rotateInDownLeft">rotateInDownLeft</option>
                                                        <option value="rotateInDownRight">rotateInDownRight</option>
                                                        <option value="rotateInUpLeft">rotateInUpLeft</option>
                                                        <option value="rotateInUpRight">rotateInUpRight</option>
                                                        <option value="slideInUp">slideInUp</option>
                                                        <option value="slideInDown">slideInDown</option>
                                                        <option value="slideInLeft">slideInLeft</option>
                                                        <option value="slideInRight">slideInRight</option>
                                                        <option value="zoomIn">zoomIn</option>
                                                        <option value="zoomInDown">zoomInDown</option>
                                                        <option value="zoomInLeft">zoomInLeft</option>
                                                        <option value="zoomInRight">zoomInRight</option>
                                                        <option value="zoomInUp">zoomInUp</option>
                                                        <option value="hinge">hinge</option>
                                                        <option value="rollIn">rollIn</option>
                                                    </select>
                                                </div>--%>
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div id="divposter" style="display: none;">
                                            <h5>
                                                <span id="spnUploader3">Poster With PlayButton</span>
                                            </h5>
                                            <div class="">
                                                <input type="file" id="FileUpload3" runat="server" class="form-control" />
                                                &nbsp;
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <h5>
                                                Devices &amp; OS
                                            </h5>
                                            <div>
                                                <select name="ddlOs" id="ddOs" runat="server" size="7" tabindex="1" class="form-control" multiple>
                                                    <option value="Windows Mobile">Windows Mobile</option>
                                                    <option value="ios">ios</option>
                                                    <option value="ipad">ipad</option>
                                                    <option value="ipod">ipod</option>
                                                    <option value="Android">Android</option>
                                                </select>
                                            </div>
                                            <div style="display: none">
                                                <div class="col-sm-2 col-xs-2">
                                                    <input type="checkbox" onclick="os();" id="os_1" />
                                                </div>
                                                <div class="col-sm-2 col-xs-5" style="margin-top: 12px;">
                                                    <span id="win">Windows</span>
                                                </div>
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                            <div style="display: none">
                                                <div class="col-sm-2 col-xs-2">
                                                    <input type="checkbox" id="os2" onclick="os()" />
                                                </div>
                                                <div class="col-sm-9 col-xs-8" style="margin-top: 12px;">
                                                    <span id="app">Apple</span>
                                                </div>
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                            <div style="display: none">
                                                <div class="col-sm-2 col-xs-2">
                                                    <input type="checkbox" id="os3" onclick="os()" />
                                                </div>
                                                <div class="col-sm-9 col-xs-8" style="margin-top: 12px;">
                                                    <span id="blackberry">Blackberry</span>
                                                </div>
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                            <div style="display: none">
                                                <div class="col-sm-2 col-xs-2">
                                                    <input type="checkbox" id="os4" onclick="os()" />
                                                </div>
                                                <div class="col-sm-9 col-xs-8" style="margin-top: 12px;">
                                                    <span id="ipad">ipad</span>
                                                </div>
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                            <div style="display: none">
                                                <div class="col-sm-2 col-xs-2">
                                                    <input type="checkbox" id="os5" onclick="os()" />
                                                </div>
                                                <div class="col-sm-9 col-xs-8" style="margin-top: 12px;">
                                                    <span id="ipod">ipod</span>
                                                </div>
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                            <div style="display: none">
                                                <div class="col-sm-2 col-xs-2">
                                                    <input type="checkbox" id="os6" onclick="os()" />
                                                </div>
                                                <div class="col-sm-9 col-xs-8" style="margin-top: 12px;">
                                                    <span id="Android">Android</span>
                                                </div>
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class=" col-md-4 col-sm-12 col-xs-12" style="float: right;">
                                        <%-- banner 1 start--%>
                                        <div class="card" runat="server" id="banner1" style="display: block; width: 300px;">
                                            <div class="Sponsored-3" runat="server" id="sponsore_banner1" checked="checked">
                                                Sponsored
                                            </div>
                                            <div class="title-container">
                                                <div class="col-xs-2 card-icon">
                                                    <img src="img/madicon.jpg" style="height: 50px; width: 50px" runat="server" id="icon_img_banner1"
                                                        alt="banner-img" class="" />
                                                </div>
                                                <!--card-icon-->
                                                <div class="col-xs-10">
                                                    <div class="title title_banner" runat="server" id="title_banner1" style="padding-top: 1px;">
                                                        Mad Max 4 : Fury Road
                                                    </div>
                                                    <div class="Rating">
                                                        <img src="img/rating.png" runat="server" id="rate_img_1_banner1" alt="banner-img"
                                                            class="img-responsive" />
                                                        <img src="img/rating.png" runat="server" id="rate_img_2_banner1" alt="banner-img"
                                                            class="img-responsive" />
                                                        <img src="img/rating.png" runat="server" id="rate_img_3_banner1" alt="banner-img"
                                                            class="img-responsive" />
                                                        <img src="img/rating.png" runat="server" id="rate_img_4_banner1" alt="banner-img"
                                                            class="img-responsive" />
                                                        <img src="img/rating.png" runat="server" id="rate_img_5_banner1" alt="banner-img"
                                                            class="img-responsive" />
                                                    </div>
                                                </div>
                                                <!--add-heading-->
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                            <!--title-container-->
                                            <div class="card-description discription_banner" runat="server" id="discription_banner1">
                                                From director George Miller, originator of the post-apocalyptic genre and mastermind<img
                                                    src="Emoticons/bob.gif" />
                                                behind the legendary “Mad Max” franchise
                                            </div>
                                            <!--card-description-->
                                            <div class="card-banner">
                                                <img src="img/mad max1.jpg" runat="server" id="banner_img_banner1" alt="banner-img"
                                                    class="img-responsive" />
                                            </div>
                                            <!--add-banner-->
                                            <div id="banner1_id" runat="server" style="font-size: 1pt">
                                            </div>
                                            <div class="install-btn">
                                                <a runat="server" id="install_link_banner1" href="#" target="_blank" onclick="click_1()">
                                                    <span id="lnk_banner1" class="lnk_banner">Download</span></a>
                                            </div>
                                            <!--install-btn-->
                                        </div>
                                        <!--card-->
                                        <%-- banner 1 close--%>
                                        <!--<div style="height:100px;"></div>-->
                                        <%-- banner 2 start--%>
                                        <div class="card banner2-wrp2-p" runat="server" id="banner2" style="display: none; width: 300px;">
                                            <div class="title-container">
                                                <div class="card-icon" style="float: left; display; inline-block; width: 25%; width: calc(75px)">
                                                    <img src="img/card2-icon.png" style="" runat="server" id="icon_img_banner2" alt="banner-img"
                                                        class="banner2-img-box" />
                                                </div>
                                                <!--card-icon-->
                                                <div style="float: left; padding: 2px 0 0; width: 55%; width: calc(100% - 130px)">
                                                    <div class="title title_banner" runat="server" id="title_banner2">
                                                        Lorem Ipsum
                                                    </div>
                                                    <div class="Rating" id="strRatingBanner2">
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
                                                    <div runat="server" style="color: #ccc; margin-top: -4px;" id="sponsore_banner2">
                                                        Sponsored
                                                    </div>
                                                    <div class=" clearfix">
                                                    </div>
                                                </div>
                                                <!--add-heading-->
                                                <div style="float: right;" runat="server"
                                                    id="action_button_banner2">
                                                    <a href="#" target="_blank" runat="server" id="install_link_banner2" style="width: 50px; height: 50px; display: flex; flex-direction: column; justify-content: center; align-content: center; text-align: center; border-radius: 5px; border: 1px solid green; color: green; margin: 10px 5px 0 0;"><span id="lnk_banner2"
                                                        class="lnk_banner">Install</span></a>
                                                </div>
                                                <div id="banner_2_id" runat="server" style="font-size: 1pt">
                                                </div>
                                                <div id="os_allowed_banner2" runat="server" style="font-size: 1pt">
                                                </div>
                                                <div id="sites_allow_banner2" runat="server" style="font-size: 1pt">
                                                </div>
                                                <!--install-btn-->
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                            <!--title-container-->
                                        </div>
                                        <!--card-->
                                        <%-- banner 2 close--%>
                                        <!--<div style="height:100px;"></div>-->
                                        <%-- banner 3 start--%>
                                        <div class="card" id="banner3" runat="server" style="display: none; width: 300px;">
                                            <div class="Sponsored-3" runat="server" id="sponsore_banner3">
                                                Sponsored
                                            </div>
                                            <div class="title2 title_banner " runat="server" id="title_banner3">
                                                Show Me What A True Hero Looks Like
                                            </div>
                                            <!--title-->
                                            <div class="card-banner">
                                                <img src="img/banner-img2.jpg" runat="server" id="image_banner3" alt="banner-img"
                                                    class="img-responsive" />
                                            </div>
                                            <!--add-banner-->
                                            <div class="title-container">
                                                <div class="col-xs-2 card-icon">
                                                    <img src="img/add-icon.jpg" runat="server" id="icon_img_banner3" alt="banner-img"
                                                        class="col-xs-2 card-icon" />
                                                </div>
                                                <!--card-icon-->
                                                <div class="col-xs-6">
                                                    <div class="title title_banner" runat="server" id="mini_title_banner3">
                                                        Lorem Ipsum
                                                    </div>
                                                    <div class="Rating">
                                                        <img src="img/rating.png" runat="server" id="star_img_1_banner3" alt="banner-img"
                                                            class="img-responsive" />
                                                        <img src="img/rating.png" runat="server" id="star_img_2_banner3" alt="banner-img"
                                                            class="img-responsive" />
                                                        <img src="img/rating.png" runat="server" id="star_img_3_banner3" alt="banner-img"
                                                            class="img-responsive" />
                                                        <img src="img/rating.png" runat="server" id="star_img_4_banner3" alt="banner-img"
                                                            class="img-responsive" />
                                                        <img src="img/rating.png" runat="server" id="star_img_5_banner3" alt="banner-img"
                                                            class="img-responsive" />
                                                    </div>
                                                </div>
                                                <!--add-heading-->
                                                <div id="banner_3_id" runat="server" style="font-size: 1pt">
                                                </div>
                                                <div class="col-xs-4 install-btn3">
                                                    <a href="#" target="_blank" onclick="click_1()" runat="server" id="install_link_banner3">
                                                        <span id="lnk_banner3" class="lnk_banner">INSTALL</span></a>
                                                </div>
                                                <!--install-btn-->
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                            <!--title-container-->
                                        </div>
                                        <!--card-->
                                        <%-- banner 3 close--%>
                                        <!--<div style="height:100px;"></div>-->
                                        <%-- banner 4 start--%>
                                        <div class="card" id="banner4" runat="server" style="display: none; width: 300px;">
                                            <div class="Sponsored-3" runat="server" id="sponsers_banner4">
                                                Sponsored
                                            </div>
                                            <div class="card-banner">
                                                <center>
                                                    <img src="img/coc.jpeg" runat="server" id="image_banner_4" style="width: 100%" alt="banner-img"
                                                        class="img-responsive" /></center>
                                            </div>
                                            <!--add-banner-->
                                            <div class="title2 title_banner" runat="server" id="title_banner4" style="padding-top: 21px;">
                                                Clash Of Clan - Multiplayer
                                            </div>
                                            <div class="card-description discription_banner" runat="server" id="discription_banner4">
                                                Clash of Clan dummy text of the printing and typesetting industry.Lorem Ipsum is
                                                simply dummy text of the printing and typesetting industry.
                                            </div>
                                            <!--card-description-->
                                            <div id="banner_4_id" runat="server" style="font-size: 1pt">
                                            </div>
                                        </div>
                                        <!--card-->
                                        <%-- banner 4 close--%>
                                        <!--<div style="height:100px;"></div>-->
                                        <%-- banner 5 start--%>
                                        <div class="card" runat="server" id="banner5" style="display: none; width: 300px;">
                                            <div class="Sponsored-3" runat="server" id="sponserese_banner_5">
                                                Sponsored
                                            </div>
                                            <div class="title-container">
                                                <div class="col-xs-2 card-icon">
                                                    <img style="height: 50px; width: 50px" runat="server" id="icon_image_banner_5" src="img/card2-icon.png"
                                                        alt="banner-img" class="">
                                                </div>
                                                <!--card-icon-->
                                                <div class="col-xs-10">
                                                    <div class="title title_banner" runat="server" id="title_banner_5">
                                                        Show Me What A True Hero
                                                    </div>
                                                    <div class="card-description discription_banner" runat="server" id="discription_banner_5">
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                                    </div>
                                                    <!--card-description-->
                                                </div>
                                                <!--add-heading-->
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                            <!--title-container-->
                                            <div class="col-xs-4 install-btn5 pull-right">
                                                <a href="#" target="_blank" onclick="click_1()" runat="server" id="install_link_banner5">
                                                    <span id="lnk_banner5" class="lnk_banner">INSTALL</span></a>
                                            </div>
                                            <!--install-btn-->
                                            <div class=" clearfix">
                                            </div>
                                            <div id="banner_5_id" runat="server" style="font-size: 1pt">
                                            </div>
                                            <div class="brd">
                                            </div>
                                        </div>
                                        <!--card-->
                                        <%-- banner 5 close--%>
                                        <!--<div style="height:100px;"></div>-->
                                        <%-- banner 6 start--%>
                                        <div class="card" runat="server" id="banner6" style="display: none; width: 300px;">
                                            <div class="Sponsored-3" runat="server" id="sponserese_banner6">
                                                Sponsored
                                            </div>
                                            <!--card-description-->
                                            <div id="DivVideo" class="card-banner">
                                                <video runat="server" id="videoPlayer" height="180" width="100%" poster="img/windows.png">
                                                    <source  runat="server" id="s1"  src="http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4" height="240" width="100%"  type="video/mp4" />
                                                    <source runat="server" id="s2" src="movie.ogg" height="240" width="100%"  type="video/ogg" />
                                                    Your browser does not support the video tag.
                                                </video>
                                                <div id="playButton"><div id="playVideo"></div></div>
                                                <div id="afterOverlay">
                                                    <div id="bannerType1_2" runat="server" class="animateBanner overlay" style="display: none">
                                                        <div id="bannerPart1_2" runat="server">
                                                        </div>
                                                        <div class="bannerPart2_2">
                                                            <div id="bannerPart3_2" runat="server">
                                                            </div>
                                                            <div id="bannerPart4_2" runat="server">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="bannerType2_2" runat="server" class="animateBanner overlay" style="display: none">
                                                        <div id="bannerPart5_2" runat="server">
                                                        </div>
                                                        <div id="bannerPart6_2" runat="server">
                                                        </div>
                                                    </div>
                                                    <div id="replay" onclick="replay()" style="display: none;">
                                                        <img src="img/replayBtn.png" />
                                                    </div>
                                                </div>
                                            </div>

                                            <!--add-banner-->
                                            <div runat="server" id="banner_6_id" runat="server" style="font-size: 1pt">
                                            </div>
                                        </div>
                                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
                                        <script src="js/bootstrap.js"></script>
                                        <div>
                                            <h5>
                                                &nbsp;
                                            </h5>
                                            <asp:TextBox runat="server" Enabled="false" ID="TextBox1" type="text" Width="95%"
                                                Height="150px" TextMode="MultiLine" class="form-control" placeholder="Copy Ad Here"
                                                Visible="False"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                        <h5>
                                            Click for preview</h5>
                                        <div class="bannerSelectors" style="margin-bottom: 20px;">
                                            <link href="assets/css/animate.css" rel="stylesheet" />
                                            <div style="float: left; width: 70px;">
                                                <input id="chkBanner1" type="checkbox" />
                                                <input id="b1" style="color: Black" runat="server" name="groupredio" type="radio" onclick="banner1()" />
                                            </div>
                                            <div style="float: left; width: 70%; margin-top: -3px;">
                                                Banner style1
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                        <div class="bannerSelectors" style="margin-bottom: 20px;">
                                            <div style="float: left; width: 70px;">
                                                <input type="checkbox" id="chkBanner2" />
                                                <input name="groupredio" type="radio" runat="server" id="b2" style="color: Black" onclick="banner2()" />
                                            </div>
                                            <div style="float: left; width: 70%; margin-top: -3px;">
                                                Banner style2
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                        <div class="bannerSelectors" style="margin-bottom: 20px;">
                                            <div style="float: left; width: 70px;">
                                                <input type="checkbox" id="chkbsdfsdfsanner3" />
                                                <input name="groupredio" type="radio" runat="server" id="b3" style="color: Black" onclick="banner3()" />
                                            </div>
                                            <div style="float: left; width: 70%; margin-top: -3px;">
                                                Banner style3
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                        <div class="bannerSelectors" style="margin-bottom: 20px;">
                                            <div style="float: left; width: 70px;">
                                                <input type="checkbox" id="chkBafghfghnner5" />
                                                <input name="groupredio" type="radio" runat="server" id="b4" style="color: Black" onclick="banner4()" />
                                            </div>
                                            <div style="float: left; width: 70%; margin-top: -3px;">
                                                Banner style4
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                        <div class="bannerSelectors">
                                            <div style="float: left; width: 70px;">
                                                <input type="checkbox" id="ckbanfgfdggner6" /><input name="groupredio" type="radio"
                                                    id="b5" runat="server" style="color: Black" onclick="banner5()" />
                                            </div>
                                            <div style="float: left; width: 70%; margin-top: -3px;">
                                                Banner style5
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                        <div>
                                            <h5>
                                                Bid</h5>
                                            <input type="text" class="form-control" id="cost" runat="server" />
                                        </div>
                                        <div class="clearfix">
                                            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                                            </asp:ToolkitScriptManager>
                                        </div>
                                        <div style="height: 25px;">
                                        </div>
                                        <div>
                                            <div style="float: left; width: 30px;">
                                                <input name="sponser" onclick="alll()" type="radio" id="sponserse" runat="server" style="color: Black" />
                                            </div>
                                            <div style="float: left; width: 70%; margin-top: -4px; margin-left: 5px;">
                                                sponsored
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                            <div style="height: 15px;">
                                            </div>
                                        </div>
                                        <div>
                                            <div style="float: left; width: 30px;">
                                                <input name="sponser" type="radio" onclick="advv()" id="adv" runat="server" style="color: Black" />
                                            </div>
                                            <div style="float: left; width: 70%; margin-top: -4px; margin-left: 5px;">
                                                adv
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                            <div style="height: 15px;">
                                            </div>
                                            <br />
                                            <div>
                                                <h5>
                                                    Country target
                                                </h5>
                                                <div>
                                                    <select name="select2" id="sale_1" runat="server" size="7" tabindex="1" class="form-control" multiple>
                                                        <option value="United States">United States</option>
                                                        <option value="United Kingdom">United Kingdom</option>
                                                        <option value="Afghanistan">Afghanistan</option>
                                                        <option value="Albania">Albania</option>
                                                        <option value="Algeria">Algeria</option>
                                                        <option value="American Samoa">American Samoa</option>
                                                        <option value="Andorra">Andorra</option>
                                                        <option value="Angola">Angola</option>
                                                        <option value="Anguilla">Anguilla</option>
                                                        <option value="Antarctica">Antarctica</option>
                                                        <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                                                        <option value="Argentina">Argentina</option>
                                                        <option value="Armenia">Armenia</option>
                                                        <option value="Aruba">Aruba</option>
                                                        <option value="Australia">Australia</option>
                                                        <option value="Austria">Austria</option>
                                                        <option value="Azerbaijan">Azerbaijan</option>
                                                        <option value="Bahamas">Bahamas</option>
                                                        <option value="Bahrain">Bahrain</option>
                                                        <option value="Bangladesh">Bangladesh</option>
                                                        <option value="Barbados">Barbados</option>
                                                        <option value="Belarus">Belarus</option>
                                                        <option value="Belgium">Belgium</option>
                                                        <option value="Belize">Belize</option>
                                                        <option value="Benin">Benin</option>
                                                        <option value="Bermuda">Bermuda</option>
                                                        <option value="Bhutan">Bhutan</option>
                                                        <option value="Bolivia">Bolivia</option>
                                                        <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                                        <option value="Botswana">Botswana</option>
                                                        <option value="Bouvet Island">Bouvet Island</option>
                                                        <option value="Brazil">Brazil</option>
                                                        <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
                                                        <option value="Brunei Darussalam">Brunei Darussalam</option>
                                                        <option value="Bulgaria">Bulgaria</option>
                                                        <option value="Burkina Faso">Burkina Faso</option>
                                                        <option value="Burundi">Burundi</option>
                                                        <option value="Cambodia">Cambodia</option>
                                                        <option value="Cameroon">Cameroon</option>
                                                        <option value="Canada">Canada</option>
                                                        <option value="Cape Verde">Cape Verde</option>
                                                        <option value="Cayman Islands">Cayman Islands</option>
                                                        <option value="Central African Republic">Central African Republic</option>
                                                        <option value="Chad">Chad</option>
                                                        <option value="Chile">Chile</option>
                                                        <option value="China">China</option>
                                                        <option value="Christmas Island">Christmas Island</option>
                                                        <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                                                        <option value="Colombia">Colombia</option>
                                                        <option value="Comoros">Comoros</option>
                                                        <option value="Congo">Congo</option>
                                                        <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic
                                                            of The</option>
                                                        <option value="Cook Islands">Cook Islands</option>
                                                        <option value="Costa Rica">Costa Rica</option>
                                                        <option value="Cote D'ivoire">Cote D'ivoire</option>
                                                        <option value="Croatia">Croatia</option>
                                                        <option value="Cuba">Cuba</option>
                                                        <option value="Cyprus">Cyprus</option>
                                                        <option value="Czech Republic">Czech Republic</option>
                                                        <option value="Denmark">Denmark</option>
                                                        <option value="Djibouti">Djibouti</option>
                                                        <option value="Dominica">Dominica</option>
                                                        <option value="Dominican Republic">Dominican Republic</option>
                                                        <option value="Ecuador">Ecuador</option>
                                                        <option value="Egypt">Egypt</option>
                                                        <option value="El Salvador">El Salvador</option>
                                                        <option value="Equatorial Guinea">Equatorial Guinea</option>
                                                        <option value="Eritrea">Eritrea</option>
                                                        <option value="Estonia">Estonia</option>
                                                        <option value="Ethiopia">Ethiopia</option>
                                                        <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
                                                        <option value="Faroe Islands">Faroe Islands</option>
                                                        <option value="Fiji">Fiji</option>
                                                        <option value="Finland">Finland</option>
                                                        <option value="France">France</option>
                                                        <option value="French Guiana">French Guiana</option>
                                                        <option value="French Polynesia">French Polynesia</option>
                                                        <option value="French Southern Territories">French Southern Territories</option>
                                                        <option value="Gabon">Gabon</option>
                                                        <option value="Gambia">Gambia</option>
                                                        <option value="Georgia">Georgia</option>
                                                        <option value="Germany">Germany</option>
                                                        <option value="Ghana">Ghana</option>
                                                        <option value="Gibraltar">Gibraltar</option>
                                                        <option value="Greece">Greece</option>
                                                        <option value="Greenland">Greenland</option>
                                                        <option value="Grenada">Grenada</option>
                                                        <option value="Guadeloupe">Guadeloupe</option>
                                                        <option value="Guam">Guam</option>
                                                        <option value="Guatemala">Guatemala</option>
                                                        <option value="Guinea">Guinea</option>
                                                        <option value="Guinea-bissau">Guinea-bissau</option>
                                                        <option value="Guyana">Guyana</option>
                                                        <option value="Haiti">Haiti</option>
                                                        <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option>
                                                        <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
                                                        <option value="Honduras">Honduras</option>
                                                        <option value="Hong Kong">Hong Kong</option>
                                                        <option value="Hungary">Hungary</option>
                                                        <option value="Iceland">Iceland</option>
                                                        <option value="India">India</option>
                                                        <option value="Indonesia">Indonesia</option>
                                                        <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
                                                        <option value="Iraq">Iraq</option>
                                                        <option value="Ireland">Ireland</option>
                                                        <option value="Israel">Israel</option>
                                                        <option value="Italy">Italy</option>
                                                        <option value="Jamaica">Jamaica</option>
                                                        <option value="Japan">Japan</option>
                                                        <option value="Jordan">Jordan</option>
                                                        <option value="Kazakhstan">Kazakhstan</option>
                                                        <option value="Kenya">Kenya</option>
                                                        <option value="Kiribati">Kiribati</option>
                                                        <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republi
                                                            of</option>
                                                        <option value="Korea, Republic of">Korea, Republic of</option>
                                                        <option value="Kuwait">Kuwait</option>
                                                        <option value="Kyrgyzstan">Kyrgyzstan</option>
                                                        <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
                                                        <option value="Latvia">Latvia</option>
                                                        <option value="Lebanon">Lebanon</option>
                                                        <option value="Lesotho">Lesotho</option>
                                                        <option value="Liberia">Liberia</option>
                                                        <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
                                                        <option value="Liechtenstein">Liechtenstein</option>
                                                        <option value="Lithuania">Lithuania</option>
                                                        <option value="Luxembourg">Luxembourg</option>
                                                        <option value="Macao">Macao</option>
                                                        <option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav
                                                            Republic of</option>
                                                        <option value="Madagascar">Madagascar</option>
                                                        <option value="Malawi">Malawi</option>
                                                        <option value="Malaysia">Malaysia</option>
                                                        <option value="Maldives">Maldives</option>
                                                        <option value="Mali">Mali</option>
                                                        <option value="Malta">Malta</option>
                                                        <option value="Marshall Islands">Marshall Islands</option>
                                                        <option value="Martinique">Martinique</option>
                                                        <option value="Mauritania">Mauritania</option>
                                                        <option value="Mauritius">Mauritius</option>
                                                        <option value="Mayotte">Mayotte</option>
                                                        <option value="Mexico">Mexico</option>
                                                        <option value="Micronesia, Federated States of">Micronesia, Federated States of</option>
                                                        <option value="Moldova, Republic of">Moldova, Republic of</option>
                                                        <option value="Monaco">Monaco</option>
                                                        <option value="Mongolia">Mongolia</option>
                                                        <option value="Montenegro">Montenegro</option>
                                                        <option value="Montserrat">Montserrat</option>
                                                        <option value="Morocco">Morocco</option>
                                                        <option value="Mozambique">Mozambique</option>
                                                        <option value="Myanmar">Myanmar</option>
                                                        <option value="Namibia">Namibia</option>
                                                        <option value="Nauru">Nauru</option>
                                                        <option value="Nepal">Nepal</option>
                                                        <option value="Netherlands">Netherlands</option>
                                                        <option value="Netherlands Antilles">Netherlands Antilles</option>
                                                        <option value="New Caledonia">New Caledonia</option>
                                                        <option value="New Zealand">New Zealand</option>
                                                        <option value="Nicaragua">Nicaragua</option>
                                                        <option value="Niger">Niger</option>
                                                        <option value="Nigeria">Nigeria</option>
                                                        <option value="Niue">Niue</option>
                                                        <option value="Norfolk Island">Norfolk Island</option>
                                                        <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                                                        <option value="Norway">Norway</option>
                                                        <option value="Oman">Oman</option>
                                                        <option value="Pakistan">Pakistan</option>
                                                        <option value="Palau">Palau</option>
                                                        <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
                                                        <option value="Panama">Panama</option>
                                                        <option value="Papua New Guinea">Papua New Guinea</option>
                                                        <option value="Paraguay">Paraguay</option>
                                                        <option value="Peru">Peru</option>
                                                        <option value="Philippines">Philippines</option>
                                                        <option value="Pitcairn">Pitcairn</option>
                                                        <option value="Poland">Poland</option>
                                                        <option value="Portugal">Portugal</option>
                                                        <option value="Puerto Rico">Puerto Rico</option>
                                                        <option value="Qatar">Qatar</option>
                                                        <option value="Reunion">Reunion</option>
                                                        <option value="Romania">Romania</option>
                                                        <option value="Russian Federation">Russian Federation</option>
                                                        <option value="Rwanda">Rwanda</option>
                                                        <option value="Saint Helena">Saint Helena</option>
                                                        <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                                                        <option value="Saint Lucia">Saint Lucia</option>
                                                        <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
                                                        <option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
                                                        <option value="Samoa">Samoa</option>
                                                        <option value="San Marino">San Marino</option>
                                                        <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                                                        <option value="Saudi Arabia">Saudi Arabia</option>
                                                        <option value="Senegal">Senegal</option>
                                                        <option value="Serbia">Serbia</option>
                                                        <option value="Seychelles">Seychelles</option>
                                                        <option value="Sierra Leone">Sierra Leone</option>
                                                        <option value="Singapore">Singapore</option>
                                                        <option value="Slovakia">Slovakia</option>
                                                        <option value="Slovenia">Slovenia</option>
                                                        <option value="Solomon Islands">Solomon Islands</option>
                                                        <option value="Somalia">Somalia</option>
                                                        <option value="South Africa">South Africa</option>
                                                        <option value="South Georgia and The South Sandwich Islands">South Georgia and The South
                                                            Sandwich Islands</option>
                                                        <option value="South Sudan">South Sudan</option>
                                                        <option value="Spain">Spain</option>
                                                        <option value="Sri Lanka">Sri Lanka</option>
                                                        <option value="Sudan">Sudan</option>
                                                        <option value="Suriname">Suriname</option>
                                                        <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                                                        <option value="Swaziland">Swaziland</option>
                                                        <option value="Sweden">Sweden</option>
                                                        <option value="Switzerland">Switzerland</option>
                                                        <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                                                        <option value="Taiwan, Republic of China">Taiwan, Republic of China</option>
                                                        <option value="Tajikistan">Tajikistan</option>
                                                        <option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
                                                        <option value="Thailand">Thailand</option>
                                                        <option value="Timor-leste">Timor-leste</option>
                                                        <option value="Togo">Togo</option>
                                                        <option value="Tokelau">Tokelau</option>
                                                        <option value="Tonga">Tonga</option>
                                                        <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                                        <option value="Tunisia">Tunisia</option>
                                                        <option value="Turkey">Turkey</option>
                                                        <option value="Turkmenistan">Turkmenistan</option>
                                                        <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                                        <option value="Tuvalu">Tuvalu</option>
                                                        <option value="Uganda">Uganda</option>
                                                        <option value="Ukraine">Ukraine</option>
                                                        <option value="United Arab Emirates">United Arab Emirates</option>
                                                        <option value="United Kingdom">United Kingdom</option>
                                                        <option value="United States">United States</option>
                                                        <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
                                                        <option value="Uruguay">Uruguay</option>
                                                        <option value="Uzbekistan">Uzbekistan</option>
                                                        <option value="Vanuatu">Vanuatu</option>
                                                        <option value="Venezuela">Venezuela</option>
                                                        <option value="Viet Nam">Viet Nam</option>
                                                        <option value="Virgin Islands, British">Virgin Islands, British</option>
                                                        <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                                                        <option value="Wallis and Futuna">Wallis and Futuna</option>
                                                        <option value="Western Sahara">Western Sahara</option>
                                                        <option value="Yemen">Yemen</option>
                                                        <option value="Zambia">Zambia</option>
                                                        <option value="Zimbabwe">Zimbabwe</option>
                                                    </select>
                                                </div>
                                                <div style="height: 20px;">
                                                </div>
                                            </div>
                                            <div>
                                                <h5>
                                                    City target
                                                </h5>
                                                <div>
                                                    <select name="selectCity" id="selectCity" size="7" tabindex="1" class="form-control"
                                                        multiple>
                                                        <option value="City1">City1</option>
                                                        <option value="City2">City2</option>
                                                        <option value="City3">City3</option>
                                                        <option value="City4">City4</option>
                                                    </select>
                                                </div>
                                                <div style="height: 20px;">
                                                </div>
                                            </div>
                                            <div>
                                                <h5>
                                                    ISP target
                                                </h5>
                                                <div>
                                                    <select name="selectISP" id="selectISP" size="7" tabindex="1" class="form-control"
                                                        multiple>
                                                        <option value="Vodafone">Vodafone</option>
                                                        <option value="Airtel">Airtel</option>
                                                        <option value="Tata Indicom">Tata Indicom</option>
                                                        <option value="Relience">Relience</option>
                                                    </select>
                                                </div>
                                                <div style="height: 20px;">
                                                </div>
                                            </div>
                                            <div id="divRating">
                                                <h5>
                                                    Rating
                                                </h5>
                                                <div>
                                                    <select class="form-control" runat="server" name="starraring" id="ddstars"
                                                        onchange="rate_(this.value)">
                                                        <option value="0.00">Don't show Stars</option>
                                                        <option value="1">1 star</option>
                                                        <option value="1.5">1.5 stars</option>
                                                        <option value="2">2 stars</option>
                                                        <option value="2.5">2.5 stars</option>
                                                        <option value="3">3 stars</option>
                                                        <option value="3.5">3.5 stars</option>
                                                        <option value="4">4 stars</option>
                                                        <option value="4.5">4.5 stars</option>
                                                        <option value="5">5 stars</option>
                                                    </select>
                                                </div>
                                                <div style="height: 20px;">
                                                </div>
                                            </div>
                                            
                                            <div class="divCapping">
                                                <h5>Daily Capping</h5>
                                                <input type="text" id="dailyCapping" runat="server" class="form-control">
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class=" clearfix">
                            </div>
                            <div class=" clearfix">
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <div class=" col-sm-8 col-xs-12" style="padding-left: 0; margin-top: 10px;">
                                    <div class=" col-sm-7 col-xs-10">
                                        <textarea style="display: none;" cols="40" rows="6" id="txt_included_devices" class="form-control"></textarea>
                                    </div>
                                </div>
                                <br />
                                <div class=" clearfix">
                                </div>
                                <div style="height: 25px;">
                                    <asp:HiddenField Value="valid" runat="server" ID="hdnfCheck" />
                                    <asp:HiddenField Value="valid" runat="server" ID="hdnfValidateImg1" />
                                    <asp:HiddenField Value="valid" runat="server" ID="hdnfValidateImg2" />
                                    <asp:HiddenField Value="valid" runat="server" ID="hdnfValidateImg3" />
                                    <asp:HiddenField Value="valid" runat="server" ID="hdnfPoster" />
                                    <asp:HiddenField Value="valid" runat="server" ID="hdnfFinalPoster" />
                                </div>
                            </div>
                            <div style="text-align: center; height: 50px">
                                <asp:UpdateProgress runat="server" ID="PageUpdateProgress">
                                    <ProgressTemplate>
                                        <img src="img/loadergif.gif" style="height: 30px; width: 30px" alt="Wait" />
                                        <br />
                                        Please Wait...
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                            <div class=" clearfix">
                            </div>
                            </div>
                            <div class=" clearfix">
                            </div>
                            <center>
                                <span id="spnMessage" runat="server" style="color: Green"></span>
                                <br />
                                <span id="spnUploadAdImg" runat="server" style="color: Green"></span>
                                <br />
                                <span id="spnUploadIconImg" runat="server" style="color: Green"></span>
                                <br />
                                <span id="spnUploadPosterImg" runat="server" style="color: Green"></span>
                                <br />
                                <span id="spnUploadFinalPoster" runat="server" style="color: Green"></span>
                                <br />
                                <span id="spnUploadIosPoster" runat="server" style="color: Green"></span>
                            </center>
                            <div style="height: 70px;">
                                <div style="margin: 0 auto; float: none; text-align: center;">
                                    <br />
                                    <input type="button" value="Submit" onclick="InsertData()" class="btn btn-primary"
                                        style="background-color: #337ab7;" />
                                    &nbsp;&nbsp
                                    <input type="button" value="Reset" class="btn btn-default" style="background-color: #fff;" />
                                </div>
                            </div>
                            <div class="lightbox" style="display: none" data-role="none">
                                <div class="closeAndReset">
                                </div>
                                <div class="lightbox-container col-md-7 col-sm-12 col-xs-12">
                                    <div class="selectTypeSelection" id="bannerTypeSelection" runat="server">
                                        <div class="col-md-12">
                                            <h3>
                                                Creation of a new poster</h3>
                                            <span>Select type:</span>
                                            <br>
                                            <br>
                                        </div>
                                        <div class="col-md-6 col-sm-12 col-xs-12">
                                            <div class="videobanner">
                                                <input type="radio" value="1" name="bannerType" id="bannerType1" runat="server"  data-role="none">
                                                <span class="posterTitle">Type A</span>
                                                <label for="bannerType1">
                                                    <span class="bordered bannerPart1">300x450</span> <span class="bannerPart2"><span
                                                        class="bordered bannerPart3">500x225</span> <span class="bordered bannerPart4">500x225</span>
                                                    </span>
                                                </label>
                                                800 x 450
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12 col-xs-12">
                                            <div class="videobanner">
                                                <span class="posterTitle">Type B</span>
                                                <input type="radio" value="2" name="bannerType" id="bannerType2" runat="server" data-role="none">
                                                <label for="bannerType2">
                                                    <span class="bordered bannerPart5">800x225</span> <span class="bordered bannerPart6">
                                                        800x225</span>
                                                </label>
                                                800 x 450
                                            </div>
                                        </div>
                                        <div class="col-md-12 next-step">
                                            <div class="pull-right btn btn-success createBanner">
                                                Next Step</div>
                                        </div>
                                    </div>
                                    <div class="bannerType1 customizeBanner" style="display: none" id="bannerStyle1" runat="server">
                                        <div class="col-md-6 col-sm-12">
                                            <h3>
                                                Creation of a new poster</h3>
                                            <br>
                                            <br>
                                            <div class="videobanner">
                                                <label class="banner">
                                                    <span id="bannerbackground1" runat="server" class="backgroundImage"></span>
                                                    <span id="bannerPart1" runat="server" class="bordered bannerPart bannerPart1" data-text="300x450">300x450</span> 
                                                    <span class="bannerPart2">
                                                        <span id="bannerPart3" runat="server" class="bordered bannerPart bannerPart3" data-text="500x225">500x225</span>
                                                        <span id="bannerPart4" runat="server" class="bordered bannerPart bannerPart4" data-text="500x225">500x225</span> 
                                                    </span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <ul>
                                                <li>
                                                    <div class="title">
                                                        Upload Image Background:</div>
                                                    <input type="file" id="backgroundImage" data-target="bannerbackground1" data-width="800"
                                                        data-height="450" name="backgroundImage">
                                                    <label for="backgroundImage" class="uploadBannerImg">
                                                    </label>
                                                    (size: 800x450) </li>
                                                <li>
                                                    <div class="title">
                                                        Upload image A:</div>
                                                    <input type="file" id="imageA" data-target="bannerPart1" data-width="300" data-height="450"
                                                        name="imageA">
                                                    <label for="imageA" class="uploadBannerImg">
                                                    </label>
                                                    (size: 300x450) </li>
                                                <li>
                                                    <div class="title">
                                                        Effect</div>
                                                    <select class="input animation-preview input-dropdown form-control" id="FinalAnimation1"
                                                        data-target="bannerPart1" runat="server">
                                                        <option value="bounce">bounce</option>
                                                        <option value="flash">flash</option>
                                                        <option value="pulse">pulse</option>
                                                        <option value="rubberBand">rubberBand</option>
                                                        <option value="shake">shake</option>
                                                        <option value="swing">swing</option>
                                                        <option value="tada">tada</option>
                                                        <option value="wobble">wobble</option>
                                                        <option value="jello">jello</option>
                                                        <option value="bounceIn">bounceIn</option>
                                                        <option value="bounceInDown">bounceInDown</option>
                                                        <option value="bounceInLeft">bounceInLeft</option>
                                                        <option value="bounceInRight">bounceInRight</option>
                                                        <option value="bounceInUp">bounceInUp</option>
                                                        <option value="fadeIn">fadeIn</option>
                                                        <option value="fadeInDown">fadeInDown</option>
                                                        <option value="fadeInDownBig">fadeInDownBig</option>
                                                        <option value="fadeInLeft">fadeInLeft</option>
                                                        <option value="fadeInLeftBig">fadeInLeftBig</option>
                                                        <option value="fadeInRight">fadeInRight</option>
                                                        <option value="fadeInRightBig">fadeInRightBig</option>
                                                        <option value="fadeInUp">fadeInUp</option>
                                                        <option value="fadeInUpBig">fadeInUpBig</option>
                                                        <option value="flip">flip</option>
                                                        <option value="flipInX">flipInX</option>
                                                        <option value="flipInY">flipInY</option>
                                                        <option value="lightSpeedIn">lightSpeedIn</option>
                                                        <option value="rotateIn">rotateIn</option>
                                                        <option value="rotateInDownLeft">rotateInDownLeft</option>
                                                        <option value="rotateInDownRight">rotateInDownRight</option>
                                                        <option value="rotateInUpLeft">rotateInUpLeft</option>
                                                        <option value="rotateInUpRight">rotateInUpRight</option>
                                                        <option value="slideInUp">slideInUp</option>
                                                        <option value="slideInDown">slideInDown</option>
                                                        <option value="slideInLeft">slideInLeft</option>
                                                        <option value="slideInRight">slideInRight</option>
                                                        <option value="zoomIn">zoomIn</option>
                                                        <option value="zoomInDown">zoomInDown</option>
                                                        <option value="zoomInLeft">zoomInLeft</option>
                                                        <option value="zoomInRight">zoomInRight</option>
                                                        <option value="zoomInUp">zoomInUp</option>
                                                        <option value="hinge">hinge</option>
                                                        <option value="rollIn">rollIn</option>
                                                    </select>
                                                </li>
                                                <li>
                                                    <div class="title">
                                                        Upload image B:</div>
                                                    <input type="file" id="imageB" data-target="bannerPart3" data-width="500" data-height="225"
                                                        name="imageB">
                                                    <label for="imageB" class="uploadBannerImg">
                                                    </label>
                                                    (size: 500x225) </li>
                                                <li>
                                                    <div class="title">
                                                        Effect</div>
                                                    <select class="input animation-preview input-dropdown form-control" id="FinalAnimation2"
                                                        data-target="bannerPart3" runat="server">
                                                        <option value="bounce">bounce</option>
                                                        <option value="flash">flash</option>
                                                        <option value="pulse">pulse</option>
                                                        <option value="rubberBand">rubberBand</option>
                                                        <option value="shake">shake</option>
                                                        <option value="swing">swing</option>
                                                        <option value="tada">tada</option>
                                                        <option value="wobble">wobble</option>
                                                        <option value="jello">jello</option>
                                                        <option value="bounceIn">bounceIn</option>
                                                        <option value="bounceInDown">bounceInDown</option>
                                                        <option value="bounceInLeft">bounceInLeft</option>
                                                        <option value="bounceInRight">bounceInRight</option>
                                                        <option value="bounceInUp">bounceInUp</option>
                                                        <option value="fadeIn">fadeIn</option>
                                                        <option value="fadeInDown">fadeInDown</option>
                                                        <option value="fadeInDownBig">fadeInDownBig</option>
                                                        <option value="fadeInLeft">fadeInLeft</option>
                                                        <option value="fadeInLeftBig">fadeInLeftBig</option>
                                                        <option value="fadeInRight">fadeInRight</option>
                                                        <option value="fadeInRightBig">fadeInRightBig</option>
                                                        <option value="fadeInUp">fadeInUp</option>
                                                        <option value="fadeInUpBig">fadeInUpBig</option>
                                                        <option value="flip">flip</option>
                                                        <option value="flipInX">flipInX</option>
                                                        <option value="flipInY">flipInY</option>
                                                        <option value="lightSpeedIn">lightSpeedIn</option>
                                                        <option value="rotateIn">rotateIn</option>
                                                        <option value="rotateInDownLeft">rotateInDownLeft</option>
                                                        <option value="rotateInDownRight">rotateInDownRight</option>
                                                        <option value="rotateInUpLeft">rotateInUpLeft</option>
                                                        <option value="rotateInUpRight">rotateInUpRight</option>
                                                        <option value="slideInUp">slideInUp</option>
                                                        <option value="slideInDown">slideInDown</option>
                                                        <option value="slideInLeft">slideInLeft</option>
                                                        <option value="slideInRight">slideInRight</option>
                                                        <option value="zoomIn">zoomIn</option>
                                                        <option value="zoomInDown">zoomInDown</option>
                                                        <option value="zoomInLeft">zoomInLeft</option>
                                                        <option value="zoomInRight">zoomInRight</option>
                                                        <option value="zoomInUp">zoomInUp</option>
                                                        <option value="hinge">hinge</option>
                                                        <option value="rollIn">rollIn</option>
                                                    </select>
                                                </li>
                                                <li>
                                                    <div class="title">
                                                        Upload image C:</div>
                                                    <input type="file" id="imageC" data-target="bannerPart4" data-width="500" data-height="225"
                                                        name="imageC">
                                                    <label for="imageC" class="uploadBannerImg">
                                                    </label>
                                                    (size: 500x225) </li>
                                                <li>
                                                    <div class="title">
                                                        Effect</div>
                                                    <select class="input animation-preview input-dropdown form-control" id="FinalAnimation3"
                                                        data-target="bannerPart4" runat="server">
                                                        <option value="bounce">bounce</option>
                                                        <option value="flash">flash</option>
                                                        <option value="pulse">pulse</option>
                                                        <option value="rubberBand">rubberBand</option>
                                                        <option value="shake">shake</option>
                                                        <option value="swing">swing</option>
                                                        <option value="tada">tada</option>
                                                        <option value="wobble">wobble</option>
                                                        <option value="jello">jello</option>
                                                        <option value="bounceIn">bounceIn</option>
                                                        <option value="bounceInDown">bounceInDown</option>
                                                        <option value="bounceInLeft">bounceInLeft</option>
                                                        <option value="bounceInRight">bounceInRight</option>
                                                        <option value="bounceInUp">bounceInUp</option>
                                                        <option value="fadeIn">fadeIn</option>
                                                        <option value="fadeInDown">fadeInDown</option>
                                                        <option value="fadeInDownBig">fadeInDownBig</option>
                                                        <option value="fadeInLeft">fadeInLeft</option>
                                                        <option value="fadeInLeftBig">fadeInLeftBig</option>
                                                        <option value="fadeInRight">fadeInRight</option>
                                                        <option value="fadeInRightBig">fadeInRightBig</option>
                                                        <option value="fadeInUp">fadeInUp</option>
                                                        <option value="fadeInUpBig">fadeInUpBig</option>
                                                        <option value="flip">flip</option>
                                                        <option value="flipInX">flipInX</option>
                                                        <option value="flipInY">flipInY</option>
                                                        <option value="lightSpeedIn">lightSpeedIn</option>
                                                        <option value="rotateIn">rotateIn</option>
                                                        <option value="rotateInDownLeft">rotateInDownLeft</option>
                                                        <option value="rotateInDownRight">rotateInDownRight</option>
                                                        <option value="rotateInUpLeft">rotateInUpLeft</option>
                                                        <option value="rotateInUpRight">rotateInUpRight</option>
                                                        <option value="slideInUp">slideInUp</option>
                                                        <option value="slideInDown">slideInDown</option>
                                                        <option value="slideInLeft">slideInLeft</option>
                                                        <option value="slideInRight">slideInRight</option>
                                                        <option value="zoomIn">zoomIn</option>
                                                        <option value="zoomInDown">zoomInDown</option>
                                                        <option value="zoomInLeft">zoomInLeft</option>
                                                        <option value="zoomInRight">zoomInRight</option>
                                                        <option value="zoomInUp">zoomInUp</option>
                                                        <option value="hinge">hinge</option>
                                                        <option value="rollIn">rollIn</option>
                                                    </select>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-md-12 .next-step">
                                            <div class="col-md-6 col-sm-12">
                                                <center>
                                                    <div class="btn btn-info play-animation">
                                                        Preview</div>
                                                </center>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="pull-right btn btn-info generateBanner">Create</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="bannerType2 customizeBanner" style="display: none" id="bannerStyle2" runat="server">
                                        <div class="col-md-6 col-sm-12">
                                            <h3>
                                                Creation of a new poster</h3>
                                            <br>
                                            <br>
                                            <div class="videobanner">
                                                <label class="banner">
                                                    <span id="bannerbackground2" runat="server" class="backgroundImage"></span>
                                                    <span id="bannerPart5" runat="server" class="bordered bannerPart bannerPart5" data-text="800x225">800x225</span> 
                                                    <span id="bannerPart6" runat="server" class="bordered bannerPart bannerPart6" data-text="800x225">800x225</span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <ul>
                                                <li>
                                                    <div class="title">
                                                        Upload Image Background:</div>
                                                    <input type="file" id="backgroundImage2" data-target="bannerbackground2" data-width="800"
                                                        data-height="450" name="backgroundImage">
                                                    <label for="backgroundImage2" class="uploadBannerImg">
                                                    </label>
                                                    (size: 800x450) </li>
                                                <li>
                                                    <div class="title">
                                                        Upload image A:</div>
                                                    <input type="file" id="imageD" data-target="bannerPart5" data-width="800" data-height="225"
                                                        name="imageA">
                                                    <label for="imageD" class="uploadBannerImg">
                                                    </label>
                                                    (size: 800x225) </li>
                                                <li>
                                                    <div class="title">
                                                        Effect</div>
                                                    <select class="input animation-preview input-dropdown form-control" id="FinalAnimation4"
                                                        data-target="bannerPart5" runat="server">
                                                        <option value="bounce">bounce</option>
                                                        <option value="flash">flash</option>
                                                        <option value="pulse">pulse</option>
                                                        <option value="rubberBand">rubberBand</option>
                                                        <option value="shake">shake</option>
                                                        <option value="swing">swing</option>
                                                        <option value="tada">tada</option>
                                                        <option value="wobble">wobble</option>
                                                        <option value="jello">jello</option>
                                                        <option value="bounceIn">bounceIn</option>
                                                        <option value="bounceInDown">bounceInDown</option>
                                                        <option value="bounceInLeft">bounceInLeft</option>
                                                        <option value="bounceInRight">bounceInRight</option>
                                                        <option value="bounceInUp">bounceInUp</option>
                                                        <option value="fadeIn">fadeIn</option>
                                                        <option value="fadeInDown">fadeInDown</option>
                                                        <option value="fadeInDownBig">fadeInDownBig</option>
                                                        <option value="fadeInLeft">fadeInLeft</option>
                                                        <option value="fadeInLeftBig">fadeInLeftBig</option>
                                                        <option value="fadeInRight">fadeInRight</option>
                                                        <option value="fadeInRightBig">fadeInRightBig</option>
                                                        <option value="fadeInUp">fadeInUp</option>
                                                        <option value="fadeInUpBig">fadeInUpBig</option>
                                                        <option value="flip">flip</option>
                                                        <option value="flipInX">flipInX</option>
                                                        <option value="flipInY">flipInY</option>
                                                        <option value="lightSpeedIn">lightSpeedIn</option>
                                                        <option value="rotateIn">rotateIn</option>
                                                        <option value="rotateInDownLeft">rotateInDownLeft</option>
                                                        <option value="rotateInDownRight">rotateInDownRight</option>
                                                        <option value="rotateInUpLeft">rotateInUpLeft</option>
                                                        <option value="rotateInUpRight">rotateInUpRight</option>
                                                        <option value="slideInUp">slideInUp</option>
                                                        <option value="slideInDown">slideInDown</option>
                                                        <option value="slideInLeft">slideInLeft</option>
                                                        <option value="slideInRight">slideInRight</option>
                                                        <option value="zoomIn">zoomIn</option>
                                                        <option value="zoomInDown">zoomInDown</option>
                                                        <option value="zoomInLeft">zoomInLeft</option>
                                                        <option value="zoomInRight">zoomInRight</option>
                                                        <option value="zoomInUp">zoomInUp</option>
                                                        <option value="hinge">hinge</option>
                                                        <option value="rollIn">rollIn</option>
                                                    </select>
                                                </li>
                                                <li>
                                                    <div class="title">
                                                        Upload image B:</div>
                                                    <input type="file" id="imageE" data-target="bannerPart6" data-width="800" data-height="225"
                                                        name="imageE">
                                                    <label for="imageE" class="uploadBannerImg">
                                                    </label>
                                                    (size: 800x225) </li>
                                                <li>
                                                    <div class="title">
                                                        Effect</div>
                                                    <select class="input animation-preview input-dropdown form-control" id="FinalAnimation5"
                                                        data-target="bannerPart6" runat="server">
                                                        <option value="bounce">bounce</option>
                                                        <option value="flash">flash</option>
                                                        <option value="pulse">pulse</option>
                                                        <option value="rubberBand">rubberBand</option>
                                                        <option value="shake">shake</option>
                                                        <option value="swing">swing</option>
                                                        <option value="tada">tada</option>
                                                        <option value="wobble">wobble</option>
                                                        <option value="jello">jello</option>
                                                        <option value="bounceIn">bounceIn</option>
                                                        <option value="bounceInDown">bounceInDown</option>
                                                        <option value="bounceInLeft">bounceInLeft</option>
                                                        <option value="bounceInRight">bounceInRight</option>
                                                        <option value="bounceInUp">bounceInUp</option>
                                                        <option value="fadeIn">fadeIn</option>
                                                        <option value="fadeInDown">fadeInDown</option>
                                                        <option value="fadeInDownBig">fadeInDownBig</option>
                                                        <option value="fadeInLeft">fadeInLeft</option>
                                                        <option value="fadeInLeftBig">fadeInLeftBig</option>
                                                        <option value="fadeInRight">fadeInRight</option>
                                                        <option value="fadeInRightBig">fadeInRightBig</option>
                                                        <option value="fadeInUp">fadeInUp</option>
                                                        <option value="fadeInUpBig">fadeInUpBig</option>
                                                        <option value="flip">flip</option>
                                                        <option value="flipInX">flipInX</option>
                                                        <option value="flipInY">flipInY</option>
                                                        <option value="lightSpeedIn">lightSpeedIn</option>
                                                        <option value="rotateIn">rotateIn</option>
                                                        <option value="rotateInDownLeft">rotateInDownLeft</option>
                                                        <option value="rotateInDownRight">rotateInDownRight</option>
                                                        <option value="rotateInUpLeft">rotateInUpLeft</option>
                                                        <option value="rotateInUpRight">rotateInUpRight</option>
                                                        <option value="slideInUp">slideInUp</option>
                                                        <option value="slideInDown">slideInDown</option>
                                                        <option value="slideInLeft">slideInLeft</option>
                                                        <option value="slideInRight">slideInRight</option>
                                                        <option value="zoomIn">zoomIn</option>
                                                        <option value="zoomInDown">zoomInDown</option>
                                                        <option value="zoomInLeft">zoomInLeft</option>
                                                        <option value="zoomInRight">zoomInRight</option>
                                                        <option value="zoomInUp">zoomInUp</option>
                                                        <option value="hinge">hinge</option>
                                                        <option value="rollIn">rollIn</option>
                                                    </select>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-md-12 .next-step">
                                            <div class="col-md-6 col-sm-12">
                                                <center>
                                                    <div class="btn btn-info play-animation">
                                                        Preview</div>
                                                </center>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="pull-right btn btn-info generateBanner">Create</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="checkImgSize">
                                    </div>
                                </div>
                            </div>
                            </div>
                            <script src="assets/plugins/jquery-1.11.js"></script>
                            <script src="assets/plugins/jquery-migrate-1.2.1.js"></script>
                            <script src="assets/plugins/jquery-ui/jquery-ui-1.10.4.min.js"></script>
                            <script src="assets/plugins/jquery-mobile/jquery.mobile-1.4.2.js"></script>
                            <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
                            <script src="assets/plugins/bootstrap-dropdown/bootstrap-hover-dropdown.min.js"></script>
                            <%--<script src="assets/plugins/mcustom-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>--%>
                            <script src="assets/plugins/mmenu/js/jquery.mmenu.min.all.js"></script>
                            <script src="assets/plugins/nprogress/nprogress.js"></script>
                            <script src="assets/plugins/charts-sparkline/sparkline.min.js"></script>
                            <script src="assets/plugins/breakpoints/breakpoints.js"></script>
                            <script src="assets/plugins/numerator/jquery-numerator.js"></script>
                            <script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
                            <%--<script src="assets/js/mCustomScrollbar.concat.min.js" type="text/javascript"></script>--%>
                            <script src="assets/js/application.js"></script>
                            <script src="assets/js/rkvLightbox.js" type="text/javascript"></script>
                            <script type="text/javascript">
//                                if ($("#sidebar").length) {
//                                    $("#sidebar").mCustomScrollbar({
//                                        autoHide: true,
//                                        theme: "minimal-dark",
//                                        scrollbarPosition: "outside",
//                                        scrollInertia: 400
//                                    });
//                                }

                                $('body').on('keypress', '#txt_camp_title', function 
                            (event) {
                                    var val = $("#text").val();
                                });
                                $('body').on('keypress', '#txt_camp_discription', function (event) {
                                    $('body').find('.discription_banner').html($(this).val());
                                    var value = $("#discription_banner1").text() + "";

                                    var replacedStr = value.replace(":-)", '<img src="Emoticons/smile.gif" />');
                                    replacedStr = replacedStr.replace(":-(", '<img src="Emoticons/sad_smile.gif" />');
                                    replacedStr = replacedStr.replace(";-(", '<img src="Emoticons/cry_smile.gif" />');
                                    replacedStr = replacedStr.replace("s-)", '<img src="Emoticons/shades_smile.gif" />');
                                    replacedStr = replacedStr.replace("-))", '<img src="Emoticons/angry_smile.gif" />');
                                    replacedStr = replacedStr.replace("r-)", '<img src="Emoticons/regular_smile.gif" />');
                                    replacedStr = replacedStr.replace("-g)", '<img src="Emoticons/tounge_smile.gif" />');
                                    replacedStr = replacedStr.replace(":))", '<img src="Emoticons/whatchutalkingabout_smile.gif" />');
                                    replacedStr = replacedStr.replace(":-o", '<img src="Emoticons/omg_smile.gif" />');
                                    replacedStr = replacedStr.replace("w-(", '<img src="Emoticons/wink_smile.gif" />');
                                    replacedStr = replacedStr.replace("(y)", '<img src="Emoticons/thumbs_up.gif" />');
                                    replacedStr = replacedStr.replace("(d)", '<img src="Emoticons/thumbs_down.gif" />');
                                    replacedStr = replacedStr.replace("A-)", '<img src="Emoticons/angel_smile.gif" />');
                                    replacedStr = replacedStr.replace("(H)", '<img src="Emoticons/broken_heart.gif" />');
                                    replacedStr = replacedStr.replace("(B)", '<img src="Emoticons/beer.gif" />');
                                    replacedStr = replacedStr.replace("(M)", '<img src="Emoticons/beer_yum.gif" />');
                                    replacedStr = replacedStr.replace("(C)", '<img src="Emoticons/coffee.gif" />');
                                    replacedStr = replacedStr.replace("(R)", '<img src="Emoticons/rainbow.gif" />');
                                    replacedStr = replacedStr.replace(":-R", '<img src="Emoticons/wilted_rose.gif" />');
                                    replacedStr = replacedStr.replace(":-N", '<img src="Emoticons/musical_note.gif" />');
                                    replacedStr = replacedStr.replace("(B)", '<img src="Emoticons/soccer_ball.gif" />');
                                    replacedStr = replacedStr.replace(":-P", '<img src="Emoticons/present.gif" />');
                                    replacedStr = replacedStr.replace(":-S", '<img src="Emoticons/sun.gif" />');
                                    replacedStr = replacedStr.replace(":-L", '<img src="Emoticons/island.gif" />');
                                    replacedStr = replacedStr.replace(":-M", '<img src="Emoticons/mobile_phone.gif" />');
                                    replacedStr = replacedStr.replace(":-T", '<img src="Emoticons/auto.gif" />');
                                    replacedStr = replacedStr.replace(":-B", '<img src="Emoticons/bat.gif" />');
                                    replacedStr = replacedStr.replace(":-E", '<img src="Emoticons/envelope_open.gif" />');
                                    replacedStr = replacedStr.replace("t-)", '<img src="Emoticons/teeth_smile.gif" />');
                                    $("#discription_banner1").html(replacedStr); ;
                                    // alert();
                                }); $('body').on('keypress', '#txt_camp_call_To_Action', function (event) {
                                    $('body').find('.lnk_banner').html($(this).val());

                                });

                            </script>
                            <script type="text/javascript">

                                document.getElementById("FileUpload2").onchange = function () {
                                    validateImg2();
                                    var reader = new FileReader();

                                    reader.onload = function (e) {
                                        document.getElementById("icon_img_banner1").src = e.target.result;
                                        document.getElementById("icon_img_banner2").src = e.target.result;
                                        document.getElementById("icon_img_banner3").src = e.target.result;
                                        document.getElementById("icon_image_banner_5").src = e.target.result;
                                    };
                                    reader.readAsDataURL(this.files[0]);
                                };
                                document.getElementById("FileUpload3").onchange = function () {
                                    validateImg3();
                                };
                                document.getElementById("PosterUploader").onchange = function () {
                                    validatePosterImg();
                                };
//                                document.getElementById("FinalPosterUploader").onchange = function () {
//                                    vilidateFinalPoster();
//                                };
                                $('#FinalPosterUploader').on('change', function () {
                                    vilidateFinalPoster();
                                })


                            </script>
                            <script type="text/javascript">
                                document.getElementById("FileUpload1").onchange = function () {
                                    validateImg1();
                                    var reader = new FileReader();
                                    reader.onload = function (e) {
                                        // get loaded data and render thumbnail.
                                        document.getElementById("banner_img_banner1").src = e.target.result;
                                        document.getElementById("image_banner3").src = e.target.result;
                                        document.getElementById("image_banner_4").src = e.target.result;
                                        var Img = e.target.result;
                                        var VideoUrl = document.getElementById("vedio_url_link").value;
                                        addVideoPreview(Img, VideoUrl);
                                    }; reader.readAsDataURL(this.files[0]);
                                };
                            </script>
                            <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
                            <%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.7/angular.min.js"></script>--%>
                            <%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.7/angular-sanitize.min.js"></script>--%>
                            <%--<script type="text/javascript" src="Emoji/dist/js/config.js"></script>--%>
                            <%--<script type="text/javascript" src="Emoji/dist/js/emoji.min.js"></script>--%>
                            <%--<link type="text/stylesheet" rel="stylesheet" href="Emoji/dist/css/emoji.min.css" />--%>
                            
                            <link href="lib/css/emoji.css" rel="stylesheet">
                            <script src="lib/js/config.js" type="text/javascript"></script>
                            <script src="lib/js/util.js" type="text/javascript"></script>
                            <script src="lib/js/jquery.emojiarea.js"></script>
                            <script src="lib/js/emoji-picker.js"></script>
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    window.emojiPicker = new EmojiPicker({
                                        emojiable_selector: '[data-emojiable=true]',
                                        assetsPath: 'lib/img',
                                        popupButtonClasses: 'fa fa-smile-o'
                                    });
                                    window.emojiPicker.discover();
                                });
                                function doGetCaretPosition(oField) {

                                    // Initialize
                                    var iCaretPos = 0;

                                    // IE Support
                                    if (document.selection) {

                                        // Set focus on the element
                                        oField.focus();

                                        // To get cursor position, get empty selection range
                                        var oSel = document.selection.createRange();

                                        // Move selection start to 0 position
                                        oSel.moveStart('character', -oField.value.length);

                                        // The caret position is selection length
                                        iCaretPos = oSel.text.length;
                                    }

                                    // Firefox support
                                    else if (oField.selectionStart || oField.selectionStart == '0')
                                        iCaretPos = oField.selectionStart;

                                    // Return results
                                    return iCaretPos;
                                }

                                $('#dailyCapping').on('keypress', function (key) {
                                    if (!((key.charCode >= 48 && key.charCode <= 57) || key.charCode == 46 || key.charCode == 0 || key.ctrlKey && key.charCode != 118 || key.ctrlKey && key.charCode != 114 || key.ctrlKey && key.charCode != 122)) { flashElem($(this)); return false; }
                                })

                                $('#cost').on('keypress', function (key) {
                                    value = $(this).val();
                                    if (value == "") {
                                        if (!((key.charCode >= 48 && key.charCode <= 57) || key.charCode == 0 || key.ctrlKey && key.charCode != 118 || key.ctrlKey && key.charCode != 114 || key.ctrlKey && key.charCode != 122)) { flashElem($(this)); return false; }
                                    } else {
                                        if (~value.indexOf(".")) {
                                            index = value.indexOf(".");
                                            arr = value.split(".");
                                            if (doGetCaretPosition(this) <= index) {
                                                if (!((key.charCode >= 48 && key.charCode <= 57) || key.charCode == 0 || key.ctrlKey && key.charCode != 118 || key.ctrlKey && key.charCode != 114 || key.ctrlKey && key.charCode != 122)) { flashElem($(this)); return false; }
                                            } else {
                                                if (arr[1].length < 2) {
                                                    if (!((key.charCode >= 48 && key.charCode <= 57) || key.charCode == 0 || key.ctrlKey && key.charCode != 118 || key.ctrlKey && key.charCode != 114 || key.ctrlKey && key.charCode != 122)) { flashElem($(this)); return false; }
                                                } else {
                                                    if (!(key.charCode == 0 || key.ctrlKey && key.charCode != 118 || key.ctrlKey && key.charCode != 114 || key.ctrlKey && key.charCode != 122)) { flashElem($(this)); return false; }
                                                }
                                            }
                                        } else {
                                            if (!((key.charCode >= 48 && key.charCode <= 57) || key.charCode == 46 || key.charCode == 0 || key.ctrlKey && key.charCode != 118 || key.ctrlKey && key.charCode != 114 || key.ctrlKey && key.charCode != 122)) { flashElem($(this)); return false; }
                                            else {
                                                if (key.charCode == 46) {
                                                    pointerPos = doGetCaretPosition(this);
                                                    strLen = value.length;
                                                    if ((strLen - pointerPos) > 2) {
                                                        intVal = parseInt(value.substring(0, pointerPos));
                                                        decVal = parseInt(value.substring(pointerPos, pointerPos + 2));
                                                        a = parseInt(value.substring(pointerPos + 2, pointerPos + 3));
                                                        if (a >= 5) {
                                                            if (decVal == 99) { decVal = "00"; intVal += 1; }
                                                            else { decVal += 1; }
                                                        }
                                                        $(this).val(intVal + '.' + decVal);
                                                        return false;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                })
                                function flashElem(elem) {
                                    elem.addClass('errorFlash');
                                    setTimeout(function () { elem.removeClass('errorFlash') }, 300)
                                }

                                $('#divDescription').on('keyup', '#messageDiv', function () { 
                                    var HTMLContent = document.getElementById('messageDiv').innerHTML
                                    var RemovedHTML = HTMLContent.replace(/<img[^>]*>/g, " ");
                                    var RemovedHTML = RemovedHTML.replace(/&nbsp;/gi, ' ').replace("<br>", '');
                                    //alert(RemovedHTML);
                                    var count = RemovedHTML.length;
                                    $('#charCount').html(150);
                                    if (count <= 150) {

                                        $('#discription_banner1').html($(this).html());
                                        $('#discription_banner4').html(RemovedHTML);
                                        $('#discription_banner_5').html(RemovedHTML);
                                        $('#charCount').html(150 - count);
//                                        alert(count)
                                    } else {

                                        var validString = HTMLContent.substring(0, 150);
                                        $('#messageDiv').html(validString);
                                        document.getElementById('messageInput').vaue = validString;
                                        var textBox = document.getElementById('messageInput');
                                        textBox.addEventListener('focus', reset, false);
                                    }
                                })
        

                            </script>
                            <script type="text/javascript">

//                                var demoApp = angular.module("demoApp", ['ngSanitize', 'emojiApp']);

//                                emojiApp.controller('emojiController', ['$scope', function ($scope) {

//                                    $scope.emojiMessage = {};
//                                } ]);

//                                $('#emojibtn').click(function (e) {
//                                    e.preventDefault();
//                                    document.getElementById('discription_banner1').innerHTML = document.getElementById('messageDiv').innerHTML

//                                });

                            </script>
                            <script type="text/javascript">

                                document.getElementById("vedio_url_link").onchange = function () {

                                    var fileUpload = document.getElementById("PosterUploader");
                                    var VideoUrl = document.getElementById("vedio_url_link").value;
                                    imagePath = document.getElementById("FileUpload1_old").value;
                                    addVideoPreview(imagePath, VideoUrl);
                                };

                                function addVideoPreview(bannerImg, videoUrl) {
                                    document.getElementById('DivVideo').removeChild(document.getElementById('videoPlayer'));
                                    afterOverlay = document.getElementById('DivVideo').innerHTML;
                                    document.getElementById('DivVideo').innerHTML = '<video id="videoPlayer" style="height :180px; width :320px;" poster ="' + bannerImg + '"><source src="' + videoUrl + '" type="video/mp4"></video>' + afterOverlay;
                                    var v = document.getElementById('videoPlayer');
                                    var playBtn = document.getElementById('playVideo');
                                    
                                    v.onclick = function () {
                                        if (v.paused) {
                                            v.play();
                                            v.controls = null;
                                        } else {
                                            v.pause();
                                            v.controls = "controls";
                                        }
                                    };
                                    v.addEventListener('ended', function () {
                                        showOverlayBanner();
                                    })
                                }

                            </script>
                            <script type="text/javascript" src="js/jquery.tagsinput.js"></script>
                            <script src="assets/plugins/bootstrap-select/bootstrap-select.js"></script>
                            <meta http-equiv="content-type" content="text/html;charset=UTF-8">
                        </ContentTemplate>
                        <Triggers>
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    
    <div id="HiddenSection">
        <asp:HiddenField runat="server" ID="txt_camp_title" />
        <asp:HiddenField runat="server" ID="hdnfDescription" />
        <input type="hidden" runat="server" class="preUploaded" data-id="FileUpload1" ID="FileUpload1_old" />
		<input type="hidden" runat="server" class="preUploaded" data-id="FileUpload2" ID="FileUpload2_old" />
		<input type="hidden" runat="server" class="preUploaded" data-id="PosterUploader" ID="PosterUploader_old" />
		<input type="hidden" runat="server" class="preUploaded" data-id="FileUpload3" ID="FileUpload3_old" />
		<input type="hidden" runat="server" class="preUploaded" data-id="backgroundImage" ID="backgroundImage_old" />
		<input type="hidden" runat="server" class="preUploaded" data-id="imageA" ID="imageA_old" />
		<input type="hidden" runat="server" class="preUploaded" data-id="imageB" ID="imageB_old" />
		<input type="hidden" runat="server" class="preUploaded" data-id="imageC" ID="imageC_old" />
		<input type="hidden" runat="server" class="preUploaded" data-id="backgroundImage2" ID="backgroundImage2_old" />
		<input type="hidden" runat="server" class="preUploaded" data-id="imageD" ID="imageD_old" />
		<input type="hidden" runat="server" class="preUploaded" data-id="imageE" ID="imageE_old" />
    </div>
    <script type="text/javascript">

//        window.onload = function banner_visible() {
////            document.getElementById('b1').checked = true;
//            document.getElementById('messageDiv').style.height = '84px';
////            document.getElementById('banner1').style.display = 'block';
////            document.getElementById('banner2').style.display = 'none';
////            document.getElementById('banner3').style.display = 'none';
////            document.getElementById('banner4').style.display = 'none';
////            document.getElementById('banner5').style.display = 'none';
////            document.getElementById('banner6').style.display = 'none';
//            document.getElementById('divchooseCallToAct').style.display = 'none';
//            document.getElementById('txt_camp_call_To_Action').style.display = 'block'
//            document.getElementById('divCallToAction').style.display = ''

//            $('#txt_camp_call_To_Action').removeAttr('disabled');
//            $('#txt_camp_title').removeAttr('disabled'); //Enable
//            $('#messageDiv').removeAttr('disabled'); //Enable
//            $('#txt_camp_call_To_Action').removeAttr('disabled'); //Enable
//            $('#messageInput').removeAttr('disabled'); //Enable
//            document.getElementById('txt_titlebanner1').style.display = 'block';
//            document.getElementById('txt_TitleBanner2').style.display = 'none';
//            document.getElementById('txt_titleBanner3').style.display = 'none';
//            document.getElementById('txt_titleBanner4').style.display = 'none';

//            //showing title , description , CallToAct, Rating
//            document.getElementById('divBannerTitle').style.display = '';
//            document.getElementById('divDescription').style.display = '';
//            document.getElementById('divRating').style.display = '';
//            document.getElementById('spnUploader1').innerText = "Upload Ad Image";
//            document.getElementById('spnUploader2').innerText = "Upload Icon";
//            document.getElementById('spnUploader3').innerText = "Poster With PlayButton";
//            document.getElementsByClassName("emoji-picker-icon")[0].style.display = "";
//            //hide Uploaders

//            document.getElementById('DivPoster1').style.display = 'none';
//            document.getElementById('diVFinalPoster').style.display = 'none';
//            document.getElementById('divposter').style.display = 'none';
//            document.getElementById('divPlayBtn').style.display = 'none';

//            //Type of targeting
//            document.getElementById('divMaxImpression').style.display = 'none';
//            document.getElementById('divKeyWords').style.display = 'none';
//            document.getElementById('divAgeRange').style.display = 'none';
//            document.getElementById('divAudience').style.display = 'none';
//            document.getElementById('divGender').style.display = 'none';
//            document.getElementById('divVideoLinkUrl').style.display = 'none';
//            //   ddlAgeRange, ddlGender, ddlInterestCategories

//        }

        //checkbox banner1 visible 
        function banner1() {
            document.getElementById('banner1').style.display = 'block';
            document.getElementById('banner2').style.display = 'none';
            document.getElementById('banner3').style.display = 'none';
            document.getElementById('banner4').style.display = 'none';
            document.getElementById('banner5').style.display = 'none';
            document.getElementById('banner6').style.display = 'none';
            $('#txt_camp_call_To_Action').removeAttr('disabled');
            document.getElementById('divCallToAction').style.display = ''
            $('#txt_camp_title').removeAttr('disabled'); //Enable
            $('#messageDiv').removeAttr('disabled'); //Enable
            $('#txt_camp_call_To_Action').removeAttr('disabled'); //Enable
            $('#messageInput').removeAttr('disabled'); //Enable
            document.getElementById('txt_titlebanner1').style.display = 'block';
            document.getElementById('txt_TitleBanner2').style.display = 'none';
            document.getElementById('txt_titleBanner3').style.display = 'none';
            document.getElementById('txt_titleBanner4').style.display = 'none';
            document.getElementById('divPlayBtn').style.display = 'none';
            document.getElementById('txtTitleVideo').style.display = 'none';
            document.getElementById("ddstars").disabled = false;
            document.getElementById('strRatingBanner2').style.display = "block";
            document.getElementById('divchooseCallToAct').style.display = "none";
            document.getElementsByClassName("emoji-picker-icon")[0].style.display = "";
            
            document.getElementById('DivAdImage').style.display = "block";
            document.getElementById('DivIcon').style.display = "block";

            document.getElementById('DivPoster1').style.display = "none";
            document.getElementById('diVFinalPoster').style.display = "none";
            document.getElementById('divposter').style.display = "none";

            //showing title , description , CallToAct, Rating
            document.getElementById('divBannerTitle').style.display = '';
            document.getElementById('divDescription').style.display = '';
            document.getElementById('divRating').style.display = '';
            document.getElementById('spnUploader1').innerText = "Upload Ad Image";
            document.getElementById('spnUploader2').innerText = "Upload Icon";
            document.getElementById('spnUploader3').innerText = "Poster With PlayButton";
            document.getElementById('divVideoLinkUrl').style.display = 'none';

        }
        //checkbox banner2 visible 
        function banner2() {
            document.getElementById('banner1').style.display = 'none';
            document.getElementById('banner2').style.display = 'block';
            document.getElementById('banner3').style.display = 'none';
            document.getElementById('banner4').style.display = 'none';
            document.getElementById('banner5').style.display = 'none';
            document.getElementById('banner6').style.display = 'none';
            $('#txt_camp_title').removeAttr('disabled'); //Enable
            $('#messageDiv').removeAttr('disabled'); //Enable
            $('#txt_camp_call_To_Action').removeAttr('disabled'); //Enable
            document.getElementById('divCallToAction').style.display = ''
            $('#messageInput').removeAttr('disabled'); //Enable
            document.getElementById('txt_titlebanner1').style.display = 'none';
            document.getElementById('txt_TitleBanner2').style.display = 'block';
            document.getElementById('txt_titleBanner3').style.display = 'none';
            document.getElementById('txt_titleBanner4').style.display = 'none';
            document.getElementById('txtTitleVideo').style.display = 'none';
            document.getElementById('divPlayBtn').style.display = 'none';
            document.getElementById("ddstars").disabled = false;
            document.getElementById('strRatingBanner2').style.display = "block";
            document.getElementById('divchooseCallToAct').style.display = "block";
            document.getElementsByClassName("emoji-picker-icon")[0].style.display = "none";

            document.getElementById('DivAdImage').style.display = "none";
            document.getElementById('DivIcon').style.display = "block";

            document.getElementById('DivPoster1').style.display = "none";
            document.getElementById('diVFinalPoster').style.display = "none";
            document.getElementById('divposter').style.display = "none";


            //showing title , description , CallToAct, Rating
            document.getElementById('divBannerTitle').style.display = '';
            document.getElementById('divDescription').style.display = '';
            document.getElementById('divRating').style.display = '';
            document.getElementById('spnUploader1').innerText = "Upload Ad Image";
            document.getElementById('spnUploader2').innerText = "Upload Icon";
            document.getElementById('spnUploader3').innerText = "Poster With PlayButton";
            document.getElementById('divVideoLinkUrl').style.display = 'none';
        }

        //checkbox banner3 visible 
        function banner3() {
            document.getElementById('banner1').style.display = 'none';
            document.getElementById('banner2').style.display = 'none';
            document.getElementById('banner3').style.display = 'none';
            document.getElementById('banner4').style.display = 'block';
            document.getElementById('banner5').style.display = 'none';
            document.getElementById('banner6').style.display = 'none';
            document.getElementById('divchooseCallToAct').style.display = 'none';
            $('#txt_camp_title').removeAttr('disabled'); //Enable
            $('#messageDiv').removeAttr('disabled'); //Enable
            $('#txt_camp_call_To_Action').removeAttr('disabled'); //Enable
            document.getElementById('divCallToAction').style.display = 'none'
            $('#messageInput').removeAttr('disabled'); //Enable

            document.getElementById('txt_titlebanner1').style.display = 'none';
            document.getElementById('txt_TitleBanner2').style.display = 'none';
            document.getElementById('txt_titleBanner3').style.display = 'block';
            document.getElementById('txt_titleBanner4').style.display = 'none';
            document.getElementById('txtTitleVideo').style.display = 'none';
            document.getElementById('divPlayBtn').style.display = 'none';
            document.getElementById('strRatingBanner2').style.display = "block";
            document.getElementById("ddstars").disabled = false;
            document.getElementsByClassName("emoji-picker-icon")[0].style.display = "none";

            document.getElementById('DivAdImage').style.display = "block";
            document.getElementById('DivIcon').style.display = "none";

            document.getElementById('DivPoster1').style.display = "none";
            document.getElementById('diVFinalPoster').style.display = "none";
            document.getElementById('divposter').style.display = "none";


            //showing title , description , CallToAct, Rating
            document.getElementById('divBannerTitle').style.display = '';
            document.getElementById('divDescription').style.display = '';
            document.getElementById('divRating').style.display = 'none';
            document.getElementById('spnUploader1').innerText = "Upload Ad Image";
            document.getElementById('spnUploader2').innerText = "Upload Icon";
            document.getElementById('spnUploader3').innerText = "Poster With PlayButton";
            document.getElementById('divVideoLinkUrl').style.display = 'none';
        }

        //checkbox banner4 visible 
        function banner4() {
            document.getElementById('banner1').style.display = 'none';
            document.getElementById('banner2').style.display = 'none';
            document.getElementById('banner3').style.display = 'none';
            document.getElementById('banner4').style.display = 'none';
            document.getElementById('banner5').style.display = 'block';
            document.getElementById('banner6').style.display = 'none';
            document.getElementById('divchooseCallToAct').style.display = 'none';
            $('#txt_camp_title').removeAttr('disabled'); //Enable
            $('#messageDiv').removeAttr('disabled'); //Enable
            $('#txt_camp_call_To_Action').removeAttr('disabled'); //Enable
            document.getElementById('divCallToAction').style.display = ''
            $('#messageInput').removeAttr('disabled'); //Enable

            document.getElementById('txt_titlebanner1').style.display = 'none';
            document.getElementById('txt_TitleBanner2').style.display = 'none';
            document.getElementById('txt_titleBanner3').style.display = 'none';
            document.getElementById('txt_titleBanner4').style.display = 'block';
            document.getElementById('divPlayBtn').style.display = 'none';
            document.getElementById('txtTitleVideo').style.display = 'none';
            document.getElementById("ddstars").disabled = false;
            document.getElementsByClassName("emoji-picker-icon")[0].style.display = "none";

            document.getElementById('DivAdImage').style.display = "none";
            document.getElementById('DivIcon').style.display = "block";

            document.getElementById('DivPoster1').style.display = "none";
            document.getElementById('diVFinalPoster').style.display = "none";
            document.getElementById('divposter').style.display = "none";

            document.getElementById('strRatingBanner2').style.display = "block";

            //showing title , description , CallToAct, Rating
            document.getElementById('divBannerTitle').style.display = '';
            document.getElementById('divDescription').style.display = '';
            document.getElementById('divRating').style.display = 'none';


            //  spnUploader1 spnUploader2 spnUploader3               

            document.getElementById('spnUploader1').innerText = "Upload Ad Image";
            document.getElementById('spnUploader2').innerText = "Upload Icon";
            document.getElementById('spnUploader3').innerText = "Poster With PlayButton";
            document.getElementById('divVideoLinkUrl').style.display = 'none';
        }
        function banner5() {
            document.getElementById('banner1').style.display = 'none';
            document.getElementById('banner2').style.display = 'none';
            document.getElementById('banner3').style.display = 'none';
            document.getElementById('banner4').style.display = 'none';
            document.getElementById('banner5').style.display = 'none';
            document.getElementById('banner6').style.display = 'block';
            $('#txt_camp_title').attr('disabled', 'disabled'); //Disable
            $('#messageDiv').attr('disabled', 'disabled'); //Disable
            $('#messageInput').attr('disabled', 'disabled'); //Disable
            $('#txt_camp_call_To_Action').attr('disabled', 'disabled'); //Disable
            document.getElementById('divCallToAction').style.display = 'none'
            document.getElementById('txt_titlebanner1').style.display = 'none';
            document.getElementById('txt_TitleBanner2').style.display = 'none';
            document.getElementById('txt_titleBanner3').style.display = 'none';
            document.getElementById('txt_titleBanner4').style.display = 'none';
            document.getElementById('txtTitleVideo').style.display = 'block';
            document.getElementById("ddstars").disabled = false;
            document.getElementsByClassName("emoji-picker-icon")[0].style.display = "none";

            document.getElementById('DivAdImage').style.display = "none";
            document.getElementById('DivIcon').style.display = "none";
            document.getElementById('divPlayBtn').style.display = 'block';

            document.getElementById('DivPoster1').style.display = "block";
            document.getElementById('diVFinalPoster').style.display = "block";
            document.getElementById('divposter').style.display = "block";



            document.getElementById('strRatingBanner2').style.display = "block";

            //hiding title , description , CallToAct, Rating

            document.getElementById('divBannerTitle').style.display = 'none';
            document.getElementById('divchooseCallToAct').style.display = 'none';
            document.getElementById('divDescription').style.display = 'none';
            document.getElementById('divRating').style.display = 'none';
            //  spnUploader1 spnUploader2 spnUploader3      Upload Ad Image     Upload Icon    Poster With PlayButton

            document.getElementById('spnUploader1').innerText = "Poster";
            document.getElementById('spnUploader2').innerText = "Final Poster";
            document.getElementById('spnUploader3').innerText = "Poster-IOS";
            document.getElementById('divVideoLinkUrl').style.display = '';
        }
        function banner6() {
            document.getElementById('banner1').style.display = 'none';
            document.getElementById('banner2').style.display = 'none';
            document.getElementById('banner3').style.display = 'none';
            document.getElementById('banner4').style.display = 'none';
            document.getElementById('banner5').style.display = 'none';
            document.getElementById('banner6').style.display = 'block';
            document.getElementById('divchooseCallToAct').style.display = 'none';
            document.getElementById('txt_titlebanner1').style.display = 'none';
            document.getElementById('txt_TitleBanner2').style.display = 'none';
            document.getElementById('txt_titleBanner3').style.display = 'none';
            document.getElementById('txt_titleBanner4').style.display = 'none';
            document.getElementById('txtTitleVideo').style.display = 'block';
            document.getElementById("ddstars").disabled = false;
            document.getElementById('strRatingBanner2').style.display = "block";
            document.getElementById('divposter').style.display = "none";
            document.getElementsByClassName("emoji-picker-icon")[0].style.display = "none";
        }
        function alll() {
            document.getElementById('sponsore_banner1').innerHTML = "sponsored";
            document.getElementById('sponsore_banner2').innerHTML = "sponsored";
            document.getElementById('sponsore_banner3').innerHTML = "sponsored";
            document.getElementById('sponsers_banner4').innerHTML = "sponsored";
            document.getElementById('sponserese_banner_5').innerHTML = "sponsored";
            document.getElementById('sponserese_banner6').innerHTML = "sponsored";

        }
        function advv() {
            document.getElementById('sponsore_banner1').innerHTML = "Adv";
            document.getElementById('sponsore_banner2').innerHTML = "Adv";
            document.getElementById('sponsore_banner3').innerHTML = "Adv";
            document.getElementById('sponsers_banner4').innerHTML = "Adv";
            document.getElementById('sponserese_banner_5').innerHTML = "Adv";
            document.getElementById('sponserese_banner6').innerHTML = "Adv";

        }

        function rate_(rate) {
            var startBanner1Star1 = document.getElementById('rate_img_1_banner1');
            startBanner1Star1.style.display = "block"
            var startBanner1Star2 = document.getElementById('rate_img_2_banner1');
            startBanner1Star2.style.display = "block"
            var startBanner1Star3 = document.getElementById('rate_img_3_banner1');
            startBanner1Star3.style.display = "block"
            var startBanner1Star4 = document.getElementById('rate_img_4_banner1');
            startBanner1Star4.style.display = "block"
            var startBanner1Star5 = document.getElementById('rate_img_5_banner1');
            startBanner1Star5.style.display = "block"
            var rate_img_1_banner2 = document.getElementById('rate_img_1_banner2');
            rate_img_1_banner2.style.display = "block"
            var rate_img_2_banner2 = document.getElementById('rate_img_2_banner2');
            rate_img_2_banner2.style.display = "block"
            var rate_img_3_banner2 = document.getElementById('rate_img_3_banner2');
            rate_img_3_banner2.style.display = "block"
            var rate_img_4_banner2 = document.getElementById('rate_img_4_banner2');
            rate_img_4_banner2.style.display = "block"
            var rate_img_5_banner2 = document.getElementById('rate_img_5_banner2');
            rate_img_5_banner2.style.display = "block"
            //3
            var star_img_1_banner3 = document.getElementById('star_img_1_banner3');
            star_img_1_banner3.style.display = "block"
            document.getElementById('title_banner1').style.paddingTop = "1px";
            document.getElementById('title_banner2').style.paddingTop = "7px";
            var star_img_3_banner3 = document.getElementById('star_img_3_banner3');
            star_img_3_banner3.style.display = "block"
            var star_img_4_banner3 = document.getElementById('star_img_4_banner3');
            star_img_4_banner3.style.display = "block"
            var star_img_5_banner3 = document.getElementById('star_img_5_banner3');
            star_img_5_banner3.style.display = "block"
            if (rate == "0.00") {
                document.getElementById('title_banner1').style.paddingTop = "13px";
                document.getElementById('rate_img_1_banner1').style.display = "none"
                document.getElementById('title_banner2').style.paddingTop = "30px";
                document.getElementById('rate_img_2_banner1').style.display = "none"
                document.getElementById('rate_img_3_banner1').style.display = "none"
                document.getElementById('rate_img_4_banner1').style.display = "none"
                document.getElementById('rate_img_5_banner1').style.display = "none"
                //2
                document.getElementById('rate_img_1_banner2').style.display = "none"
                document.getElementById('rate_img_2_banner2').style.display = "none"
                document.getElementById('rate_img_3_banner2').style.display = "none"
                document.getElementById('rate_img_4_banner2').style.display = "none"
                document.getElementById('rate_img_5_banner2').style.display = "none"
                //3
                document.getElementById('star_img_1_banner3').style.display = "none"
                document.getElementById('star_img_2_banner3').style.display = "none"
                document.getElementById('star_img_3_banner3').style.display = "none"
                document.getElementById('star_img_4_banner3').style.display = "none"
                document.getElementById('star_img_5_banner3').style.display = "none"
            }
            if (rate == "1" || rate == "1.0") {

                document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner1').src = "img/star-empty.png"
                document.getElementById('rate_img_3_banner1').src = "img/star-empty.png"
                document.getElementById('rate_img_4_banner1').src = "img/star-empty.png"
                document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"
                //2
                document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner2').src = "img/star-empty.png"
                document.getElementById('rate_img_3_banner2').src = "img/star-empty.png"
                document.getElementById('rate_img_4_banner2').src = "img/star-empty.png"
                document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"

            }
            if (rate == "1.5" || rate == "1.50") {
                document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner1').src = "img/rating-50.png"
                document.getElementById('rate_img_3_banner1').src = "img/star-empty.png"
                document.getElementById('rate_img_4_banner1').src = "img/star-empty.png"
                document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"
                //2
                document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner2').src = "img/rating-50.png"
                document.getElementById('rate_img_3_banner2').src = "img/star-empty.png"
                document.getElementById('rate_img_4_banner2').src = "img/star-empty.png"
                document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"

            }
            //when rate is 2.0
            else if (rate == "2" || rate == "2.0") {
                document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner1').src = "img/star-empty.png"
                document.getElementById('rate_img_4_banner1').src = "img/star-empty.png"
                document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"
                //2
                document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner2').src = "img/star-empty.png"
                document.getElementById('rate_img_4_banner2').src = "img/star-empty.png"
                document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"
            }
            //when rate is 2.5
            else if (rate == "2.5" || rate == "2.50") {
                document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner1').src = "img/rating-50.png"
                document.getElementById('rate_img_4_banner1').src = "img/star-empty.png"
                document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"
                //2
                document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner2').src = "img/rating-50.png"
                document.getElementById('rate_img_4_banner2').src = "img/star-empty.png"
                document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"
            }
            //when rate is 3.0
            else if (rate == "3" || rate == "3.0") {
                document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_4_banner1').src = "img/star-empty.png"
                document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"
                //2
                document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_4_banner2').src = "img/star-empty.png"
                document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"
            }
            //when rate is 3.5
            else if (rate == "3.5" || rate == "3.50") {
                document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_4_banner1').src = "img/rating-50.png"
                document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"
                //2
                document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_4_banner2').src = "img/rating-50.png"
                document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"
            }
            //when rate is 4.0
            else if (rate == "4" || rate == "4.0") {

                document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_4_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"
                //2
                document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_4_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"
            }

            //when rate is 4.5
            else if (rate == "4.5" || rate == "4.50") {

                document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_4_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_5_banner1').src = "img/rating-50.png"
                //2
                document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_4_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_5_banner2').src = "img/rating-50.png"
            }
            //when rate is 5.00
            else if (rate == "5" || rate == "5.0") {
                document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_4_banner1').src = "img/rating-100.png"
                document.getElementById('rate_img_5_banner1').src = "img/rating-100.png"
                //2
                document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_3_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_4_banner2').src = "img/rating-100.png"
                document.getElementById('rate_img_5_banner2').src = "img/rating-100.png"
            }
            else {
            }
        }
        // select os function
        function os() {

            var os_total = "";
            var wincheckbox = document.getElementById("os_1");
            var appleCheckBox = document.getElementById("os2");
            var blackberryCheckbox = document.getElementById("os3");
            var ipadcheckbox = document.getElementById("os4");
            var ipodcheckbox = document.getElementById("os5");
            var androidCheckbox = document.getElementById("os6");
            if (wincheckbox.checked) {
                if (os_total == "") {

                    os_total = "Windows";
                }
                else {
                    os_total = os_total + "," + "Windows";
                }
            }
            if (appleCheckBox.checked) {
                if (os_total == "") {
                    os_total = "Apple";
                }
                else {
                    os_total = os_total + "," + "Apple";
                }
            }
            if (blackberryCheckbox.checked) {


                if (os_total == "") {
                    os_total = "Blackberry";
                }
                else {
                    os_total = os_total + "," + "Blackberry";
                }
            }
            if (ipadcheckbox.checked) {
                if (os_total == "") {

                    os_total = "ipad";
                }
                else {
                    os_total = os_total + "," + "ipad";
                }
            }
            if (ipodcheckbox.checked) {
                if (os_total == "") {
                    os_total = "ipod";
                }
                else {
                    os_total = os_total + "," + "ipod";
                }
            }
            if (androidCheckbox.checked) {
                if (os_total == "") {
                    os_total = "Android";
                }
                else {
                    os_total = os_total + "," + "Android";
                }
            }
            document.getElementById('txt_included_devices').value = os_total;
        }
        function submit_camp() {

            var banner_id = "";
            if (document.getElementById('banner1').style.display == 'block') {
                banner_id = "Banner 1";
            }
            if (document.getElementById('banner2').style.display == 'block') {
                banner_id = "Banner 2";
            }
            if (document.getElementById('banner3').style.display == 'block') {

                banner_id = "Banner 3";
            }
            if (document.getElementById('banner4').style.display == 'block') {
                banner_id = "Banner 4";
            }
            if (document.getElementById('banner6').style.display == 'block') {
                banner_id = "Banner 5";
            }

            var camp_name = document.getElementById('txt_camp_name').value;

            var TitleBanner1 = document.getElementById('txt_titlebanner1').value;
            var TitleBanner2 = document.getElementById('txt_TitleBanner2').value;

            var TitleBanner3 = document.getElementById('txt_titleBanner3').value;
            var TitleBanner4 = document.getElementById('txt_titleBanner4').value;
            var titleVideoBanner = document.getElementById('txtTitleVideo').value;


            var MaxImpressions = document.getElementById('txtMaxImpressions').value;
            if (MaxImpressions == '') {
                MaxImpressions = '5';
            }

            var description = document.getElementById('messageDiv').innerHTML;
            var adv_sponserce = "";
            if (document.getElementById('sponserse').checked == true) {
                adv_sponserce = "sponsored";
            }
            else if (document.getElementById('adv').checked == true) {
                adv_sponserce = "adv";
            }
            var camp_url = document.getElementById('txt_camp_url').value;
            var vedio_url = document.getElementById('vedio_url_link').value;
            var txt_call_to_action = document.getElementById('txt_camp_call_To_Action').value;
            var included_devicess = document.getElementById('txt_included_devices').value;
            var TypeOfAdTarget = document.getElementById('HdnfTypeOfTargeting').value;
            var cost = document.getElementById('cost').value;
            var pageUrl = '<%= ResolveUrl("~/admin/EditCampaign.aspx/submit_function") %>';
            var firstName = "1";
            var lastName = "2";
            //            main banner image 
            //start 
            var countries = document.getElementById('sale_1');
            var resultc = [];
            for (var i = 0; i < countries.options.length; i++) {
                if (countries.options[i].selected) {
                    resultc.push(countries.options[i].value)
                }
            }
            var countr = resultc.toString();

            var cities = document.getElementById('selectCity');
            var resultcities = [];
            for (var i = 0; i < cities.options.length; i++) {
                if (cities.options[i].selected) {
                    resultcities.push(cities.options[i].value)
                }
            }
            var countcities = resultcities.toString();

            var isp = document.getElementById('selectISP');
            var resultisp = [];
            for (var i = 0; i < isp.options.length; i++) {
                if (isp.options[i].selected) {
                    resultisp.push(isp.options[i].value)
                }
            }
            var countisp = resultisp.toString();


            //--------------------------os start---------------------------------------
            var OsString = document.getElementById('ddOs');
            var OsArray = [];
            for (var i = 0; i < OsString.options.length; i++) {
                if (OsString.options[i].selected) {
                    if (i == 0) {
                        OsArray.push('Windows')
                    }
                    else if (i == 1) {
                        OsArray.push('Apple')
                    }
                    else {
                        OsArray.push(OsString.options[i].value)
                    }
                }
            }

            var OsSelected = OsArray.toString();


            //--------------------------os End-------------------------------




            //---------------------------Age Range Start------------------------------
            var ddlAgeRange = document.getElementById('ddlAgeRange');
            var AgeRangeArray = [];
            for (var i = 0; i < ddlAgeRange.options.length; i++) {
                if (ddlAgeRange.options[i].selected) {

                    AgeRangeArray.push(ddlAgeRange.options[i].value)

                }
            }

            var RangeSelected = AgeRangeArray.toString();

            //----------------------------Age Range End---------------------------


            //---------------------------Gender Start------------------------------
            var ddlGender = document.getElementById('ddlGender');
            var GenderArray = [];
            for (var i = 0; i < ddlGender.options.length; i++) {
                if (ddlGender.options[i].selected) {

                    GenderArray.push(ddlGender.options[i].value)

                }
            }

            var GenderSelected = GenderArray.toString();

            //----------------------------Gender End---------------------------


            //---------------------------InterestCategories Start------------------------------
            var ddlInterestCategories = document.getElementById('ddlInterestCategories');
            var InterestCategoriesArray = [];
            for (var i = 0; i < ddlInterestCategories.options.length; i++) {
                if (ddlInterestCategories.options[i].selected) {

                    InterestCategoriesArray.push(ddlInterestCategories.options[i].value)

                }
            }

            var InterestCategoriesSelected = InterestCategoriesArray.toString();

            //----------------------------InterestCategories End---------------------------






            //   -------------------  keywords start------------------------------
            var Keywords = document.getElementById('txtKeyWords').value;

            var startsDD = document.getElementById('ddstars');
            var Adstars = "";
            for (var i = 0; i < startsDD.options.length; i++) {
                if (startsDD.options[i].selected) {
                    Adstars = startsDD.options[i].value;
                }
            }
            var passvalueStars = Adstars.toString();
            var banner1Check = document.getElementById('chkBanner1');
            var banner2Check = document.getElementById('chkBanner2');
            var banner3Check = document.getElementById('chkbsdfsdfsanner3');
            var banner4Check = document.getElementById('chkBafghfghnner5');
            var banner5Check = document.getElementById('ckbanfgfdggner6');
            var AllBanners = "";
            if (banner1Check.checked) {
                if (AllBanners == "") {
                    AllBanners = "Banner 1";
                }
                else {
                    AllBanners = AllBanners + "," + "Banner 1";
                }
            }
            if (banner2Check.checked) {
                if (AllBanners == "") {
                    AllBanners = "Banner 2";
                }
                else {
                    AllBanners = AllBanners + "," + "Banner 2";
                }
            }
            if (banner3Check.checked) {
                if (AllBanners == "") {
                    AllBanners = "Banner 3";
                }
                else {
                    AllBanners = AllBanners + "," + "Banner 3";
                }
            }
            if (banner4Check.checked) {
                if (AllBanners == "") {
                    AllBanners = "Banner 4";
                }
                else {
                    AllBanners = AllBanners + "," + "Banner 4";
                }
            }

            if (banner5Check.checked) {
                if (AllBanners == "") {
                    AllBanners = "Banner 5";
                }
                else {
                    AllBanners = AllBanners + "," + "Banner 5";

                }
            }

            var ShowCallToActBnr2 = document.getElementById('hdnfShowHideBanner2').value;

            var bannerType1 = document.getElementById('bannerType1');
            var bannerType2 = document.getElementById('bannerType2');

            var bannerBackground = '';
            var imageA = '';
            var imageB = '';
            var imageC = '';
            var imageD = '';
            var imageE = '';
            var animationA = '';
            var animationB = '';
            var animationC = '';
            var animationD = '';
            var animationE = '';
            var bannerType = '';
            var main_banner_img = '';
            var camp_icon_img = '';
            var posterWithPlay = '';
            var filePosterurl = '';


            var fileUpload = $("#FileUpload1").get(0);
            var files1 = fileUpload.files;
            if (files1.length) {
                var file_name = $("#FileUpload1").val();

                var file1 = file_name.split('\\').pop();
                var main_banner_img = "../Campaign_Images/" + file1;

                var test = new FormData();
                for (var i = 0; i < files1.length; i++) {
                    test.append(files1[i].name, files1[i]);
                }
                $.ajax({
                    url: "camp2.ashx",
                    type: "POST",
                    contentType: false,
                    processData: false,
                    data: test,
                    success: function (result) {
                    },
                    error: function (err) {
                    }
                });
            } else {
                main_banner_img = $.trim($("#FileUpload1_old").val());
            }

            //main banner image upload finish
            //camp icon image upload statrt
            var fileUpload = $("#FileUpload2").get(0);
            var files2 = fileUpload.files;
            if (files2.length) {
                var file_name = $("#FileUpload2").val();

                var file2 = file_name.split('\\').pop();
                camp_icon_img = "../Campaign_Images/" + file2;
                var test = new FormData();
                for (var i = 0; i < files2.length; i++) {
                    test.append(files2[i].name, files2[i]);
                }
                $.ajax({
                    url: "camp.ashx",
                    type: "POST",
                    contentType: false,
                    processData: false,
                    data: test,
                    success: function (result) {
                    },
                    error: function (err) {
                    }
                });
            } else {
                camp_icon_img = $.trim($("#FileUpload2_old").val());
            }

            var fileUpload = $("#FileUpload3").get(0);
            var files3 = fileUpload.files;
            if (files3.length) {
                var file_name = $("#FileUpload3").val();

                var file = file_name.split('\\').pop();
                var posterWithPlay = "../Campaign_Images/" + file;

                var test = new FormData();
                for (var i = 0; i < files3.length; i++) {
                    test.append(files3[i].name, files3[i]);
                }
                $.ajax({
                    url: "camp2.ashx",
                    type: "POST",
                    contentType: false,
                    processData: false,
                    data: test,
                    success: function (result) {
                    },
                    error: function (err) {
                    }
                });
            } else {
                posterWithPlay = $.trim($("#FileUpload3_old").val());
            }

            var fileUpload = $("#PosterUploader").get(0);
            var filesPoster = fileUpload.files;
            if (filesPoster.length) {
                var file_name = $("#PosterUploader").val();
                var bannerAnimation = $("#").val();

                var fileposter = file_name.split('\\').pop();
                var filePosterurl = "../Campaign_Images/" + fileposter;

                var test = new FormData();
                for (var i = 0; i < files.length; i++) {
                    test.append(files[i].name, files[i]);
                }
                $.ajax({
                    url: "camp2.ashx",
                    type: "POST",
                    contentType: false,
                    processData: false,
                    data: test,
                    success: function (result) {
                    },
                    error: function (err) {
                    }
                });
            } else {
                filePosterurl = $.trim($("#PosterUploader_old").val());
            }

            //            var fileUpload = $("#FinalPosterUploader").get(0);
            //            var filesFPoster = fileUpload.files;
            //            var file_name = $("#FinalPosterUploader").val();
            //            var finalAnimation = $("#FinalAnimation").val();

            //            var fileFinalposter = file_name.split('\\').pop();
            //            var fileFinalposterUrl = "../Campaign_Images/" + fileFinalposter;

            //            var test = new FormData();
            //            for (var i = 0; i < filesFPoster.length; i++) {
            //                test.append(filesFPoster[i].name, filesFPoster[i]);
            //            }
            //            $.ajax({
            //                url: "camp2.ashx",
            //                type: "POST",
            //                contentType: false,
            //                processData: false,
            //                data: test,
            //                success: function (result) {
            //                },
            //                error: function (err) {
            //                }
            //            });

            if (bannerType1.checked) {
                var bannerType = '1';
                var fileUpload = $("#backgroundImage").get(0);
                var filesBG = fileUpload.files;
                if (filesBG.length) {
                    var file_name = $("#backgroundImage").val();
                    var fileposter = file_name.split('\\').pop();
                    bannerBackground = "../Campaign_Images/" + fileposter;
                    var test = new FormData();
                    for (var i = 0; i < filesBG.length; i++) {
                        test.append(filesBG[i].name, filesBG[i]);
                    }
                    $.ajax({
                        url: "camp2.ashx",
                        type: "POST",
                        contentType: false,
                        processData: false,
                        data: test,
                        success: function (result) {
                        },
                        error: function (err) {
                        }
                    });
                } else {
                    bannerBackground = $.trim($('#bannerBackground_old').val());
                }

                var fileUpload = $("#imageA").get(0);
                var filesA = fileUpload.files;
                if (filesA.length) {
                    var file_name = $("#imageA").val();
                    var fileposter = file_name.split('\\').pop();
                    var imageA = "../Campaign_Images/" + fileposter;
                    var test = new FormData();
                    for (var i = 0; i < filesA.length; i++) {
                        test.append(filesA[i].name, filesA[i]);
                    }
                    $.ajax({
                        url: "camp2.ashx",
                        type: "POST",
                        contentType: false,
                        processData: false,
                        data: test,
                        success: function (result) {
                        },
                        error: function (err) {
                        }
                    });
                } else {
                    imageA = $.trim($('#imageA_old').val());
                }

                var fileUpload = $("#imageB").get(0);
                var filesB = fileUpload.files;
                if (filesB.length) {
                    var file_name = $("#imageB").val();
                    var fileposter = file_name.split('\\').pop();
                    var imageB = "../Campaign_Images/" + fileposter;
                    var test = new FormData();
                    for (var i = 0; i < filesB.length; i++) {
                        test.append(filesB[i].name, filesB[i]);
                    }
                    $.ajax({
                        url: "camp2.ashx",
                        type: "POST",
                        contentType: false,
                        processData: false,
                        data: test,
                        success: function (result) {
                        },
                        error: function (err) {
                        }
                    });
                } else {
                    imageB = $.trim($("#imageB_old").val());
                }

                var fileUpload = $("#imageC").get(0);
                var filesC = fileUpload.files;
                if (filesC.length) {
                    var file_name = $("#imageC").val();
                    var fileposter = file_name.split('\\').pop();
                    var imageC = "../Campaign_Images/" + fileposter;

                    var test = new FormData();
                    for (var i = 0; i < filesC.length; i++) {
                        test.append(filesC[i].name, filesC[i]);
                    }
                    $.ajax({
                        url: "camp2.ashx",
                        type: "POST",
                        contentType: false,
                        processData: false,
                        data: test,
                        success: function (result) {
                        },
                        error: function (err) {
                        }
                    });
                } else {
                    imageC = $.trim($('#imageC_old').val());
                }
                animationA = $('#FinalAnimation1').val();
                animationB = $('#FinalAnimation2').val();
                animationC = $('#FinalAnimation3').val();

            } else if (bannerType2.checked) {
                var bannerType = '2';
                var fileUpload = $("#backgroundImage2").get(0);
                var filesBG2 = fileUpload.files;
                if (filesBG2.length) {
                    var file_name = $("#backgroundImage2").val();
                    var fileposter = file_name.split('\\').pop();
                    var bannerBackground = "../Campaign_Images/" + fileposter;
                    var test = new FormData();
                    for (var i = 0; i < filesBG2.length; i++) {
                        test.append(filesBG2[i].name, filesBG2[i]);
                    }
                    $.ajax({
                        url: "camp2.ashx",
                        type: "POST",
                        contentType: false,
                        processData: false,
                        data: test,
                        success: function (result) {
                        },
                        error: function (err) {
                        }
                    });
                } else {
                    bannerBackground = $.trim($("#backgroundImage2_old").val());
                }

                var fileUpload = $("#imageD").get(0);
                var filesD = fileUpload.files;
                if (filesD.length) {
                    var file_name = $("#imageD").val();
                    var fileposter = file_name.split('\\').pop();
                    var imageD = "../Campaign_Images/" + fileposter;
                    var test = new FormData();
                    for (var i = 0; i < filesD.length; i++) {
                        test.append(filesD[i].name, filesD[i]);
                    }
                    $.ajax({
                        url: "camp2.ashx",
                        type: "POST",
                        contentType: false,
                        processData: false,
                        data: test,
                        success: function (result) {
                        },
                        error: function (err) {
                        }
                    });
                } else {
                    imageD = $.trim($("#imageD_old").val());
                }

                var fileUpload = $("#imageE").get(0);
                var filesE = fileUpload.files;
                if (filesE.length) {
                    var file_name = $("#imageE").val();
                    var fileposter = file_name.split('\\').pop();
                    var imageE = "../Campaign_Images/" + fileposter;
                    var test = new FormData();
                    for (var i = 0; i < filesE.length; i++) {
                        test.append(filesE[i].name, filesE[i]);
                    }
                    $.ajax({
                        url: "camp2.ashx",
                        type: "POST",
                        contentType: false,
                        processData: false,
                        data: test,
                        success: function (result) {
                        },
                        error: function (err) {
                        }
                    });

                } else {
                    imageE = $.trim($("#imageE_old").val());
                }
                

                animationD = $('#FinalAnimation4').val();
                animationE = $('#FinalAnimation5').val();
            }
            fileFinalposterUrl = bannerBackground;
            dailyCapping = $('#dailyCapping').val();

            var videoPlayBtn = $("#videoPlayButton").val();
            // alert(pageUrl + "?camp_name: " + camp_name + " , title: " + TitleBanner1 + " , description: " + description + " , camp_url: " + camp_url + " , vedio_url: " + vedio_url + " , txt_call_to_action: " + txt_call_to_action + " , included_devicess: " + OsSelected + " , adv_sponserce: " + adv_sponserce + " , cost: " + cost + " , banner_id: " + banner_id + " , rate: " + passvalueStars + " , camp_icon_img: " + camp_icon_img + " , main_banner_img: " + main_banner_img + " , country: " + countr + " , AllBanners: " + AllBanners + " , campkeys: " + Keywords + " , titleBanner2: " + TitleBanner2 + " , titleBanner3: " + TitleBanner3 + " , titleBanner4: " + TitleBanner4 + " , ShowCallToAction: " + ShowCallToActBnr2 + " , TitleVideoBanner: " + titleVideoBanner + " , posterWithPlay: " + posterWithPlay + " , Poster: " + filePosterurl + " , finalPoster: " + fileFinalposterUrl + " , bannerType: " + bannerType + " , imageA: " + imageA + " , imageB: " + imageB + " , imageC: " + imageC + " , imageD: " + imageD + " , imageE: " + imageE + " , animationA: " + animationA + " , animationB: " + animationB + " , animationC: " + animationC + " , animationD: " + animationD + " , animationE: " + animationE + " , MaxImpressions: " + MaxImpressions + " , TypeOfAdTarget: " + TypeOfAdTarget + " , RangeSelected: " + RangeSelected + " , GenderSelected: " + GenderSelected + " , InterestCategoriesSelected: " + InterestCategoriesSelected + " , CitySelected: " + countcities + " , ISPSelected: " + countisp + " , videoPlayBtn: " + videoPlayBtn + " , dailyCapping" + dailyCapping)
            var parameter = { "camp_name": camp_name, "title": TitleBanner1, "description": description, "camp_url": camp_url, "vedio_url": vedio_url, "txt_call_to_action": txt_call_to_action, "included_devicess": OsSelected, "adv_sponserce": adv_sponserce, "cost": cost, "banner_id": banner_id, "rate": passvalueStars, "camp_icon_img": camp_icon_img, "main_banner_img": main_banner_img, "country": countr, "AllBanners": AllBanners, "campkeys": Keywords, "titleBanner2": TitleBanner2, "titleBanner3": TitleBanner3, "titleBanner4": TitleBanner4, "ShowCallToAction": ShowCallToActBnr2, "TitleVideoBanner": titleVideoBanner, "posterWithPlay": posterWithPlay, "Poster": filePosterurl, "finalPoster": fileFinalposterUrl, "bannerType": bannerType, "imageA": imageA, "imageB": imageB, "imageC": imageC, "imageD": imageD, "imageE": imageE, "animationA": animationA, "animationB": animationB, "animationC": animationC, "animationD": animationD, "animationE": animationE, "MaxImpressions": MaxImpressions, "TypeOfAdTarget": TypeOfAdTarget, "RangeSelected": RangeSelected, "GenderSelected": GenderSelected, "InterestCategoriesSelected": InterestCategoriesSelected, "CitySelected": countcities, "ISPSelected": countisp, "videoPlayBtn": videoPlayBtn, "dailyCapping": dailyCapping };
            $.ajax({
                type: 'POST',
                url: pageUrl,
                data: JSON.stringify(parameter),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    document.getElementById('spnMessage').innerText = "Campaign updated successfully...";
                    document.getElementById('spnMessage').style.color = "Green";
                    document.getElementById('spnUploadAdImg').innerText = "";
                    document.getElementById('spnUploadIconImg').innerText = "";
                    document.getElementById('spnUploadIosPoster').innerText = "";
                    document.getElementById('spnUploadFinalPoster').innerText = "";
                    document.getElementById('spnUploadPosterImg').innerText = "";
                    document.getElementById('txtMaxImpressions').value = '';
                },
                error: function (data, success, error) {
                    alert("Error : " + error);
                }
            });
        }
        function callBackMessage(message) {

            alert(message);
        }
        function SetTypeTarget(Type) {
            $('#divMaxImpression, #divKeyWords, #divAgeRange, #divAudience, #divGender').hide();
            $('#txtMaxImpressions, #txtKeyWords, #ddlAgeRange, #ddlGender, #ddlInterestCategories').val('');
            $('#ddlAgeRange, #ddlGender, #ddlInterestCategories').trigger('change');
            $('#txtKeyWords_tagsinput .tag').remove();

            if (Type == "0") {
                $('#HdnfTypeOfTargeting').val('All');
            }
            else if (Type == "1") {
                $('#divKeyWords').show();
                $('#HdnfTypeOfTargeting').val('Keywords');
            }
            else if (Type == "2") {
                $('#divMaxImpression').show();
                $('#HdnfTypeOfTargeting').val('Cookies');
            }
            else if (Type == "3") {
                $('#divAgeRange').show();
                $('#HdnfTypeOfTargeting').val('AgeRange');
            }
            else if (Type == "4") {
                $('#divGender').show();
                $('#HdnfTypeOfTargeting').val('Gender');
            }
            else if (Type == "5") {
                $('#divAudience').show();
                $('#HdnfTypeOfTargeting').val('PublicInterest');
            }
        }
    </script>
    <script type="text/javascript">
        function InsertData() {

            var banner1Check = document.getElementById('chkBanner1');
            var banner2Check = document.getElementById('chkBanner2');
            var banner3Check = document.getElementById('chkbsdfsdfsanner3');
            var banner4Check = document.getElementById('chkBafghfghnner5');
            var banner5Check = document.getElementById('ckbanfgfdggner6');

            if (banner1Check.checked || banner3Check.checked || banner2Check.checked || banner4Check.checked || banner5Check.checked) {

                if (banner5Check.checked) {
                    // alert('enter in 5 check')
//                    if (document.getElementById('hdnfValidateImg1').value == 'valid' && document.getElementById('hdnfValidateImg2').value == 'valid' && document.getElementById('hdnfValidateImg3').value == 'valid' && document.getElementById('hdnfPoster').value == 'valid' && document.getElementById('hdnfFinalPoster').value == 'valid') {
                    if (document.getElementById('hdnfValidateImg3').value == 'valid' && document.getElementById('hdnfPoster').value == 'valid') {

                        submit_camp();
                    }
                    else {
                        alert('All images and posters are not valid in width and height ratio.')
                    }

                }
                else {
                    if (document.getElementById('hdnfValidateImg1').value == 'valid') {
                        submit_camp();
                    }
                    else {
                        //alert('banner Image  not valid in height and width ratio.')
                    }
                }
            }
            else {
                alert('Please select at least one banner type')
            }

        }

        function validateImg1() {

            var fileUpload = document.getElementById("FileUpload1");
            var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.png|.gif)$");
            if (regex.test(fileUpload.value.toLowerCase())) {

                if (typeof (fileUpload.files) != "undefined") {

                    var reader = new FileReader();

                    //Read the contents of Image File.

                    reader.readAsDataURL(fileUpload.files[0]);
                    reader.onload = function (e) {

                        //Initiate the JavaScript Image object.
                        var image = new Image();

                        //Set the Base64 string return from FileReader as source.
                        image.src = e.target.result;

                        //Validate the File Height and Width.
                        image.onload = function () {
                            var height = this.height;
                            var width = this.width;

                            //   alert(width + "   " + height);
                            if ((width / height == 2.5) && height == 320 && width == 800) {
                                statusval = "true";
                                document.getElementById('hdnfValidateImg1').value = "valid";
                                document.getElementById('spnUploadAdImg').style.color = "green";
                                document.getElementById('spnUploadAdImg').innerText = "Uploader1 has Valid ratio of 2:5 ( width=" + width + " , height= " + height + " )";
                            }
                            else {
                                fileUpload.value = "";
                                document.getElementById('spnUploadAdImg').style.color = "Red";
                                document.getElementById('spnUploadAdImg').innerText = "Uploader1 Image Height and Width are not in ratio of 2:5 ( width=" + width + " , height= " + height + " )";
                            }
                        };
                    }
                }
                else {
                    document.getElementById('spnUploadAdImg').innerText = "This browser does not support HTML5.";
                    statusval = "false";
                }
            }
            else {
                document.getElementById('spnUploadAdImg').innerText = "Ad Image is not selected. please select a file.";
                statusval = "False";
            }
        }

        function validateImg2() {

            var fileUpload = document.getElementById("FileUpload2");
            var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.png|.gif)$");
            if (regex.test(fileUpload.value.toLowerCase())) {

                if (typeof (fileUpload.files) != "undefined") {

                    var reader = new FileReader();

                    //Read the contents of Image File.

                    reader.readAsDataURL(fileUpload.files[0]);
                    reader.onload = function (e) {

                        //Initiate the JavaScript Image object.
                        var image = new Image();

                        //Set the Base64 string return from FileReader as source.
                        image.src = e.target.result;

                        //Validate the File Height and Width.
                        image.onload = function () {
                            var height = this.height;
                            var width = this.width;

                            //   alert(width + "   " + height);
                            if (height == 80 && width == 80) {
                                statusval = "true";
                                document.getElementById('hdnfValidateImg2').value = "valid";
                                document.getElementById('spnUploadIconImg').innerText = "Uploader2 has valid ratio 80*80 ( width=" + width + " , height= " + height + " )";
                                document.getElementById('spnUploadIconImg').style.color = "green";
                            }
                            else {
                                fileUpload.value = "";
                                document.getElementById('spnUploadIconImg').innerText = "Uploader2 Image Height and Width are not in ratio 80*80 ( width=" + width + " , height= " + height + " )";
                                document.getElementById('spnUploadIconImg').style.color = "Red";
                            }

                        };
                    }
                }
                else {
                    document.getElementById('spnUploadIconImg').innerText = "This browser does not support HTML5.";
                    statusval = "false";
                }
            }
            else {
                document.getElementById('spnUploadIconImg').innerText = "Icon image is not selected. please select a file.";
                statusval = "False";
            }

        }

        function validateImg3() {
            //  alert('3');
            var fileUpload = document.getElementById("FileUpload3");
            var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.png|.gif)$");
            if (regex.test(fileUpload.value.toLowerCase())) {

                if (typeof (fileUpload.files) != "undefined") {

                    var reader = new FileReader();

                    //Read the contents of Image File.

                    reader.readAsDataURL(fileUpload.files[0]);
                    reader.onload = function (e) {

                        //Initiate the JavaScript Image object.
                        var image = new Image();

                        //Set the Base64 string return from FileReader as source.
                        image.src = e.target.result;

                        //Validate the File Height and Width.
                        image.onload = function () {
                            var height = this.height;
                            var width = this.width;

                            //   alert(width + "   " + height);
                            if (height == 450 && width == 800) {
                                statusval = "true"; document.getElementById('hdnfValidateImg3').value = "valid";
                                // alert('val= '+statusval);
                                //                                     alert(width / height);

                                document.getElementById('spnUploadIosPoster').innerText = "Poster-IOS has valid ratio of 16:9 ( width=" + width + " , height= " + height + " )";
                                document.getElementById('spnUploadIosPoster').style.color = "green";
                            }
                            else {

                                fileUpload.value = "";
                                document.getElementById('spnUploadIosPoster').innerText = "Poster-IOS Image Height and Width are not in ratio of 16:9 ( width=" + width + " , height= " + height + " )";
                                document.getElementById('spnUploadIosPoster').style.color = "Red";
                            }
                        };
                    }
                }
                else {
                    document.getElementById('spnUploadIosPoster').innerText = "This browser does not support HTML5.";
                    statusval = "false";
                }
            }
            else {
                document.getElementById('spnUploadIosPoster').innerText = "Ios-Poster image  is not selected. please select a file.";
                statusval = "False";
            }

        }


        function validatePosterImg() {
            //  alert('3');
            var fileUpload = document.getElementById("PosterUploader");
            var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.png|.gif)$");
            if (regex.test(fileUpload.value.toLowerCase())) {

                if (typeof (fileUpload.files) != "undefined") {

                    var reader = new FileReader();

                    //Read the contents of Image File.

                    reader.readAsDataURL(fileUpload.files[0]);
                    reader.onload = function (e) {

                        //Initiate the JavaScript Image object.
                        var image = new Image();

                        //Set the Base64 string return from FileReader as source.
                        image.src = e.target.result;

                        //Validate the File Height and Width.
                        image.onload = function () {
                            var height = this.height;
                            var width = this.width;

                            alert(width + "   " + height);
                            if (height == 450 && width == 800) {
                                statusval = "true"; document.getElementById('hdnfPoster').value = "valid";
                                // alert('val= '+statusval);
                                //                                     alert(width / height);
                                document.getElementById('spnUploadPosterImg').innerText = "Poster Imgae has valid ratio of 16:9 ( width=" + width + " , height= " + height + " )";
                                document.getElementById('spnUploadPosterImg').style.color = "green";
                                if (document.getElementById("b5").checked = true) {
                                    var VideoUrl = document.getElementById("vedio_url_link").value;
                                    addVideoPreview(image.src, VideoUrl);
                                }
                            }
                            else {

                                document.getElementById('PosterUploader').value = "";
                                document.getElementById('hdnfPoster').value = "Invalid";
                                document.getElementById('spnUploadPosterImg').innerText = "Poster Imgae Height and Width are not in ratio of 16:9 ( width=" + width + " , height= " + height + " )\nIt must be 800px X 450px";
                                document.getElementById('spnUploadPosterImg').style.color = "Red";
                                statusval = "False";
                            }
                        };
                    }
                }
                else {
                    document.getElementById('spnUploadPosterImg').innerText = "This browser does not support HTML5.";
                    statusval = "false";
                }
            }
            else {
                document.getElementById('spnUploadPosterImg').innerText = "Poster image  is not selected. please select a file.";
                statusval = "False";
            }

        }

        function vilidateFinalPoster() {
            //  alert('3');
            var fileUpload = document.getElementById("FinalPosterUploader");
            var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.png|.gif)$");
            if (regex.test(fileUpload.value.toLowerCase())) {

                if (typeof (fileUpload.files) != "undefined") {

                    var reader = new FileReader();

                    //Read the contents of Image File.

                    reader.readAsDataURL(fileUpload.files[0]);
                    reader.onload = function (e) {

                        //Initiate the JavaScript Image object.
                        var image = new Image();

                        //Set the Base64 string return from FileReader as source.
                        image.src = e.target.result;

                        //Validate the File Height and Width.
                        image.onload = function () {
                            var height = this.height;
                            var width = this.width;

                            //   alert(width + "   " + height);
                            if (height == 450 && width == 800) {
                                statusval = "true"; document.getElementById('hdnfFinalPoster').value = "valid";
                                document.getElementById('spnUploadFinalPoster').innerText = "Final Poster has valid Height=450 and Width=800 ";
                                document.getElementById('spnUploadFinalPoster').style.color = "green";
                            }
                            else {
                                document.getElementById('hdnfFinalPoster').value = "Invalid";
                                document.getElementById('spnUploadFinalPoster').innerText = "Required Final Poster Image Height=450 and Width=800 ";
                                document.getElementById('spnUploadFinalPoster').style.color = "Red";
                                statusval = "False";
                            }
                        };
                    }
                }
                else {
                    document.getElementById('spnUploadFinalPoster').innerText = "This browser does not support HTML5.";
                    statusval = "false";
                }
            }
            else {
                document.getElementById('spnUploadFinalPoster').innerText = "Final-poster is not selected. please select a file.";
                statusval = "False";
            }

        }

//        window.onload = function FillDescription() {
//            document.getElementById('messageDiv').innerHTML = document.getElementById('hdnfDescription').value;
//            document.getElementById('show').style.display = "none";
//            bannerTitle = document.getElementById('txt_camp_title').value;
//            document.getElementById('txt_titlebanner1').value = bannerTitle;
//            document.getElementById('txt_TitleBanner2').value = bannerTitle;
//            document.getElementById('txt_titleBanner3').value = bannerTitle;
//            document.getElementById('txt_titleBanner4').value = bannerTitle;
//            document.getElementById('txtTitleVideo').value = bannerTitle;
//        }

        $(document).ready(function () {
            $('#getElementById, #getElementById, #getElementById, #getElementById, #getElementById, #divchooseCallToAct, #txt_TitleBanner2, #txt_titleBanner3, #txt_titleBanner4, #diVFinalPoster, #DivPoster1, #divposter, #divPlayBtn, #divMaxImpression, #divKeyWords, #divAgeRange, #divAudience, #divGender, #divVideoLinkUrl').hide();
            $('#divDescription, #txt_camp_call_To_Action, #divCallToAction, #txt_titlebanner1, #divRating, .emoji-picker-icon').show();
            $('#txt_camp_call_To_Action, #txt_camp_title, #messageDiv, #txt_camp_call_To_Action, #messageInput').removeAttr('disabled');
            $('#spnUploader1').text("Upload Ad Image");
            $('#spnUploader2').text("Upload Icon");
            $('#spnUploader3').text("Poster With PlayButton");
            $('#messageDiv').html($('#hdnfDescription').val()).height(84);
            bannerTitle = $('#txt_camp_title').val();
            $('#txt_titlebanner1,#txt_TitleBanner2,#txt_titleBanner3,#txt_titleBanner4,#txtTitleVideo').val(bannerTitle);
            $('input[name="groupredio"]:checked').trigger('click').closest('.bannerSelectors').find('input[type=checkbox]').attr({ 'checked': 'checked', 'data-cacheval': 'true' });
            $('#videoButton').trigger('change');
            var v = document.getElementById('videoPlayer');
            v.onclick = function () {
                if (v.paused) {
                    v.play();
                    v.controls = null;
                } else {
                    v.pause();
                    v.controls = "controls";
                }
            };
            v.addEventListener('ended', function () {
                showOverlayBanner();
            })
        })
    </script>
    </form>
</body>
</html>
