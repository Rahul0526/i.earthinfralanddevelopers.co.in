<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="newWords.aspx.cs" Inherits="admin_newWords" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/nlp.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row" style="border-bottom: 1px solid #ddd; padding-bottom: 15px;">
        <div class="col-md-6">
            <h1 style="margin-top: 35px;margin-bottom: 0;">Teach</h1>
        </div>
        <div class="col-md-6">
            <div class="col-md-12" style="margin: 10px 0 5px 0">Upload .csv to add words</div>
            <div class="col-md-8">
                <asp:FileUpload ID="csvFile" runat="server" CssClass="form-control" accept=".csv" />
            </div>
            <div class="col-md-4">
                <asp:Button ID="uploadCsv" runat="server" Text="Add" CssClass="noMargin" onclick="uploadCsv_Click" />
            </div>
            <div class="col-md-12">
                <div id="UploadMessage" runat="server"></div>
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="btnAddNewSubcategory blackListing">
            <span>Enable/Disable data storage </span>
            <asp:CheckBox ID="dataStorage" runat="server" />
            <label for="<%= dataStorage.ClientID %>" />
        </div>
    </div>
    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
        <ContentTemplate>
            <div class="col-sm-6">
                <div class="row">
                    <div class="col-md-12">
                        <br />
                        <div class="charSelector">
                            <% char ch = 'A'; %>
                            <% while (ch <= 'Z')
                               {
                                   Response.Write("<span>" + ch + "</span>");
                                   ch++;
                               } %>
                        </div>
                        <div id="wordsList" class="wordsList">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="divSelectedWord col-md-12">
                    <Label id="selectedWord" class="selectedWord"></label>
                </div>
                <div class="center action-buttons" style="display: none">
                    <span class="button addWrod" style="margin-right: 20px;">Add</span>
                    <span class="button blacklistWord">Blacklist</span>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        $(document).ready(function () {
            function fetchWordsData(char, lastId, targetid, appendData) {
                parameter = JSON.stringify({ "searchChar": char, "lastId": lastId });
                var pageUrl = '<%= ResolveUrl("~/admin/newWords.aspx/Get_Word") %>';
                $.ajax({
                    type: 'POST',
                    url: pageUrl,
                    data: parameter,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    beforeSend: function () {
                        if ($('.wordsList').find('.searching').length) {
                            $('.wordsList').find('.searching').show();
                        } else {
                            $('.wordsList').append("<div class='searching'><img src='img/loader.gif'></div>");
                        }
                        $('.charSelector span').addClass('disabled')
                    },
                    success: function (data) {
                        $('.wordsList').find('.searching').hide();
                        $('.charSelector span').removeClass('disabled')
                        if (appendData) {
                            targetid.append(data.d).show();
                            // $('.wordsList').find('[data-target=' + char + ']').show();
                        } else {
                            targetid.append("<div class='list' data-target='" + char + "'>" + data.d + "</div>");
                        }
                    },
                    error: function (data, success, error) {
                        alert("Opps... Someting went wrong.\n Please consern to IT Team...");
                    }
                });
            }

            $('.charSelector span').on('click', function () {
                var char = $(this).text().toUpperCase();
                $('.charSelector span').removeClass('active');
                $('#searchWord').val('');
                $(this).addClass('active');
                $('.wordsList').find('.list').hide();
                if ($('.wordsList').find('[data-target=' + char + ']').length) {
                    $('.wordsList').find('[data-target=' + char + ']').show();
                } else {
                    lastId = 0;
                    targetid = $('.wordsList');
                    appendData = false;
                    fetchWordsData(char, lastId, targetid, appendData);
                }
            });
            $('.charSelector span:first').trigger('click');

            $('.wordsList').on('click', '.list .loadMore', function () {
                targetId = $(this).closest('.list');
                char = targetId.attr('data-target');
                lastId = $(this).prev('span').attr('data-id');
                appendData = true;
                $(this).remove();
                fetchWordsData(char, lastId, targetId, appendData);
            });

            $('.wordsList').on('click', '.list span:not(.loadMore)', function () {
                id = $.trim($(this).attr('data-id'));
                text = $.trim($(this).text());
                $('#selectedWord').attr('data-id', id).text(text);
                $('.action-buttons').show();
            });

            $('.action-buttons .button').on('click', function () {
                blocked = 0;
                if ($(this).is('.blacklistWord')) {
                    blocked = 1;
                }
                wordId = $('#selectedWord').attr('data-id');
                word = $('#selectedWord').text();

                parameter = JSON.stringify({ "word": word, "wordId": wordId, "blocked": blocked });
                var pageUrl = '<%= ResolveUrl("~/admin/newWords.aspx/NewWordAction") %>';
                $.ajax({
                    type: 'POST',
                    url: pageUrl,
                    data: parameter,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    beforeSend: function () { },
                    success: function (data) {
                        if (data.d == 'success') {
                            $('#selectedWord').text('');
                            $('#selectedWord').removeAttr('data-id');
                            $('#wordsList').find('[data-id=' + wordId + ']').remove();
                            $('.action-buttons').hide();
                            if (blocked == 1)
                                alert("\"" + word + "\" Blocked Successfully");
                            else
                                alert("\"" + word + "\" Added Successfully");
                        } else {
                            alert("Opps... Someting went wrong.\n Please try again later...");
                        }
                    },
                    error: function (data, success, error) {
                        alert("Opps... Someting went wrong.\n Please consern to IT Team...");
                    }
                });
            })

            $('#<%= dataStorage.ClientID %>').on('change', function () {
                value = $(this).is(':checked') ? 1 : 0;
                parameter = JSON.stringify({ "value": value });
                var pageUrl = '<%= ResolveUrl("~/admin/newWords.aspx/EnableDisableDataStorage") %>';
                $.ajax({
                    type: 'POST',
                    url: pageUrl,
                    data: parameter,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    beforeSend: function () { },
                    success: function (data) {
                        if (data.d == 'success') {
                            alert("Updated Successfully");
                        }
                        else {
                            alert("Opps... Someting went wrong.\n Please try again later...");
                        }
                    },
                    error: function (data, success, error) {
                        alert("Opps... Someting went wrong.\n Please consern to IT Team...");
                    }
                });
            });
        })
    </script>
    </label>
</asp:Content>