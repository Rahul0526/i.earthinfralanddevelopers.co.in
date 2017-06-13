<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_rating.aspx.cs" Inherits="admin_test_rating" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>

     <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.3.min.js"></script>
 <link rel="stylesheet" type="text/css" href="http://camp.earthinfralanddevelopers.co.in/admin/css/bootstrap.min.css" />

 <link href="http://camp.earthinfralanddevelopers.co.in/admin/css/style.css" rel="stylesheet" />
    <script type="text/javascript">
        window.onload = function () {
            console.log("Output;");
            console.log(location.hostname);
            console.log(document.domain);
            var domain_name = document.domain

            var websites = document.getElementById('ContentPlaceHolder1_sites_allow_banner1').innerText;
            var site_array = new Array();
            site_array = websites.split(",");
            var arrayLength = site_array.length;
            var site_allow = 0;
            for (var i = 0; i < arrayLength; i++) {
                if (domain_name == site_array[i]) {
                    site_allow = site_allow + 1;
                }
            }



            // now after checking the os confuguraton of the os plateform... we will deside finally that the ad section deserve for this site and os confuguration or not.
            // now we are going to check the os confuguration of the whether it is  windows/ios/endroid/ipad/ipod
            var OSName = "Unknown OS";
            if (navigator.appVersion.indexOf("Win") != -1) OSName = "Windows";
            if (navigator.appVersion.indexOf("Mac") != -1) OSName = "MacOS";
            if (navigator.appVersion.indexOf("X11") != -1) OSName = "UNIX";
            if (navigator.appVersion.indexOf("Linux") != -1) OSName = "Linux";
            if (navigator.appVersion.indexOf("Android") != -1) OSName = "Android";
            if (navigator.appVersion.indexOf("iPhone") != -1) OSName = "ios";
            if (navigator.appVersion.indexOf("iPod") != -1) OSName = "iPod";
            if (navigator.appVersion.indexOf("iPad") != -1) OSName = "iPad";

            if (OSName != "Unknown OS") {
                var selected_os_in_campaign = document.getElementById('ContentPlaceHolder1_os_allowed_banner1').innerText;
                var os_configuration = new Array();
                os_configuration = selected_os_in_campaign.split(",");
                var length_os_configuration = os_configuration.length;
                var os_allow_counter = 0;
                for (var i = 0; i < length_os_configuration; i++) {


                    if (OSName == os_configuration[i]) {
                        os_allow_counter = os_allow_counter + 1;
                    }
                }

                // now we check that aligibility counter is more than zero for both site_allow and os_allow_counter or not.
                if (os_allow_counter == 0 || site_allow == 0) {
                    //hide the ad section

                    document.getElementById('ContentPlaceHolder1_banner1').style.display = 'none';

                }
                else {
                    //show the ad section... now this site and system os is allowed for this ad .... thank you
                    increase_view();



                }






            }
            else {
                //hide  the  ad div
                document.getElementById('ContentPlaceHolder1_banner1').style.display = 'none';


            }


        }



        function increase_view() {
            var camp_id = document.getElementById('ContentPlaceHolder1_banner1_id').innerText;
            var req_type = "view";
            var url = "http://lkohaat.akassociate.in/web_url.aspx?iframe_id=" + camp_id + "&request_type=" + req_type;
            window.open(url, "_blank", "width=1,height=1");
        }
        function click_1() {
            var camp_id = document.getElementById('ContentPlaceHolder1_banner1_id').innerText;


            var req_type = "click";

            var url = "http://lkohaat.akassociate.in/web_url.aspx?iframe_id=" + camp_id + "&request_type=" + req_type;
            window.open(url, "_blank", "width=1,height=1");
        }
    </script>

     <style type="text/css">
.blankstar
{
background-image: url(blank_star.png);
width: 16px;
height: 16px;
}
.waitingstar
{
background-image: url(half_star.png);
width: 16px;
height: 16px;
}
.shiningstar
{
background-image: url(shining_star.png);
width: 16px;
height: 16px;
}
         .auto-style1
         {
             width: 16px;
             height: 16px;
         }
     </style>

</head>
<body>
    <form id="form1" runat="server">
    <div id="ContentPlaceHolder1_banner1" class="card">
    	<div id="ContentPlaceHolder1_sponsore_banner1" class="Sponsored-3">Sponsored</div>   
    	<div class="title-container">
            <div class="col-xs-2 card-icon"><img src="http://camp.earthinfralanddevelopers.co.in/Campaign_Images/thumb-3.jpg" id="ContentPlaceHolder1_icon_img_banner1" style="height:50px; width:50px" alt="banner-img" class="" /></div>
            <div class="col-xs-10"> <div id="ContentPlaceHolder1_title_banner1" class="title ">test</div>
            <div class="Rating"><img src="http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png" id="ContentPlaceHolder1_rate_img_1_banner1" alt="banner-img" class="img-responsive" /><img src="http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png" id="ContentPlaceHolder1_rate_img_2_banner1" alt="banner-img" class="img-responsive" /><img src="http://camp.earthinfralanddevelopers.co.in/admin/img/rating.png" id="ContentPlaceHolder1_rate_img_3_banner1" alt="banner-img" class="img-responsive" />
          
            </div>
            </div>
        <div class=" clearfix"></div>
        </div><div id="ContentPlaceHolder1_discription_banner1" class="card-description">hello... this is a test campaing game ... as much as they want to play.....</div><div class="card-banner">
            <img src="http://camp.earthinfralanddevelopers.co.in/Campaign_Images/image-1.jpg" id="ContentPlaceHolder1_banner_img_banner1" alt="banner-img" class="img-responsive" />
            </div>
            <div id="ContentPlaceHolder1_banner1_id" style="font-size:1pt">te1005030447730</div>
            <div id="ContentPlaceHolder1_os_allowed_banner1" style="font-size:1pt">Windows,ios</div>
            <div id="ContentPlaceHolder1_sites_allow_banner1" style="font-size:1pt"></div>
            <div id="ContentPlaceHolder1_action_button_banner1" class="install-btn"><a href="http://localhost:4374/The_campaign/Admin/Copy_ad.aspx" id="ContentPlaceHolder1_install_link_banner1" target="_blank" onclick="click_1()">Install Now</a></div><!--install-btn-->
    </div>
    </form>
  
</body>
</html>
