<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testPage.aspx.cs" Inherits="admin_testPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type='text/javascript'>
        window.onload = function ValidateCookie() {
            var Expireydays = '1';
            var tagSepecification = 'testingTag';
            var interestCategiories = '4/5';
            var camp = 'Th1026025019629';
            var Url = 'http://camp.earthinfralanddevelopers.co.in/admin/CrossDomainCookie.aspx?DomainName=' + document.domain + ',' + camp + ',' + Expireydays + ',' + tagSepecification + ',' + interestCategiories + '';
            var iframe = document.createElement('iframe');
            iframe.style.display = 'none';
            iframe.src = Url;
            document.body.appendChild(iframe);
        }
</script>

    <!DOCTYPE html>
<html>
<body>
<script type="text/javascript">
    // Javascript URL redirection
    window.location.replace("http://www.amazon.com");
</script>
</body>
</html>

</head>
<body>
    <form id="form1" runat="server">
    <div>
   
    </div>
    </form>
</body>
</html>
