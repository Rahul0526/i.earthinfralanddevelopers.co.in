<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="PostbackPage_Admin.aspx.cs" Inherits="admin_PostbackPage_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 70px;
            height: 63px;
        }
        .style2
        {
            width: 264px;
        }
        .style4
        {
            width: 72px;
        }
        .style5
        {
            width: 143px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center><h3>PostBack Page</h3> </center>
<br />
<br />
<br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel runat="server">
    <ContentTemplate>
    

     <asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="3000">
            </asp:Timer>

    <div  style="text-align:center; height:25px">
        <asp:UpdateProgress runat="server" id="PageUpdateProgress">
            <ProgressTemplate>
                <img src="img/loader.gif" /> <br /> 
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    <div>
    
    
        <table style="text-align:center; width:100%">
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style2">
                    Total Clicks</td>
                <td>
                    &nbsp;</td>
                <td>
                    Total Views</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style2">
                    <img alt="clicks" class="style1" src="img/click.png" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <img alt="view" class="style1" src="img/views.png" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    
    </div>
    </ContentTemplate>
    
    </asp:UpdatePanel>
<div>



</div>
</asp:Content>

