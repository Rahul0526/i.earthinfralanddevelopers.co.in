<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="Teach.aspx.cs" Inherits="admin_Teach" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/nlp.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <h1>
        Teach
    </h1>
    <hr />
    <div class="col-sm-12">
        <div class="btnAddNewSubcategory pull-right">
            <i class="fa fa-plus" aria-hidden="true"></i> Add new sub-category
        </div>
    </div>
    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
        <ContentTemplate>
            <div class="col-sm-6">
                <div class="row">
                    <div class="col-md-8">
                        <div class="col-md-3" style="line-height: 36px">
                            search:</div>
                        <div class="col-md-9">
                            <input type="text" id="searchWord" class="form-control" />
                            <i class="fa fa-pencil editIcon"></i>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label id="addNewWord" class="pull-right" style="margin-top: 8px"><i class="fa fa-plus" aria-hidden="true"></i> Add new word(s)</label>
                    </div>
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
                        <div id="wordList" class="wordsList" runat="server">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 word-properties" disabled>
                <div class="divSelectedWord col-md-12">
                    <label id="selectedWord" class="selectedWord">&nbsp;</label>
                    <div class="pull-right blackListing">
                        <span>whitelist/blacklist</span>
                        <input type="checkbox" id="blacklisted">
                        <label for="blacklisted">
                        </label>
                    </div>
                </div>
                <div class="category col-md-12">
                    category
                    <asp:DropDownList ID="categoryList" CssClass="categoryList form-control" runat="server">
                    </asp:DropDownList>
                </div>
                <br />
                <div class="category col-md-12">
                    Sub-category
                    <select id="subcategoryList" class="subcategoryList form-control">
                        <option>--please select a category--</option>
                    </select>
                </div>
                <br />
                <div class="category col-md-12">
                    <div>Image</div>
                    <div class="row">
                        <div class="col-md-6">
                            <input id="wordImage" type="file" class="form-control">
                            <br />
                            <br />
                            <span id="deeptraining" class="button center">Deep&nbsp;Training</span>
                        </div>
                        <div class="col-md-6" id="uploadedImage"></div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div id="lightbox" class="lightbox" runat="server">
        <div class="lightbox-loader">
            <img src="img/loader.gif" />
        </div>
        <div class="lightbox-container">
            <div class="close-lightbox"></div>
            <div class="selectcategory lightbox-content">
                <h2>Add New Sub-category</h2>
                <div class="categorySelector">
                    <h3>Choose one category</h3>
                    <asp:DropDownList ID="categoriesList1" CssClass="categoriesList1 form-control" runat="server">
                    </asp:DropDownList>
                    <div class="inlineBlock">
                        <span class="button next pull-right">Next</span>
                    </div>
                </div>
                <div class="subcategoryBox" style="display: none;">
                    <h3>Type the name of new sub-category</h3>
                    <asp:TextBox ID="txtSubcategory" runat="server" CssClass="txtSubcategory form-control"></asp:TextBox>
                    <div class="inlineBlock">
                        <div id="showUpdater1" class="showUpdater1 pull-left" runat="server">
                            <img src="img/loader.gif" width="60" alt="" />
                            <div class="userMessage">
                            </div>
                        </div>
                        <input type="submit" value="Add" class="subcategoryAdd button pull-right" />
                    </div>
                </div>
            </div>

            <div class="addWord lightbox-content">
                <h2>Add New Word</h2>
                <h3>Type the new word here:</h3>
                <input type="text" id="newWord" class="txtSubcategory form-control" />
                <div class="inlineBlock">
                    <div id="showUpdater2" class="showUpdater1 pull-left">
                        <img src="img/loader.gif" alt="loading..." width="60" />
                        <div class="userMessage">
                        </div>
                    </div>
                    <input id="addWord" type="submit" value="Add" class="button pull-right" />
                </div>
            </div>
            
            <div class="deeptraining lightbox-content">
                <h2>Deep Training</h2>
                <div id="newRule">
                    <h3><span class="trainingWord"></span> is a <span class="prevCategory"></span> > <span
                            class="prevSubCategory"></span>
                    </h3>
                    <p>When the following words aren't found in the text:</p>
                    <br />
                    <textarea id="trainingList" class="trainingWords"></textarea>
                    <br />
                    <br />
                    <p>If the above listed words are found then <span class="trainingWord"></span> it's:</p>
                    <div class="row">
                        <div class="col-md-6">
                            Category:
                            <asp:DropDownList ID="newCategory" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            Sub-category:
                            <select name="" id="newSubCategory" class="form-control">
                            </select>
                        </div>
                        <div class="col-md-12">
                            <%--<span data-target="currentRules" class="activeRulesToggle">Active Rules</span>--%>
                            <div class="loader" style="display: none;"><img src="img/loader.gif" /></div>
                            <input id="train" type="submit" value="Save" class="button pull-right" />
                        </div>
                    </div>
                </div>
                <div id="currentRules" style="display: none">
                    <h3>Active rules</h3>
                    <div class="rules"></div>
                    <div class="row">
                        <div class="col-md-12">
                            <span data-target="newRule" class="activeRulesToggle">Add New Rule</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {

            function getSubcatagory(word_id, category_id, selectedSubcategory, targetElem) {
                parameter = JSON.stringify({ "word_id": word_id, "category_Id": category_id });
                var pageUrl = '<%= ResolveUrl("~/admin/Teach.aspx/CategoryChanged") %>';
                $.ajax({
                    type: 'POST',
                    url: pageUrl,
                    data: parameter,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    beforeSend: function () { },
                    success: function (data) {
                        if (data.d != 'error') {
                            targetElem.html(data.d);
                            if (selectedSubcategory && selectedSubcategory !== '0')
                                targetElem.val(selectedSubcategory);
                        } else {
                            alert("Opps... Someting went wrong. Please try again later.");
                        }
                    },
                    error: function (data, success, error) {
                        alert("Error : " + error);
                    }
                });
            }

            $('.btnAddNewSubcategory').on('click', function () {
                $('.lightbox').css('display', 'flex');
                $('.subcategoryBox, .showUpdater1, .lightbox .lightbox-content, .lightbox-loader').hide();
                $('.lightbox-container, .lightbox .selectcategory, .categorySelector').show();
                $('.categoriesList1').val('0');
                $('.txtSubcategory').val('');
            })

            $('#addNewWord').on('click', function () {
                $('.lightbox').css('display', 'flex');
                $('#showUpdater2, .lightbox .lightbox-content, .lightbox-loader').hide();
                $('.lightbox-container, .lightbox .addWord').show();
                $('.lightbox #newWord').val('').focus();
            })

            $('#deeptraining').on('click', function () {
                if ($('.categoryList').val() == '0' || $('#subcategoryList').val() == '0') {
                    alert("No category or sub-category is not defined.\nPlease define them first...")
                } else {
                    $('.lightbox').css('display', 'flex');
                    $('.lightbox .lightbox-content, #newRule .loader').hide();

                    $('#<%= newCategory.ClientID %>').val('0')
                    $('#newSubCategory').html("");
                    word = $.trim($('#selectedWord').text());
                    prevCategory = $.trim($('.categoryList option:selected').text());
                    prevSubCategory = $.trim($('#subcategoryList option:selected').text());
                    $('.trainingWords').val("");
                    $('.lightbox .trainingWord').text(word);
                    $('.lightbox .prevCategory').text(prevCategory);
                    $('.lightbox .prevSubCategory').text(prevSubCategory);

                    parameter = JSON.stringify({ "word": word });
                    var pageUrl = '<%= ResolveUrl("~/admin/Teach.aspx/GetExtendedWords") %>';
                    $.ajax({
                        type: 'POST',
                        url: pageUrl,
                        data: parameter,
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        beforeSend: function () { },
                        success: function (data) {
                            if (data.d != 'error') {
                                if (data.d != "") {
                                    arr = data.d.split('$#$');
                                    $('.trainingWords').val(arr[0]);
                                    $('#<%= newCategory.ClientID %>').val(arr[1]);
                                    getSubcatagory('', arr[1], arr[2], $('#newSubCategory'));
                                }
                                $('.lightbox .lightbox-container, .lightbox .deeptraining').show();
                            } else {
                                alert("Opps... Someting went wrong. Please try again later.");
                            }
                        },
                        error: function (data, success, error) {
                            alert("Error : " + error);
                        }
                    });
                }
            });

            $('#train').on('click', function (e) {
                keywords = $.trim($('#trainingList').val());
                newCategory = $.trim($('#<%= newCategory.ClientID %>').val());
                newSubCategory = $.trim($('#newSubCategory').val());
                if (keywords == "") {
                    $('#trainingList').addClass('flashError');
                    setTimeout(function () { $('#trainingList').removeClass('flashError') }, 500);
                } else if (newCategory == '' || newCategory == '0') {
                    $('#<%= newCategory.ClientID %>').addClass('flashError');
                    setTimeout(function () { $('#<%= newCategory.ClientID %>').removeClass('flashError') }, 500);
                } else if (newSubCategory == '' || newSubCategory == '0') {
                    $('#newSubCategory').addClass('flashError');
                    setTimeout(function () { $('#newSubCategory').removeClass('flashError') }, 500);
                } else {
                    arr = keywords.split(/[\n,]/g);
                    super_entities = "";
                    newVal = "";
                    $.each(arr, function (i, val) {
                        val = $.trim(val);
                        super_entities += super_entities == "" ? val : "|" + val;
                        newVal += newVal == "" ? val : "\n" + val;
                    });
                    entity = $.trim($('#selectedWord').text());
                    parameter = JSON.stringify({ "entity": entity, "category": newCategory, "sub_category": newSubCategory, "super_entities": super_entities });
                    var pageUrl = '<%= ResolveUrl("~/admin/Teach.aspx/DeepTraining") %>';
                    $.ajax({
                        type: 'POST',
                        url: pageUrl,
                        data: parameter,
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        beforeSend: function () { $('#newRule .loader').show(); },
                        success: function (data) {
                            if (data.d == 'success') {
                                $('#newRule .loader').hide();
                                $('#trainingList').val(newVal);
                            } else {
                                alert("Opps... Someting went wrong. Please try again later.");
                            }
                        },
                        error: function (data, success, error) {
                            alert("Opps... Someting went wrong. Please contact IT Team.");
                        }
                    });
                }
                e.preventDefault();
            });

            $('#<%= newCategory.ClientID %>').on('change', function () {
                categoryId = $.trim($(this).val());
                if (categoryId != "" || categoryId != "0") {
                    getSubcatagory('', categoryId, '', $('#newSubCategory'));
                }
            });

            $('.activeRulesToggle').on('click', function () {
                target = $.trim($(this).attr('data-target'));
                $('#currentRules, #newRule').hide();
                $("#" + target).show();
                console.log(target)
            })

            $('.trainingWords').on('click', 'li', function () {
                $('.trainingWords').find('li').removeClass('selected');
                $(this).addClass('selected');
            })

            $('.close-lightbox').on('click', function () {
                $('.lightbox').fadeOut(function () {
                    $(".subcategoryBox, .showUpdater1, .showUpdater2, .lightbox .lightbox-content").hide();
                    $('.categoriesList1').val('0');
                    $('.txtSubcategory, #newWord').val('');
                });
            })

            $('.button.next').on('click', function () {
                if ($(".categoriesList1").val() != '0') {
                    $('.categorySelector').hide();
                    $('.subcategoryBox').show();
                    $('.txtSubcategory').val('').focus();
                } else {
                    $('.categoriesList1').addClass('flashError');
                    setTimeout(function () { $('.categoriesList1').removeClass('flashError') }, 500);
                }
            });

            $('.lightbox #addWord').on('click', function (e) {
                var newWord = $.trim($('.lightbox #newWord').val());
                parameter = JSON.stringify({ "word": newWord });
                var pageUrl = '<%= ResolveUrl("~/admin/Teach.aspx/AddNewWord") %>';
                $.ajax({
                    type: 'POST',
                    url: pageUrl,
                    data: parameter,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    beforeSend: function () {
                        $("#showUpdater2").show();
                    },
                    success: function (data) {
                        $("#showUpdater2 img").hide();
                        $("#showUpdater2 .userMessage").text("Added successfully... \nPlease reload page to see effect...").show();
                        $('.lightbox #newWord').val('').focus();
                    },
                    error: function (data, success, error) {
                        alert("Error : " + error);
                    }
                });
                e.preventDefault();
            })

            function fetchWordsData(char, lastId, targetid, appendData) {
                parameter = JSON.stringify({ "searchChar": char, "lastId": lastId });
                var pageUrl = '<%= ResolveUrl("~/admin/Teach.aspx/Get_Word") %>';
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
                        $('.charSelector span').attr('disabled', '')
                    },
                    success: function (data) {
                        $('.wordsList').find('.searching').hide();
                        $('.charSelector span').removeAttr('disabled')
                        if (appendData) {
                            targetid.append(data.d).show();
                            // $('.wordsList').find('[data-target=' + char + ']').show();
                        } else {
                            targetid.append("<div class='list' data-target='" + char + "'>" + data.d + "</div>");
                        }
                    },
                    error: function (data, success, error) {
                        alert("Error : " + data.error);
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

            var setTrigger = "";
            $('#searchWord').on('keyup', function () {
                var word = $.trim($(this).val());
                $('.charSelector span').removeClass('active');
                $('.editIcon').addClass('visible');
                keyupCounter = 0;
                if (setTrigger == "") {
                    setTrigger = setInterval(function () {
                        console.log(keyupCounter);
                        keyupCounter++;
                        if (keyupCounter >= 30) {
                            searchWord();
                        }
                    }, 30);
                }
            })

            function searchWord() {
                clearInterval(setTrigger);
                setTrigger = "";
                char = $.trim($('#searchWord').val());
                $('.editIcon').removeClass('visible');
                lastId = 0;
                if (char) {
                    $('.wordsList .list').hide();
                    if (!$('.wordsList').find('.searchList').length) {
                        $('.wordsList').append("<div class='list searchList' data-target='" + char + "'></div>");
                    } else {
                        $('.wordsList').find('.searchList').attr('data-target', char).html('');
                    }
                    targetId = $('.wordsList').find('.searchList');
                    appendData = true;
                    fetchWordsData(char, lastId, targetId, appendData);
                }
            }

            $('.wordsList').on('click', '.list span:not(.loadMore)', function () {
                parameter = JSON.stringify({ "word": $.trim($(this).text()) });
                var pageUrl = '<%= ResolveUrl("~/admin/Teach.aspx/Word_Changed") %>';
                $.ajax({
                    type: 'POST',
                    url: pageUrl,
                    data: parameter,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    beforeSend: function () {
                        $('.lightbox').css('display', 'flex');
                        $('.lightbox-loader').show();
                        $('.lightbox-container').hide();
                    },
                    success: function (data) {
                        $('.lightbox').hide();
                        arr = data.d.split(',');
                        $('.word-properties').removeAttr('disabled');
                        $('.selectedWord').text(arr[1]).attr('data-id', arr[0]);
                        $('#subcategoryList').html("<option>--geting details--</option>")
                        if (arr[2]) {
                            $('.categoryList').val(arr[2])
                            getSubcatagory("", arr[2], arr[3], $('.subcategoryList'));
                        } else {
                            $('.categoryList').val(0);
                            $('#subcategoryList').html("<option>--please select a category--</option>")
                        }
                        if (arr[4] != "") {
                            $("#uploadedImage").html("<img src='../" + arr[4] + "' alt='broken image. Upload new' />")
                        } else {
                            $("#uploadedImage").html('');
                        }
                        if (arr[5] == '0') {
                            $('#blacklisted').prop('checked', true);
                        } else {
                            $('#blacklisted').prop('checked', false);
                        }
                    },
                    error: function (data, success, error) {
                        alert("Error : " + error);
                    }
                });
            })

            $("#blacklisted").on('change', function () {
                word_id = "";
                if ($('#selectedWord').has('data-id')) {
                    word_id = $('#selectedWord').attr('data-id');
                }
                blacklist = $(this).is(":checked") ? "0" : "1";

                parameter = JSON.stringify({ "wordId": word_id, "blacklist": blacklist });
                var pageUrl = '<%= ResolveUrl("~/admin/Teach.aspx/ChangeBlacklist") %>';
                $.ajax({
                    type: 'POST',
                    url: pageUrl,
                    data: parameter,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    error: function (data, success, error) {
                        alert("Error : " + error);
                    }
                });
            })

            $('.subcategoryAdd').on('click', function (e) {
                category_id = $.trim($(".categoriesList1").val());
                subcategory = $.trim($(".txtSubcategory").val());
                if (subcategory != "") {
                    parameter = JSON.stringify({ "category_Id": category_id, "subcategory": subcategory });
                    var pageUrl = '<%= ResolveUrl("~/admin/Teach.aspx/Add_Sub_category") %>';

                    $.ajax({
                        type: 'POST',
                        url: pageUrl,
                        data: parameter,
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        beforeSend: function () {
                            $('.showUpdater1, .showUpdater1 img').show();
                            $('.showUpdater1 .userMessage').hide();
                        },
                        success: function (data) {
                            if (data.d == "updated") {
                                $('.showUpdater1 img').hide();
                                $('.userMessage').text("Added successfully...").show();
                                setTimeout(function () { $('.lightbox').fadeOut(); }, 500)
                            } else {
                                // alert(data.d);
                                alert("Opps... Someting went wrong");
                                setTimeout(function () { $('.lightbox').fadeOut(); }, 500)
                            }
                        },
                        error: function (data, success, error) {
                            alert("Error : " + error);
                        }
                    });
                } else {
                    $('.txtSubcategory').addClass('flashError');
                    setTimeout(function () { $('.txtSubcategory').removeClass('flashError') }, 500);
                }
                e.preventDefault();
            })

            $('.categoryList').on('change', function () {
                category_id = $.trim($(this).val());
                word_id = "";
                if ($('#selectedWord').has('data-id')) {
                    word_id = $('#selectedWord').attr('data-id');
                }
                getSubcatagory(word_id, category_id, '0', $('.subcategoryList'));
            })
            $('#subcategoryList').on('change', function () {
                word_id = "";
                if ($('#selectedWord').has('data-id')) {
                    word_id = $('#selectedWord').attr('data-id');
                }
                parameter = JSON.stringify({ "wordId": word_id, "subCategory": $.trim($(this).val()) });
                var pageUrl = '<%= ResolveUrl("~/admin/Teach.aspx/ChangeSubCategory") %>';

                $.ajax({
                    type: 'POST',
                    url: pageUrl,
                    data: parameter,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                    },
                    error: function (data, success, error) {
                        alert("Error : " + error);
                    }
                });
            });

            $("#wordImage").on('change', function () {
                word_id = "";
                if ($('#selectedWord').has('data-id')) {
                    word_id = $.trim($('#selectedWord').attr('data-id'));
                }
                alert(word_id)
                if (word_id != "") {
                    var data = new FormData();
                    var _URL = window.URL || window.webkitURL;
                    elem = this;
                    var files = $(this).get(0).files;
                    if (files.length > 0) {
                        data.append("HelpSectionImages", files[0]);
                    }
                    data.append('word_id', word_id);
                    $.ajax({
                        url: "camp.ashx",
                        type: "POST",
                        processData: false,
                        contentType: false,
                        data: data,
                        success: function (response) {
                            //code after success
                            var file = elem.files[0];
                            var img = new Image();
                            var sizeKB = file.size / 1024;
                            img.onload = function () {
                                $('#uploadedImage').html(img)
                            }
                            img.src = _URL.createObjectURL(file);
                        },
                        error: function (er) {
                            alert(er);
                        }
                    });
                }
            });
        })
    </script>
</asp:Content>
