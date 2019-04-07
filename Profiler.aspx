<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/UserMasterPage.master" CodeFile="Profiler.aspx.cs" Inherits="Profiler" %>



<asp:Content runat="server" ContentPlaceHolderID="HomeLink"><a href="UserPage.aspx">Home</a></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="JumbHeader"><small>Profiler</small></asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style>
        .borderless td, table.borderless th {
            border: none !important;
        }

        table {
            border: none;
        }

        .tabcontent {
            -webkit-animation: fadeEffect 1s;
            animation: fadeEffect 1s; /* Fading effect takes 1 second */
        }

        @-webkit-keyframes fadeEffect {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        @keyframes fadeEffect {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }
    </style>

    <link href="Content/Grid.css" rel="stylesheet" />
    <link rel="stylesheet" href="Content/metro-icons.css" />
    <link rel="stylesheet" href="Content/profimager.css" />
    <%-- <link href="Content/metro.css" rel="stylesheet" />--%>
    <script src="Scripts/metro.js"></script>

    <script>
        function openMenu(evt, ElementId) {
            // Declare all variables
            var i, tabcontent, tablinks;

            // Get all elements with class="tabcontent" and hide them
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }

            // Get all elements with class="tablinks" and remove the class "active"
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }

            // Show the current tab, and add an "active" class to the button that opened the tab
            document.getElementById(ElementId).style.display = "block";
            evt.currentTarget.className += " active";

            //Display Current Page on BreadCrumb
           
            $('.breadcrumb').append('<li><a href="#" onclick="openMenu(event,2)">' + $('#' + evt.currentTarget.id).children('.tile-content').children('.tile-label').text() + '</a></li>');

        }
    </script>

</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="body">

    <div class="container-fluid">

        <div class="col-md-3 col-md-push-2">

            <div class="imager">
                <img id="image1" class="profimg" src="Images/Profiler/oldpapertexture2.jpg" />
                <img id="image2" class="profimg" src="Images/Profiler/steven.JPG" />
                <img id="clip" class="profimg clipper" src="Images/Profiler/Clippersvertical.png" />
            </div>

            <div class="panel">
                <div class="panel-heading">
                    <h4><b>Fact File</b></h4>
                </div>
                <div class="panel-body">

                    <table class="table table-responsive borderless">

                        <tr>
                            <th>Names:</th>
                            <td>Katabalwa Steven</td>
                        </tr>
                        <tr>
                            <th>aka:</th>
                            <td>Stek</td>
                        </tr>
                        <tr>
                            <th>DOB:</th>
                            <td>18<sup>th</sup>/Feb/2017</td>
                        </tr>

                        <tr>
                            <th>Status:</th>
                            <td>Student</td>
                        </tr>

                        <tr>
                            <th>School:</th>
                            <td><a href="#">Gombe Secondary School</a></td>
                        </tr>

                        <tr>
                            <th>Contact:</th>
                            <td>0700742219</td>
                        </tr>

                        <tr>
                            <th>Interests:</th>
                        </tr>

                    </table>
                </div>
            </div>
        </div>


        <div class="col-md-4 col-md-push-2">
            <div class="row" style="max-height:500px; height:500px;">

                <div class="row" style="height: 10%;">
                    <ul class="breadcrumb">
                        <li><a href="#" onclick="openMenu(event,'1');"><span class="mif-home"></span>&nbsp Kizito Stephen</a></li>

                    </ul>
                </div>

                <div class="row" style="height:80%">
                    <div class="tabcontrol2">
                        <div class="frames">
                            <div class="frame tabcontent" id="1" style="height: 100%;">
                                <div class="row" style="height: 65%; max-width: 100%;">
                                    <div class="col-md-6" style="height: 100%;">
                                        <div class="row" style="height: 50%;">
                                            <div class="col-md-6  col" style="height: 100%;">
                                                <div class="tile tablinks" style="background-color: orangered" data-role="tile" id="Schools" onclick="openMenu(event,'2');">
                                                    <div class="tile-content">
                                                        <div class="tile-content iconic">
                                                            <icon class="icon mif-school" />
                                                        </div>
                                                        <span class="tile-label">Schools</span>
                                                        <span class="tile-badge">5</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col" style="height: 100%;">
                                                <div class="tile">
                                                    <div class="tile-content slide-left" style="background-color: black">

                                                        <div class="slide-over">
                                                            <span class="tile-label">Activity</span>
                                                            <span class="tile-badge">5</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 50%;">
                                            <div class="col-md-6" style="height: 94%;">
                                                <div class="row row-sm" style="height: 50%">
                                                    <div class="col-md-6 col-sm" style="height: 100%">
                                                        <div class="tile">
                                                            <div class="tile-content iconic ">
                                                            <icon class="icon mif-mail" />
                                                        </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm" style="height: 100%">
                                                        <div class="tile" data-role="tile">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row row-sm" style="height: 50%">
                                                    <div class="col-md-6 col-sm" style="height: 100%">
                                                        <div class="tile" data-role="tile">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm" style="height: 100%">
                                                        <div class="tile" data-role="tile">
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-6 col" style="height: 100%;">
                                                <div class="tile" style="background-color: burlywood" data-role="tile">
                                                     <div class="tile-content">
                                                    <div class="tile-content iconic">
                                                            <icon class="icon mif-organization" />
                                                        </div>
                                                        <span class="tile-label">Community</span>
                                                        <span class="tile-badge">3</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 50%">
                                            <div class="col-md-6 col" style="height: 100%">
                                                <div class="tile" style="background-color: #330000" data-role="tile">
                                                    <div class="tile-content">
                                                        <div class="tile-content iconic">
                                                            <icon class="icon mif-trophy" />
                                                        </div>
                                                        <span class="tile-label">Points</span>
                                                        <span class="tile-badge">2</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col" style="height: 100%">
                                                <div class="tile" data-role="tile" data-effect="slideLeftRight" data-duration="1000" data-period="10000">
                                                    <div class="tile-content">
                                                        <div class="live-slide">
                                                            <div class="tile" style="background-color: #339900" data-role="tile">
                                                                <span class="tile-label">Other</span>
                                                                <span class="tile-badge">12</span>
                                                            </div>
                                                        </div>
                                                        <div class="live-slide">
                                                            <img src="Images/Profiler/steven.JPG" />
                                                        </div>

                                                        <div class="live-slide">
                                                            <img src="Images/Profiler/download (1).jpg" />
                                                        </div>

                                                        <div class="live-slide">
                                                            <img src="Images/Profiler/monitor-news-2016.jpg" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 coldivider" style="height: 100%;">
                                        <div class="row" style="height: 50%;">
                                            <div class="tile">
                                                <div class="tile-content image-set">
                                                    <img src="Images/Profiler/steven.JPG" />
                                                    <img src="Images/Profiler/monitor-news-2016.jpg" />
                                                    <img src="..." />
                                                    <img src="Images/Profiler/oldpapertexture.jpg" />
                                                    <img src="..." />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 50%">
                                            <div class="col-md-6 col" style="height: 100%">
                                                <div class="tile">
                                                    <div class="tile-content slide-left">
                                                        <div class="slide">
                                                            <div class="slide">
                                                                <img src="Images/Profiler/download (2).jpg" />
                                                            </div>
                                                        </div>
                                                        <div class="slide-over">
                                                            ... Over slide content here ...
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col" style="height: 100%">

                                                <div class="tile" data-role="tile" data-effect="slideUpDown">
                                                    <div class="tile-content">
                                                        <div class="live-slide">
                                                            <img src="Images/Profiler/steven.JPG" />
                                                        </div>

                                                        <div class="live-slide">
                                                            <img src="Images/Profiler/download (1).jpg" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row" style="height: 50%;">
                                            <div class="tile">
                                                <div class="tile-content slide-up">
                                                    <div class="slide">
                                                        <div class="slide">
                                                            <img src="Images/Profiler/Forestry-woodland-758x259.jpg" />
                                                        </div>
                                                    </div>
                                                    <div class="slide-over">
                                                        ... Over slide content here ...
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="frame" id="2" style="height: 100%;">
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>

</asp:Content>
