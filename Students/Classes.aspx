<%@ Page Title="" Language="C#" MasterPageFile="~/Students/Students.master" AutoEventWireup="true" CodeFile="Classes.aspx.cs" Inherits="Students_Classes" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="Scripts/StudentScripts.js" ></script>
   
    <style>
        .mylist{

            list-style:none;

        }
        .mylist a{

            position:relative;
            left:5%;
            text-decoration:none;
            font-size:18px;
        }

        .mylist a span{

            position:relative;
            right:15px;

        }

        .breadcrumb{

            background-color:none;
            background:none;

        }


        .list-group-item a{


            text-decoration:none;

        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    
    <div class="container">
        <ol class="breadcrumb" id="tabbreadcrumb">
            <li><a data-toggle="tab" href="#mst">My Class</a></li>
            
            
        </ol>
    <div class="row">
        <div class="col-md-3">

            <ul class="list-group">
                <li class="list-group-item active">Records</li>
                <li class="list-group-item">
                    <div class="panel-group" id="collapse">
                      <%--  <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#collapse" href="#collapse-one">Pre-Primary
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse-one" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                </div>
                            </div>
                        </div>--%>
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#collapse" href="#collapse-two">Primary

                                    </a>
                                </h4>
                            </div>
                            <div id="collapse-two" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul id="Primary_Classes" style="list-style:none;" class="list-group mylist" runat="server" >
                                       
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#collapse" href="#collapse-three">Secondary
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse-three" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="list-group mylist" id="Secondary_Classes" runat="server">
                                        <h4 class="active list-group-item-heading">O'Level</h4>
                                      
                                    </ul>
                                     <ul class="list-group mylist" id="Secondary_Classes2" runat="server">
                                        <h4 class="active list-group-item-heading">A'Level</h4>
                                    
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="list-group-item active">Activities</li>
                <li class="list-group-item">Morbi eget libero quis metus consectetur semper.</li>
                <li class="list-group-item">Suspendisse ullamcorper massa eget eleifend iaculis.</li>
            </ul>

        </div>

        <div class="col-md-9">
            <div class="tab-content">
                <div id="mst" class="tab-pane fade in active">
                    <div class="jumbotron">
                        <h1>My Class <small>My Educational Gift</small></h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                </div>

                <div id="p1" class="tab-pane fade ">
                    <div class="row">
                        <div class="col-md-4">
                            Term 1
                        </div>

                         <div class="col-md-4">
                             Term 2
                        </div>

                         <div class="col-md-4">
                             Term 3
                        </div>

                    </div>

                </div>
                 <div id="p2" class="tab-pane fade ">
                    <div class="row">
                        <div class="col-md-4">
                            Term 1
                        </div>

                         <div class="col-md-4">
                             Term 2
                        </div>

                         <div class="col-md-4">
                             Term 3
                        </div>

                    </div>

                </div>
        </div>
            </div>
            
    </div>
        </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="JumbHeader" runat="server">
    Classes
</asp:Content>