<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExamModal.ascx.cs" Inherits="ExamModal" %>
<%--<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>--%>

<script type="text/javascript">



    $(document).ready(function () {

        $('#SelTable tr').addClass("btn")
        $('#SelTable tr').css("min-width", "100%");


        $('#MenuSelect').on('click', 'button', function () {

            var selected = $(this).hasClass('Selected');

            $('#MenuSelect button').removeClass("Selected");

            if (!selected)

                $(this).addClass("Selected");

            $('.lb3').val($(this).index());

        });

        $('#SelTable').delegate('tr', 'click', function () {

            var selected = $(this).hasClass("highlight");

            $("#SelTable tr").removeClass("highlight");

            if (!selected)

                $(this).addClass("highlight");

            $('.SelectedIndex').val($(this).index());

        });

    });


    function SelectCode() {


        $('.melli').val("this is it");

        $(this)

    }


    function pong() {

        $('.melli').val("Kikuube Kiss");


    }

</script>



<style>
    .btn-circle {
        width: 30px;
        height: 30px;
        text-align: center;
        padding: 6px 0;
        font-size: 12px;
        line-height: 1.428571429;
        border-radius: 15px;
    }

        .btn-circle.btn-lg {
            width: 50px;
            height: 50px;
            padding: 10px 16px;
            font-size: 18px;
            line-height: 1.33;
            border-radius: 25px;
        }

        .btn-circle.btn-xl {
            width: 70px;
            height: 70px;
            padding: 10px 16px;
            font-size: 24px;
            line-height: 1.33;
            border-radius: 35px;
        }

    .highlight {
        background-color: darkgrey;
    }

    .Selected {
        background-color: orange;
    }
</style>

<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

        <div id="ExamModal" class="modal fade" role="dialog">

            <div class="modal-dialog" role="document">

                <div class="modal-content" style="height: 500px;">

                    <%--   <div class="modal-header"></div>--%>
                    <div class="modal-body" style="height: 100%;">
                        <div runat="server" class="row" style="height: 100%;">
                            <div class="col-md-4" style="border-right-style: groove; height: 100%;">
                                <div class="list-group" id="MenuSelect">
                                    <button type="button" data-toggle="tab" data-target="#NewExamPane" class="list-group-item">New</button>
                                    <button type="button" data-toggle="tab" class="list-group-item" data-target="#OpenExistingPane">Open</button>
                                    <button type="button" class="list-group-item">Online</button>
                                    <button type="button" class="list-group-item">Co-Create</button>

                                </div>


                                <fieldset>
                                    <legend title="Filter" class="pull-left text-left">Subjects</legend>

                                    <%--<dx:ASPxListBox ID="ASPxListBox2" runat="server" AutoPostBack="true" Caption="Please Select:" OnSelectedIndexChanged="ASPxListBox2_SelectedIndexChanged" DataSourceID="SubjectsDataSource" SelectionMode="CheckColumn" TextField="sbjct_title" EnableTheming="True" Theme="Metropolis">
                                        <CaptionSettings Position="Top" />

                                        <%--  <ClientSideEvents SelectedIndexChanged="function(s, e) {
	
                                       ASPxListBox1.PerformCallback('1');
                                            
                                            }" />--%>
                                    <%--</dx:ASPxListBox>--%>

                                    <%--   <asp:ListBox ID="ListBox1" CssClass="pull-left" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ASPxListBox2_SelectedIndexChanged" DataSourceID="SubjectsDataSource" DataValueField="sbjct_title" SelectionMode="Multiple">
                                                          
                                                       </asp:ListBox>--%>
                                </fieldset>


                                <input type="hidden" id="label3" class="lb3" runat="server" value="2" />

                            </div>

                            <div class="col-md-7" style="height: 100%;">

                                <div class="tab-content" style="position: relative; min-height: 90%;">

                                    <div id="NewExamPane" class="tab-pane active fade in">

                                        <asp:Panel ID="Panel1" runat="server">

                                            <table class="table table-hover Selectiontable" id="SelTable">


                                                <tr>

                                                    <td>
                                                        <p class="text-left text-muted">Exam Template</p>
                                                    </td>

                                                </tr>

                                                <tr>

                                                    <td>
                                                        <p class="text-left text-muted">Quiz</p>
                                                    </td>

                                                </tr>

                                            </table>

                                        </asp:Panel>

                                        <div class="container" style="position: absolute; bottom: 5px; max-width:380px;">

                                            <table class="table pull-left left">

                                                <tr>
                                                    <td>File Name:</td>
                                                    <td>
                                                        <input runat="server" type="text" id="mel" class="pull-left melli" />

                                                    </td>

                                                </tr>

                                                <tr>
                                                    <td>Sections:</td>
                                                    <td>

                                                        <select class="pull-left" runat="server" id="SectionSelection" style="width: auto;">
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                        </select>

                                                    </td>

                                                </tr>


                                            </table>



                                        </div>

                                    </div>


                                    <div id="OpenExistingPane" class="tab-pane fade">
                                        Pane for Opening Exsiting

                                                              <asp:UpdatePanel runat="server">
                                                                  <ContentTemplate>

                                                                      <%--<dx:ASPxListBox ID="ASPxListBox1" CssClass="selbox" runat="server" Theme="Metropolis" OnCallback="Exams_Callback" Height="400px">
                                                                          <Columns>
                                                                              <dx:ListBoxColumn FieldName="Exam" Caption="Name" />
                                                                              <dx:ListBoxColumn FieldName="Exam_Code" Caption="Code" />
                                                                              <dx:ListBoxColumn FieldName="DateCreated" Caption="Date Created" />
                                                                          </Columns>
                                                                          <ItemStyle>
                                                                              <Border BorderStyle="None" />
                                                                              <BorderLeft BorderStyle="None" />
                                                                              <BorderRight BorderStyle="None" />
                                                                          </ItemStyle>
                                                                          <ClientSideEvents SelectedIndexChanged="function(s, e) {
	
                                        var selected = s.GetSelectedItem().text.split(';');

                                            $('.lb2').val(selected[1]);
                                            
                                            }" />
                                                                          <Border BorderStyle="None" />
                                                                      </dx:ASPxListBox>--%>


                                                                      <input type="hidden" id="Label2" class="lb2 pull-left" runat="server" />

                                                                  </ContentTemplate>
                                                              </asp:UpdatePanel>


                                    </div>

                                </div>




                                <div class="row col-md-push-2" style="position: absolute; width: 100%; bottom: -8%;">
                                    <div class="col-md-7">
                                    </div>
                                    <div class="col-md-5">

                                        <button type="button" runat="server" onserverclick="Unnamed_ServerClick" class="btn btn-circle btn-info btn-lg"><i class="glyphicon glyphicon-ok"></i></button>
                                        &nbsp 
                                 <button type="button" class="btn btn-circle btn-danger btn-lg"><i class="glyphicon glyphicon-remove"></i></button>

                                    </div>

                                </div>
                            </div>

                            <div class="col-md-6">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </ContentTemplate>
</asp:UpdatePanel>


<asp:UpdatePanel runat="server">
    <ContentTemplate>

        <asp:Label ID="Label1" CssClass="lb" runat="server"></asp:Label>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Cosmo_School_TechnologyConnectionString %>" SelectCommand="SELECT [Exam], [Exam_Code], [DateCreated] FROM [ExamsView]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SubjectsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Cosmo_School_TechnologyConnectionString %>" SelectCommand="SELECT [sbjct_title] FROM [Subjects]"></asp:SqlDataSource>

    </ContentTemplate>
</asp:UpdatePanel>
