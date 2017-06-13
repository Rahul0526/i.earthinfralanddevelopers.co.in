<%@ Page Language="C#" AutoEventWireup="true" CodeFile="update_camp.aspx.cs" Inherits="admin_update_camp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="no-js sidebar-large">
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <title>Campaign Application</title>
    <link rel="icon" href="img/Iconsmind-Outline-Flag-2.ico" type="img/Iconsmind-Outline-Flag-2.ico"
        sizes="16x16">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="" name="description" />
    <meta content="themes-lab" name="author" />
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
        rel="stylesheet">
    <link href="rate/css/star-rating.min.css" media="all" rel="stylesheet" type="text/css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="gen_validatorv4.js" type="text/javascript"></script>
    <script src="rate/js/star-rating.min.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
    <link href="assets/css/icons/icons.min.css" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/plugins.min.css" rel="stylesheet">
    <link href="assets/css/style.min.css" rel="stylesheet">
    <!-- BEGIN PAGE LEVEL STYLE -->
    <link href="assets/plugins/datetimepicker/jquery.datetimepicker.css" rel="stylesheet">
    <link href="assets/plugins/pickadate/themes/default.css" rel="stylesheet">
    <link href="assets/plugins/pickadate/themes/default.date.css" rel="stylesheet">
    <link href="assets/plugins/pickadate/themes/default.time.css" rel="stylesheet">
    <!-- END PAGE LEVEL STYLE -->
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
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.2.8/jquery.form-validator.min.js"
        type="text/javascript">
    </script>
    <script type="text/javascript">

        //this function will run on pageload time .. and mad banner1 visible true
        window.onload = function banner_visible() {
            document.getElementById('b1').checked = true;
            document.getElementById('banner1').style.display = 'block';
            document.getElementById('banner2').style.display = 'none';
            document.getElementById('banner3').style.display = 'none';
            document.getElementById('banner4').style.display = 'none';
            document.getElementById('banner5').style.display = 'none';
            document.getElementById('banner6').style.display = 'none';
        }
        //checkbox banner1 visible 
        function banner1() {
            document.getElementById('banner1').style.display = 'block';
            document.getElementById('banner2').style.display = 'none';
            document.getElementById('banner3').style.display = 'none';
            document.getElementById('banner4').style.display = 'none';
            document.getElementById('banner5').style.display = 'none';
            document.getElementById('banner6').style.display = 'none';

        }

        //checkbox banner2 visible 
        function banner2() {
            document.getElementById('banner1').style.display = 'none';
            document.getElementById('banner2').style.display = 'block';
            document.getElementById('banner3').style.display = 'none';
            document.getElementById('banner4').style.display = 'none';
            document.getElementById('banner5').style.display = 'none';
            document.getElementById('banner6').style.display = 'none';
        }

        //checkbox banner3 visible 
        function banner3() {
            document.getElementById('banner1').style.display = 'none';
            document.getElementById('banner2').style.display = 'none';
            document.getElementById('banner3').style.display = 'none';
            document.getElementById('banner4').style.display = 'block';
            document.getElementById('banner5').style.display = 'none';
            document.getElementById('banner6').style.display = 'none';
        }

        //checkbox banner4 visible 
        function banner4() {
            document.getElementById('banner1').style.display = 'none';
            document.getElementById('banner2').style.display = 'none';
            document.getElementById('banner3').style.display = 'none';
            document.getElementById('banner4').style.display = 'none';
            document.getElementById('banner5').style.display = 'block';
            document.getElementById('banner6').style.display = 'none';

        }

        //checkbox banner5 visible 
        function banner5() {
            document.getElementById('banner1').style.display = 'none';
            document.getElementById('banner2').style.display = 'none';
            document.getElementById('banner3').style.display = 'none';
            document.getElementById('banner4').style.display = 'none';
            document.getElementById('banner5').style.display = 'none';
            document.getElementById('banner6').style.display = 'block';

        }
        //checkbox banner6 visible 
        function banner6() {
            document.getElementById('banner1').style.display = 'none';
            document.getElementById('banner2').style.display = 'none';
            document.getElementById('banner3').style.display = 'none';
            document.getElementById('banner4').style.display = 'none';
            document.getElementById('banner5').style.display = 'none';
            document.getElementById('banner6').style.display = 'block';
        }

        //sponsered radiobutton function
        function alll() {

            document.getElementById('sponsore_banner1').innerHTML = "sponsored";
            document.getElementById('sponsore_banner2').innerHTML = "sponsored";
            document.getElementById('sponsore_banner3').innerHTML = "sponsored";
            document.getElementById('sponsers_banner4').innerHTML = "sponsored";
            document.getElementById('sponserese_banner_5').innerHTML = "sponsored";
            document.getElementById('sponserese_banner6').innerHTML = "sponsored";
        }

        //adv radiobutton function
        function advv() {

            document.getElementById('sponsore_banner1').innerHTML = "Adv";
            document.getElementById('sponsore_banner2').innerHTML = "Adv";
            document.getElementById('sponsore_banner3').innerHTML = "Adv";
            document.getElementById('sponsers_banner4').innerHTML = "Adv";
            document.getElementById('sponserese_banner_5').innerHTML = "Adv";
            document.getElementById('sponserese_banner6').innerHTML = "Adv";

        }



        function rate_() {
            var rate = document.getElementById('rate').value;

            if (rate == "1" || rate == "1.0") {
                //                rate_img_1_banner1.Visible = true;
                //                rate_img_2_banner1.Visible = false;
                //                rate_img_3_banner1.Visible = false;
                //                rate_img_4_banner1.Visible = false;

                //                rate_img_5_banner1.Visible = false;

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


                //3
                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner3').src = "img/star-empty.png"
                document.getElementById('star_img_3_banner3').src = "img/star-empty.png"
                document.getElementById('star_img_4_banner3').src = "img/star-empty.png"
                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"

                //6
                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner6').src = "img/star-empty.png"
                document.getElementById('star_img_3_banner6').src = "img/star-empty.png"
                document.getElementById('star_img_4_banner6').src = "img/star-empty.png"
                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"



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


                //3
                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner3').src = "img/rating-50.png"
                document.getElementById('star_img_3_banner3').src = "img/star-empty.png"
                document.getElementById('star_img_4_banner3').src = "img/star-empty.png"
                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"

                //6



                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner6').src = "img/rating-50.png"
                document.getElementById('star_img_3_banner6').src = "img/star-empty.png"
                document.getElementById('star_img_4_banner6').src = "img/star-empty.png"
                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"



            }



            //when rate is 1.5
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


                //3
                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner3').src = "img/star-empty.png"
                document.getElementById('star_img_4_banner3').src = "img/star-empty.png"
                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"

                //6



                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner6').src = "img/star-empty.png"
                document.getElementById('star_img_4_banner6').src = "img/star-empty.png"
                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"



            }



            //when rate is 1.5
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

                //3
                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner3').src = "img/rating-50.png"
                document.getElementById('star_img_4_banner3').src = "img/star-empty.png"
                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"

                //6



                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner6').src = "img/rating-50.png"
                document.getElementById('star_img_4_banner6').src = "img/star-empty.png"
                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"



            }

            //when rate is 1.5
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


                //3
                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_4_banner3').src = "img/star-empty.png"
                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"


                //6
                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_4_banner6').src = "img/star-empty.png"
                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"



            }

            //when rate is 1.5
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


                //3
                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_4_banner3').src = "img/rating-50.png"
                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"

                //6

                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_4_banner6').src = "img/rating-50.png"
                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"

            }

            //when rate is 1.5
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

                //3
                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_4_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"

                //6

                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_4_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"

            }

            //when rate is 1.5
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

                //3
                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_4_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_5_banner3').src = "img/rating-50.png"

                //6

                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_4_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_5_banner6').src = "img/rating-50.png"
            }


            //when rate is 1.5
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


                //3
                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_4_banner3').src = "img/rating-100.png"
                document.getElementById('star_img_5_banner3').src = "img/rating-100.png"

                //6



                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_3_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_4_banner6').src = "img/rating-100.png"
                document.getElementById('star_img_5_banner6').src = "img/rating-100.png"




            }
            else {

                //alert('please Choose fractional value like 1 or 1.0 or 1.5 ...  from 1.0 to 5.0');
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

            //            if (document.getElementById('banner5').style.display == 'block') {
            //                banner_id = "Banner 5";
            //            }


            if (document.getElementById('banner6').style.display == 'block') {
                banner_id = "Banner 5";
            }

            var camp_name = document.getElementById('txt_camp_name').value;

            var title = document.getElementById('txt_camp_title').value;
            var description = document.getElementById('txt_camp_discription').value;
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
            var rate = document.getElementById('rate').value;
            var included_devicess = document.getElementById('txt_included_devices').value;

            var cost = document.getElementById('cost').value;

            var pageUrl = '<%= ResolveUrl("~/admin/create_new_campaign.aspx/submit_function") %>';

            var firstName = "1";
            var lastName = "2";

            //            main banner image 
            //start 
            var fileUpload = $("#FileUpload1").get(0);
            var files = fileUpload.files;
            var file_name = $("#FileUpload1").val();

            var file1 = file_name.split('\\').pop();
            var main_banner_img = "../Campaign_Images/" + file1;

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
                // dataType: "json",
                success: function (result) {
                    //                    alert(result);
                },
                error: function (err) {
                    //                    alert(err.statusText);
                }
            });

            //main banner image upload finish



            //camp icon image upload statrt



            var fileUpload = $("#FileUpload2").get(0);
            var files = fileUpload.files;
            var file_name = $("#FileUpload2").val();

            var file2 = file_name.split('\\').pop();
            var camp_icon_img = "../Campaign_Images/" + file2;

            var test = new FormData();
            for (var i = 0; i < files.length; i++) {
                test.append(files[i].name, files[i]);
            }

            $.ajax({

                url: "camp.ashx",
                type: "POST",
                contentType: false,
                processData: false,
                data: test,
                // dataType: "json",
                success: function (result) {
                    //                    alert(result);
                },
                error: function (err) {
                    //                    alert(err.statusText);
                }
            });

            var countries = document.getElementById('sale_1');
            var resultc = [];
            for (var i = 0; i < countries.options.length; i++) {
                if (countries.options[i].selected) {
                    resultc.push(countries.options[i].value)
                }
            }
            var countr = resultc.toString();


            //main jason string send to  c# function
            var parameter = { "camp_name": camp_name, "title": title, "description": description, "camp_url": camp_url, "camp_url": camp_url, "vedio_url": vedio_url, "txt_call_to_action": txt_call_to_action, "vedio_url": vedio_url, "included_devicess": included_devicess, "adv_sponserce": adv_sponserce, "cost": cost, "banner_id": banner_id, "rate": rate, "camp_icon_img": camp_icon_img, "main_banner_img": main_banner_img, "country": countr }
            $.ajax({
                type: 'POST',
                url: pageUrl,
                data: JSON.stringify(parameter),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    //                    onSuccess(data);
                    alert('New campaign added successfully!');
                    document.getElementById("myform").reset();
                    document.getElementById('b1').checked = true;

                },
                error: function (data, success, error) {
                    alert("Error : " + error);
                }
            });

            return false;
            //            alert(camp_name + title + camp_url + vedio_url + txt_call_to_action);
        }

    </script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#inputid').bind('rating.change', function (event, value, caption) {
                alert(value);
                //$("#lbl1").html(value);

            });

        });

        function abc(action, value) {
            $('#input-id').rating(action, value);
        }

    </script>
   
</head>
<body data-page="dashboard">
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
                                <a href="Change_password_admin.aspx">
                                    <i class="fa fa-cog"></i> Account Settings
                                </a>
                            </li>
                            <li class="dropdown-footer clearfix">
                               
                               
                                <a href="login.aspx" title="Logout">
                                    <i class="fa fa-power-off"></i>Logout
                                </a>
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
                            <li ><a href="create_new_campaign.aspx"><i class="fa fa-flag-o"></i>
                        <span class="sidebar-text">Manage Campaign</span><span class="fa arrow"></span></a>
                      
                    </li>
                     
                      <li>
                        <a href="Start_stop_campaign.aspx" ><i class="fa fa-lock"></i><span class="sidebar-text">Start/Stop Campaign</span><span class="fa arrow"></span></a>
                    </li>
                    
                            <li>
                                <a href="Affiliate_login_details.aspx"><i class="fa fa-lock"></i><span class="sidebar-text">Affiliate Login</span><span class="fa arrow"></span></a>
                            </li>
                            

                     <li>
                        <a href="Affiliate_ctr.aspx" ><i class="fa fa-flag-o"></i><span class="sidebar-text">Affiliate CTR</span><span class="fa arrow"></span></a>
                    </li>

                     <li>
                        <a href="Payment.aspx" ><i class="fa fa-flag-o"></i><span class="sidebar-text">Payment</span><span class="fa arrow"></span></a>
                    </li>
                     <li>
                        <a href="view_click_report_details_affilate_wise.aspx" ><i class="fa fa-flag-o"></i><span class="sidebar-text">Affiliate View Clicks</span><span class="fa arrow"></span></a>
                    </li>

                      <li>
                        <a href="Chart_view_admin.aspx" ><i class="fa fa-flag-o"></i><span class="sidebar-text">Chart View(All Affiliate)</span><span class="fa arrow"></span></a>
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
                                    <div class="col-md-4 col-sm-4 col-xs-12 table-responsive" style="overflow-x: hidden;">
                                        <h4>
                                            Create/edit campaign</h4>
                                        <div>
                                            <h5>
                                                &nbsp;</h5>
                                            <asp:DropDownList ID="dd_affiliate" Visible="false" Width="50%" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div>
                                            <h5>
                                                Campaign name</h5>
                                            <%-- <asp:TextBox runat="server" ID="txt_camp_name" MaxLength="50" class="form-control" placeholder="Campaign Name"
                                                type="text"></asp:TextBox>--%>
                                            <input type="text" id="txt_camp_name"  maxlength="50" class="form-control" placeholder="Campaign Name"/>
                                        </div>
                                        <div>
                                            <h5>
                                                Title</h5>
                                            <%-- <asp:TextBox runat="server" MaxLength="50" ID="txt_camp_title" class="form-control" placeholder="Title"
                                                type="text"></asp:TextBox>--%>
                                            <input type="text" id="txt_camp_title" maxlength="50" class="form-control" placeholder="Title" />
                                        </div>
                                        <div>
                                            <h5>
                                                Description</h5>
                                            <%--<asp:TextBox runat="server" ID="txt_camp_discription" MaxLength="100" class="form-control" cols="20"
                                                name="S1" placeholder="Description" ></asp:TextBox>--%>
                                            <input type="text" id="txt_camp_discription" maxlength="100" class="form-control"
                                                placeholder="Description" />
                                        </div>
                                        <div>
                                            <h5>
                                                <span id="urlspan" runat="server">Action URL</span></h5>
                                            <%--  <asp:TextBox runat="server" ID="txt_camp_url" class="form-control" placeholder="URL"></asp:TextBox>--%>
                                            <input type="text" id="txt_camp_url" class="form-control" placeholder="URL" />
                                        </div>
                                        <div>
                                            <h5>
                                                <span id="Span1" runat="server">Vedio URL</span></h5>
                                            <%--  <asp:TextBox runat="server" ID="vedio_url_link" class="form-control" placeholder="Vedio Link URL"></asp:TextBox>--%>
                                            <input type="text" id="vedio_url_link" class="form-control" placeholder="Vedio Link URL" />
                                        </div>
                                        <div>
                                            <h5>
                                                Call to Action</h5>
                                            <%-- <asp:TextBox runat="server" ID="txt_camp_call_To_Action" class="form-control" placeholder="Call In Action"
                                                type="text"></asp:TextBox>--%>
                                            <input type="text" id="txt_camp_call_To_Action" class="form-control" placeholder="Call In Action" />
                                        </div>
                                        <div>
                                            <h5>
                                                Upload Ad Image</h5>
                                            <div class="">
                                                <div class=" col-sm-8">
                                                    <%--  <asp:FileUpload ID="FileUpload1" CssClass="btn btn-primary" runat="server" />--%>
                                                    <%--<asp:Button ID="Button3" runat="server" ForeColor="White" CausesValidation="false" BorderStyle="None" 
                                                        Text="Preview" onclick="Button3_Click" />--%>
                                                    <input type="file" id="FileUpload1" runat="server" class="btn btn-primary" />
                                                    &nbsp;
                                                </div>
                                                <div class=" col-sm-4">
                                                </div>
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <h5>
                                                Upload Icon</h5>
                                            <div class="">
                                                <div class=" col-sm-8">
                                                    <%--<asp:FileUpload ID="FileUpload2" CssClass="btn btn-primary" runat="server" />--%>
                                                    <%--<asp:Button ID="Button4" runat="server" BorderStyle="None" 
                                                        CausesValidation="false" ForeColor="White" 
                                                        Text="Preview" onclick="Button4_Click" />--%>
                                                    <input type="file" id="FileUpload2" runat="server" class="btn btn-primary" />
                                                    &nbsp;
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                        <h5>
                                            Click for preview</h5>
                                        <div>
                                            <div style="float: left; width: 50px;">
                                                <%--<asp:RadioButton ID="CheckBox1" OnCheckedChanged="load_banner_style" GroupName="a"
                                                    AutoPostBack="true" runat="server" />--%>
                                                <input id="b1" style="color: Black" name="groupredio" type="radio" onclick="banner1()" />
                                            </div>
                                            <div style="float: left; width: 70%; margin-top: 11px;">
                                                Banner style1
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                            <div style="height: 15px;">
                                            </div>
                                        </div>
                                        <div>
                                            <div style="float: left; width: 50px;">
                                                <%--  <asp:RadioButton ID="CheckBox2" OnCheckedChanged="load_banner_style" GroupName="a"
                                                    AutoPostBack="true" runat="server" />--%>
                                                <input name="groupredio" type="radio" id="b2" style="color: Black" onclick="banner2()" />
                                            </div>
                                            <div style="float: left; width: 70%;margin-top: 11px;">
                                                Banner style2
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                            <div style="height: 15px;">
                                            </div>
                                        </div>

                                        <div>
                                            <div style="float: left; width: 50px;">
                                                <%--  <asp:RadioButton ID="CheckBox4" AutoPostBack="true" OnCheckedChanged="load_banner_style"
                                                    GroupName="a" runat="server" />--%>
                                                <input name="groupredio" type="radio" id="b3" style="color: Black" onclick="banner3()" />
                                            </div>
                                            <div style="float: left; width: 70%;margin-top: 11px;">
                                                Banner style3
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                            <div style="height: 15px;">
                                            </div>
                                        </div>

                                        <div>
                                            <div style="float: left; width: 50px;">
                                                <%-- <asp:RadioButton ID="CheckBox5" AutoPostBack="true" OnCheckedChanged="load_banner_style"
                                                    GroupName="a" runat="server" />--%>
                                                <input name="groupredio" type="radio" id="b4" style="color: Black" onclick="banner4()" />
                                            </div>
                                            <div style="float: left; width: 70%;margin-top: 11px;">
                                                Banner style4
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                            <div style="height: 15px;">
                                            </div>
                                        </div>

                                        <div>
                                            <div style="float: left; width: 50px;">
                                                <%-- <asp:RadioButton ID="checkbox6" AutoPostBack="true" OnCheckedChanged="load_banner_style"
                                                    GroupName="a" runat="server" />--%>
                                                <input name="groupredio" type="radio" id="b5" style="color: Black" onclick="banner5()" />
                                            </div>
                                            <div style="float: left; width: 70%;margin-top: 11px;">
                                                Banner style5
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                            <div style="height: 15px;">
                                            </div>
                                        </div>

                                        <div>
                                            <h5>
                                                Bid</h5>
                                            <%--<asp:TextBox runat="server" ID="cost" type="text" class="form-control" placeholder="0.25"></asp:TextBox>--%>
                                            <input type="text" class="form-control" id="cost" />
                                        </div>

                                        <div class="clearfix">
                                            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                                            </asp:ToolkitScriptManager>
                                        </div>
                                        <div style="height: 25px;">
                                        </div>

                                        <div>
                                            <div style="float: left; width: 30px;">
                                                <%-- <asp:RadioButton runat="server" ID="sponsored" GroupName="sp" 
                                                    AutoPostBack="True" oncheckedchanged="sponsored_CheckedChanged" />--%>
                                                <input name="sponser" onclick="alll()" type="radio" id="sponserse" style="color: Black" />
                                            </div>
                                            <div style="float: left; width: 70%;margin-top: 11px;">
                                                sponsored</div>
                                            <div class="clearfix">
                                            </div>
                                            <div style="height: 15px;">
                                            </div>
                                        </div>

                                        <div>
                                            <div style="float: left; width: 30px;">
                                                <%-- <asp:RadioButton runat="server" ID="avd"  GroupName="sp" AutoPostBack="True" 
                                                    oncheckedchanged="avd_CheckedChanged"/></div>--%>
                                                <input name="sponser" type="radio" onclick="advv()" id="adv" style="color: Black" />
                                            </div>
                                            <div style="float: left; width: 70%;margin-top: 11px;">
                                                adv</div>
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
                                                    <select name="select2" id="sale_1"  size="7" tabindex="1" class="form-control" multiple>
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
                                                        <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option>
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
                                                        <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republi of</option>
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
                                                    Rating</h5>
                                                <div>
                                                    <input type="text" id="rate" class="form-control" onkeyup="rate_()" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>

                                    </div>

                                    <div class=" col-md-4">
                                        <link href="css/bootstrap.min.css" rel="stylesheet" />
                                        <link href="css/style.css" rel="stylesheet" />
                                        <%-- banner 1 start--%>
                                        <div class="card" runat="server" id="banner1">
                                            <div class="Sponsored-3" runat="server" id="sponsore_banner1">
                                                Sponsored</div>
                                            <div class="title-container">
                                                <div class="col-xs-2 card-icon">
                                                    <img src="img/madicon.jpg" style="height: 50px; width: 50px" runat="server" id="icon_img_banner1"
                                                        alt="banner-img" class="" /></div>
                                                <!--card-icon-->
                                                <div class="col-xs-10">
                                                    <div class="title title_banner" runat="server" id="title_banner1">
                                                        Mad Max 4 : Fury Road</div>
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
                                                From director George Miller, originator of the post-apocalyptic genre and mastermind
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
                                        <div class="card" runat="server" id="banner2">
                                            <div class="title-container">
                                                <div class="col-xs-2 card-icon">
                                                    <img src="img/card2-icon.png" style="height: 50px; width: 50px" runat="server" id="icon_img_banner2"
                                                        alt="banner-img" class="" /></div>
                                                <!--card-icon-->
                                                <div class="col-xs-6">
                                                    <div class="title title_banner" runat="server" id="title_banner2">
                                                        Lorem Ipsum
                                                    </div>
                                                    <div class="Rating">
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
                                                    <div runat="server" id="sponsore_banner2">
                                                        Sponsored
                                                    </div>
                                                </div>
                                                <!--add-heading-->
                                                <div id="banner_2_id" runat="server" style="font-size: 1pt">
                                                </div>
                                                <div class="col-xs-4 install-btn2">
                                                    <a href="#" target="_blank" onclick="click_1()" runat="server" id="install_link_banner2">
                                                        <span id="lnk_banner2" class="lnk_banner">INSTALL</span></a>
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
                                        <div class="card" id="banner3" runat="server">
                                            <div class="Sponsored-3" runat="server" id="sponsore_banner3">
                                                Sponsored</div>
                                            <div class="title2 title_banner " runat="server" id="title_banner3">
                                                Show Me What A True Hero Looks Like</div>
                                            <!--title-->
                                            <div class="card-banner">
                                                <img src="img/banner-img2.jpg" runat="server" id="image_banner3" alt="banner-img"
                                                    class="img-responsive" />
                                            </div>
                                            <!--add-banner-->
                                            <div class="title-container">
                                                <div class="col-xs-2 card-icon">
                                                    <img src="img/add-icon.jpg" runat="server" id="icon_img_banner3" alt="banner-img"
                                                        class="col-xs-2 card-icon" /></div>
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
                                        <div class="card" id="banner4" runat="server">
                                            <div class="Sponsored-3" runat="server" id="sponsers_banner4">
                                                Sponsored</div>
                                            <div class="card-banner">
                                                <img src="img/banner-img2.jpg" runat="server" id="image_banner_4" alt="banner-img"
                                                    class="img-responsive" />
                                            </div>
                                            <!--add-banner-->
                                            <div class="title2 title_banner" runat="server" id="title_banner4">
                                                Show Me What A True Hero Looks Like</div>
                                            <div class="card-description discription_banner" runat="server" id="discription_banner4">
                                                Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem
                                                Ipsum is simply dummy text of the printing and typesetting industry.
                                            </div>
                                            <!--card-description-->
                                            <div id="banner_4_id" runat="server" style="font-size: 1pt">
                                            </div>
                                        </div>
                                        <!--card-->
                                        <%-- banner 4 close--%>
                                        <!--<div style="height:100px;"></div>-->
                                        <%-- banner 5 start--%>
                                        <div class="card" runat="server" id="banner5">
                                            <div class="Sponsored-3" runat="server" id="sponserese_banner_5">
                                                Sponsored</div>
                                            <div class="title-container">
                                                <div class="col-xs-2 card-icon">
                                                    <img style="height: 50px; width: 50px" runat="server" id="icon_image_banner_5" src="img/card2-icon.png"
                                                        alt="banner-img" class=""></div>
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
                                            <div class="col-xs-4 install-btn5">
                                                <a href="#" target="_blank" onclick="click_1()" runat="server" id="install_link_banner5">
                                                    <span id="lnk_banner5" class="lnk_banner">INSTALL</span></a></div>
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
                                        <div class="card" runat="server" id="banner6">
                                            <div class="Sponsored-3" runat="server" id="sponserese_banner6">
                                                Sponsored</div>
                                            <div class="title-container">
                                               <%-- <div class="col-xs-2 card-icon">
                                                    <img runat="server" id="icon_img_banner_6" style="height: 50px; width: 50px" src="img/add-icon.jpg"
                                                        alt="banner-img" class="" /></div>--%>
                                                <!--card-icon-->
                                               <%-- <div class="col-xs-10">
                                                    <div class="title title_banner" runat="server" id="title_banner_6">
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
                                                </div>--%>
                                                <!--add-heading-->
                                                <div class=" clearfix">
                                                </div>
                                            </div>
                                            <!--title-container-->
                                           <%-- <div class="card-description" runat="server" id="diacription_banner6">
                                                Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem
                                                Ipsum is simply dummy text of the printing and typesetting industry.
                                            </div>--%>
                                            <!--card-description-->
<div id="DivVideo" class="card-banner">
                                                
    <video  runat="server" id="AdVideo" height="240" width="320" poster="img/windows.png">
   <source  runat="server" id="s1"  src="http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4" type="video/mp4" />
   <source runat="server" id="s2" src="movie.ogg" type="video/ogg" />
   Your browser does not support the video tag.
</video>
                                            </div>
                                            <!--add-banner-->
                                            <div runat="server" id="banner_6_id" runat="server" style="font-size: 1pt">
                                            </div>
                                           <%-- <div class="col-sm-4 col-xs-12 install-btn6">
                                                <a href="#" target="_blank" onclick="click_1()" runat="server" id="install_action_banner_6">
                                                    <span id="lnk_banner6" class="lnk_banner" runat="server">INSTALL</span></a>
                                            </div>--%>
                                            <!--install-btn-->
                                        </div>
                                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
                                        <script src="js/bootstrap.js"></script>
                                        <div>
                                            <h5>
                                                &nbsp;</h5>
                                            <asp:TextBox runat="server" Enabled="false" ID="TextBox1" type="text" Width="95%"
                                                Height="150px" TextMode="MultiLine" class="form-control" placeholder="Copy Ad Here"
                                                Visible="False"></asp:TextBox>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class=" clearfix">
                            </div>
                            <div class=" clearfix">
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <h5>
                                    Devices &amp; OS
                                </h5>
                                <div>
                                    <div class=" clearfix">
                                    </div>
                                </div>
                                <div>
                                    <div class=" col-sm-4 col-xs-12">
                                        <div>
                                            <div class="col-sm-2">
                                                <input type="checkbox" onclick="os();" id="os_1" /></div>
                                            <div class="col-sm-2" style="margin-top: 18px;">
                                                <span id="win">Windows</span>
                                            </div>
                                            <div class=" clearfix">
                                            </div>
                                        </div>
                                        <div>
                                            <div class="col-sm-2">
                                                <input type="checkbox" id="os2" onclick="os()" />
                                            </div>
                                            <div class="col-sm-9" style="margin-top: 18px;">
                                                <span id="app">Apple</span>
                                            </div>
                                            <div class=" clearfix">
                                            </div>
                                        </div>

                                        <div>
                                            <div class="col-sm-2">
                                                <%-- <asp:CheckBox ID="CheckBox8" OnCheckedChanged="incluede_devices" AutoPostBack="true"
                                                    runat="server" />--%>
                                                <input type="checkbox" id="os3" onclick="os()" />
                                            </div>
                                            <div class="col-sm-9"  style="margin-top: 18px;">
                                                <%-- <asp:Label ID="Label2" runat="server" Text="Blackberry"></asp:Label>--%>
                                                <span id="blackberry">Blackberry</span>
                                            </div>
                                            <div class=" clearfix">
                                            </div>
                                        </div>

                                        <div>
                                            <div class="col-sm-2">
                                                <%--  <asp:CheckBox ID="CheckBox9" OnCheckedChanged="incluede_devices" AutoPostBack="true"
                                                    runat="server" />--%>
                                                <input type="checkbox" id="os4" onclick="os()" />
                                            </div>
                                            <div class="col-sm-9" style="margin-top: 18px;">
                                                <%--<asp:Label ID="Label3" runat="server" Text="ipad"></asp:Label>--%>
                                                <span id="ipad">ipad</span>
                                            </div>
                                            <div class=" clearfix">
                                            </div>
                                        </div>

                                        <div>
                                            <div class="col-sm-2">
                                                <%-- <asp:CheckBox ID="CheckBox10" OnCheckedChanged="incluede_devices" AutoPostBack="true"
                                                    runat="server" />--%>
                                                <input type="checkbox" id="os5" onclick="os()" />
                                            </div>
                                            <div class="col-sm-9" style="margin-top: 18px;">
                                                <%-- <asp:Label ID="Label4" runat="server" Text="ipod"></asp:Label>--%>
                                                <span id="ipod">ipod</span>
                                            </div>
                                            <div class=" clearfix">
                                            </div>
                                        </div>


                                        <div>
                                            <div class="col-sm-2">
                                                <%--<asp:CheckBox ID="CheckBox11" OnCheckedChanged="incluede_devices" AutoPostBack="true"
                                                    runat="server" />--%>
                                                <input type="checkbox" id="os6" onclick="os()" />
                                            </div>
                                            <div class="col-sm-9" style="margin-top: 18px;">
                                                <%--  <asp:Label ID="Label5" runat="server" Text="Android"></asp:Label>--%>
                                                <span id="Android">Android</span>
                                            </div>
                                            <div class=" clearfix">
                                            </div>
                                        </div>
                                    </div>

                                    <div class=" col-sm-8 col-xs-12" style="padding-left: 0; margin-top: 10px;">
                                        <div class=" col-sm-7 col-xs-10">
                                            <%-- <asp:TextBox runat="server" ID="txt_included_devices" TextMode="MultiLine" class="form-control"
                                                Rows="5" Columns="10" placeholder="Selected Devices"></asp:TextBox>--%>
                                            <textarea style="" cols="40" rows="6" id="txt_included_devices" class="form-control"></textarea>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>

                                    <div class="col-md-4 col-sm-4 col-xs-12" style="margin: 30px auto 0 auto; float: none;">
                                        <div class=" clearfix">
                                        </div>
                                        <%--<asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" Height="40px"
                                            Width="100px" Style="background-color: #868482; color: #fff;" />--%>
                                        <input type="button" value="Submit" onclick="submit_camp()" class="btn btn-primary"
                                            style="background-color: #337ab7;" />
                                        &nbsp;&nbsp
                                        <%-- <asp:Button ID="Button2" runat="server" Text="Reset" CausesValidation="false" Height="40px"
                                            Width="100px" Style="background-color: #868482; color: #fff;" OnClick="Button2_Click" />--%>
                                        <input type="button" value="Reset" class="btn btn-default" style="background-color: #fff;" />
                                        <%--  <asp:Label ID="Label6" runat="server" Style="color: #009900"></asp:Label>--%>
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
                                <div style="height: 70px;">
                                </div>
                            </div>
                            <!-- BEGIN MANDATORY SCRIPTS -->
                            <script src="assets/plugins/jquery-1.11.js"></script>
                            <script src="assets/plugins/jquery-migrate-1.2.1.js"></script>
                            <script src="assets/plugins/jquery-ui/jquery-ui-1.10.4.min.js"></script>
                            <script src="assets/plugins/jquery-mobile/jquery.mobile-1.4.2.js"></script>
                            <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
                            <script src="assets/plugins/bootstrap-dropdown/bootstrap-hover-dropdown.min.js"></script>
                            <script src="assets/plugins/bootstrap-select/bootstrap-select.js"></script>
                            <script src="assets/plugins/mcustom-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
                            <script src="assets/plugins/mmenu/js/jquery.mmenu.min.all.js"></script>
                            <script src="assets/plugins/nprogress/nprogress.js"></script>
                            <script src="assets/plugins/charts-sparkline/sparkline.min.js"></script>
                            <script src="assets/plugins/breakpoints/breakpoints.js"></script>
                            <script src="assets/plugins/numerator/jquery-numerator.js"></script>
                            <script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
                            <script src="assets/js/application.js"></script>
                            <!-- END MANDATORY SCRIPTS -->
                            <script type="text/javascript">
                                $('body').on('keypress', '#txt_camp_title', function 
                            (event) {
                                    $('.title_banner').html($(this).val()); $('body').find('.title_banner').html($(this).val());
                                }); $('body').on('keypress', '#txt_camp_discription', function (event) {
                                    $('body').find('.discription_banner').html($(this).val());
                                }); $('body').on('keypress', '#txt_camp_call_To_Action', function (event) {
                                    $('body').find('.lnk_banner').html($(this).val());
                                }); // $('body').on('keypress', '#rate', function (event) { // // $('body').find('.lnk_banner').html($(this).val());
                                // alert(hello); // }); function btn_preview_onclick() { }
                                 </script>
                          
                            <script type="text/javascript">

                                document.getElementById("FileUpload2").onchange = function () {
                                    var reader = new FileReader();

                                    reader.onload = function (e) {
                                        // get loaded data and render thumbnail.
                                        document.getElementById("icon_img_banner1").src = e.target.result;
                                        document.getElementById("icon_img_banner2").src = e.target.result;
                                        document.getElementById("icon_img_banner3").src = e.target.result;
                                        document.getElementById("icon_image_banner_5").src = e.target.result;
                                        document.getElementById("icon_img_banner_6").src = e.target.result;

                                    };

                                    // read the image file as a data URL.
                                    reader.readAsDataURL(this.files[0]);
                                };

                            </script>

                            <script type="text/javascript">

                                document.getElementById("FileUpload1").onchange = function () {
                                    var reader = new FileReader();
                                    reader.onload = function (e) {
                                        // get loaded data and render thumbnail.
                                        document.getElementById("banner_img_banner1").src = e.target.result;
                                        document.getElementById("image_banner3").src = e.target.result;
                                        document.getElementById("image_banner_4").src = e.target.result;
                                        var Img = e.target.result;
                                        var VideoUrl = document.getElementById("vedio_url_link").value;
                                        document.getElementById('DivVideo').innerHTML = '<video controls id="videoPlayer" style="height :240px; width :320px;" poster ="' + Img + '"><source src="' + VideoUrl + '" type="video/mp4"></video>';
                                        var v = document.getElementById('videoPlayer');
                                        //alert(v);
                                        v.addEventListener(
                                        'play',
                                        function () {
                                            v.play();
                                        }, false);

                                        v.onclick = function () {
                                            if (v.paused) {
                                                v.play();
                                                v.controls = null;
                                            } else {
                                                v.pause();
                                                v.controls = "controls";
                                            }
                                        };

                                    }; reader.readAsDataURL(this.files[0]);

                                    // read the image file as a data URL.

                                };
                                
                            </script>

                            
                            <script type="text/javascript">

                                document.getElementById("vedio_url_link").onchange = function () {
                                    var Img = document.getElementById("banner_img_banner1").src;



                                    var VideoUrl = document.getElementById("vedio_url_link").value;
                                    document.getElementById('DivVideo').innerHTML = '<video controls id="videoPlayer" style="height :240px; width :320px;" poster ="' + Img + '"><source src="' + VideoUrl + '" type="video/mp4"></video>';
                                    var v = document.getElementById('videoPlayer');
                                    //alert(v);
                                    v.addEventListener(
                                        'play',
                                        function () {
                                            v.play();
                                        }, false);

                                    v.onclick = function () {
                                        if (v.paused) {
                                            v.play();
                                            v.controls = null;
                                        } else {
                                            v.pause();
                                            v.controls = "controls";
                                        }
                                    };



                                };
                                
                            </script>




                          
                            <script src="assets/plugins/mandatoryJs.min.js"></script>
                            <script src="assets/plugins/metrojs/metrojs.min.js"></script>
                            <script src='assets/plugins/fullcalendar/moment.min.js'></script>
                            <script src='assets/plugins/fullcalendar/fullcalendar.min.js'></script>
                            <script src="assets/plugins/simple-weather/jquery.simpleWeather.min.js"></script>
                            <script src="assets/plugins/google-maps/markerclusterer.js"></script>
                            <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
                            <script src="assets/plugins/google-maps/gmaps.js"></script>
                            <script src="assets/plugins/charts-morris/raphael.min.js"></script>
                            <script src="assets/plugins/charts-morris/morris.min.js"></script>
                            <script src="assets/plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
                            <script src="assets/js/calendar.js"></script>
                            <%--<script src="assets/js/dashboard.js"></script>--%>
                            <meta http-equiv="content-type" content="text/html;charset=UTF-8">
                        </ContentTemplate>
                        <Triggers>
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
