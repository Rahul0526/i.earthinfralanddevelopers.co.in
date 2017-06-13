<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="DropDownCheckBoxes" Namespace="Saplin.Controls" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DropDownListCheckBoxes</title>


    <style type="text/css">
    .ddd
    {
        select.custom-dropdown {
 -webkit-appearance: none;  /*REMOVES DEFAULT CHROME & SAFARI STYLE*/
 -moz-appearance: none;  /*REMOVES DEFAULT FIREFOX STYLE*/
 border: 0 !important;  /*REMOVES BORDER*/

 color: #fff;
 -webkit-border-radius: 5px;
 border-radius: 5px;
 font-size: 14px;
 padding: 10px;
 width: 35%;
 cursor: pointer;

 background: #0d98e8 url(drop-down-arrow.png) no-repeat right center;
 background-size: 40px 37px; /*TO ACCOUNT FOR @2X IMAGE FOR RETINA */
}
}
    
    </style>
</head>
<body>
    <form id="form1" runat="server">    
    <div>
     <asp:DropDownCheckBoxes ID="ddchkCountry" runat="server" 
                    AddJQueryReference="True" UseButtons="True"    UseSelectAllNode="True">
                    <Style SelectBoxWidth="200"   DropDownBoxBoxWidth="200" DropDownBoxBoxHeight="130" />
                    <Texts SelectBoxCaption="Select Country" />
                </asp:DropDownCheckBoxes>
    
    <asp:Label ID="lblCountryID" runat="server"></asp:Label><br />
    <asp:Label ID="lblCountryName" runat="server"></asp:Label>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
    </div>    
    </form>
</body>
</html>
