<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="Teachers_Home_Default.aspx.cs" Inherits="Teachers_Teachers_Home_Default" %>

<%--<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Home" ContentPlaceHolderID="HomeLink" runat="server"><a href="Teachers_Home_Default.aspx">Home</a></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

   <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<body>
        
    
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
                    <li class="list-group-item"><a href="Classes.aspx"><span class="glyphicon glyphicon-education">&nbspClasses</span> <span class="badge pull-right btn-success">4</span></a></li>
                    <li class="list-group-item"><a href="#"><span class="glyphicon glyphicon-user"></span><span class="glyphicon glyphicon-user"></span> Groups</a></li>
                    <li class="list-group-item"><a href="#">Clubs</a></li>
                </ul>

            </div>

            <div class="col-md-6">

                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <figure class="thumbnail">
                            
                            <img src="DashBoard/Thumbnail_Images/Subjects2.jpg" class="img-thumbnail">
                            <div class="caption">
                                <h3>Schools</h3>
                                
                            </div>
                        </figure>
                    </div>
                     <div class="col-sm-6 col-md-4">
                      <a href="Classes.aspx">  <div class="thumbnail">
                            <img src="DashBoard/Thumbnail_Images/Classroom1.JPG">
                            <div class="caption">
                                <h3>Departments</h3>
                                
                            </div>
                        </div></a>
                    </div>
                     <div class="col-sm-6 col-md-4">
                        <a href="Tests.aspx" class="thumbnail mythumb">
                            <img src="DashBoard/Thumbnail_Images/math1.jpg">
                            <div class="caption">
                                <h3>Tests / <small>Quizes</small></h3>
                               
                            </div>
                        </a>
                    </div>
                </div>

                
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="DashBoard/Thumbnail_Images/library.jpg">
                            <div class="caption">
                                <h3>Library</h3>
                               
                            </div>
                        </div>
                    </div>
                     <div class="col-sm-6 col-md-4">
                        <a href="Students_Social.aspx" class="thumbnail">
                            <img src="DashBoard/Thumbnail_Images/social-networking.jpg"/>
                            <div class="caption">
                                <h3>Social</h3>
                         
                            </div>
                        </a>
                    </div>
                     <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="DashBoard/Thumbnail_Images/Assignments.jpg"/>
                            <div class="caption">
                                <h3>Assignments</h3>
                            
                            </div>
                        </div>
                    </div>
                </div>

                
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/64x64"/>
                            <div class="caption">
                                <h3>Storage</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                        </div>
                    </div>
                     <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/64x64">
                            <div class="caption">
                                <h3>Planner</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                        </div>
                    </div>
                     <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/64x64"/>
                            <div class="caption">
                                <h3>Events</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-md-3">

                <div class="panel panel-default">
                    <div class="panel-heading"><h4>Cosmo News</h4></div>
                    <div class="panel-body">
                        <ul class="media-list">
                            <li class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="http://placehold.it/64x64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Media heading 1</h4>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                </div>
                            </li>
                            <li class="media">
                                <div class="media-right">
                                    <a href="#">
                                        <img class="media-object" src="http://placehold.it/64x64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Media heading 2</h4>
                                    Morbi eget libero quis metus consectetur semper.
                                </div>
                            </li>
                            <li class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="http://placehold.it/64x64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Media heading 3</h4>
                                    Suspendisse ullamcorper massa eget eleifend iaculis.
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="panel-group" id="collapse">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#collapse" href="#collapse-one">Cosmo Standings [Teachers]
                                </a>
                            </h4>
                        </div>
                        <div id="collapse-one" class="panel-collapse collapse in">
                            <div class="panel-body">
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

    </form>
</body> 
</html>


</asp:Content>

