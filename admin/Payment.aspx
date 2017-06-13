<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="Payment.aspx.cs" Inherits="admin_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <script type="text/javascript" src="dist/sweetalert/sweetalert2.min.js"></script>
    <link href="dist/sweetalert/sweetalert2.min.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript">
        function ss(ctrl) {
            var checkBox1 = document.getElementById(ctrl.id);

            swal({
                title: 'Are you sure?',
                text: "You want to change the payment status?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes!',
                closeOnConfirm: false
            }).then(function (isConfirm) {
                if (isConfirm) {
                    swal(
      'Updated!',
      'Payment status updated successfully.',
      'success'
    );
                    __doPostBack(ctrl.id, '');
                }
                else {
                    return false;
                }
            })
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div style="text-align: center">
    </div>
    <center>
        <h4>
            Affiliate's Payment Details</h4>
    </center>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <%-- <asp:UpdatePanel runat="server" UpdateMode="Conditional" id="id1">
    <ContentTemplate>
    --%>
   

    <div style="text-align: left">
        Payment mode:
        <asp:DropDownList ID="DropDownList1" AutoPostBack="true" ForeColor="Black" runat="server"
            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>--Select--</asp:ListItem>
            <asp:ListItem>Paypal</asp:ListItem>
            <asp:ListItem>Wired Transfer</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" InitialValue="--Select--"
            runat="server" ControlToValidate="DropDownList1" ErrorMessage="*"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server" Width="120px" AutoPostBack="true"
            ForeColor="Black" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            <asp:ListItem>All</asp:ListItem>
            <asp:ListItem>Latest Paid</asp:ListItem>
            <asp:ListItem>Pending</asp:ListItem>
        </asp:DropDownList>
    </div>

    <div class="clear">
        <br />
    </div>

    <div style="max-height: 100%;">
        <div style="color: #fff; background-color: #91C9F1; font-weight: bold; font-size: 17px; margin: 3px;">

            &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Total Unpaid "></asp:Label>
        
            <div class="pull-right" style="width:180px;">$ <asp:Label ID="TotalUnpaid" runat="server" Text=""></asp:Label></div>
        </div>
        <asp:GridView ID="GridPayment" DataKeyNames="ReqestId" AutoGenerateColumns="false"
            Width="100%" runat="server" BackColor="White" BorderColor="#3366CC" AllowSorting="true"
            OnSorting="gvPayment_Sorting" BorderStyle="None" BorderWidth="1px" CellPadding="4"
            OnRowDataBound="GridPayment_RowDataBound">
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
            <Columns>
                <asp:TemplateField HeaderText="ReqId" Visible="false">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbreqid" Text='<%#Eval("ReqestId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  >
                    <ItemTemplate>
                        <asp:HiddenField runat="server" ID="hdfnBankAcNumber" Value='<%#Eval("bankInfo") %>' />
                        <asp:HiddenField runat="server" ID="hdfnBankInfo" Value='<%#Eval("BankInfo") %>' />
                        <asp:HiddenField ID="hdfn1" runat="server" Value='<%#Eval("AffiliateId") %>' />
                        <asp:CheckBox ID="chkSelect" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sur Name" Visible="false">
                    <ItemTemplate>
                     
                     </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User">
                    <ItemTemplate>
                    <asp:Label runat="server" ID="lbName" Text='<%#Eval("AffiliateName") %>'></asp:Label><br />
                    <asp:Label runat="server" ID="lblSurName" Text='<%#Eval("SurName") %>'></asp:Label>
                    <br />
                        <asp:Label runat="server" ID="lbail" Text='<%#Eval("affimail") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Payment Mode">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbmode" Text='<%#Eval("paytype") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Staus">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbstatus" Text='<%#Eval("Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Days Remain" SortExpression="DaysRemain">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbDays" Text='<%#Eval("DaysRemain") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Requested Amt">
                    <ItemTemplate>
                        <p>
                            $</p>
                        &nbsp;<asp:Label runat="server" ID="lbreqAmt" Text='<%#Eval("RequestedAmt") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Check">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbcheck" onclick="return ss(this)" AutoPostBack="true" OnCheckedChanged="Loadchk"
                            runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <div style="text-align: right;">
        <asp:Button ID="btnPaypal" CausesValidation="false" runat="server" 
            Text="Download Paypal" onclick="btnPaypal_Click" />
        <asp:Button ID="btnBankWire" CausesValidation="false" runat="server" OnClick="Button1_Click"
            Text="Download Bank Wire" /></div>

    <%-- </ContentTemplate>
    <Triggers>
    <asp:PostBackTrigger ControlID="Button1" />
    </Triggers>
    </asp:UpdatePanel>--%>
</asp:Content>
