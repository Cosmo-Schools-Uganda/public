<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <%--Bootstrap and Site CSS--%>
    <link href="Content/bootstrap-theme.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <%--BootStrap and JQuery Links--%>
    <script src="Scripts/jquery-3.1.0.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.1.0.intellisense.js"></script>

    <style>
        body {
            /*/*background-color:rgba(128, 128, 128,0.25);*/ */;
        }

        .Backgrounder {
            height: 550px;
            width: auto;
            background: linear-gradient(rgba(128, 128, 128,0.45),rgba(128, 128, 128,0.45)),url(Images/Backgrounds/Weback2.jpg);
        }

        .jumbotron {
            margin-bottom: 0px;
        }

        .mission {
            font-size: 45px;
            color: whitesmoke;
        }

        .mission_content {
            font-size: x-large;
            color: ghostwhite;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigationa</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">C<sub>s</sub>P</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">About US <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                          
                            <li><a href="#">Background</a></li>
                            <li><a href="#">Services</a></li>
                            <li><a href="#">Customer Care</a></li>

                        </ul>

                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                            <li class="divider"></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                </ul>
                <%--    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>--%>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Registration.aspx">Register</a></li>
                    <li><a href="SignInPage.aspx">Sign In <span class="glyphicon glyphicon-user"></span></a></li>

                </ul>
            </div>
            <!-- /.navbar-collapse -->
            <!-- /.container-fluid -->
        </nav>

        <div class="jumbotron">

            <h1 class="page-header text-center">Welcome to Cosmo-Schools Platform</h1>


        </div>

        <div class="container Backgrounder">

            <div class="row">
                <div class="col-lg-8 col-md-8"></div>

                <div class="col-md-4">

                    <h3 class="mission">Mission</h3>
                    <p class="mission_content text-justify ">Enlightening Child Education through understanding Its principles and expressing them in a brand new Technology.</p>
                    <a class="btn btn-lg btn-success" href="SchoolRegistration.aspx"><span class="glyphicon glyphicon-plus"></span>Join Us</a>

                </div>

            </div>
        </div>

        <div class="container Content_Back">

            <div class="row panel panel-body">

                <h1>Introduction </h1>

                <p class="lead">Cosmo-Schools Platform is a technology that is used in Schools (Primary and Secondary) to interact and also to manage activities within the School.<span>C<b>s</b>P</span> runs on all web technoogies and is suited to support most of the lowest school requirements that include, Web browsers and computers. </p>


                <h2>Profile</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh. Quisque volutpat condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam nec ante. Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, a cursus ipsum ante quis turpis. Nulla facilisi. Ut fringilla. Suspendisse potenti. Nunc feugiat mi a tellus consequat imperdiet. Vestibulum sapien. Proin quam. Etiam ultrices. Suspendisse in justo eu magna luctus suscipit. Sed lectus. Integer euismod lacus luctus magna. Quisque cursus, metus vitae pharetra auctor, sem massa mattis sem, at interdum magna augue eget diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi lacinia molestie dui. Praesent blandit dolor. Sed non quam. In vel mi sit amet augue congue elementum. Morbi in ipsum sit amet pede facilisis laoreet. Donec lacus nunc, viverra nec.</p>

            </div>



            <br />
            <br />


            <div class="row panel-default">

                <div class="col-md-5">

                    <div id="my-carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#my-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#my-carousel" data-slide-to="1"></li>
                            <li data-target="#my-carousel" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img alt="First slide" src="Images/Administrators/admin1.jpg"/>
                                <div class="carousel-caption">
                                    <h3>Caption heading 1</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="Second slide" src="Images/Administrators/principal.jpg"/>
                                <div class="carousel-caption">
                                    <h3>Caption heading 2</h3>
                                    <p>Morbi eget libero quis metus consectetur semper.</p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="Third slide" src="Images/Administrators/admin3.jpg"/>
                                <div class="carousel-caption">
                                    <h3>Caption heading 3</h3>
                                    <p>Suspendisse ullamcorper massa eget eleifend iaculis.</p>
                                </div>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#my-carousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#my-carousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                    <%--<img class="img img-responsive"  src="Images/Administrators/admin1.jpg" />--%>
                </div>
                <div class="col-md-7">

                    <h3>Administrators</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh. Quisque volutpat condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam nec ante. Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, a cursus ipsum ante quis turpis. Nulla facilisi. Ut fringilla. Suspendisse potenti. Nunc feugiat mi a tellus consequat imperdiet. Vestibulum sapien. Proin quam. Etiam ultrices. Suspendisse in justo eu magna luctus suscipit. Sed lectus. Integer euismod lacus luctus magna. Quisque cursus, metus vitae pharetra auctor, sem massa mattis sem, at interdum magna augue eget diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi lacinia molestie dui. Praesent blandit dolor. Sed non quam. In vel mi sit amet augue congue elementum. Morbi in ipsum sit amet pede facilisis laoreet. Donec lacus nunc, viverra nec.</p>

                </div>


            </div>
            <hr />
            <br />
            <br />
            <div class="row">
                <div class="col-md-7">

                    <h3>Teachers</h3>
                    <p>Cosmo Provides a wide range of information in relation to teachers' biography, performance, schedules, Work and task management. Cosmo through an administrative panel provides an evaluation scheme that manages teachers effectively. </p>
                </div>

                <div class="col-md-5">
                    <div id="my-carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#my-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#my-carousel" data-slide-to="1"></li>
                            <li data-target="#my-carousel" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img alt="First slide" src="Images/Teachers/075secondary-school-teacher2.jpg"/>
                                <div class="carousel-caption">
                                    <h3>Caption heading 1</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="Second slide" src="Images/Teachers/teachers2.jpg"/>
                                <div class="carousel-caption">
                                    <h3>Caption heading 2</h3>
                                    <p>Morbi eget libero quis metus consectetur semper.</p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="Third slide" src="Images/Teachers/teachers3.jpg" />
                                <div class="carousel-caption">
                                    <h3>Caption heading 3</h3>
                                    <p>Suspendisse ullamcorper massa eget eleifend iaculis.</p>
                                </div>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#my-carousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#my-carousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                    <%-- <img class="img img-responsive" src="Images/Teachers/075secondary-school-teacher2.jpg" />--%>
                </div>
            </div>


        </div>
    </form>
</body>
</html>
