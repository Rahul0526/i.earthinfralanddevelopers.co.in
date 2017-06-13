<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_page.aspx.cs" Inherits="admin_test_page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:FileUpload ID="FileUpload1" runat="server" accept=".csv" />
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    </form>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <div class="col-md-12">
        <div id="text" runat="server"></div>
    </div>

</body>
</html>
