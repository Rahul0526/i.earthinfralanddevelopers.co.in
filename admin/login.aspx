<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage2.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div class="login-box clearfix animated flipInY">
                    <div class="page-icon animated bounceInDown">
                        <img src="assets/img/account/user-icon.png" alt="Key icon">
                    </div>
                    <div class="login-logo">
                        <a href="#?login-theme-3">
                            <img src="assets/img/account/login-logo.png" alt="Company Logo">
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
                            <asp:TextBox ID="TextBox1" runat="server" placeholder="Username" CssClass="input-field form-control user"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                         <asp:TextBox ID="TextBox2" TextMode="Password" runat="server" placeholder="Password" CssClass="input-field form-control password"></asp:TextBox>
                            
                            <div class="div-login" style="margin:auto;text-align:center">
                                <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" CssClass="btn btn-login ladda-button" />
                                
                            </div> 
                        <div class="login-links">
                            <a href="forget_password.aspx">Forgot password?</a>
                            <br>
                            <a href="../admin/Register_affiliate.aspx">Don't have an account? <strong>Sign Up as Affiliate</strong></a>
                        </div>
                    </div>
                </div>

    </center>
</asp:Content>

