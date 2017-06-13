<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="view_campaigns_admin.aspx.cs" Inherits="admin_view_campaigns_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />

<h3>
View Campaign
</h3>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>



<div style="overflow:scroll; max-height:800px ">

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="campaign_id" BackColor="#CCCCCC" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
        CellSpacing="2" ForeColor="Black" onrowediting="GridView1_RowEditing" 
        onrowcancelingedit="GridView1_RowCancelingEdit" 
        onrowupdating="GridView1_RowUpdating">
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
        
        <asp:TemplateField   HeaderText="Campain ID" Visible="false"  >
        <ItemTemplate>
            <asp:Label runat="server" id="camp_id"  Text='<%#Eval("campaign_id") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField   HeaderText="campaign Name"  >
        
        <ItemTemplate>
        
            <asp:Label runat="server" Text='<%#Eval("campaigin_name") %>' />
             </ItemTemplate>
             <EditItemTemplate>
             
             
             <asp:TextBox Text='<%#Eval("campaigin_name") %>' ID="camp_name"   TextMode="MultiLine"   ForeColor="Black" Width="100px" Height="100px" runat="server" ></asp:TextBox>
             </EditItemTemplate>
        </asp:TemplateField>


         <asp:TemplateField   HeaderText="Icon"  >
        <ItemTemplate>
          
            <asp:Image ImageUrl='<%#Eval("icon_img") %>'  AlternateText="No Icon" runat="server" ID="img_icon" Height="100px" Width="100px"/>
             </ItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField   HeaderText="Ad Image"  >
        <ItemTemplate>
          
            <asp:Image ImageUrl='<%#Eval("action") %>'  runat="server" ID="ad_img" Height="100px" Width="100px"/>
             </ItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField   HeaderText="Title"  >
        <ItemTemplate>
            <asp:Label runat="server" id="title" Text='<%#Eval("title") %>' />
             </ItemTemplate>


          <EditItemTemplate>
          <asp:TextBox ID="tb_title" Text='<%#Eval("title") %>' ForeColor="Black" TextMode="MultiLine" Width="100px" Height="100px" runat="server" ></asp:TextBox>
          
          </EditItemTemplate>
        </asp:TemplateField>

        

        <asp:TemplateField   HeaderText="Description"  >

        <ItemTemplate>
            <asp:Label runat="server" id="discription" Text='<%#Eval("discription") %>' />
             </ItemTemplate>

               <EditItemTemplate>
          <asp:TextBox ID="tb_discription" Text='<%#Eval("discription") %>' TextMode="MultiLine" ForeColor="Black" Width="300px" Height="100px" runat="server" ></asp:TextBox>
          
          </EditItemTemplate>


        </asp:TemplateField>
        



         <asp:TemplateField   HeaderText="Call To Action"  >
        <ItemTemplate>
            <asp:Label runat="server" id="call_to_action" Text='<%#Eval("call_to_action") %>' />
             </ItemTemplate>

              <EditItemTemplate>
          <asp:TextBox ID="tb_call_to_action" Text='<%#Eval("call_to_action") %>' TextMode="MultiLine" ForeColor="Black" Width="100px" Height="100px" runat="server" ></asp:TextBox>
          
          </EditItemTemplate>


        </asp:TemplateField>

        
       

        <asp:TemplateField   HeaderText="Device And Action"  >

        <ItemTemplate>
            <asp:Label runat="server" id="device_and_action" Text='<%#Eval("device_and_action") %>' />
             </ItemTemplate>


             
        


        </asp:TemplateField>



        <asp:TemplateField   HeaderText="Style Format"  >
        <ItemTemplate>
            <asp:Label runat="server" id="style_format" Text='<%#Eval("Add_style_formate") %>' />
             </ItemTemplate>




        </asp:TemplateField>



        

        </Columns>
    </asp:GridView>


    </ContentTemplate>


</asp:UpdatePanel>


</div>
</asp:Content>

