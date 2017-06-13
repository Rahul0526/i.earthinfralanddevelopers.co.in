<%@ Page Language="C#" AutoEventWireup="true" CodeFile="clearCookies.aspx.cs" Inherits="admin_clearCookies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        BODY
        {
            color: #444444;
            background-color: #E5F2FF;
            font-family: verdana;
            margin: 0px;
        }

        #PageOutline
        {
            text-align: center;
            margin-top: 300px;
        }

        A
        {
            color: #0153A4;
        }

        H1
        {
            font-size: 16pt;
            margin-bottom: 4px;
        }

        H2
        {
            font-size: 14pt;
            margin-bottom: 4px;
            font-weight: normal;
        }
    </style>
    <script>
        function deleteAllCookies() {
            var cookies = document.cookie.split(";");

            for (var i = 0; i < cookies.length; i++) {
                var cookie = cookies[i];
                var eqPos = cookie.indexOf("=");
                var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
                document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center  ; text-align: center;  margin-top: 10px;">
            <asp:Button  ID="BtnClearCookie" OnClick="LoadData" runat="server" Text="Clear Browser Cookie"/>
            <br />
            <a href="http://camp.earthinfralanddevelopers.co.in"><span >Back</span></a>
            <br />

            <p id="PMessage" runat="server"></p>
        </div>
        
    </form>
</body>
</html>
