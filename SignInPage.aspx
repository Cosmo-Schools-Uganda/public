<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="SignInPage.aspx.cs" Inherits="SignInPage" %>



<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title></title>



    <script>

        $(document).ready(function () {


            $('.ubox').focus();

        });

        function button_click(textbox, btn) {
            if (window.event.keyCode == 13) {

                document.getElementById(btn).click();
            }
        }


    </script>

</asp:Content>

<asp:Content ID="Header" ContentPlaceHolderID="JumbHeader" runat="server">Sign In</asp:Content>

<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">


    <head>

        <title></title>

        <%-- <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-datetimepicker.css" rel="stylesheet" />
        --%>

        <%--bootstrap and jquery links--%>

        <%-- <script src="Scripts/jquery-3.1.0.js"></script>
    <script src="Scripts/jquery-3.1.0.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/moment.js"></script>
    <script src="Scripts/bootstrap-datetimepicker.min.js"></script>
    <script src="Scripts/jquery-3.1.0.intellisense.js"></script>--%>
    </head>

    <body>
        <form id="form1" runat="server">

            <div class="container" style="position: relative; top: 120px;">
                <div class="row">

                    <div class="col-md-2 col-md-offset-4">
                        <asp:Label runat="server" Text="User Name"></asp:Label>
                    </div>

                    <div class="col-md-4 col-md-pull-1">
                        <input type="text" runat="server" id="UserNameBox" class="ubox" />
                    </div>

                </div>
                <br />
                <div class="row">

                    <div class="col-md-1 col-md-offset-4">
                        <asp:Label runat="server" Text="Password"></asp:Label>
                    </div>

                    <div class="col-md-4">
                        <input type="password" runat="server" id="PasswordBox" class="passbox" />

                    </div>



                </div>

                <br />

                <div class="row">
                    <div class="col-md-6 col-md-push-4">

                        <p class="text-danger" runat="server" id="ErrorMessage"></p>
                    </div>


                </div>


                <div class="row">
                    <div class="col-md-6 col-md-push-4">

                        <a href="Recovery.aspx">Forgot Password?</a>

                        <br />

                        <input type="button" class="button" runat="server" style="margin: 1% auto 1% auto;" value="CONTINUE" id="ContinueButton" onserverclick="ContinueButton_ServerClick" />



                    </div>
                    <div class="col-md-6">
                        <a href="Registration.aspx">Need an Account?</a>

                    </div>
                </div>

            </div>


        </form>
    </body>
    </html>


</asp:Content>
