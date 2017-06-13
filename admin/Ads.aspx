<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Affiliate_master_page.master"
    AutoEventWireup="true" CodeFile="Ads.aspx.cs" Inherits="admin_Ads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <h4>
        Campaign Ads</h4>
    <br />
    <div>
        <asp:Button ID="Button1" runat="server" BorderStyle="None" Text="Refresh" 
            onclick="Button1_Click" Height="42px" Width="119px" 
            CausesValidation="False" /></div>
            <br />
            <div >
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
    </div>
    <div style="overflow: scroll; max-height: 800px">
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="campaign_id" Width="100%"
            AutoGenerateColumns="false" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid"
            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" 
            onrowdeleting="GridView1_RowDeleting" >
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
            <Columns>
                <asp:CommandField ShowDeleteButton="true" CausesValidation="true" DeleteText="Get Code" ButtonType="Button"
                    HeaderText="Get Code" />
                <asp:BoundField DataField="campaign_id" HeaderText="Id" />
                <asp:BoundField DataField="campaigin_name" HeaderText="Name" />
                <asp:BoundField DataField="title" HeaderText="Title" />
                <asp:BoundField DataField="discription" HeaderText="Description" />
                 <asp:BoundField DataField="Add_style_formate" HeaderText="Banner Type" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
