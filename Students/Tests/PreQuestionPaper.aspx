<%@ Page Title="" Language="C#" MasterPageFile="~/Students/Tests/Tests.master" AutoEventWireup="true" CodeFile="PreQuestionPaper.aspx.cs" Inherits="Students_Tests_PreQuestionPaper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PaperHeader" runat="server"><h1 class="text-center">Gombe Senior Secondary School</h1>

    <p class="text-center">MATH P203</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">

    <div class="container"> 

        <h1>Rules and Regulations</h1>
        

        <ol type="A">

            <li><h3>Seating Rules</h3>

                 <ol type="1">
            <li>Do not Open This Bookllet until you are to do so</li>
            <li>Rule 2</li>
            <li>Rule 3</li>
            <li>Rule 4</li>
        </ol>

            </li>

            <li><h3>Beginning of Test</h3>
             <ol type="1">
         <li>Rule 1</li>
            <li>Rule 2</li>
            <li>Rule 3</li>
            <li>Rule 4</li>
   
           </ol>
            </li>
        </ol>

        <div class="well well-lg">
            <h3>Declaration</h3>

            <p class="text-info"><input type="checkbox" class="checkbox checkbox-inline"/>&nbsp I hereby declare that i have read and understood the rules and reguations to which this test is to be conducted........ </p>
      
              </div>
      
        <input type="button" class="btn btn-success btn-lg pull-right" data-toggle="modal" data-target="#PaperAuthent" value="BEGIN" />

      
        <div class="modal fade" id="PaperAuthent" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Please Verify Your Identity</h4>
                    </div>

                    <div class="modal-body">

                        <div class="row">
                            <div class="col-md-8">

                               <h4 class="list-group-item-heading">User Sign in</h4>
                                <br />

                                    <div class="form-group">
                                        <label class="control-label col-md-4">User Name:</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="Enter User Name Here" />

                                            <br />
                                        </div>
                                    </div>
                                  
                                
                                    <div class="form-group">
                                        <label class="control-label col-md-4" for="pwd">Password:</label>
                                        <div class="col-md-8">
                                            <input type="password" id="pwd" class="form-control" />

                                            <br />
                                        </div>
                               
                                            </div>

                                <div class="form-group">
                                    <a href="QuestionPaper.aspx"><input type="button" class="btn btn-info pull-right" value="Submit" runat="server" /></a>

                                </div>
                              
                                </div>

                         
                            <div class="col-md-4">
                                <h4 class="list-group-item-heading">Biometric Sign in</h4>

                                <img class="img-thumbnail" src="Thumbnails/FingerPrints.jpg" />
                            </div>
                        </div>
                        
                     </div>
                </div>
            </div>
        </div>
              </div>

</asp:Content>
