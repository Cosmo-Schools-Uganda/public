<%@ Page Title="" Language="C#" MasterPageFile="~/Students/Students.master"  AutoEventWireup="true" CodeFile="Tests.aspx.cs" Inherits="Students_Tests" %>

<%--<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
--%>
<%--<%@ Register Assembly="DevExpress.XtraScheduler.v15.2.Core, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script src="../Scripts/jquery.signalR-2.2.1.min.js"></script>
    <script src="../signalr/hubs"></script>

  
    <script>

        var TestHub = $.connection.TestsHub;

        function LoadTests() {

            $.ajax(
            {
                type: 'POST',
                url: "../CosmoService.asmx/GetTests",
                contentType: 'application/json; charset=utf-8',
               data:{},
                dataType: 'json',
                success: function (data) {

                   
                    $('.MiniCalendarBody').children().remove();

                    for (var i = 0; i < data.d.length; i++) {

                        var Startdate = new Date(parseInt(data.d[i].schedule.Start.substr(6)));

                        var EndDate = new Date(parseInt((data.d[i].schedule.End.substr(6))));

                        var DataElem = '<tr><td><a href="#" runat="server">' + data.d[i].ExamName + '</a></td><td>' + Startdate.toLocaleString() + '</td><td>' + EndDate.toLocaleString() + '</td></tr>';

                        $('.MiniCalendarBody').append(DataElem);

                    }

                    $('#IncomingSubject').text(data.d[0].ExamName);
                    $('#IncomingTimeStart').text(new Date(parseInt(data.d[0].schedule.Start.substr(6))).toLocaleString());
                    $('#IncomingTimeEnd').text(new Date(parseInt(data.d[0].schedule.End.substr(6))).toLocaleString());

                    var Today = new Date();
            
                    if (new Date(parseInt(data.d[0].schedule.Start.substr(6))) <= Today & new Date(parseInt(data.d[0].schedule.End.substr(6))) > Today)
                    {

                        console.log("The Exam has started");
                        $('.startbtn').removeClass('disabled');
                    }
                    else {

                        $('.startbtn').addClass('disabled');
                        console.log("Not yet");
                    }

                },
                error: function (result) {
                    console.log(result);
                }

            }
            );
        }

        $(document).ready(function () {

            var interval = setInterval(function () {

                LoadTests();

            }, 1000);


          

            TestHub.client.broadcastMessage = function (msg) {



            }

            TestHub.client.receiveSchedule = function (data) {

                console.log(data);
            }

            $.connection.hub.start().done(function () {

                TestHub.server.refreshSchedule();

                $.connection.hub.logging = true;

                console.log("hub start");

            });


          
        });
       
        function dothis() {

            TestHub.server.refreshSchedule();

        }
        
    </script>

    <style>
        .list-group a {
            text-decoration: none;
        }

        .thumbnail {
            text-decoration: none;
        }

        .subjectsel div {
            text-decoration: none;
        }

        #ASPxCalendar1 {
            position: relative;
            width: 800px;
            height: auto;
        }

        .planner {
            height: 300px;
            width: auto;
            background-image: url(Tests/TimePlan.jpg);
            background-size: cover;
            background-position: center;
        }

            .planner:hover {
                height: 300px;
                width: auto;
                background: linear-gradient(rgba(0, 0, 0,0.45),rgba(0, 0, 0,0.5)),url(Tests/TimePlan.jpg);
                background-size: cover;
                background-position: center;
            }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>

   
    <div class="row container-fluid">
        <div class="col-md-2 col-md-push-1">
            <ul class="list-group">
                <a data-toggle="tab" href="#mainpane">
                    <li class="list-group-item active">
                        <h3 class="list-group-item-heading text-center">Explore</h3>
                    </li>
                </a>
                <a data-toggle="tab" href="#results">
                    <li class="list-group-item btn btn-default" runat="server" id="resultslink" onclick="resultsclick">Results</li>
                </a>

                <a data-toggle="tab" href="#schedules">
                    <li class="list-group-item btn btn-default" runat="server" id="scheduleslink" onclick="schedulesclick">Schedules &nbsp<span class="glyphicon glyphicon-calendar"></span></li>
                </a>
                <a data-toggle="tab" href="#guidelines">
                    <li class="list-group-item btn btn-default" runat="server" id="guidelineslink" onclick="guidelinesclick">Guidelines</li>
                </a>
                <a data-toggle="tab" href="#ppapers">
                    <li class="list-group-item btn btn-default" runat="server" id="ppaperslink" onclick="ppapersclick">Past Papers</li>
                </a>

            </ul>

            <div class="panel panel-default">
                <div class="panel-heading">Incoming Test</div>
                <div class="panel-body">

                    <asp:UpdatePanel runat="server" ID="panel1">
                      
                        <ContentTemplate>
                            <table>

                                <tbody>
                                    <tr>
                                        <th>Subject:&nbsp</th>

                                        <td>
                                            <p><a href="#" id="IncomingSubject">None</a></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Start: &nbsp</th>
                                        <td>
                                            <p id="IncomingTimeStart">Null</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>End: &nbsp</th>
                                        <td>
                                            <p id="IncomingTimeEnd">Null</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Scope: &nbsp</th>

                                        <td>
                                            <p runat="server" id="IncomingTestScope"></p>
                                        </td>
                                    </tr>
                                </tbody>


                            </table>


                            <hr />
                            <a runat="server" id="StartButton" class="btn disabled btn-lg btn-block btn-default startbtn" href="~/Students/Tests/PreQuestionPaper.aspx">
                                <h2 class="text-success">START <span class="glyphicon glyphicon-play"></span></h2>
                            </a>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-md-push-1">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="mainpane">
                    Hello this is the main tests content page
                </div>
                <div class="tab-pane fade" id="results">
                    <div class="jumbotron">
                        <h1>Tests Results</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                    <p class="lead text-muted">Please select a Subject:</p>

                    <div class="row">
                        <div class="col-md-2">
                            <a href="#" class="subjectsel">
                                <figure class="thumbnail">

                                    <img src="Tests/Thumbnails/maths.jpg" class="img-thumbnail" />
                                    <div class="caption">
                                        <h3>Math</h3>

                                    </div>
                                </figure>
                            </a>

                        </div>
                        <div class="col-md-2">
                            <figure class="thumbnail">

                                <img src="DashBoard/Thumbnail_Images/Subjects2.jpg" class="img-thumbnail" />
                                <div class="caption">
                                    <h3>History</h3>

                                </div>
                            </figure>
                        </div>
                        <div class="col-md-2">
                            <figure class="thumbnail">

                                <img src="DashBoard/Thumbnail_Images/Subjects2.jpg" class="img-thumbnail" />
                                <div class="caption">
                                    <h3>Physics</h3>

                                </div>
                            </figure>
                        </div>
                        <div class="col-md-2">
                            <figure class="thumbnail">

                                <img src="DashBoard/Thumbnail_Images/Subjects2.jpg" class="img-thumbnail" />
                                <div class="caption">
                                    <h3>English</h3>

                                </div>
                            </figure>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="schedules">



                    <div class="row">
                        <div class="col-md-6">
                            <h3 class="text-muted">Calendar</h3>
                            <%--<dx:ASPxCalendar ID="ASPxCalendar1" runat="server" Theme="Metropolis"></dx:ASPxCalendar>--%>
                        </div>
                        <div class="col-md-6">
                            <a href="#">
                                <div class="jumbotron planner">
                                </div>
                            </a>

                        </div>
                    </div>


                    <hr />

                    <h3 class="text-muted">Events Overview</h3>
                  <%--  <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" ActiveViewType="Timeline" Theme="Metropolis" ClientIDMode="AutoID"  Start="2017-03-19">
                        <Storage EnableReminders="false">
                            <Appointments AutoRetrieveId="true" />
                        </Storage>
                        <Views>


                            <WeekView Enabled="true"></WeekView>
                            <FullWeekView Enabled="false">
                            </FullWeekView>
                            <WorkWeekView Enabled="false"></WorkWeekView>
                            <MonthView Enabled="true"></MonthView>
                        </Views>

                    </dxwschs:ASPxScheduler>--%>

                </div>
                <div class="tab-pane fade" id="guidelines">
                    This is the Guidelines Pane
                </div>
                <div class="tab-pane fade" id="ppapers">
                    This is the Past Papers Pane
                </div>

            </div>
        </div>
        <div class="col-md-3 col-md-push-1">
            <div class="panel panel-default">
                <div class="panel-heading">Mini-Calendar for Quick up Notifications</div>
                <div class="panel-body">

                    <asp:UpdatePanel runat="server">
                      
                        <ContentTemplate>
                            <table class="table table-hover table-inverse">
                                <thead runat="server">
                                    <tr>
                                        <td>Subject</td>
                                        <td>Start</td>
                                        <td>End</td>
                                    </tr>
                                </thead>
                                <tbody runat="server" class="MiniCalendarBody" id="ScheduleBody">
                                </tbody>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="JumbHeader" runat="server">
    Tests
</asp:Content>

