<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage2.master" AutoEventWireup="true" CodeFile="LoginAffiliate.aspx.cs" Inherits="LoginAffiliate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <style type="text/css">
        .auto-style2
        {
            width: 154px;
        }

        .auto-style3
        {
            width: 60px;
        }
        
        .auto-style4
        {
            width: 60px;
            height: 20px;
        }
        
        .auto-style5
        {
            width: 154px;
            height: 20px;
        }

        .auto-style6
        {
            height: 20px;
        }
        
        .auto-style7
        {
            width: 142px;
        }

        .auto-style8
        {
            width: 142px;
            height: 20px;
        }
    </style>
      <script src="jquery.js" temp_src="jquery.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    var OAUTHURL = 'https://accounts.google.com/o/oauth2/auth?';
    var VALIDURL = 'https://www.googleapis.com/oauth2/v1/tokeninfo?access_token=';
    var SCOPE = 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email';
    var CLIENTID = '596938763846-u12q4cumq0n5v0ctvhcp979egblddtbj.apps.googleusercontent.com';
    var REDIRECT = 'http://camp.earthinfralanddevelopers.co.in/testPage.aspx';
    var LOGOUT = 'http://accounts.google.com/Logout';
    var TYPE = 'token';
    var _url = OAUTHURL + 'scope=' + SCOPE + '&client_id=' + CLIENTID + '&redirect_uri=' + REDIRECT + '&response_type=' + TYPE;
    var acToken;
    var tokenType;
    var expiresIn;
    var user;
    var loggedIn = false;
    function login() {
        var win = window.open(_url, "windowname1", 'width=800, height=600');
        var pollTimer = window.setInterval(function () {
            try {

                console.log(win.document.URL);
                if (win.document.URL.indexOf(REDIRECT) != -1) {

                    window.clearInterval(pollTimer);
                    var url = win.document.URL;
                    acToken = gup(url, 'access_token');
                    tokenType = gup(url, 'token_type');
                    expiresIn = gup(url, 'expires_in');
                    win.close();
                    validateToken(acToken);
                }
            } catch (e) {
            }
        }, 500);
    }
    function validateToken(token) {
        $.ajax({
            url: VALIDURL + token,
            data: null,
            success: function (responseText) {
                getUserInfo();
                loggedIn = true;
              
                $('#logoutText').show();
            },
            dataType: "jsonp"
        });
    }
    function getUserInfo() {
        $.ajax({
            url: 'https://www.googleapis.com/oauth2/v1/userinfo?access_token=' + acToken,
            data: null,
            success: function (resp) {
                user = resp;
                console.log(user);

                document.getElementById('<%= AffiliateMailId.ClientID %>').value = user.email;
                document.getElementById("<%= btnGmailLogin.ClientID %>").click();
            },
            dataType: "jsonp"
        });
    }
    //credits: http://www.netlobo.com/url_query_string_javascript.html
    function gup(url, name) {
        name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
        var regexS = "[\\#&]" + name + "=([^&#]*)";
        var regex = new RegExp(regexS);
        var results = regex.exec(url);
        if (results == null)
            return "";
        else
            return results[1];
    }
    function startLogoutPolling() {
        $('#loginText').show();
        $('#logoutText').hide();
        loggedIn = false;
    }

</script>



   <script>

       window.onload = function SetIpAddress()
       {

           $.getJSON("http://freegeoip.net/json/", function (data) {
               country = data.country_name;
               var ip = data.ip;
               document.getElementById("ContentPlaceHolder1_hdnfIpAddress").value = ip;


           });
       }

   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center>
        <div class="login-box clearfix animated flipInY">
        <asp:HiddenField ID="AffiliateMailId" runat="server"  />
            <asp:HiddenField ID="hdnfIpAddress" runat="server"  />
                    <div class="page-icon animated bounceInDown">
                        <img src="admin/assets/img/account/user-icon.png" alt="Key icon">
                    </div>
                    <div class="login-logo">
                        <a href="#">
                            <img src="admin/assets/img/account/login-logo.png" alt="Company Logo">
                        </a>
                    </div>
                    <hr>

                    <div class="login-form">
                        <!-- BEGIN ERROR BOX -->
                        <div class="alert alert-danger hide">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <h4>Error!</h4>
                            Your Error Message goes here
                        </div>
                        <!-- END ERROR BOX -->
                            <asp:TextBox ID="txtAffiliateMail" runat="server" placeholder="Username" CssClass="input-field form-control user"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="regExtxtAffiliateMail" runat="server" ControlToValidate="txtAffiliateMail" ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                         <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" placeholder="Password" CssClass="input-field form-control password"></asp:TextBox>
                            
                            <div class="div-login" style="margin:auto;text-align:center">
                                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="Button1_Click" CssClass="btn btn-login ladda-button" />
                                
                            </div> 
                        <div class="login-links">
                            <%--<a href="forget_password.aspx">Forgot password?</a>--%><b> <a href='#' onClick='login();' id="loginText"'> Login with Gmail </a></b>
                            <br>
                            <a href="../admin/Register_affiliate.aspx">Don't have an account? <strong>Sign Up as Affiliate</strong></a>
                        </div>
                    </div>
                </div>
                

    </center>
    <asp:Button ID="btnGmailLogin" runat="server"   ForeColor="White" BackColor="White" BorderStyle="None"  Text="GmailLogin" 
        onclick="btnGmailLogin_Click" />
</asp:Content>

