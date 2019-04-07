<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/UserMasterPage.master" CodeFile="UserPage.aspx.cs" Inherits="UserPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title style="font-size: large; font-weight: bold;"></title>



    <style type="text/css">
        .dot, .dot:before, .dot:after {
            position: absolute;
            width: 10px;
            height: 10px;
            border-radius: 20px;
            background-color: #34495e;
        }

        .dot {
            top: 50%;
            left: 50%;
            margin-top: 5px;
            margin-left: 0px;
        }

            .dot:before, .dot:after {
                content: "";
            }

            .dot:before {
                right: 12px;
                transition: right .3s ease-out;
            }

            .dot:after {
                left: 12px;
                transition: left .3s ease-out;
            }

        .dots:hover .dot:before {
            right: -12px;
        }

        .dots:hover .dot:after {
            left: -12px;
        }

        .affix {
            top: 6%;
            max-width: 30%;
            z-index: 50;
            /*min-width:16.5%;*/
        }
    </style>

    <script type="text/javascript">

        $(document).ready(function () {

            $('#NewUserPrompt').hide().fadeIn(2000);

        });

        function ClosePrompt() {

            $('#NewUserPrompt').fadeOut('normal');

        }

                       </script>

                   </asp:Content>



<asp:Content ID="UserLabel" ContentPlaceHolderID="JumbHeader" runat="server">User</asp:Content>

<asp:Content ID="HomeLink" ContentPlaceHolderID="HomeLink" runat="server"><a href="UserPage.aspx">Home</a></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <body>


        <div id="fb-root"></div>
        <script>
       
       (function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
                  </script>



        <div class="container">
            <div class="row clearfix">

                <div class="col-md-3 col-md-pull-1">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2><small>About</small>&nbsp&nbsp<a href="#" style="text-decoration: none"><small></small><span><asp:Image CssClass="img-circle pull-right profileimg" runat="server" ID="ProfilePicture2" ImageUrl="~/Images/Users/Unknown-person2.gif" Style="position: relative; max-height: 100px; right: 0px; max-width: 100px; top: 0px;" /></span></a></h2>
                        </div>
                        <div class="panel-body">

                            <h3 class="text-muted"><span runat="server" id="UserProfileNames"></span></h3>

                        </div>
                        <ul class="list-group">
                            <li class="list-group-item"><span>
                                <p class="text-muted">God Will make it Possible !!!</p>
                            </span></li>
                            <li class="list-group-item">Born: <span runat="server" id="Birthday"></span></li>
                            <li class="list-group-item">Studies at<a href="#"> Mawaazo</a></li>
                            <li class="list-group-item">Works at <a href="#">Cosmo</a></li>
                        </ul>

                    </div>

                    <ul class="list-group">
                        <li class="list-group-item active">Subscriptions</li>
                        <li class="list-group-item"><a href="Schools.aspx"><span class="glyphicon glyphicon-education">&nbsp Schools</span> <span class="badge pull-right btn-success">1</span></a></li>

                        <li class="list-group-item"><a href="Classes.aspx"><span class="glyphicon glyphicon-education">&nbsp Classes</span> <span class="badge pull-right btn-success">4</span></a></li>
                        <li class="list-group-item"><a href="#"><span class="glyphicon glyphicon-user"></span><span class="glyphicon glyphicon-user"></span>&nbsp Groups</a></li>
                        <li class="list-group-item"><a href="#">Clubs</a></li>
                    </ul>

                </div>

                <div class="col-md-5">
                    <div class="panel navbar-header" data-spy="affix" data-offset-top="240">

                        <h3 class="text-muted"># Education Transformed {Blogs, Articles, Social Media, Posts, News and Anlaysis} </h3>

                    </div>

                    <div class="container-fluid" runat="server" id="NewUserPrompt">

                        <div class="row modal-header">

                            <button type="button" class="close" onclick="ClosePrompt()">&times;</button>

                            <h3 style="font-family: Centaur;">Hi <small runat="server" id="Salutation"></small><span>, Just as we set Up a few things for you. We would like to know your Concern about this Programme.</span></h3>


                        </div>

                        <div class="row modal-body">
                            <div class="col-md-6 col-md-pull-1" style="background-color: aquamarine; height: 200px;">

                                <h2 class="text-center"><a href="StudentRegistration.aspx" style="text-decoration: none;">Student</a></h2>

                            </div>

                            <div class="col-md-6 col-md-push-1" style="background-color: rebeccapurple; height: 200px;">

                                <h2 class="text-center"><a href="#" style="text-decoration: none">Teacher</a></h2>

                            </div>
                        </div>

                    </div>


                    <div class="row" style="height: 500px; margin-left: -25%; margin-right: -25%; background-image: url('Users/Images/Student.jpg');">


                        <div class="panel">


                            <div class="panel-heading">

                                <div class="row">
                                    <div class="col-md-2">
                                        <img src="Users/Images/NoImage.png" class="img-circle img-thumbnail" style="width: 100%; height: 100%;" />
                                    </div>
                                    <div class="col-md-2">
                                        <div class="row">
                                            <b class="media-bottom">Stephen Kizito</b>
                                        </div>
                                        <div class="row">
                                            <small>Blogs</small>
                                        </div>
                                        <div class="row">
                                            <br />
                                            Date
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h4 class="text-left">History About African Education.</h4>
                                    </div>
                                    <div class="col-md-1">
                                        <a href="#" class="dots media-right">
                                            <div class="dot"></div>
                                        </a>
                                    </div>

                                </div>
                                <hr />

                                <h4>This Space Belongs to US</h4>

                            </div>


                            <div class="panel-body">

                                <p class="text-justify">Cosmo Blogs to be displayed in a short while !!! </p>

                            </div>
                        </div>

                    </div>

                </div>


                <div class="col-md-3 col-md-push-1">

                    <div class="panel panel-default" style="opacity: 0.8;">
                        <div class="panel-heading">
                            <h4>Cosmo News</h4>
                        </div>
                        <div class="panel-body">
                            <a class="embedly-card" href="http://www.nytimes.com/2015/10/23/opinion/lady-gaga-and-the-life-of-passion.html">Lady Gaga and the Life of Passion</a>
                            <script async src="//cdn.embedly.com/widgets/platform.js" charset="UTF-8"></script>


                            <a class="embedly-card" href="https://www.msn.com/en-gb/news">MSN News UK | Latest UK and world news, weird news and analysis</a>
                            <script async src="//cdn.embedly.com/widgets/platform.js" charset="UTF-8"></script>

                        </div>
                    </div>

                    <div class="panel-group" id="collapse">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#collapse" href="#collapse-one">Cosmo Standings [Students]
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse-one" class="panel-collapse collapse in">
                                <div class="panel-body container-fluid">
                                    <table class="table table-striped">
                                        <caption>Student Interaction Rate</caption>
                                        <thead>
                                            <tr>
                                                <th>Pos</th>
                                                <th>Name</th>
                                                <th>Class</th>
                                                <th>Points</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1.</td>
                                                <td><a href="#">Nachwa. A</a></td>
                                                <td>P.2</td>
                                                <td>48</td>
                                            </tr>
                                            <tr>
                                                <td>2.</td>
                                                <td><a href="#">Ssebaduka. G</a></td>
                                                <td>P.5</td>
                                                <td>40</td>
                                            </tr>
                                            <tr>
                                                <td>3.</td>
                                                <td><a href="#">Ssekewa. T</a></td>
                                                <td>P.7</td>
                                                <td>30</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#collapse" href="#collapse-two">Accordion heading 2
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse-two" class="panel-collapse collapse">
                                <div class="panel-body">
                                    Morbi eget libero quis metus consectetur semper.
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#collapse" href="#collapse-three">Accordion heading 3
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse-three" class="panel-collapse collapse">
                                <div class="panel-body">
                                    Suspendisse ullamcorper massa eget eleifend iaculis.
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>

    </body>
    </html>
</asp:Content>
