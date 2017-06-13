<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Affiliate_master_page.master"
    AutoEventWireup="true" CodeFile="Add_new_site_for_affiliate.aspx.cs" Inherits="admin_Add_new_site_for_affiliate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style5
        {
            width: 217px;
        }
        .style6
        {
            width: 27px;
        }
        
        
        
        .datagrid table { border-collapse: collapse; text-align: left; width: 100%; } .datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; border: 1px solid #8C8C8C; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; }.datagrid table td, .datagrid table th { padding: 3px 10px; }.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #8C8C8C), color-stop(1, #7D7D7D) );background:-moz-linear-gradient( center top, #8C8C8C 5%, #7D7D7D 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#8C8C8C', endColorstr='#7D7D7D');background-color:#8C8C8C; color:#FFFFFF; font-size: 15px; font-weight: bold; border-left: 1px solid #A3A3A3; } .datagrid table thead th:first-child { border: none; }.datagrid table tbody td { color: #7D7D7D; border-left: 1px solid #DBDBDB;font-size: 12px;font-weight: normal; }.datagrid table tbody .alt td { background: #EBEBEB; color: #7D7D7D; }.datagrid table tbody td:first-child { border-left: none; }.datagrid table tbody tr:last-child td { border-bottom: none; }.datagrid table tfoot td div { border-top: 1px solid #8C8C8C;background: #EBEBEB;} .datagrid table tfoot td { padding: 0; font-size: 12px } .datagrid table tfoot td div{ padding: 2px; }.datagrid table tfoot td ul { margin: 0; padding:0; list-style: none; text-align: right; }.datagrid table tfoot  li { display: inline; }.datagrid table tfoot li a { text-decoration: none; display: inline-block;  padding: 2px 8px; margin: 1px;color: #F5F5F5;border: 1px solid #8C8C8C;-webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #8C8C8C), color-stop(1, #7D7D7D) );background:-moz-linear-gradient( center top, #8C8C8C 5%, #7D7D7D 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#8C8C8C', endColorstr='#7D7D7D');background-color:#8C8C8C; }.datagrid table tfoot ul.active, .datagrid table tfoot ul a:hover { text-decoration: none;border-color: #7D7D7D; color: #F5F5F5; background: none; background-color:#8C8C8C;}div.dhtmlx_window_active, div.dhx_modal_cover_dv { position: fixed !important; }
    </style>
    <script type="text/javascript" src="http://crypto-js.googlecode.com/svn/tags/3.1.2/build/rollups/aes.js"></script>
    <script language="javascript" type="text/javascript">
        function Encrypt(InputText) {
            var encrypted = CryptoJS.AES.encrypt(InputText, "AUGURS001");

            var decrypted = CryptoJS.AES.decrypt(encrypted, "AUGURS001");


        };



    </script>
    <script language="javascript" type="text/javascript">
        function VideoEvent() {
            var v = document.getElementById('videoPlayer');

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
            }
        };
    
    </script>
    <script src="ColorPickerJs/jscolor.js"></script>
    <style type="text/css">
        .auto-style1
        {
            width: 217px;
        }
        
        .auto-style2
        {
            width: 336px;
        }
        
        .auto-style3
        {
            width: 217px;
            height: 20px;
        }
        .auto-style4
        {
        }
        </style>
    <link href="http://camp.earthinfralanddevelopers.co.in/admin/css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <h3>
        Register a new site</h3>
    <br />
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel runat="server" ID="Uppanel1">
        <ContentTemplate>
            <asp:Panel runat="server" ID="p1">
            </asp:Panel>
            <div class="datagrid">
                <asp:GridView ID="GridWebsites" runat="server" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" AutoGenerateColumns="false">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    <Columns>
                    <asp:TemplateField>
                    <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <ItemTemplate>
                   <asp:Label ID="lbStatus" runat="server" ></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Websites" HeaderText="Websites" />

                    </Columns>
                </asp:GridView>
            </div>
            <div>
                <table class="nav-justified">
                    <tr>
                        <td class="style6">&nbsp;
                            
                        </td>
                        <td class="style5">&nbsp;
                            
                        </td>
                        <td>&nbsp;
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">&nbsp;
                            
                        </td>
                        <td class="style5">&nbsp;
                            
                        </td>
                        <td>&nbsp;
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">&nbsp;
                            
                        </td>
                        <td class="style5">
                            Add a new site
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" ForeColor="Black" runat="server"></asp:TextBox>
                            <asp:Label ID="lblResponse" runat="server" ForeColor="Black" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">&nbsp;
                            
                        </td>
                        <td class="style5">&nbsp;
                            
                        </td>
                        <td>
                            <asp:Label ID="Label1" ForeColor="Green" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">&nbsp;
                            
                        </td>
                        <td class="style5">&nbsp;
                            
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
                            &nbsp;&nbsp;&nbsp;
                            
                        </td>
                    </tr>
                </table>
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
            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
