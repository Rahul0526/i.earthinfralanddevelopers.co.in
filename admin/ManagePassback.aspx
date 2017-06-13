<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/admin/Affiliate_master_page.master"
    AutoEventWireup="true" CodeFile="ManagePassback.aspx.cs" Inherits="admin_ManagePassback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
<asp:ScriptManager runat="server"></asp:ScriptManager>
   <%-- <asp:UpdatePanel runat="server">
        <ContentTemplate>--%>


    <div>
        <div id="_divPassback">
            <h2 id="H1">
                Passback
            </h2>
            <p id="P5">
                Add Passback:
             <%--   <asp: ID="txtCopypassback" placeholder="Paste Your code here" TextMode="MultiLine" BackColor="#f3f3f3" ForeColor="Black" runat="server" Height="200px" Width="100%"></asp:TextBox>--%>
                    <%--<textarea style="height:200px; width:100%;  color:Black;"  rows="4"     id="txtCopypassback"   placeholder="Paste Your code here"></textarea>--%>
                <asp:TextBox runat="server" ForeColor="#9900ff" ID="txtpassback" TextMode="MultiLine" Height="200px" Width="100%" ></asp:TextBox>

          <%--      <asp:HiddenField ID="PassbackId" runat="server" Value="" />--%>
               
            </p>

          
            <asp:HiddenField runat="server" ID="RanderDiv" />

            <p id="P4">
                <asp:Button ID="insertPassback" Text="insert" runat="server" OnClick="InsertPassBackTag" />
            </p>
        </div>


       

<%--            <script>

                $('body').on('keyup', '#txtCopypassback', function (event) {
                    var txt = document.getElementById("txtCopypassback").value
                    document.getElementById("ContentPlaceHolder1_RanderDiv").value = txt;
                });

            </script>
        
        
         <script>


             function Filltxtpassback() {
                 document.getElementById("txtCopypassback").value = document.getElementById("ContentPlaceHolder1_RanderDiv").value
             }


             function Fillpassback() {
                 alert();
                 document.getElementById("ContentPlaceHolder1_RanderDiv").value = document.getElementById("txtCopypassback").value
             }


        </script>--%>

    </div>

     <%--       
        </ContentTemplate>
        

    </asp:UpdatePanel>--%>
</asp:Content>
