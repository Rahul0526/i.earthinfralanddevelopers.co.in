<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FetchTextFomWebpage.aspx.cs" Inherits="admin_FetchTextFomWebpage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/nlp.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="body-wrap">
    <div class="searchBar">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>  
            <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
        </div>
    </div>
    <div id="pageTextContent" class="pageText" runat="server" style="margin-bottom: 30px;">
    </div>
    <div class="col-md-12">
        <h3 id="pageLanguage" class="pageInfo" runat="server"></h3>
        <h3 id="pageCategory" class="pageInfo" runat="server"></h3>
        <br/><br/>
    </div>
    <div id="listContainer1" class="list_container col-md-4" runat="server">
        <h4>Keywords : <span id="keywords_Count" runat="server"></span></h4>
        <div id="divKeywords" class="keywords-list" runat="server">
        </div>
    </div>
    <div id="listContainer2" class="list_container col-md-4" runat="server">
        <h4>Entities : <span id="entities_Count" runat="server"></span></h4>
        <div id="divEntities" class="keywords-list" runat="server">
        </div>
    </div>
    <div class="col-md-4">
        <h4>&nbsp;</h4>
        <div id="imageContainer" class="imagesContainer" runat="server"></div>
    </div>
    <div id="exceptionMessage" runat="server" style="color: Red;"></div>
    </form>
    <%--<div class="floatingContent body-wrap">
    	<div class="pageText"></div>
    </div>--%>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // $('.floatingContent .pageText').text($('#pageTextContent').text());
            $('.keywords-list span').hover(function () {
                keyword = $(this).text();
                if ($(this).closest('.keywords-list').is('#divEntities')) {
                    highlight('', keyword, 'caseSensitive');
                } else {
                    highlight('', keyword, '');
                }
            }).mouseleave(function () {
                if ($('.keywords-list span.selected').length) {
                    keywords = "";
                    $('.pageText').html($('.pageText').text());
                    $('.keywords-list span.selected').each(function () {
                        //                        keywords += keywords == "" ? $(this).text() : "|" + $(this).text();
                        if ($(this).closest('.keywords-list').is('#divEntities')) {
                            highlight('', keyword, 'caseSensitive');
                        } else {
                            highlight('', keyword, '');
                        }
                    })
                    //                    highlight(keywords, '', '');

                } else {
                    normalizeText();
                }
            }).click(function () {
                if ($(this).is('.selected')) {
                    $(this).removeClass('selected');
                } else {
                    $('.pageText').addClass('selected');
                    $(this).addClass('selected');
                }
            })
        })

        function highlight(keywords, animate, caseSensitive) {
            checkCase = caseSensitive == "" ? 'gi' : 'g';
            if (animate) {
                $('.pageText').find(".pop").removeAttr('class');
                text = $('.pageText').html();
                var regex = new RegExp('(' + animate + ')', checkCase);
                if (regex.test(text)) {
                    $('.pageText').html(
                        text.replace(regex, '<span class="pop">$1</span>')
                    );
                }
            }
            else {
                text = $('.pageText').text();
                var regex = new RegExp('(' + keywords + ')', checkCase);
                if (regex.test(text)) {
                    $('.pageText').html(
                        text.replace(regex, '<span>$1</span>')
                    );
                }
            }
        }
        function normalizeText() {
            $('.pageText').html($('.pageText').text());
        }
    </script>
</body>
</html>
