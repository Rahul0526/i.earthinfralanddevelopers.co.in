<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="nlp.aspx.cs" Inherits="admin_nlp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #main-content 
        {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-content: center;
            box-sizing: border-box;
        }
        .table 
        {
            display: table;
            float: none;
            width: 400px;
            margin: auto;
            text-align: center;
            position: relative;
        }
        .linkButton 
        {
            display: inline-block;
            float: none;
            margin: 0 auto !important;
            width: 150px;
            line-height: 40px;
            border: 1px solid #00A2E8;
            background-color: #00A2E8;
            color: #FFF;
            font-size: 16px;
            font-weight: 500;
        }
        a:hover, a:focus, a:active 
        {
            text-decoration: none !important;
            color: #fff;
        }
        
        .linkButton2,
        .linkButton2:hover, 
        .linkButton2:focus, 
        .linkButton2:active
        {
            background: transparent;
            color: #00A2E8;
        } 
        {
            color: #00A2E8;    
        }
        hr {border-color: #aaa;}
        .orText {
          position: absolute;
          top: 42px;
          left: 50%;
          transform: translateX(-50%);
          padding: 5px;
          background: #fff;
          font-size: 18px;
          font-weight: bold;
        }
        .newWords 
        {
            display: table;
            padding: 5px 20px;
            border: 1px solid #ccc;
            border-radius: 3px;
            line-height: 22px;
            float: none;
            margin: auto;
        }
        .newWords .wordsCount 
        {
            font-weight: 500;
        }
        .newWords a 
        {
            background: #00FF7F;
            padding: 0 40px;
            color: #FFF !important;
            margin: 0 !important;
            display: inline-block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="table">
        <asp:HyperLink ID="HyperLink1" CssClass="linkButton" runat="server" NavigateUrl="~/admin/Teach.aspx">Teach</asp:HyperLink>
        <span class="orText">or</span>
        <hr />
        <asp:HyperLink ID="HyperLink2" CssClass="linkButton linkButton2" runat="server" NavigateUrl="~/admin/Test.aspx">Test</asp:HyperLink>
        <br />
        <br />
        <br />
        <div class="newWords" ><span id="wordsCount" class="wordsCount" runat="server"></span>&nbsp;&nbsp;&nbsp;Newly&nbsp;&nbsp;&nbsp;learnt&nbsp;&nbsp;&nbsp;words&nbsp;&nbsp;&nbsp;<a href="newWords.aspx">Open</a></div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $(window).resize(function () {
                setHeight()
            });

            function setHeight() {
                $('#main-content').outerHeight($(window).innerHeight() - $('.navbar').innerHeight())
            } setHeight()
        });
    </script>
</asp:Content>