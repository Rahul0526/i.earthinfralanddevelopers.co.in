<%@ Page Language="C#" AutoEventWireup="true" CodeFile="invoice.aspx.cs" Inherits="admin_invoice" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title></title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        
    </style>
    <%--<script type="text/javascript">

        function PrintElem() {
            Popup($('#mydiv').html());
        }

        function Popup(data) {

            var mywindow = window.open('', 'my div', 'height=400,width=600');
            mywindow.document.write('<html>');
            /*optional stylesheet*/ //mywindow.document.write('<link rel="stylesheet" href="main.css" type="text/css" />');
            mywindow.document.write('<body >');
            mywindow.document.write(data);
            mywindow.document.write('</body></html>');

            mywindow.document.close(); // necessary for IE >= 10
            mywindow.focus(); // necessary for IE >= 10

            mywindow.print();
            mywindow.close();

            return true;
        }

    </script>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <asp:Button type="button" Text="Back To Payment" runat="server" ID="btnBack"
            style="height: 30px; color: White; border: none;" 
            onclick="btnBack_Click" />
        <input type="button" value="Print Invoice" style="height: 30px; color: White; border: none;"
            onclick="window.print();" />
        <asp:Button type="button" Text="Download PDF Invoice" runat="server" ID="btnGenPdf"
            style="height: 30px; color: White; border: none;" onclick="btnGenPdf_Click"/>
    </div>
    <div id="mydiv">
        <div class="Invoice-Wrp">
            
            <table class="Invoice-Header" style="width:100%">
            <tr>
            <td><asp:Label ID="lbCompName" runat="server" Text="The Campaign Application"></asp:Label>
            <br />
            <asp:Label ID="lbCompAddress" runat="server" Text="Gomti Nagar, Lko"></asp:Label></td>
            <td style="text-align:right;"><h2>INVOICE</h2></td>
            </tr>
            </table>
            <!--Invoice-Header-->
            <br /><br />
            <div class="Invoice-mid">
                <%--<div class="clearfix">
                </div>--%>
                <div>
                    <table style="width:100%;">
                        <tr>
                            <td width="65%">
                                <h4>
                                    <strong>Bill To</strong></h4>
                                <p runat="server" id="pOurDate">
                                    Name</p>
                                Company name : New Company
                                <br />Address : <asp:Label ID="lbAddress" runat="server" Text=""></asp:Label>
                            </td>
                            <td width="35%">
                                <table>
                                    <tr style="text-align:right;">
                                        <td>
                                            <h4>
                                                <strong>Invoice No.: </strong>
                                            </h4>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbInvoiceNumber" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="text-align:right;">
                                        <td>
                                            <h4>
                                                <strong>Invoice Date: </strong></h4>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbInvoiceDate" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <br /><br />
                <div class="table-div">
                    <table width="100%">
                        <tr>
                            <td width="80%" background="#f6f6f6" bgcolor="#F6F6F6">
                                <div class="  tbl-td">
                                    Description
                                </div>
                            </td>
                            <td width="20%" background="#f6f6f6" bgcolor="#F6F6F6">
                                <div class="  tbl-td">
                                    Amount</div>
                            </td>
                        </tr>
                        <tr>
                            <td width="80%">
                                <div class="  tbl-td2 text-left">
                                    Mobile app promotion
                                </div>
                            </td>
                            <td width="20%">
                                <div class="  tbl-td2 text-center">
                                    $<asp:Label ID="lbSubAmt" runat="server" Text=""></asp:Label></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="80%">
                                <div class=" tbl-td4 text-right">
                                    Total
                                </div>
                            </td>
                            <td width="20%" bgcolor="#F6F6F6">
                                <div class=" tbl-td text-center">
                                    $<asp:Label ID="lbTotalAmt" runat="server" Text=""></asp:Label></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--Invoice-mid-->
            <br /><br />
            <div class="Invoice-foot">
                <h4>
                    <strong>Terms & Conditions </strong>
                </h4>
                <div>
                    <h5>
                        <strong>30 days after submitting a payment request and an invoice</strong></h5>
                </div>
            </div>
            <!--Invoice-foot-->
        </div>
    </div>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    </form>
</body>
</html>
