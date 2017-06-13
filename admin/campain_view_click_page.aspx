<%@ Page Language="C#" AutoEventWireup="true" CodeFile="campain_view_click_page.aspx.cs" Inherits="admin_campain_view_click_page" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.3.min.js"></script>
   <!-- <script type="text/javascript" >
      window.onload=  function view() {
          var data = document.getElementById("id1").innerHTML;
         
          $.get("http://order.arrahmanoverseas.com/WebService.asmx?WSDL/increase_clicks", function (response) {
                data = response;
            }).error(function () {
                alert("Sorry could not proceed");
            });

          return data;




           
        }



        function click() {
            var data = document.getElementById("id1").innerHTML;
            alert();

            //$.post('http://order.arrahmanoverseas.com/WebService.asmx?WSDL/increase_clicks', {}, function (response) {
            //    data = response;
            //}).error(function () {
            //    alert("Sorry could not proceed");
            //});

            //return data;
        }

       
    </script>-->
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <script type="text/javascript" src="Scripts/jMsAjax.js"></script>

     <script type="text/javascript" src="Scripts/jquery-1.3.2-vsdoc2.js"></script>

     <script type="text/javascript" src="Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="Scripts/WS.js"></script>
    <script>



        $(window).load(function () {



            var camp_id = "Co0907064349258";



            alert(camp_id);

            $.ajax({

                URL: 'http://order.arrahmanoverseas.com/WebService.asmx/increase_views',
                data: { iframe_id: camp_id },
                method: 'post',
                dataType: 'xml',
                success: function () {
                    var jqueryXml = $(data);
                    alert('Sucess');



                }







            });




        });

    </script>

   
</head>
<body >
    
    <label id="id1"></label>
    <div style="width:286px; height: 277px;">



    
    <div >
        <p style="color:black ; font-size:13pt; font-family:Calibri">Counter Strike-Condition Zero</p>
    </div>
        <div>

<img src="https://counterstrikegame1.files.wordpress.com/2012/12/83832-counter-strike-condition-zero-windows-screenshot-title-screens1.jpg" style="height: 210px; width: 98%" />

        </div>


        <center>

    <div><input type="button"  id="link" value="Download" /></div>
            </center>

        </div>
</body>
</html>