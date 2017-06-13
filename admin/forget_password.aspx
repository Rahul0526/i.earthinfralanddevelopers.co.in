<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage2.master" AutoEventWireup="true" CodeFile="forget_password.aspx.cs" Inherits="admin_forget_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 16px;
            color: White;
        }
        .style2
        {
            width: 149px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br />
<br />
<br />
<center>
<div style="height:400px; color:White; background-color:Black; width:40%">

<br />
<br />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="true" Font-Size="Large" Text="Forget password"></asp:Label>
    <br />
<br />
    <table class="nav-justified">
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label1" ForeColor="White" runat="server" Text="Enter Your Registered mail ID"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:TextBox ID="TextBox1" ForeColor="Black" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator3"  ForeColor="White" runat="server" ControlToValidate="TextBox1" 
                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                    &nbsp;<asp:RegularExpressionValidator 
                    ID="RegularExpressionValidator1" ForeColor="White" runat="server" ControlToValidate="TextBox1" 
                    ErrorMessage="Invalid Mail ID" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" BackColor="White" ForeColor="Black" 
                    BorderStyle="None"  runat="server" Text="Get Details" Height="35px" 
                    Width="108px" onclick="Button1_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:HyperLink ID="HyperLink1"  ForeColor="White"  runat="server" 
                    NavigateUrl="~/admin/login.aspx">Back To Login</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</div>


</center>
<br />
<br />
<br />


</asp:Content>

