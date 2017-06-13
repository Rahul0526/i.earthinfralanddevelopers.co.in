<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage2.master" AutoEventWireup="true"
    CodeFile="Register_affiliate.aspx.cs" Inherits="admin_Register_affiliate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 <%--client id:  943160021315-m27od4fssdkqb78chrv42ti6hgrsqunk.apps.googleusercontent.com--%>
 <%--   client secret :   NTgkpWZVHfBAorKeoKhgbtBm--%>
 <%--   https://auth0.com/docs/connections/social/google--%>
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
                $('#loginText').hide();
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
                document.getElementById('<%= DivGmailReg.ClientID %>').style.display = "block";
                document.getElementById('<%= DivRegistration.ClientID %>').style.display = "none";
                document.getElementById('<%= txtGmailName.ClientID %>').value = user.name;
                document.getElementById('<%= txtGmailId.ClientID %>').value = user.email;
            },
            dataType: "jsonp"
        });
    }

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

<style>
    .DisPlay
    {
        display: none;
    }

    .cssborder
    {
        border-color: white;
        margin-top: -8px;
    }
</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="col-md-4 col-sm-4 col-xs-12 table-responsive" style="margin: 0 auto;  float: none;">
                <div>
                  <b> <a href='#'  onClick='login();' id="loginText"'> Register with Gmail </a></b>&nbsp;&nbsp;  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="../LoginAffiliate.aspx">Go To affiliate Login</asp:HyperLink>   
                </div>
                <h4>
                    Create/edit Affiliate
                </h4>
                 <div> </div>
                 <div id="DivRegistration" runat="server"> 

                 <div>
                   
                    <h5>
                        Mail ID<asp:RequiredFieldValidator ID="reqftxt_mail" runat="server" ControlToValidate="txt_mail"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="regExtxt_mail" runat="server"
                            ControlToValidate="txt_mail" ErrorMessage="Invalid Mail ID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </h5>

                    <asp:TextBox runat="server" ID="txt_mail" class="form-control" placeholder="Mail ID" type="Text"></asp:TextBox>
                </div>

                <div>
                    <h5>
                        Website<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"  ControlToValidate="tb_website_1"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                    </h5>
                   
                        <div class="col-sm-12    form-control" style="height:38px" >
                        <div class="col-md-1" ><img id="Favicon" src="https://www.google.com/s2/favicons?domain=earthinfralanddevelopers.co.in" /></div>&nbsp;
                        <div class="col-md-6" style=" padding-left:0px !important;"><input type="text"   runat="server"  id="tb_website_1"  onblur="CallOnBlur()"  style="color:Black; border:none;margin-left: 25px;" class=" cssborder " placeholder="Website" />
                        </div>
                        <div class=" clear"></div>
                        </div>&nbsp;
                    <div>
                    </div>
                </div>

                <div>
                    <h5>
                        Enter Password<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"  ControlToValidate="pass_txt" ErrorMessage="*"></asp:RequiredFieldValidator>

                    </h5>
                    <asp:TextBox runat="server" ID="pass_txt" class="form-control" Width="466px" placeholder="Password"  TextMode="Password"></asp:TextBox>
                    <div>
                    <asp:RegularExpressionValidator ID="RegExp1" runat="server"  ForeColor="Red" ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ControlToValidate="pass_txt"    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" />
                    </div>
                </div>

                <br />
                <div>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" />
                    &nbsp;&nbsp
                    <asp:Button ID="btnReset" runat="server" CausesValidation="false" Text="Reset" OnClick="btnReset_Click" />
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <div>
                    </div>
                     
                  <a href="#" temp_href="#"  style="display:none"  id="logoutText" target='myIFrame' onclick="myIFrame.location='https://www.google.com/accounts/Logout'; startLogoutPolling();return false;"> </a>
                  
                  <iframe  name='myIFrame'  id="myIFrame"  style='display:none'>
                  </iframe>

                </div>

            </div>
            <div id='uName' runat="server"></div>
            <div id='mailId' runat="server"></div>
            <div id='Gender' runat="server"></div>
            <div id='Phone' runat="server"></div>
            <div id='Age' runat="server"></div>
            <div id='Address' runat="server"></div>
      <div id="DivGmailReg"  runat="server" style="display:none;">
      <div>
                    <asp:TextBox runat="server" CssClass="DisPlay" ID="txtGmailId" class="form-control" placeholder="Email Id " type="text"></asp:TextBox>
      </div>
      <div>
                    <h5></h5>
                    <asp:TextBox runat="server" CssClass="DisPlay" ID="txtGmailName" class="form-control" placeholder="Affiliate Name" type="text"></asp:TextBox>
     </div>
      <div>
                      <h5>
                        Website Url<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="ValGrpGmailReg"  runat="server"
                            ControlToValidate="txtWebsiteGmailReg" ErrorMessage="*"></asp:RequiredFieldValidator> </h5>
                    <asp:TextBox runat="server"   ID="txtWebsiteGmailReg" class="form-control" placeholder="Add a website" type="text"></asp:TextBox>
     </div>
      <div>
                    <h5>
                        
                    </h5>
                    <asp:TextBox runat="server" ID="txtPassGmail" CssClass="DisPlay" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
      </div>
      <div>
                    <h5></h5>
         
                    <asp:TextBox runat="server" CssClass="DisPlay" ID="txtConfirmPassword" class="form-control" TextMode="Password" placeholder="Confirm Password" ></asp:TextBox>
     </div>
      <br />
      <div>
                    <asp:Button ID="btnSubmitGmail" runat="server" Text="Submit" 
                        BorderStyle="None"  ValidationGroup="ValGrpGmailReg" 
                        onclick="btnSubmitGmail_Click" />
                    &nbsp;&nbsp
                    <asp:Button ID="btnReload" runat="server" CausesValidation="false" Text="Reset" BorderStyle="None"  OnClick="btnReset_Click" />
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <div>
                    </div>
                     
  <a href="#" temp_href="#" style="display:none" id="A1" target='myIFrame' onclick="myIFrame.location='https://www.google.com/accounts/Logout'; startLogoutPolling();return false;"> </a>
    <iframe name='myIFrame' id="Iframe1" style='display:none'></iframe>
     </div>
     </div>
     <br />
     <br />
     <div style="text-align: center; height: 50px">
                <asp:UpdateProgress runat="server" ID="PageUpdateProgress">
                    <ProgressTemplate>
                        <img src="img/loadergif.gif" style="height: 30px; width: 30px" alt="Wait" />
                        <br />
                        Please Wait...
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>

            <script>

                $('body').on('keyup', '#ContentPlaceHolder1_tb_website_1', function (event) {
                    var txt = document.getElementById("ContentPlaceHolder1_tb_website_1").value
                    if (txt.length > 0) {
                        //  alert();
                          var url = "";
                          if (txt == '')
                          { url = "google.com" }
                          else
                          { url = "https://www.google.com/s2/favicons?domain=" + txt; }

                          document.getElementById("Favicon").src = url;
                    }




                });

            </script>
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
