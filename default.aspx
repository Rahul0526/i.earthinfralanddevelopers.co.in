<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>The Campaign</title>
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
    <script type="text/javascript">
       
        function Redirect() 
        {
            // window.location = "http://camp.earthinfralanddevelopers.co.in/LoginAffiliate.aspx";
        }
           
    </script>
</head>
<body onload="Redirect()">
    <div id="PageOutline">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="LoginAffiliate.aspx">click here to login</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/admin/Register_affiliate.aspx">Register An Affiliate</asp:HyperLink>
         <br />
        <br />
       
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/clearCookies.aspx">Clear Cookies</asp:HyperLink>
    </div>
</body>
</html>
