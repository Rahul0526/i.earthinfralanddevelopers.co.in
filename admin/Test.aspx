<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="Test.aspx.cs" Inherits="admin_Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/nlp.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="searchBar col-md-12">
        <div class="searchForm">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Test it!" OnClick="Button1_Click" style="margin-top: 0;" />
        </div>
        <span class="toggleContent">Show Page Text</span>
    </div>
    <div class="col-md-12">
        <div id="pageTextContent" class="pageText" runat="server" style="margin-bottom: 30px;"></div>
    </div>
    <div class="col-md-12">
        <h3 id="pageLanguage" class="pageInfo" runat="server">
        </h3>
        <h3 id="pageCategory" class="pageInfo" runat="server">
        </h3>
        <br />
        <br />
    </div>
    <div id="listContainer1" class="list_container col-md-4" runat="server">
        <h4>
            Keywords : <span id="keywords_Count" runat="server"></span>
        </h4>
        <div id="divKeywords" class="keywords-list" runat="server">
        </div>
    </div>
    <div id="listContainer2" class="list_container col-md-4" runat="server">
        <h4>
            Entities : <span id="entities_Count" runat="server"></span>
        </h4>
        <div id="divEntities" class="keywords-list" runat="server">
        </div>
    </div>
    <div class="col-md-4">
        <h4>
            &nbsp;</h4>
        <div id="imageContainer" class="imagesContainer" runat="server">
        </div>
    </div>
    <div id="exceptionMessage" runat="server" style="color: Red;">
    </div>
    </form>
    <%--<div class="floatingContent body-wrap">
    	<div class="pageText"></div>
    </div>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            // $('.floatingContent .pageText').text($('#pageTextContent').text());
            if ($('.pageText').innerHeight() > 10) {
                $('.toggleContent').show().text('Show Text');
                $('.pageText').height(40).addClass('hiddenText');
                $('.searchBar').addClass('hasContent');
            } else {
                $('.toggleContent').hide().text('Show Text');
            }
            $('.toggleContent').on('click', function () {
                val = $.trim($(this).text());
                if (val == "Show Text") {
                    $('.pageText').removeClass('hiddenText');
                    $('.pageText').height('auto');
                    $(this).text("Hide Text");
                } else {
                    $('.pageText').height(40).addClass('hiddenText');
                    $(this).text("Show Text");
                }
            })
            var ajaxRequest = false;
            $(".actions span").on('click', function () {
                if (ajaxRequest == false) {
                    $li = $(this).closest('li');
                    word = $.trim($(this).closest('li').find('.newWord').text());
                    blocked = 0;
                    if ($(this).hasClass('blacklistWord')) {
                        blocked = 1;
                    }

                    parameter = JSON.stringify({ "word": word, "blocked": blocked });
                    var pageUrl = '<%= ResolveUrl("~/admin/Test.aspx/AddWord") %>';
                    $.ajax({
                        type: 'POST',
                        url: pageUrl,
                        data: parameter,
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        beforeSend: function () {
                            ajaxRequest = true;
                        },
                        success: function (data) {
                            if (data.d == 'success') {
                                if (blocked == 0) {
                                    $li.find('.actions').replaceWith('"Word Added"');
                                } else {
                                    $li.slideUp(function () {
                                        $li.remove()
                                    });
                                }
                            }
                            ajaxRequest = false;
                        },
                        error: function (data, success, error) {
                            alert("Error : " + error);
                        }
                    });
                } else {
                    alert("Working! Please wait...");
                }
            });
        });
    </script>
</asp:Content>
