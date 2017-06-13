<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Affiliate_master_page.master"
    AutoEventWireup="true" CodeFile="update_Details.aspx.cs" Inherits="admin_update_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 148px;
        }

        .dispNone
        {
            display: none;
        }

        .auto-style4
        {
            width: 148px;
            height: 26px;
        }

        .auto-style5
        {
            height: 26px;
        }

        .auto-style6
        {
            width: 456px;
        }

        .auto-style7
        {
            height: 26px;
            width: 456px;
        }

        #UerImageSection
        {
            height: 305px;
        }
        .UserImg
        {
            height:200px;
            width:200px;
        }
    </style>
    <script src="js/countries.js" type="text/javascript"></script>
    <script language="javascript">
        window.onload = function LoadAllCountries() {
            populateCountries("country", "state");
            LoadAfter();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="scrmgrUpdateDetails" runat="server">
    </asp:ScriptManager>
    <%-- <asp:UpdatePanel runat="server">
        <ContentTemplate>--%>
    <h4>Update Info</h4>


    <div id="ContentSection">
        <table class="nav-justified">
            <tr>
                <td class="style1">&nbsp;
                </td>
                <td class="auto-style6">
                    <asp:HiddenField ID="hdnfUserName" runat="server" Value=""></asp:HiddenField>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">First Name
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtFirstName" runat="server" ForeColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqftxtFirstName" runat="server" ControlToValidate="txtFirstName"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td rowspan="13">
                    <div id="UerImageSection">
                       <img id="ImgUserImage" runat="server" />
                    </div>
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;
                </td>
                <td class="auto-style6">&nbsp;
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Last Name
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtLastName" runat="server" ForeColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqftxtFirstName0" runat="server" ControlToValidate="txtLastName"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5">&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;
                </td>
                <td class="auto-style6">&nbsp;
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">Mail Id
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtMailId" runat="server" ForeColor="Black" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqftxtFirstName1" runat="server" ControlToValidate="txtMailId" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;
                </td>
                <td class="auto-style6">&nbsp;
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">Address
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtAddress" runat="server" ForeColor="Black" TextMode="MultiLine"
                        Height="49px" Width="168px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqftxtFirstName2" runat="server" ControlToValidate="txtAddress"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;
                </td>
                <td class="auto-style6">&nbsp;
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">Country
                </td>
                <td class="auto-style6">
                    <%-- <asp:DropDownList ID="ddlCountry" runat="server" CausesValidation="false" AutoPostBack="true" ForeColor="Black"
                            Width="170px" onselectedindexchanged="ddlCountry_SelectedIndexChanged">--%>
                    <%--</asp:DropDownList>--%>
                    <%-- <asp:RequiredFieldValidator ID="reqftxtFirstName3" runat="server" ControlToValidate="ddlCountry"
                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <select id="country" name="country" style="color: Black" onchange="countryChange(this.value)">
                    </select>
                    <asp:Label ID="lbCurrentCountry" runat="server" Text="" CssClass="dispNone"></asp:Label><asp:HiddenField
                        ID="hdfnCountry" runat="server" Value="No Country" />
                    <script type="text/javascript">
                        function countryChange(value) {


                        }
                    </script>
                    <script type="text/javascript">
                        function StateChange(value) {

                            var e = document.getElementById('state');
                            var strUser = e.options[e.selectedIndex].value;
                            document.getElementById("ContentPlaceHolder1_hdfnState").value = strUser;
                        }
                    </script>
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;
                </td>
                <td class="auto-style6">&nbsp;
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">State
                </td>
                <td class="auto-style6">
                    <%--<asp:DropDownList ID="ddlState" runat="server" ForeColor="Black" Width="170px">
                        </asp:DropDownList>--%>
                    <select name="state" id="state" style="color: Black" onchange="StateChange(this.value)">
                    </select>
                    <asp:Label ID="lbCurrentState" runat="server" CssClass="dispNone" Text=""></asp:Label>
                <asp:HiddenField ID="hdfnState" runat="server" Value="No Country" />
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;
                </td>
                <td class="auto-style6">&nbsp;
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">City
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtCity" runat="server" ForeColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqftxtFirstName5" runat="server" ControlToValidate="txtCity"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;
                </td>
                <td class="auto-style6">&nbsp;
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">Postal Code
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtPostalCode" runat="server" ForeColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqftxtFirstName6" runat="server" ControlToValidate="txtPostalCode"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">User Image</td>
                <td class="auto-style6">
                    <input type="file" id="FileUpload1" onchange="validateImg1()" class="btn btn-primary" /></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style1">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="lblResponse" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style1">&nbsp;
                </td>
                <td class="auto-style6">
                    <asp:Button ID="btnSubmit" runat="server" ForeColor="White" OnClick="btnSubmit_Click"
                        Text="Update" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>


    </div>

    <div>
    </div>

    <center><asp:HiddenField ID="hdnfValidateImg1" runat="server" Value="0" />
   <asp:HiddenField ID="hdnfImageUrl" runat="server" Value="" />
   <span id="spnUploadAdImg"></span></center>
    <%--  </ContentTemplate>
    </asp:UpdatePanel>--%>


    <script>


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
                            if (width == 200 && height == 200) {

                                var fileUpload = $("#FileUpload1").get(0);
                                var files = fileUpload.files;
                                var file_name = $("#FileUpload1").val();

                                var file1 = file_name.split('\\').pop();
                                var ProfileImageURL = "../ProfilePictures/" + file1;

                                var test = new FormData();
                                for (var i = 0; i < files.length; i++) {
                                    test.append(files[i].name, files[i]);
                                }

                                $.ajax({
                                    url: "UserProfile.ashx",
                                    type: "POST",
                                    contentType: false,
                                    processData: false,
                                    data: test,
                                    success: function (result) {
                                        // alert('success');
                                    },
                                    error: function (err) {
                                        // alert('error');
                                    }
                                });

                                document.getElementById('ProfileImg').src = ProfileImageURL;
                                document.getElementById('ContentPlaceHolder1_ImgUserImage').src = ProfileImageURL;
                                
                                document.getElementById('ContentPlaceHolder1_hdnfImageUrl').value = ProfileImageURL;

                                document.getElementById('ContentPlaceHolder1_hdnfValidateImg1').value = "1";

                                document.getElementById('spnUploadAdImg').style.color = "green";
                                document.getElementById('spnUploadAdImg').innerText = "Valid Image( width=" + width + " , height= " + height + " )";

                            }
                            else {

                                document.getElementById('ContentPlaceHolder1_hdnfValidateImg1').value = "0";
                                document.getElementById('spnUploadAdImg').style.color = "Red";
                                document.getElementById('spnUploadAdImg').innerText = "Invalid Image ..it should be in 35*35 in height and width..";

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


    </script>
</asp:Content>
