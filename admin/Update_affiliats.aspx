<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Update_affiliats.aspx.cs" Inherits="admin_Update_affiliats" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class=" table-responsive">

        <asp:UpdatePanel runat="server">
            <ContentTemplate>



           
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Affiliates.aspx">Go To Registration page</asp:HyperLink>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <h4>Update Affiliate</h4>
        <br />
        <br />
        <div style="background-color: #3A3D41;text-align:center">

            <asp:Label ID="Label1" runat="server" style="color: #FFFFFF" Text="Affiliate Details"></asp:Label>

        </div>
        <div style="max-height:600px; overflow:scroll    ">
            <asp:GridView ID="GridView1" Width="150%" runat="server" AutoGenerateColumns="false" DataKeyNames="Affiliate_user_name" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />


                <Columns>
                    <asp:CommandField    ShowEditButton="true" ButtonType="Button"/>
                    <asp:CommandField ShowDeleteButton="true" ButtonType="Button" />
                    <asp:TemplateField HeaderText="Code">
                        <ItemTemplate>

                            <asp:Label ID="aff_user_id" runat="server" Text='<%#Eval("Affiliate_user_name") %>'></asp:Label>
                        </ItemTemplate>


                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>

                            <asp:Label ID="aff_name" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                        </ItemTemplate>


                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txt_name" Width="60px" Text='<%#Eval("name") %>' ></asp:TextBox>


                        </EditItemTemplate>


                    </asp:TemplateField>



                     <asp:TemplateField HeaderText="Mail ID">
                        <ItemTemplate>

                            <asp:Label ID="aff_mail" runat="server" Text='<%#Eval("mail") %>'></asp:Label>
                        </ItemTemplate>



                          <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txt_mail" Width="80px" Text='<%#Eval("mail") %>' ></asp:TextBox>


                        </EditItemTemplate>


                    </asp:TemplateField>



                     <asp:TemplateField HeaderText="Age">
                        <ItemTemplate>

                            <asp:Label ID="Age" runat="server" Text='<%#Eval("Age") %>'></asp:Label>
                        </ItemTemplate>


                         
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txt_age" Width="60px" Text='<%#Eval("Age") %>' >

                            </asp:TextBox>


                        </EditItemTemplate>



                    </asp:TemplateField>


                      <asp:TemplateField HeaderText="Bank Info">
                        <ItemTemplate>

                            <asp:Label ID="Aff_bank_info" runat="server" Text='<%#Eval("bank_info") %>'></asp:Label>
                        </ItemTemplate>

                          <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txt_bank_info" Width="80px" Text='<%#Eval("bank_info") %>' ></asp:TextBox>


                        </EditItemTemplate>
                    </asp:TemplateField>




                      <asp:TemplateField HeaderText="Bank Account Info">
                        <ItemTemplate>

                            <asp:Label ID="Aff_acc_info" runat="server" Text='<%#Eval("Account_no") %>'></asp:Label>
                        </ItemTemplate>



                          
                          <EditItemTemplate>

                            <asp:TextBox runat="server" ID="txt_acc_info" Width="80px" Text='<%#Eval("Account_no") %>' ></asp:TextBox>


                        </EditItemTemplate>

                    </asp:TemplateField>


                    
                      <asp:TemplateField HeaderText="Payment Type">
                        <ItemTemplate>

                            <asp:Label ID="Aff_Payment_type" runat="server" Text='<%#Eval("payment_type") %>'></asp:Label>
                        </ItemTemplate>

                           <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txt_payment_type" Width="80px" Text='<%#Eval("payment_type") %>' ></asp:TextBox>


                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Website">
                        <ItemTemplate>

                            <asp:Label ID="aff_website" runat="server" Text='<%#Eval("website") %>'></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txt_website" Width="80px" Text='<%#Eval("website") %>' ></asp:TextBox>


                        </EditItemTemplate>





                    </asp:TemplateField>




                     <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>

                            <asp:Label ID="aff_address" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                        </ItemTemplate>
                          <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txt_address" Width="80px" Text='<%#Eval("Address") %>' ></asp:TextBox>


                        </EditItemTemplate>

                    </asp:TemplateField>



                     <asp:TemplateField HeaderText="Date">

                        <ItemTemplate>

                            <asp:Label ID="aff_date" runat="server" Text='<%#Eval("date") %>'></asp:Label>
                        </ItemTemplate>

                    
                    </asp:TemplateField>


                </Columns>

            </asp:GridView>
        </div>
       
        


    </div>


     </ContentTemplate>

        </asp:UpdatePanel>


</asp:Content>

