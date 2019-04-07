<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuestionBanker.ascx.cs" Inherits="Teachers_QuestionBank_QuestionBanker" %>

<%--<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>--%>

<%@ Register Src="~/Teachers/ExamModal.ascx" TagName="ExamModal" TagPrefix="CustomControl" %>

<script>

   
    
</script>

<style>
    .mygroup .activex {
        background-color: rgba(26, 23, 23,0.8) !important;
    }
</style>


    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Services>
            <asp:ServiceReference Path="~/UserInformation.asmx" />
            <asp:ServiceReference Path="~/Teachers/QuestionBank/QuestionBank.asmx" />
       
             </Services>
        
    </asp:ScriptManagerProxy>

     


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        
       <%-- <Triggers>
            <asp:PostBackTrigger ControlID="Button1" />
        </Triggers>--%>
       
        <ContentTemplate>
            
            <div style="width: auto;" class="container" runat="server">

                <div class="container" style="width: 100%; margin-bottom: 5px;">
                    <h1 runat="server" style="display: inline;" id="qt" class="currntqt">Qtn: 1<%--<button id="savebtn">FINISH</button>--%></h1>



                    <%--<dx:ASPxImage ID="barcode" CssClass="img pull-right" runat="server" ShowLoadingImage="true" Visible="true"></dx:ASPxImage>--%>

                </div>

                <nav class="navbar navbar-inverse" role="navigation">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#MainPane" data-toggle="tab">C<sub>s</sub>P</a>
                        </div>
                       
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="nav navbar-collapse">
                            <ul class="nav navbar-nav mytabs">
                                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Actions <b class="caret"></b></a>
                                     <ul class="dropdown-menu">
                                    <li><a href="#" data-target="#ExamModal" data-toggle="modal"><span class="glyphicon"></span>&nbsp; Open Other</a></li>
                                    <li><a href="#" data-target="#ExamModal" data-toggle="modal"><span class="glyphicon"></span>&nbsp; Finalize</a></li>
                                </ul>
                                </li>
                                <li><a href="#">Menu</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Insert <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#"><span class="glyphicon glyphicon-briefcase"></span>&nbsp; Document</a></li>
                                        <li><a href="#"><span class="glyphicon glyphicon-picture"></span>&nbsp; Image</a></li>
                                        <li><a href="#"><span class="glyphicon glyphicon-facetime-video"></span>&nbsp; Video</a></li>
                                        <li class="divider"></li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Question <b class="caret caret-right" style="transform: rotate(270deg)"></b></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Sub Question</a></li>
                                            </ul>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">One more separated link</a></li>
                                    </ul>
                                </li>

                                  <asp:DropDownList runat="server" ID="SectionSelection" AppendDataBoundItems="true" OnSelectedIndexChanged="SectionSelection_SelectedIndexChanged" AutoPostBack="true"  class="form-control" Style="width: 110px; position:relative; top:10px;"></asp:DropDownList>
                                   
                            </ul>

                             

                            <ul class="nav navbar-nav mytabs navbar-right">
                                <%--<li><a href="#" runat="server"  id="QuestionDelete" onserverclick="QuestionDelete_ServerClick"><span class="glyphicon glyphicon-trash"></span> Delete</a></li>--%>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Options <b class="caret"></b></a>
                                    <ul class="dropdown-menu nav">
                                        <li><a data-toggle="tab" href="#Settings">Settings</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li class="divider"></li>
                                        <li class="input-group"><a href="#"><span class="glyphicon glyphicon-ok" runat="server" id="chkaddon"></span>&nbsp; Enable Quick Selection</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                    </div>
                    <!-- /.container-fluid -->



                </nav>

                <div class="tab-content">
                    
                   
                    
                    <div id="MainPane" class="tab-pane fade in active">
                     
                        <div class="row form-group">

                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                <ProgressTemplate>

                                    <%--  <div style="position:absolute; z-index:5; right:40%;  " class="alert alert-info">--%>
                                    <span>
                                        <h4 class="text-center" style="z-index: 5; right: 40%;"><span style="z-index: 5">
                                          
                                             <span> <asp:Image ImageUrl="~/Teachers/QuestionBank/Icons/loader2.gif" runat="server" /></span><h4>Please Wait</h4>
                                            
                                       
                                        <%--  </div>--%>
                                    </span>


                                </ProgressTemplate>
                            </asp:UpdateProgress>

                            <div class="col-md-1">
                                <p id="Qlabel" class="Qelems">Question</p>
                            </div>
                            <div class="col-md-10 col-md-pull-1">
                                <textarea runat="server" id="QuestionTextArea" rows="4" cols="100" class="QuestData Datainp Qelems form-control" style="min-width: 500px; max-width: 600px; max-height: 150px; overflow: auto"></textarea>
                            </div>
                            <div class="col-md-1 col-md-pull-1">
                            
                                <a href="#" runat="server" id="A1" style="position: relative;" onserverclick="QuestionDelete_ServerClick" title="Delete Entire Question">
                                  
                                    <asp:Image runat="server" ImageUrl="~/Teachers/QuestionBank/Icons/trash2.png" CssClass="img" Width="100px" Height="100px"/>
                                </a>
                            </div>
                        </div>


                        <div class="navbar navbar-inverse" role="navigation">


                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header form-horizontal form-inline">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar_collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>

                                <%--  <a class="navbar-brand" href="#">Brand</a>--%>



                                <p runat="server" class="navbar-brand">
                                    Option Count: <span>
                                        <%--   < id="sel" runat="server" onselect="sel_SelectionChange"></></span> </p>--%>
                                        <asp:DropDownList runat="server" ID="sell" OnSelectedIndexChanged="sel_SelectedIndexChanged" AutoPostBack="true" class="form-control" Style="width: 55px;"></asp:DropDownList></span>


                                </p>

                                <p runat="server" class="navbar-brand">
                                    &nbsp; &nbsp; &nbsp; 
                            Question Type: <span>
                                <asp:DropDownList runat="server" ID="QuestionTypeDropDown" OnSelectedIndexChanged="QuestionTypeDropDown_SelectedIndexChanged" AutoPostBack="true" class="form-control" Style="width: 115px;"></asp:DropDownList></span>

                                </p>

                            </div>

                            <div class="collapse navbar-collapse" id="navbar_collapse">

                                <ul class="nav navbar-nav navbar-right" style="margin-top: 1%;">

                                    <li id="edit"><a runat="server" id="EditBtn" onserverclick="EditBtn_ServerClick"><span class="glyphicon glyphicon-edit"></span>&nbsp;<strong>Edit</strong>&nbsp;</a></li>
                                    <li id="del"><a runat="server" id="DelBtn" onserverclick="DataDelete"><span class="glyphicon glyphicon-trash"></span>&nbsp;<strong>Delete</strong></a></li>

                                </ul>
                            </div>
                        </div>


                        <div class="container" runat="server">


                            <table id="obtable" runat="server" class="table objectivetable ObjectiveGen table-hover" border="0" cellpadding="5" cellspacing="2" style="width: 62%">
                                <thead>

                                    <tr id="header_row" class="active" runat="server">
                                        <td>
                                            <input type="checkbox" id="mainchk" /></td>
                                        <td>Option Value </td>
                                        <td>Answer</td>
                                        <td>Is Answer</td>

                                    </tr>

                                </thead>

                                <tbody>
                                    <tr runat="server" style="width: 100%; height: 10%;" visible="false">
                                        <td class="rowdata">

                                            <input runat="server" type="checkbox" id="chk1" style="position: relative;" class="ia" />

                                        </td>

                                        <td style="width: 15%;" class="rowdata">'+elems[i]+'</td>
                                        <td id="inp1" style="width: 70%;">

                                            <input type="text" id="TextBox1" runat="server" class="txt datainp" style="width: 100%;" />
                                        </td>
                                        <td style="width: 15%;" class="rowdata">

                                            <asp:RadioButton ID="AnswerRadio1" runat="server" GroupName="answerradio" CssClass="ansradio" />
                                        </td>
                                        <td>
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                        </td>
                                    </tr>

                                    <tr runat="server" style="width: 100%; height: 10%;" visible="false">
                                        <td class="rowdata">

                                            <input runat="server" type="checkbox" id="chk2" style="position: relative;" class="ia" />

                                        </td>
                                        <td style="width: 15%;" class="rowdata">'+elems[i]+'</td>
                                        <td id="inp2" style="width: 70%;" class="rowdata">
                                            <input type="text" id="TextBox2" runat="server" class="txt datainp" style="width: 100%;" />
                                        </td>
                                        <td style="width: 15%;" class="rowdata">
                                            <asp:RadioButton ID="AnswerRadio2" runat="server" GroupName="answerradio" CssClass="ansradio" />

                                        </td>
                                        <td>
                                            <asp:HiddenField ID="HiddenField2" runat="server" />
                                        </td>
                                    </tr>


                                    <tr runat="server" style="width: 100%; height: 10%;" visible="false">
                                        <td class="rowdata">

                                            <input runat="server" type="checkbox" id="chk3" style="position: relative;" class="ia" />

                                        </td>
                                        <td style="width: 15%;" class="rowdata">'+elems[i]+'</td>
                                        <td id="inp3" style="width: 70%;" class="rowdata">
                                            <input type="text" id="TextBox3" runat="server" class="txt datainp" style="width: 100%;" />
                                        </td>
                                        <td style="width: 15%;" class="rowdata">
                                            <asp:RadioButton ID="AnswerRadio3" runat="server" GroupName="answerradio" CssClass="ansradio" />

                                        </td>
                                        <td>
                                            <asp:HiddenField ID="HiddenField3" runat="server" />
                                        </td>

                                    </tr>


                                    <tr runat="server" style="width: 100%; height: 10%;" visible="false">
                                        <td class="rowdata">

                                            <input runat="server" type="checkbox" id="chk4" style="position: relative;" class="ia" />

                                        </td>
                                        <td style="width: 15%;" class="rowdata">'+elems[i]+'</td>
                                        <td id="inp4" style="width: 70%;" class="rowdata">
                                            <input type="text" id="TextBox4" runat="server" class="txt datainp" style="width: 100%;" />

                                        </td>
                                        <td style="width: 15%;" class="rowdata">
                                            <asp:RadioButton ID="AnswerRadio4" runat="server" GroupName="answerradio" CssClass="ansradio" />

                                        </td>
                                        <td>
                                            <asp:HiddenField ID="HiddenField4" runat="server" />
                                        </td>

                                    </tr>


                                    <tr runat="server" style="width: 100%; height: 10%;" visible="false">
                                        <td class="rowdata">

                                            <input runat="server" type="checkbox" id="chk5" style="position: relative;" class="ia" />

                                        </td>
                                        <td style="width: 15%;" class="rowdata">'+elems[i]+'</td>

                                        <td id="inp5" style="width: 70%;" class="rowdata">
                                            <input type="text" id="TextBox5" runat="server" class="txt datainp" style="width: 100%;" />
                                        </td>
                                        <td style="width: 15%;" class="rowdata">
                                            <asp:RadioButton ID="AnswerRadio5" runat="server" GroupName="answerradio" CssClass="ansradio" />


                                        </td>
                                        <td>
                                            <asp:HiddenField ID="HiddenField5" runat="server" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="container">

                            <h4>Caption Preview</h4>

                        </div>



                        <div class="nav navbar navbar-inverse container-fluid row">
                            <%--<input type="button" runat="server" id="" value="NEXT"  />--%>

                            <div class="navbar-form form-inline form-horizontal">

                                <div class="col-md-3">

                                    <button type="button" runat="server" onserverclick="ButtonPrev_ServerClick" id="ButtonPrev" value="PREV" class="btn btn-default left form-control" postbackurl="~/Bank.aspx">PREVIOUS</button>

                                </div>

                                <div class="col-md-6">
                                    <h5 class="text-muted text-center">@2016 Copyrights (Cosmo Technologies)</h5>

                                </div>

                                <div class="col-md-3">

                                    <button type="button" runat="server" onserverclick="ButtonAdd_ServerClick" id="ButtonAdd" value="ADD" class="btn btn-default pull-right form-control">ADD</button>
                                    
                                    
                                    <button type="button" runat="server" onserverclick="ButtonNext_ServerClick" id="ButtonNext" value="NEXT" class="btn btn-default pull-right form-control">NEXT</button>

                                </div>


                                <%--  <input type="button" id="Button1" title="Button" value="Click me" onclick="Doit()"  />--%>
                            </div>



                        </div>



                    </div>

                    <div id="Settings" class="tab-pane fade">

                        <div class="row">
                            <h3 class="text-muted text-left">&nbsp; &nbsp;  Settings <small>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  Additional Settings Shall be displayed here</small></h3>

                           <%-- <p>&nbsp; &nbsp; &nbsp; &nbsp; </p>--%>
                            
                        </div>
                        <div class="row container">
                            <div class="col-md-2" style="min-height: 400px;">
                                <div class="list-group mygroup" style="border-right: 1px solid gray;">
                                    <a data-toggle="tab" href="#SectionsPane" class="list-group-item active">Sections</a>
                                    <a data-toggle="tab" href="#EvaluationPane" class="list-group-item">Evaluation</a>
                                    <a data-toggle="tab" href="#" class="list-group-item">Item 3</a>
                                    <a data-toggle="tab" href="#" class="list-group-item">Item 4</a>
                                    <a data-toggle="tab" href="#" class="list-group-item">Item 5</a>
                                    <a data-toggle="tab" href="#" class="list-group-item">Item 6</a>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="tab-content">
                                    <div class="tab-pane fade in active" id="SectionsPane">
                                        <h3>Paper Sections</h3>

                                            <p class="text text-left text-muted text-md-2">Sections: <span>
                                                <select id="SectionsCountBox">
                                                    

                                               </select></span></p>
                                 
                                        <div class="well well-default">
                                            <p class="text text-danger"><b>Note:</b> All Pre-Typed Questions and Correspondings shall be Considered under First Section Only. </p>
                                        </div>

                                        <br/>
                                        <br />
                                        <br />
                                        <hr />

                                    </div>
                                    <div class="tab-pane fade" id="EvaluationPane">
                                        <h3>This is the Evaluation Pane</h3>

                                         
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    
   
    <script src="../../Scripts/qBScript.js"></script>  
    <script src="../../Scripts/bootstrap.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script> 
   

    <script type="text/javascript">

        var NextQuestionNumber = 1;
        var CurrentQuestionNumber = 1;


        function NewTemplate() {



        }

        function PopulateObjectives(count) {

            var row = $(".objectivetable tbody > tr:not(:first)");


            for (count = 0; count <= 5; count++) {

                row.index(count).css('display', "block");

            }


        }

        function ReflectData(TestCode, QuestionNumber) {


            var Que = new QuestionBank();

            //$('.QuestData').val("Helo Stek");

            Que.GetQuestionData(TestCode, QuestionNumber, QuestionCallBack);

            function QuestionCallBack(response) {

                $('.currntqt').text("Qtn: " + response["QuestionNumber"]);
                $('.QuestData').val(response['Question']);

                var Objectives = response["Objectives"];

                var row = $(".objectivetable tbody > tr:not(:first)");

                var count = 0;

                $(row).each(function () {


                    var ObjectiveContent = Objectives[count];

                    $(this).children("td").find(".txt").val(ObjectiveContent["Detail"]);

                    count++;

                });



                //  $('.QuestData').val(ObjectiveContent["Detail"]);

            }


        }


        function Doit() {

            //     $('.QuestData').val("Helo Stek");
          //  ReflectData("TST012/001", 2);

        }

        function ReviewQuestion() {
            if (CurrentQuestionNumber > 1) {

                CurrentQuestionNumber = CurrentQuestionNumber - 1;

                $('.currntqt').text("Qtn: " + CurrentQuestionNumber);


            }



        }

        function AddQuestion() {

            var Questionnaire = {};

            Questionnaire.QuestionNumber = CurrentQuestionNumber;
            Questionnaire.QuestionData = $(".QuestData").val();
            Questionnaire.SetType = 2;

            var Objectives = [];

            var Objective = {};

            var RowData;

            var row = $(".objectivetable tbody > tr:not(:first)");

            var y;

            var x = 1;

            row.each(function () {

                RowData = $(this).children("td").find(".txt");


                if (RowData.val().length <= 0) {

                    Objective.ObjectiveData = "null";
                    Objective.ObjectiveValidity = 2;

                }

                else {

                    Objective.ObjectiveData = RowData.val();
                    Objective.ObjectiveValidity = 1;

                    Objectives.push({ ObjectiveData: Objective.ObjectiveData, ObjectiveValidity: Objective.ObjectiveValidity });

                }



            });

            Questionnaire.Objectives = Objectives;


            var jsonData = JSON.stringify
             ({

                 Questionnaire: Questionnaire

             });

            var TestCode = "TST012/001/005";

            var TestCodeData = JSON.stringify({ TestCode: TestCode, QuestionNumber: CurrentQuestionNumber });





            $.ajax({
                type: "POST",
                url: "QuestionPaper.aspx/CheckForExistance",
                contentType: "application/json;charset=utf-8",
                data: TestCodeData,
                dataType: "json",
                success: function (response) {
                    var resp = response.d;

                    console.log("The thing is " + resp + " " + CurrentQuestionNumber);

                    CurrentQuestionNumber = CurrentQuestionNumber + 1;

                    if (resp == true) {
                        $.ajax({
                            type: "POST",
                            url: "QuestionPaper.aspx/DisplayData",
                            contentType: "application/json;charset=utf-8",
                            data: JSON.stringify({ QuestionNumber: 1 }),
                            dataType: "json",
                            success: function (response) {

                                console.log("Data has been Displayed");
                            },
                            error: function (result, status, err) {

                            }
                        });

                    }

                    else {

                        console.log("Not Captured");
                    }


                },
                error: function (result, status, err) {

                    console.log(result);

                }


            });
            //$.ajax({
            //    type: "POST",
            //    url: "QuestionPaper.aspx/AddQuestion",
            //    contentType: "application/json;charset=utf-8",
            //    data: jsonData,
            //    dataType: "json",
            //    success: function (response) {

            //        console.log(response.d);

            //                $.ajax({

            //                    type: "POST",
            //                    url: "QuestionPaper.aspx/NextQuestionNumber",
            //                    contentType: "application/json;charset=utf-8",
            //                    data: {},
            //                    dataType: "json",
            //                    success: function (response) {

            //                        CurrentQuestionNumber = CurrentQuestionNumber + 1;

            //                        console.log(response.d);

            //                        NextQuestionNumber = response.d;

            //                        $('.currntqt').text("Qtn: " + CurrentQuestionNumber);

            //                    },

            //                    error: function (result, status, err) {



            //            },

            //            error: function (result,status,err) {

            //                console.log(result);

            //            }

            //        });},
            //    error: function (result,status,err) {


            //    }


            //})

        }


        //$('#mytabs a').on('shown.bs.tab', function (e) {


        //    if (e.relatedTarget) {
        //        $(e.relatedTarget).removeClass('active');
        //    }

        //    $('.currntqt').text("Hello");
        //});

        $('.mytabs a').click(function (e) {

            e.preventDefault();

            $(this).parent().removeClass('active');

            $('.mytabs li').removeClass('active');

            $(this).parent().parent().removeClass('active');

            //$('#mytabs a[href="#Settings"]').tab('Show');


        });

        $('.mygroup a').click(function () {

            $(this).addClass('active').siblings().removeClass('active');

        });

    </script>




