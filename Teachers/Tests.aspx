<%@ Page Title="" Language="C#" MasterPageFile="~/Teachers/Teachers.master" AutoEventWireup="true" CodeFile="Tests.aspx.cs" Inherits="Teachers_Tests" %>

<%--<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>--%>

<%@ Register Src="~/Teachers/ExamModal.ascx" TagName="ExamModal" TagPrefix="CustomControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        function continueclick() {

        }

        $(document).ready(function () {

            $('#SelTable tr').addClass("btn")
            $('#SelTable tr').css("min-width", "100%");


            $('#MenuSelect').on('click', 'button', function () {

                var selected = $(this).hasClass('Selected');

                $('#MenuSelect button').removeClass("Selected");

                if (!selected)

                    $(this).addClass("Selected");

                $('.lb3').val($(this).index());

            });

            $('#SelTable').delegate('tr', 'click', function () {

                var selected = $(this).hasClass("highlight");

                $("#SelTable tr").removeClass("highlight");

                if (!selected)

                    $(this).addClass("highlight");

                $('.SelectedIndex').val($(this).index());

            });

        });


        function SelectCode() {


            $('.melli').val("this is it");

            $(this)

        }


        function pong() {

            $('.melli').val("Kikuube Kiss");


        }


    </script>



    <style>
        .btn-circle {
            width: 30px;
            height: 30px;
            text-align: center;
            padding: 6px 0;
            font-size: 12px;
            line-height: 1.428571429;
            border-radius: 15px;
        }

            .btn-circle.btn-lg {
                width: 50px;
                height: 50px;
                padding: 10px 16px;
                font-size: 18px;
                line-height: 1.33;
                border-radius: 25px;
            }

            .btn-circle.btn-xl 
            {
                width: 70px;
                height: 70px;
                padding: 10px 16px;
                font-size: 24px;
                line-height: 1.33;
                border-radius: 35px;
            }

        .highlight 
        {
            background-color: darkgrey;
        }

        .Selected {
            background-color: orange;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="JumbHeader" runat="Server">
    Teachers
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">


    <form id="form2" runat="server">

        <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server"></asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>


                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-6">

                            <div class="container-fluid">

                                <ul class="breadcrumb">
                                    <li class="active"><a href="#StartUp" data-toggle="tab">Start Up</a></li>
                                    <li><a href="#Preparations" data-toggle="tab">Preparations</a></li>
                                    <li><a href="#Finally" data-toggle="tab">Data</a></li>
                                </ul>

                                <div class="jumbotron pager tab-content">

                                    <div id="StartUp" class="tab-pane fade in active">
                                    </div>

                                    <div id="Preparations" class="tab-pane fade">
                                    </div>

                                    <div id="Finally" class="tab-pane fade">

                                        <h1>Are You Ready For Setting?</h1>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                        <a href="QuestionPaper.aspx"></a>

                                        <button type="button" data-target="#ExamModal" data-toggle="modal" class="btn btn-lg pull-right btn-primary">CONTINUE</button>

                                        <br />

                                    </div>

                                    <CustomControl:ExamModal runat="server" ID="ExamModal" />


                                </div>
                            </div>
                            <div class="content">
                                This is the other content we can add to this page
                            </div>



                            <div class="col-md-3">
                            </div>
                        </div>
                    </div>
                </div>


            </ContentTemplate>
        </asp:UpdatePanel>


        <input type="hidden" id="SelIndex" runat="server" class="SelectedIndex" />
    </form>

</asp:Content>

