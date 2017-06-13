<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Affiliate_master_page.master" AutoEventWireup="true" CodeFile="goto_view_chart.aspx.cs" Inherits="admin_goto_view_chart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br />
<h3>

View-Clicks chart View
</h3>
<div style="max-height:800px; overflow:scroll">
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="campaign_id" 
        Width="100%" AutoGenerateColumns="false" BackColor="White" 
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        onrowdeleting="GridView1_RowDeleting" 
        onselectedindexchanging="GridView1_SelectedIndexChanging">
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
        <Columns>
        <asp:CommandField ShowDeleteButton="true" DeleteText="Graph View" ButtonType="Button" />
       
        <asp:TemplateField HeaderText="Campaign ID">
        <ItemTemplate>
        <asp:Label runat="server" ID="banner_camp"  Text='<%#Eval("campaign_id") %>'></asp:Label>
        
        </ItemTemplate>
        
        </asp:TemplateField>



         <asp:TemplateField HeaderText="Campaign Name">
        <ItemTemplate>
        <asp:Label runat="server" ID="camp_name"  Text='<%#Eval("campaigin_name") %>'></asp:Label>
        
        </ItemTemplate>
        
        </asp:TemplateField>


          <asp:TemplateField HeaderText="Ad Title">
        <ItemTemplate>
        <asp:Label runat="server" ID="ad_title"  Text='<%#Eval("title") %>'></asp:Label>
        
        </ItemTemplate>
        
        </asp:TemplateField>


          <asp:TemplateField HeaderText="Ad Description">
        <ItemTemplate>
        <asp:Label runat="server" ID="ad_title"  Text='<%#Eval("discription") %>'></asp:Label>
        
        </ItemTemplate>
        
        </asp:TemplateField>


        
          <asp:TemplateField HeaderText="Banner Type">
        <ItemTemplate>
        <asp:Label runat="server" ID="bannner_type"  Text='<%#Eval("Add_style_formate") %>'></asp:Label>
        
        </ItemTemplate>
        
        </asp:TemplateField>
        
        </Columns>
    </asp:GridView>




</div>


</asp:Content>

