<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Students_Social.aspx.cs" Inherits="Students_Students_Social" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title></title>
    
    <%--Bootstrap and Site CSS--%>

    <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>--%>

<link href="../Content/bootstrap.css" rel="stylesheet"/>
<link href="../Content/bootstrap.min.css" rel="stylesheet"/>
<link href="../Content/bootstrap-theme.min.css" rel="stylesheet" />
   
    <%--BootStrap and JQuery Links--%>
    <script src="../Scripts/jquery-3.1.0.intellisense.js"></script>
    <script src="../Scripts/jquery-3.1.0.js"></script>
    <script src="../Scripts/jquery-3.1.0.min.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery.min.js"></script>

    <style>

        @media(max-width:767px)
        {
        

        }

        a:hover{

            text-decoration:none;

        }


        .media-profiles{

            height:80px;
            width:80px;

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
                                <li><a href="#" >Background</a></li>
                                <li><a href="#" >Services</a></li>
                                <li><a href="#" >Customer Care</a></li>
                                
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
                        <li><a href="#" style="right:10px;"><span class="glyphicon glyphicon-user"></span> Student </a></li>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->
                        <!-- /.container-fluid -->
        </nav>

    <div class="jumbotron">
    
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-md-8">
                <h1 class="page-header text-center">Cosmo-Schools Platform <small>Students</small></h1>

                <ul class="nav navbar-nav bottom">
                    <li><a href="#"><span class="glyphicon glyphicon-envelope"></span></a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-exclamation-sign"></span></a></li>
                </ul>

            </div>
            <div class="col-md-2">

        <img class="img-circle pull-right profileimg" src="../Images/Users/Unknown_Person.png" style="position:relative; height:100px; width:auto; top:50px;" />

            </div>
        </div>
        

    </div>
        <div class="container">
        <div class="row clearfix">
           
            <div class="col-md-3">

                <div class="panel panel-default">
                    <div class="panel-heading"><h2><small>About</small></h2></div>
                    <div class="panel-body">

                        <p class="text-muted">God Will make it Possible !!!</p>

                    </div>
                               <ul class="list-group">
                            <li class="list-group-item">Born: <span class="text-muted">25<sup>th</sup>, December, 2016  </span></li>
                            <li class="list-group-item">Studies at<a href="#"> Mawaazo</a></li>
                            <li class="list-group-item">Works at <a href="#"> Cosmo</a></li>
                        </ul>
                 
                </div>

                <ul class="list-group">
                    <li class="list-group-item active">Subscriptions</li>
                    <li class="list-group-item"><a href="#"><span class="glyphicon glyphicon-education"> Classes</span> <span class="badge pull-right btn-success">4</span></a></li>
                    <li class="list-group-item"><a href="#"><span class="glyphicon glyphicon-user"></span><span class="glyphicon glyphicon-user"></span> Groups</a></li>
                    <li class="list-group-item"><a href="#">Clubs</a></li>
                </ul>

            </div>

            <div class="col-md-6">

                <div class="well well-lg">

                    <div class="form-group">                
                         
                    <h4>Post</h4>
                    <textarea class="form-control" rows="3"></textarea>

                        </div>

                    
                    <div class="form-group">
                        <div><p class="text-info form-horizontal">Attach: </p> <a href="#">
                            <span class="glyphicon glyphicon-paperclip"></span>
                            File 
                             </a>

                            
                            <a href="#">
                                <span class="glyphicon glyphicon-camera"></span>
                                Image
                            </a>
                        </div>

                        <input type="button" class="btn btn-success pull-right" value="SEND" />
                    
                    </div>                    
                    
                  
                </div>

                <div class="media media-middle">

                    <a href="#" class="pull-left"><img class="media-object  media-profiles" src="../Images/Users/Unknown-person2.gif" alt="" /></a>
                    
                   

                    <div class="media-body">
                        
                        <h4 class="media-heading">Irene Angel</h4>
                        <p>Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa</p>
                
                          <hr />

                       

                    <div class="media-bottom">
                       
                        <span class="glyphicon glyphicon-comment"></span>
                        <a href="#"><span class="glyphicon glyphicon-hand-up" title="Up Votes"></span></a>
                      
                    </div>

                            
                               </div>
                 
                     <a class="media-object pull-left">1 Upvotes</a>
                   


                </div>

                                <div class="media media-middle">

                    <a href="#" class="pull-left"><img class="media-object  media-profiles" src="../Images/Users/Unknown-person2.gif" alt="" /></a>

                    <div class="media-body">
                        
                        <h4 class="media-heading">Hassan Fahad</h4>
                        <p>Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa</p>
                    </div>



                </div>
                         <div class="media media-middle">

                    <a href="#" class="pull-left"><img class="media-object  media-profiles" src="../Images/Users/Unknown-person2.gif" alt="" /></a>

                    <div class="media-body">
                        
                        <h4 class="media-heading">Ssekyewa Timothy</h4>
                        <p>Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa</p>
                    </div>



                </div>


                         <div class="media media-middle">

                    <a href="#" class="pull-left"><img class="media-object  media-profiles" src="../Images/Users/Unknown-person2.gif" alt="" /></a>

                    <div class="media-body">
                        
                        <h4 class="media-heading">Kiyega Denis</h4>
                        <p>Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa</p>
                    </div>



                </div>

                         <div class="media media-middle">

                    <a href="#" class="pull-left"><img class="media-object  media-profiles" src="../Images/Users/Unknown-person2.gif" alt="" /></a>

                    <div class="media-body">
                        
                        <h4 class="media-heading">Gilbert</h4>
                        <p>Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa</p>
                    </div>



                </div>

                         <div class="media media-middle">

                    <a href="#" class="pull-left"><img class="media-object  media-profiles" src="../Images/Users/Unknown-person2.gif" alt="" /></a>

                    <div class="media-body">
                        
                        <h4 class="media-heading">Stek</h4>
                        <p>Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa Hello World, Hello Africa</p>
                    </div>



                </div>


            </div>

            <div class="col-md-3">Notifications</div>

             </div>
        </div>

    </form>
</body> 
</html>
