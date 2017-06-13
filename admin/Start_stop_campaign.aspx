<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="Start_stop_campaign.aspx.cs" Inherits="admin_Start_stop_campaign" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .tbgrid
        {
            margin-top: -20px;
            width: 40px;
            height: 20px;
            font-size: 9pt;
            color: Black;
        }

        table.dataTable
        {
            clear: none;
        }

        .pagination
        {
            border-bottom: 1px solid #e0e0e0;
            padding-top: 5px;
            background-color: #EFF3F8;
            margin: 0px;
        }

        .re-total ul
        {
            margin: 0px 0 0 0;
            padding: 0;
        }

            .re-total ul li
            {
                list-style: none;
            }

        .Total-main
        {
            padding-bottom: 5px;
            border-bottom: 1px solid #6FB3E0;
            margin-bottom: 5px;
            padding-top: 5px;
        }

        .Total-ul
        {
            margin-top: 15px;
            border: 1px solid #6FB3E0;
            border-bottom: none !important;
            min-height: 36px;
            margin-bottom: 15px;
            padding: 0;
        }

            .Total-ul ul
            {
                margin: 0;
                padding: 0;
            }

                .Total-ul ul li
                {
                    list-style: none;
                    margin-bottom: 6px;
                }

        .am-toltal
        {
            width: 140px;
            border: 1px solid #eaeaea;
            line-height: 25px;
            margin-bottom: 6px;
            background-color: #fff;
        }

        .form-group.has-warning input, .form-group.has-warning select, .form-group.has-warning textarea
        {
            border-color: #eaeaea !important;
            color: #333;
        }
        .rkv_moreInfo
        {
            display: inline-block;
            cursor: pointer;
            color: #018fc4;
        }
        .rkv_lightbox {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background: rgba(0,0,0,0.5);
          z-index: 9999;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-content: center;
        }
        .rkv_lightbox .lightbox-container {
          display: table;
          padding: 18px 0 0 0;
          background: #fff;
          margin: auto;
          position: relative;
        }
        .rkv_lightbox iframe {
          border: none;
          min-width: 500px;
          min-height: 300px;
          float: left;
        }
        .rkv_lightbox .close_lightbox {
            position: absolute;
            top: 0;
            right: 0;
            width: 18px;
            height: 18px;
            background: #292C30;
            cursor: pointer;
        }
        .rkv_lightbox .close_lightbox:before,
        .rkv_lightbox .close_lightbox:after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 80%;
            height: 2px;
            background: #fff
        }
        .rkv_lightbox .close_lightbox:before {
            transform: translateX(-50%) translateY(-50%) rotate(45deg);
        }
        .rkv_lightbox .close_lightbox:after {
            transform: translateX(-50%) translateY(-50%) rotate(-45deg);
        }

        @media only screen and (min-width : 320px)
        {
            .re-total ul
            {
                padding: 0px;
                text-align: center;
            }

                .re-total ul li
                {
                    display: inline;
                    margin-right: 0px;
                }

            .text-right2
            {
                text-align: center;
                margin-top: 10px;
                margin-bottom: 0px;
            }
        }

        @media only screen and (min-width : 480px)
        {
            .re-total ul
            {
                padding: 0px;
                text-align: center;
            }

                .re-total ul li
                {
                    display: inline;
                    margin-right: 0px;
                }

            .text-right2
            {
                text-align: center;
                margin-top: 10px;
                margin-bottom: 0px;
            }
        }

        @media only screen and (min-width : 768px)
        {
            .re-total ul
            {
                padding: 0px;
                text-align: left;
            }

                .re-total ul li
                {
                    display: block;
                    margin-right: 0px;
                }

            .text-right2
            {
                text-align: right;
                margin-top: 0px;
                margin-right: 6px;
            }
        }

        @media only screen and (min-width : 992px)
        {
            .re-total ul
            {
                padding: 0px;
                text-align: center;
            }

                .re-total ul li
                {
                    display: inline;
                    margin-right: 20px;
                }

            .text-right2
            {
                text-align: right;
                margin-top: 0px;
                margin-right: 6px;
            }
        }

        @media only screen and (min-width : 1200px)
        {
            .re-total ul
            {
                padding: 0px;
                text-align: center;
            }

                .re-total ul li
                {
                    display: inline;
                    margin-right: 20px;
                }

            .text-right2
            {
                text-align: right;
                margin-top: 0px;
                margin-right: 6px;
            }
        }

        .modalBackground
        {
            background-color: #53baff;
            filter: alpha(opacity=60);
            opacity: 0.6;
        }

        .modalBackground2
        {
            background-color: White;
            filter: alpha(opacity=40);
            opacity: 0.6;
        }

        .delete_icon
        {
            height: 20px;
            width: 20px;
        }

        .modalPopup
        {
            background-color: #FFFFFF;
            /*width: 400px;*/
            border: 3px solid #0DA9D0;
            border-radius: 12px;
            padding: 0;
        }

        .modalPopup1
        {
            background-color: Silver;
            width: 400px;
            border: 3px solid black;
            border-radius: 12px;
            padding: 0;
        }

        .modalPopup1
        {
            background-color: #FFFFFF;
            width: 600px;
            height: 500px;
            border: 3px solid black;
            border-radius: 12px;
            padding: 0;
        }

        .modalPopup .header
        {
            background-color: #2FBDF1;
            height: 30px;
            color: White;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
            border-top-left-radius: 6px;
            border-top-right-radius: 6px;
        }

        .modalPopup .body
        {
            min-height: 50px;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
        }

        .buton
        {
            display: none;
        }

        .modalPopup .footer
        {
            padding: 6px;
        }

        .modalPopup .yes, .modalPopup .no
        {
            height: 23px;
            color: White;
            line-height: 23px;
            text-align: center;
            font-weight: bold;
            cursor: pointer;
            border-radius: 4px;
        }

        .modalPopup .yes
        {
            background-color: #2FBDF1;
            border: 1px solid #0DA9D0;
        }

        .modalPopup .no
        {
            background-color: #9F9F9F;
            border: 1px solid #5C5C5C;
        }

        .gridview
        {
            background-color: #fff;
            padding: 2px;
            margin: 2% auto;
        }

            .gridview a
            {
                margin: auto 1%;
                border-radius: 50%;
                background-color: #444;
                padding: 5px 10px 5px 10px;
                color: #fff;
                text-decoration: none;
                -o-box-shadow: 1px 1px 1px #111;
                -moz-box-shadow: 1px 1px 1px #111;
                -webkit-box-shadow: 1px 1px 1px #111;
                box-shadow: 1px 1px 1px #111;
            }

                .gridview a:hover
                {
                    background-color: #1e8d12;
                    color: #fff;
                }

            .gridview span
            {
                background-color: #ae2676;
                color: #fff;
                -o-box-shadow: 1px 1px 1px #111;
                -moz-box-shadow: 1px 1px 1px #111;
                -webkit-box-shadow: 1px 1px 1px #111;
                box-shadow: 1px 1px 1px #111;
                border-radius: 50%;
                padding: 5px 10px 5px 10px;
            }

        .glyphicon-calendar
        {
            font-size: 14px;
        }

        .btn-success
        {
            margin-left: -1px;
        }

        .btn-default
        {
            margin-left: -1px;
        }

        .DispBTN
        {
            display: none;
        }
    </style>
    <style>
        *, *:after, *:before
        {
            box-sizing: border-box;
        }

        body
        {
        }

        section
        {
            float: left;
            min-width: 150px;
            width: 33.33%;
            padding: 25px 0;
            min-height: 100px;
        }

        /*=====================*/
        .checkbox
        {
            position: relative;
            display: inline-block;
        }

            .checkbox:after, .checkbox:before
            {
                font-family: FontAwesome;
                -webkit-font-feature-settings: normal;
                font-feature-settings: normal;
                -webkit-font-kerning: auto;
                font-kerning: auto;
                -webkit-font-language-override: normal;
                font-language-override: normal;
                font-stretch: normal;
                font-style: normal;
                font-synthesis: weight style;
                font-variant: normal;
                font-weight: normal;
                text-rendering: auto;
            }

            .checkbox label
            {
                width: 90px;
                height: 42px;
                background: #ccc;
                position: relative;
                display: inline-block;
                border-radius: 46px;
                -webkit-transition: 0.4s;
                transition: 0.4s;
            }

                .checkbox label:after
                {
                    content: '';
                    position: absolute;
                    width: 50px;
                    height: 50px;
                    border-radius: 100%;
                    left: 0;
                    top: -5px;
                    z-index: 2;
                    background: #fff;
                    box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
                    -webkit-transition: 0.4s;
                    transition: 0.4s;
                }

            .checkbox input
            {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                z-index: 5;
                opacity: 0;
                cursor: pointer;
            }

                .checkbox input:hover + label:after
                {
                    box-shadow: 0 2px 15px 0 rgba(0, 0, 0, 0.2), 0 3px 8px 0 rgba(0, 0, 0, 0.15);
                }

                .checkbox input:checked + label:after
                {
                    left: 40px;
                }

        .model-1 .checkbox input:checked + label
        {
            background: #376fcb;
        }

            .model-1 .checkbox input:checked + label:after
            {
                background: #4285F4;
            }

        .model-2 .checkbox label
        {
            width: 75px;
        }

            .model-2 .checkbox label:after
            {
                top: 0;
                width: 42px;
                height: 42px;
            }

        .model-2 .checkbox input:checked + label
        {
            background: #4BD865;
        }

            .model-2 .checkbox input:checked + label:after
            {
                left: 35px;
            }

        .model-3 .checkbox label
        {
            background: #fff;
            border: 1px solid #eee;
            height: 38px;
        }

            .model-3 .checkbox label:after
            {
                background: #bbb;
                top: 3px;
                left: 5px;
                width: 30px;
                height: 30px;
            }

        .model-3 .checkbox input:checked + label:after
        {
            background: #3fb454;
            left: 55px;
        }

        .model-4 .checkbox label
        {
            background: #bbb;
            height: 25px;
            width: 75px;
        }

            .model-4 .checkbox label:after
            {
                background: #fff;
                top: -8px;
                width: 38px;
                height: 38px;
            }

        .model-4 .checkbox input:checked + label
        {
            background: #77C2BB;
        }

            .model-4 .checkbox input:checked + label:after
            {
                background: #009688;
                left: 40px;
            }

        .model-5 .checkbox label
        {
            background: #bbb;
            height: 15px;
            width: 85px;
        }

            .model-5 .checkbox label:after
            {
                background: #fff;
                top: -12px;
                width: 36px;
                height: 36px;
            }

        .model-5 .checkbox input:hover + label:after
        {
            -webkit-transform: scale(1.4, 1.4);
            transform: scale(1.4, 1.4);
        }

        .model-5 .checkbox input:checked + label
        {
            background: #b66d0b;
        }

            .model-5 .checkbox input:checked + label:after
            {
                background: #FF980F;
                left: 50px;
            }

        .model-6 .checkbox label
        {
            background: #bbb;
            height: 2px;
            width: 60px;
        }

            .model-6 .checkbox label:after
            {
                background: #bbb;
                top: -16px;
                width: 32px;
                height: 32px;
            }

        .model-6 .checkbox input:checked + label
        {
            background: #376fcb;
        }

            .model-6 .checkbox input:checked + label:after
            {
                background: #4285F4;
                left: 40px;
            }

        .model-7 .checkbox label
        {
            background: none;
            border: 5px solid #555;
            height: 42px;
        }

            .model-7 .checkbox label:after
            {
                background: #555;
                box-shadow: none;
                top: 2px;
                left: 2px;
                width: 28px;
                height: 28px;
            }

        .model-7 .checkbox input:checked + label
        {
            border-color: #329043;
        }

            .model-7 .checkbox input:checked + label:after
            {
                background: #3fb454;
                left: 50px;
            }

        .model-8 .checkbox label
        {
            background: #ddd;
            width: 95px;
            border-radius: 10px;
        }

            .model-8 .checkbox label:after
            {
                background: #fff;
                border-radius: 10px;
                top: 0;
                width: 60px;
                height: 42px;
            }

        .model-8 .checkbox input:checked + label
        {
            background: #FF980F;
        }

            .model-8 .checkbox input:checked + label:after
            {
                left: 35px;
            }

        .model-9 .checkbox label
        {
            background: #aaa;
            width: 90px;
            height: 32px;
            border-radius: 20px;
        }

            .model-9 .checkbox label:after
            {
                border-radius: 20px;
                top: 0;
                width: 50px;
                height: 32px;
            }

        .model-9 .checkbox input:checked + label
        {
            background: #266c33;
        }

            .model-9 .checkbox input:checked + label:after
            {
                background: #369a48;
                left: 40px;
            }

        .model-10 .checkbox:after
        {
            content: '\f00d';
            color: #aaa;
            position: relative;
            right: 30px;
            bottom: 15px;
        }

        .model-10 .checkbox:before
        {
            content: '\f00c';
            position: relative;
            left: 35px;
            bottom: 15px;
            color: #fff;
            z-index: 1;
        }

        .model-10 .checkbox label
        {
            width: 80px;
            background: #EAEAEA;
            box-shadow: 0 0 1px 2px rgba(0, 0, 0, 0.15);
        }

            .model-10 .checkbox label:after
            {
                top: 0;
                width: 42px;
                height: 42px;
            }

        .model-10 .checkbox input:checked + label
        {
            background: #4BD865;
        }

            .model-10 .checkbox input:checked + label:after
            {
                left: 40px;
            }

        .model-11 .checkbox:after, .model-11 .checkbox:before
        {
            content: 'OFF';
            position: absolute;
            right: 10px;
            top: 10px;
            font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
            font-size: 12px;
            color: #90201F;
        }

        .model-11 .checkbox:before
        {
            content: 'ON';
            left: -40px;
            z-index: 1;
            color: #266c33;
        }

        .model-11 .checkbox label
        {
            background: #E3666C;
            height: 32px;
            border-radius: 0;
            box-shadow: 0 0 1px 2px rgba(0, 0, 0, 0.2);
        }

            .model-11 .checkbox label:after
            {
                background-color: #ffffff;
                *zoom: 1;
                filter: progid:DXImageTransform.Microsoft.gradient(gradientType=1, startColorstr='#FFFFFFFF', endColorstr='#FFFFFFFF');
                background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuMCIgeTE9IjAuNSIgeDI9IjEuMCIgeTI9IjAuNSI+PHN0b3Agb2Zmc2V0PSIzMCUiIHN0b3AtY29sb3I9IiNmZmZmZmYiLz48c3RvcCBvZmZzZXQ9IjQ1JSIgc3RvcC1jb2xvcj0iI2RkZGRkZCIvPjxzdG9wIG9mZnNldD0iNTAlIiBzdG9wLWNvbG9yPSIjZmZmZmZmIi8+PHN0b3Agb2Zmc2V0PSI1NSUiIHN0b3AtY29sb3I9IiNkZGRkZGQiLz48c3RvcCBvZmZzZXQ9IjcwJSIgc3RvcC1jb2xvcj0iI2ZmZmZmZiIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JhZCkiIC8+PC9zdmc+IA==');
                background-size: 100%;
                background-image: -webkit-gradient(linear, 0% 50%, 100% 50%, color-stop(30%, #ffffff), color-stop(45%, #dddddd), color-stop(50%, #ffffff), color-stop(55%, #dddddd), color-stop(70%, #ffffff));
                background-image: -webkit-linear-gradient(left, #ffffff 30%, #dddddd 45%, #ffffff 50%, #dddddd 55%, #ffffff 70%);
                background-image: linear-gradient(to right, #ffffff 30%, #dddddd 45%, #ffffff 50%, #dddddd 55%, #ffffff 70%);
                border-radius: 0;
                box-shadow: none !important;
                -webkit-transition: 0.1s;
                transition: 0.1s;
                top: 0;
                width: 50px;
                height: 32px;
            }

        .model-11 .checkbox input:checked + label
        {
            background: #4BD865;
        }

            .model-11 .checkbox input:checked + label:after
            {
                left: 40px;
            }

        .model-12 .checkbox
        {
            background: #2B2B2D;
            height: 40px;
            width: 160px;
            border-radius: 50px;
        }

            .model-12 .checkbox:after, .model-12 .checkbox:before
            {
                content: 'ON';
                font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
                line-height: 40px;
                font-size: 12px;
            }

            .model-12 .checkbox:before
            {
                content: 'OFF';
                z-index: 1;
            }

            .model-12 .checkbox label
            {
                background: #1E1E1E;
                height: 10px;
                width: 70px;
                margin: 0 5px;
                box-shadow: 0 0 2px 2px rgba(0, 0, 0, 0.3) inset;
            }

                .model-12 .checkbox label:after
                {
                    background-color: #3F4545;
                    background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuNSIgeTE9IjAuMCIgeDI9IjAuNSIgeTI9IjEuMCI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzY2NjY2NiIvPjxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzNmNDU0NSIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JhZCkiIC8+PC9zdmc+IA==');
                    background-size: 100%;
                    background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #666666), color-stop(100%, #3f4545));
                    background-image: -webkit-linear-gradient(top, #666666 0%, #3f4545 100%);
                    background-image: linear-gradient(to bottom, #666666 0%, #3f4545 100%);
                    top: -9px;
                    width: 27px;
                    height: 27px;
                }

                .model-12 .checkbox label:before
                {
                    content: '';
                    position: absolute;
                    width: 14px;
                    height: 14px;
                    border-radius: 100%;
                    -webkit-transition: 0.4s;
                    transition: 0.4s;
                    background: #151515;
                    z-index: 3;
                    left: 7px;
                    top: -2px;
                }

            .model-12 .checkbox input:checked + label:after
            {
                left: 45px;
            }

            .model-12 .checkbox input:checked + label:before
            {
                background: #94DA00;
                box-shadow: 0 0 5px #94DA00;
                left: 52px;
            }

        .model-13 .checkbox:after
        {
            content: 'OFF';
            font-family: Arial;
            position: absolute;
            color: #666;
            top: 12px;
            right: 15px;
        }

        .model-13 .checkbox label
        {
            background: none;
            border: 3px solid #777;
            height: 40px;
            border-radius: 20px;
        }

            .model-13 .checkbox label:after
            {
                content: 'ON';
                font-family: Arial;
                color: #fff;
                line-height: 28px;
                text-indent: 100px;
                background: #777;
                overflow: hidden;
                box-shadow: none;
                border-radius: 14px;
                -webkit-transform: translateX(-50px);
                transform: translateX(-50px);
                -moz-transition: all 0.4s 0.2s, width 0.2s linear, text-indent 0.4s linear;
                -o-transition: all 0.4s 0.2s, width 0.2s linear, text-indent 0.4s linear;
                -webkit-transition: all 0.4s, width 0.2s linear, text-indent 0.4s linear;
                -webkit-transition-delay: 0.2s, 0s, 0s;
                -webkit-transition: all 0.4s 0.2s, width 0.2s linear, text-indent 0.4s linear;
                transition: all 0.4s 0.2s, width 0.2s linear, text-indent 0.4s linear;
                top: 3px;
                left: auto;
                right: 2px;
                width: 28px;
                height: 28px;
            }

        .model-13 .checkbox input:checked + label
        {
            border-color: #329043;
        }

            .model-13 .checkbox input:checked + label:after
            {
                background: #3fb454;
                left: auto;
                -webkit-transform: translateX(0px);
                transform: translateX(0px);
                -moz-transition: all 0.4s, width 0.2s linear 0.4s, text-indent 0.3s linear 0.4s;
                -o-transition: all 0.4s, width 0.2s linear 0.4s, text-indent 0.3s linear 0.4s;
                -webkit-transition: all 0.4s, width 0.2s linear, text-indent 0.3s linear;
                -webkit-transition-delay: 0s, 0.4s, 0.4s;
                -webkit-transition: all 0.4s, width 0.2s linear 0.4s, text-indent 0.3s linear 0.4s;
                transition: all 0.4s, width 0.2s linear 0.4s, text-indent 0.3s linear 0.4s;
                width: 80px;
                text-indent: 0;
            }

        .model-14 .checkbox:after, .model-14 .checkbox:before
        {
            content: 'OFF';
            position: absolute;
            right: 10px;
            top: 10px;
            font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
            font-size: 12px;
            color: #90201F;
        }

        .model-14 .checkbox:before
        {
            content: 'ON';
            left: -40px;
            z-index: 1;
            color: #266c33;
        }

        .model-14 .checkbox label
        {
            background: #fff;
            height: 32px;
            border-radius: 0;
            box-shadow: 0 0 2px rgba(0, 0, 0, 0.2);
        }

            .model-14 .checkbox label:after
            {
                background: #90201F;
                border-radius: 0;
                box-shadow: none !important;
                -webkit-transition: 0.3s;
                transition: 0.3s;
                top: 0;
                width: 40px;
                height: 32px;
            }

        .model-14 .checkbox input:checked + label:after
        {
            background: #4BD865;
            left: 50px;
        }

        .model-15 .checkbox
        {
            width: 94px;
            height: 34px;
            border: 2px solid #ddd;
            background: #266c33;
            border-radius: 6px;
            overflow: hidden;
        }

            .model-15 .checkbox:after, .model-15 .checkbox label:before
            {
                content: 'ON';
                position: absolute;
                left: 10px;
                top: 8px;
                font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
                font-size: 12px;
                color: #fff;
            }

            .model-15 .checkbox label:before
            {
                content: 'OFF';
                left: auto;
                top: 8px;
                right: 10px;
                z-index: 1;
            }

            .model-15 .checkbox label
            {
                background: #f00;
                width: 90px;
                height: 32px;
                border-radius: 4px;
            }

                .model-15 .checkbox label:after
                {
                    border-radius: 4px;
                    box-shadow: none !important;
                    top: 0;
                    width: 50px;
                    height: 32px;
                }

            .model-15 .checkbox input:checked + label
            {
                -webkit-transform: translateX(40px);
                transform: translateX(40px);
            }

                .model-15 .checkbox input:checked + label:after
                {
                    left: 0;
                }
    </style>
    <script src="DateTimePicker/moment.min.js" type="text/javascript"></script>
    <link href="DateTimePicker/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="DateTimePicker/daterangepicker.css" rel="stylesheet" type="text/css" />
    <script src="DateTimePicker/daterangepicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        function Callback2() {
            $("#ContentPlaceHolder1_ddlCampaigns").customselect();
            $("#ContentPlaceHolder1_DropDownList1").customselect();
            $("#ContentPlaceHolder1_ddTypeOfTarget").customselect();

            document.getElementById("ContentPlaceHolder1_prevDate").value = "No Load";
            setTimeout(function () {
                $(function () {
                    function cb(start, end) {
                        $('#txtDateSearch span').html(start.format('D MMMM, YYYY') + ' - ' + end.format('D MMMM, YYYY'));
                    }
                    cb(moment().subtract(29, 'days'), moment());
                    $('#<%= txtDateSearch.ClientID %>').daterangepicker({
                        ranges:
            {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
                    }, cb);
                });



            }, 3000)



        }

    </script>
    <script>

        window.onload = function CallOnloadDatePicker() {


            Callback2();
        }
    </script>
    <style>
        .StyleGrid
        {
            margin-top: 35px;
        }
    </style>
    <script language="javascript">

        function b() {


            var hf = document.getElementById("ContentPlaceHolder1_prevDate").value;
            var dt = document.getElementById("ContentPlaceHolder1_txtDateSearch").value;
            if (hf == "No Load") {
                document.getElementById("ContentPlaceHolder1_prevDate").value = "No Date";
            }

            else if ((hf == dt) || hf == "No Date") {
                document.getElementById("ContentPlaceHolder1_prevDate").value = document.getElementById("ContentPlaceHolder1_txtDateSearch").value;
            }
            else {
                document.getElementById("ContentPlaceHolder1_prevDate").value = "No Load";
                ChangeStatus()
                ChangeStatus2()
                ChangeStatus3()
                CallClick()
            }

            if (document.getElementById("ContentPlaceHolder1_hdnfLoadFirst").value == 'LoadFirst') {
                document.getElementById("ContentPlaceHolder1_prevDate").value = document.getElementById("ContentPlaceHolder1_txtDateSearch").value;
                document.getElementById("ContentPlaceHolder1_hdnfLoadFirst").value = "secondLoad";
            }
        }


        function CallClick() {
            document.getElementById('<%= BtnSearch.ClientID %>').click();
        }
        function ChangeStatus() {
            document.getElementById("ContentPlaceHolder1_prevDate").value = "No Load";

        }
        function ChangeStatus2() {
            document.getElementById("ContentPlaceHolder1_prevDate").value = "No Load";
        }
        function ChangeStatus3() {
            document.getElementById("ContentPlaceHolder1_prevDate").value = "No Load";


        }

    </script>
    <script language="javascript">
        function Opencalender() {
            $("#ContentPlaceHolder1_txtDateSearch").click();

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <h3>Start/Stop Campaign
    </h3>
    <br />
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:HiddenField ID="hdnfLoadFirst" Value="LoadFirst" runat="server" />
            <asp:ModalPopupExtender ID="ModelConfirmation" CancelControlID="btnNo" TargetControlID="Button3"
                BackgroundCssClass="modalBackground" PopupControlID="pnlPopup" runat="server">
            </asp:ModalPopupExtender>
            <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
                <div class="header">
                    Confirmation
                </div>
                <div class="body">
                    <asp:Label ID="lbCampaingDeleteID" runat="server" Visible="false" ForeColor="White"></asp:Label>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Are you sure !!!!... You want to delete this campaign????"></asp:Label>
                </div>
                <div align="right">
                    <asp:ImageButton ID="btnYes" runat="server" CausesValidation="false" OnClick="DeleteCampaign"
                        ImageUrl="img/ok.png" Height="21px" Width="21px" />
                    <asp:ImageButton ID="btnNo" runat="server" ImageUrl="img/cancelIcon.png" Height="30px"
                        Width="30px" CausesValidation="false" />
                </div>
                <br />
                <asp:Button ID="Button3" CssClass="buton" runat="server" Text="Button" />
            </asp:Panel>
            <div>
                &nbsp;Search Banner Type&nbsp;&nbsp;&nbsp;
                <div>
                    <asp:DropDownList ID="DropDownList1" Width="320px" runat="server" CssClass="form-control custom-select" Height="36px"  AutoPostBack="True"
                        OnSelectedIndexChanged="ddTypeOfTarget_SelectedIndexChanged">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Banner 1</asp:ListItem>
                        <asp:ListItem>Banner 2</asp:ListItem>
                        <asp:ListItem>Banner 3</asp:ListItem>
                        <asp:ListItem>Banner 4</asp:ListItem>
                        <asp:ListItem>Banner 5</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                
                &nbsp;Select Targeting Type&nbsp;&nbsp;&nbsp;
                <div>
                    <asp:DropDownList ID="ddTypeOfTarget" Width="320px" runat="server" CssClass="form-control custom-select"  
                        Height="36px"  AutoPostBack="True" onselectedindexchanged="ddTypeOfTarget_SelectedIndexChanged"
                        >
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Keywords</asp:ListItem>
                        <asp:ListItem>Cookies</asp:ListItem>
                        <asp:ListItem>Age Range</asp:ListItem>
                        <asp:ListItem>Gender</asp:ListItem>
                        <asp:ListItem>Audience Interest</asp:ListItem>
                    </asp:DropDownList>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="TextBox1" ForeColor="Black" runat="server" Width="93px" Visible="false"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" ForeColor="White" runat="server" Visible="false" ValidationGroup="valsearch"
                    Text="Search" BorderStyle="None" OnClick="Button1_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" CausesValidation="false" Visible="false"
                    ForeColor="White" BorderStyle="None" Text="Reset Grid" OnClick="Button2_Click" />
                <div style="width: 320px;">
                    <asp:DropDownList ID="ddlCampaigns" CssClass='custom-select' data-show-subtext="true"
                        runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="ddlCampaigns_SelectedIndexChanged">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <br />
            <div>
               
                <div style="position: relative; width: 320px;">
                    <asp:TextBox ID="txtDateSearch"  CssClass="form-control" style="padding-left: 30px; width: 320px; height: 36px; color: black; box-shadow: none;"
                     runat="server" onchange="b()"></asp:TextBox>
                    <asp:HiddenField Value="No Date" runat="server" ID="prevDate" />
                    <asp:RequiredFieldValidator ID="reqftxtFrom" ValidationGroup="ValRate" runat="server"
                        ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDateSearch"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnSearch" runat="server" ValidationGroup="Valdate" CssClass="DispBTN"
                        ForeColor="White" BorderStyle="None" Text="Search" OnClick="BtnSearch_Click" />
                    <div class="" style="position: absolute; top: 8px; left: 10px; color: #BBBBBB;">
                        <span class="glyphicon glyphicon-calendar" onclick="Opencalender();"></span>
                    </div>
                    <div style="position: absolute; top: 8px;   right: 12px;">
                        <span class="caret" onclick="Opencalender();"></span>
                    </div>
                </div>
            </div>
            <div style="text-align: center; height: 50px">
                <asp:UpdateProgress runat="server" ID="PageUpdateProgress">
                    <ProgressTemplate>
                        <img src="img/loadergif.gif" style="height: 30px; width: 30px" alt="Wait" />
                        <br />
                        Please Wait...
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
            <div>
                For Sorting the table.. Please click on the header link of the columns.
                <%--<div style="float: right">
                    <asp:RadioButton ID="RadioVedioBanners" GroupName="a" AutoPostBack="true" runat="server"
                        OnCheckedChanged="RadioVedioBanners_CheckedChanged" />
                    <asp:Label ID="Label1" runat="server" Text="Video Banners Only"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:RadioButton ID="RadioOtherBanners" AutoPostBack="true" GroupName="a" runat="server"
                        OnCheckedChanged="RadioOtherBanners_CheckedChanged" />
                    <asp:Label ID="Label2" runat="server" Text="Other Banners"></asp:Label>
                </div>--%>
            </div>
            <asp:GridView ID="GridCampaigns" runat="server" AllowPaging="True" PageSize="25"
                DataKeyNames="campain_id" Width="100%" AutoGenerateColumns="False" BackColor="White"
                BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" AllowSorting="True" OnSorting="gvTeacher_Sorting" OnPageIndexChanging="GridCampaigns_PageIndexChanging"
                OnRowDataBound="GridCampaigns_RowDataBound" GridLines="Both">
                <FooterStyle BackColor="#C6C3C6" Height="500px" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle CssClass="gridview" Height="40px" HorizontalAlign="Right" BackColor="#C6C3C6" ForeColor="Black" />
                <RowStyle BackColor="#DEDFDE" HorizontalAlign="Center" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
                <Columns>
                    <asp:TemplateField HeaderText="Campaign Name">
                        <ItemTemplate>
                            <asp:Label ID="lbId" Visible="False" runat="server" Text='<%# Eval("campain_id") %>'></asp:Label>
                            <asp:Label ID="lbCamapaignName" runat="server" Text='<%#Eval("camp_name") %>'></asp:Label>
                            <br />
                            <asp:LinkButton ID="lnkMoreInfor" CssClass="rkv_moreInfo" Text="More Info" runat="server" OnClick="getCampDetails"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="campain_id" SortExpression="campain_id" Visible="false"
                        HeaderText="Id" />
                    <asp:BoundField DataField="total_clicks" SortExpression="total_clicks" HeaderText="Clicks(Total)" />
                    <asp:BoundField DataField="total_Impression" SortExpression="total_Impression" HeaderText="Video Views(Total)" />
                    <asp:BoundField DataField="total_conversions" SortExpression="total_conversions"
                        HeaderText="Conversion (Total)" />
                    <asp:BoundField DataField="total_revenu" SortExpression="total_revenu" HeaderText="Revenue (Total)" />
                    <asp:TemplateField HeaderText=" Status ">
                        <ItemTemplate>
                            <section class="model-13">
                                <div class="checkbox">
                                    <asp:CheckBox ID="cb" runat="server" OnCheckedChanged="load_check_boxes" AutoPostBack="true" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp 
                                    <label></label>
                                </div>
                            </section>
                            <asp:HyperLink runat="server" ID="HyperLinkEdit" Text="Edit" />
                            <asp:ImageButton runat="server" ID="imgButtonDelete" OnClick="DeleteCampaignImgBtn"
                                Height="40px" Width="40px" CssClass="StyleGrid" ImageUrl="img/cancelIcon.png" />
                            <asp:Label ID="lb_hidden_status" runat="server" Visible="false" Text='<%#Eval("status") %>'></asp:Label>
                            <asp:Label ID="lb_status" runat="server" Visible="false" Text=""></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status" Visible="false">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="running_status"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CTR">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="ctr"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Imp." SortExpression="total_views">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="imp" Text='<%#Eval("total_views") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:BoundField DataField="keywords" SortExpression="keywords" HeaderText="Keywords" />--%>
                </Columns>
            </asp:GridView>

            <asp:ModalPopupExtender ID="modalCampDetails" CancelControlID="btnNoCamp" TargetControlID="Button4"
                BackgroundCssClass="modalBackground" PopupControlID="campInforPopup" runat="server">
            </asp:ModalPopupExtender>
            <asp:Panel ID="campInforPopup" runat="server" CssClass="modalPopup">
                <div class="header">
                    <asp:Label runat="server" ID="bannerName"></asp:Label>
                </div>
                <div class="body">
                <asp:GridView ID="gdvCampDetails" runat="server" Width="100%" 
                        AutoGenerateColumns="False" BackColor="White"
                BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" 
                        CellSpacing="1" GridLines="Both" EmptyDataText="No records Found"
                        onrowcreated="gdvCampDetails_RowCreated">
                <FooterStyle BackColor="#C6C3C6" Height="500px" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle CssClass="gridview" Height="40px" HorizontalAlign="Right" BackColor="#C6C3C6" ForeColor="Black" />
                <RowStyle BackColor="#DEDFDE" HorizontalAlign="Center" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
                
                <Columns>
                    <asp:BoundField DataField="website" HeaderText="Website" />
                    <asp:BoundField DataField="Click" HeaderText="Clicks" />
                    <asp:BoundField DataField="total_Views" HeaderText="Views" />
                    <asp:BoundField DataField="total_conversions" HeaderText="Conversion" />
                    <asp:BoundField DataField="total_VideoImpressions" HeaderText="Video Impressions" />
                    <asp:BoundField DataField="Revenue" HeaderText="Revenue" />
                    <asp:TemplateField HeaderText="Block" Visible="true">
                        <ItemTemplate>
                            <asp:Button ID="Btn_Block" runat="server" ToolTip='<%#Eval("website") %>' 
                                CssClass="btn btn-primary" style="margin: 5px; background: #32B659" 
                                OnClick="Block_Unblock_Campain" data-id='<%#Eval("isBlocked") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                </div>
                <div align="right">
                    <asp:ImageButton ID="btnNoCamp" runat="server" ImageUrl="img/cancelIcon.png" Height="30px"
                        Width="30px" CausesValidation="false" />
                </div>
                <br />
                <asp:Button ID="Button4" CssClass="buton" runat="server" Text="Button" />
            </asp:Panel>

            <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
            <link href="/../netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="/../cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
            <script src="js/uikit.min.js"></script>
            <link href="css/jquery-customselect-1.9.1.css" rel="stylesheet" type="text/css" />
            <script src="js/jsSelect/jquery-customselect-1.9.1.js" type="text/javascript"></script>
            <script src="js/jsSelect/jquery-customselect-1.9.1.min.js" type="text/javascript"></script>
            <script src="js/jsSelect/slideshow.js"></script>
            <script src="js/jsSelect/slideshow-fx.js"></script>
            <script src="js/jsSelect/slideset.js"></script>
            <script src="js/jsSelect/sticky.js"></script>
            <script src="js/jsSelect/tooltip.js"></script>
            <script src="js/jsSelect/parallax.js"></script>
            <script src="js/jsSelect/lightbox.js"></script>
            <script src="js/jsSelect/grid.min.js"></script>
            <script src="js/jsSelect/wow.min.js"></script>
            <script>        new WOW().init(); </script>
            <script src="js/jsSelect/offcanvas-menu.js"></script>
            <script src="js/jsSelect/template.js"></script>
            <script src="js/jsSelect/ie10-viewport-bug-workaround.js"></script>
            <%--<script>
                $(document).ready(function () {
                    $('#main-content').on('click', '.rkv_moreInfo', function () {
                        id = $(this).attr('title');
                        src = "campaing_info.aspx?id=" + id;
                        $('.rkv_lightbox').fadeIn();
                        $('#rkv_info').attr('src', src);

                    })
                    $('#main-content').on('click', '.close_lightbox', function () {
                        $('.rkv_lightbox').fadeOut(function () {
                            $('#rkv_info').attr('src', '');
                        });
                    })
                })
            </script>--%>
            <script>
//                $(document).ready(function () {
//                    $("#ContentPlaceHolder1_ddlCampaigns").customselect();                    
//                });
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
