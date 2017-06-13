<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="SearchClickIdDetails.aspx.cs" Inherits="admin_SearchClickIdDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .lb
        {
            font-size: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <center>
            <asp:TextBox ID="txtClickId" runat="server" Style="color: Black; width: 28%;" OnTextChanged="txtClickId_TextChanged"
                ForeColor="Black" placeholder="Paste here a click Id"></asp:TextBox>
            &nbsp; &nbsp;
            <asp:Button runat="server" ID="btnSearch" Text="Search" /></center>
    </div>
    <br />
    <br />
    <div>
        <asp:Label ID="lbStatus" runat="server" CssClass="lb" Text=""></asp:Label>
    </div>
    <div>
        <asp:GridView ID="GridAffiliate" AutoGenerateColumns="False" Width="100%" runat="server"
            BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
            CellPadding="4">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Affiliate Name" />
                <asp:BoundField DataField="campaigin_name" HeaderText="campaign Name" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
    </div>
    <br /><br /><br /><br /><br />
    <div class="panel-group panel-accordion" id="accordion2">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion2" href="#collapseOne2" class="collapsed">
                        Suspicious activities: <span style="float: right">(<asp:Label ID="lblSuspiciousCount" runat="server" Text=""></asp:Label> Detected)</span></a>
                </h4>
            </div>
            <div id="collapseOne2" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                    <asp:GridView ID="GridBlockDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="IP" OnRowDataBound="GridBlockDetails_DataBound"
                        Width="100%" OnSelectedIndexChanging="GridBlockDetails_SelectIndexChanging">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                                <HeaderStyle CssClass="grdHead" />
                                <ItemStyle CssClass="cntr" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="IP" HeaderText="IP Address" />
                            <asp:TemplateField HeaderText="Total Conversion">
                                <ItemTemplate>
                                    <asp:Label ID="lblCount" runat="server" Text='<%# Bind("Converted") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="grdHead" />
                                <ItemStyle CssClass="cntr" />
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="true" SelectText="Remove" HeaderStyle-CssClass="grdHead" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
