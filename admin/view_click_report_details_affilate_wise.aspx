<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="view_click_report_details_affilate_wise.aspx.cs" Inherits="admin_view_click_report_details_affilate_wise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<h3>Affiliate Report View Click</h3>
<br />

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<asp:UpdatePanel runat="server" >

<ContentTemplate>
<div>&nbsp; Search Banner Type
    <asp:DropDownList ID="banner_dd" ForeColor="Black"  runat="server" 
        AutoPostBack="True" onselectedindexchanged="banner_dd_SelectedIndexChanged" 
        >
         <asp:ListItem>--Select--</asp:ListItem>
        <asp:ListItem>Banner 1</asp:ListItem>
        <asp:ListItem>Banner 2</asp:ListItem>
         <asp:ListItem>Banner 3</asp:ListItem>
          <asp:ListItem>Banner 4</asp:ListItem>
           <asp:ListItem>Banner 5</asp:ListItem>
         <%--   <asp:ListItem>Banner 6</asp:ListItem>--%>
    </asp:DropDownList>
    &nbsp;Search By Affiliate
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        ForeColor="Black" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    &nbsp;Select Website
    <asp:DropDownList ID="DropDownList2" ForeColor="Black"  runat="server" AutoPostBack="True" 
        onselectedindexchanged="DropDownList2_SelectedIndexChanged">
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp; Records Found :
    <asp:Label ID="Label1" runat="server" ForeColor="#CC0099"></asp:Label>
    </div>

     <div  style="text-align:center; height:50px">
        <asp:UpdateProgress runat="server" id="PageUpdateProgress">
            <ProgressTemplate>
                <img src="img/loadergif.gif"  style="height:30px; width:30px"  alt="Wait" /> <br /> Please Wait...
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>



<div style="max-height:800px; overflow:scroll">


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" BackColor="White"  Width="100%"
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
        <Columns>
        <asp:BoundField DataField="campain_id" Visible="false" />
        <asp:BoundField DataField="camp_id" HeaderText="Campaign Name" />
        <asp:BoundField DataField="affiliate_id" Visible="false" HeaderText="Affiliate ID" />
        <asp:BoundField DataField="Aff_id" HeaderText="Affiliate Name" />
        <asp:BoundField DataField="Website" HeaderText="Website" />
        
        <asp:BoundField DataField="total_clicks" HeaderText="Total Clicks" />
        
        <asp:BoundField DataField="total_conversions" HeaderText="Total Conversions" />
        <asp:BoundField DataField="total_views" HeaderText="Total Views" />

         <asp:BoundField DataField="status" HeaderText="Status" />
           <asp:BoundField DataField="total_revenu" HeaderText="Total Revenue" />
          <asp:TemplateField HeaderText="Banner Type">
         
         <ItemTemplate>
             <asp:Label ID="banner_type" runat="server" Text='<%#Eval("banner_type") %>'></asp:Label>
         
         </ItemTemplate>
         </asp:TemplateField>
        
        </Columns>
    </asp:GridView>



</div>
</ContentTemplate>

</asp:UpdatePanel>


</asp:Content>

