<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/UserMasterPage.master" EnableEventValidation="false" CodeFile="StudentRegistration.aspx.cs" Inherits="StudentRegistration" %>

<%--<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>--%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title></title>


    <script>

        //$(function () {
        //    var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "PrimaryPane";
        //    $('#Tabs a[href="#' + tabName + '"]').tab('show');
        //    $("#Tabs a").click(function () {
        //        $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
        //    });
        //});

        var SchoolId;

        function GetSchools(Category) {

            $('.SchoolsDrop').children().remove();
            $('.SchoolsDrop2').children().remove();
            var count = 0;

            $.ajax({
                type: 'POST',
                url: 'StudentRegistration.aspx/GetSchools',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ Category: Category }),
                dataType: 'json',
                success: function (data) {

                    for (count = 0; count <= data.d.length; count++) {

                        var School = data.d[count];

                        console.log(School);
                        try {
                            $('.SchoolsDrop').append('<option value=' + School.SchoolId + '>' + School.SchoolName + '</option>');
                            $('.SchoolsDrop2').append('<option value=' + School.SchoolId + '>' + School.SchoolName + '</option>');
                        }
                        catch (Ex) {


                        }

                    }

                    GetSchool($('.SchoolsDrop').val(), Category);

                },
                error: function (result) {

                    console.log(result.error);

                }




            });

        }

        function GetSchool(Id, Category) {

            $('.ClassesDrop').children().remove();
            $('.ClassesDrop2').children().remove();

            var count = 0;

            $.ajax({
                type: 'POST',
                url: 'StudentRegistration.aspx/GetSchool',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ SchoolId: Id, Category: Category }),
                dataType: 'json',
                success: function (data) {

                    var School = data.d;

                    $('.BioName').text(School.SchoolName);
                    $('.BioReg').text(School.RegistrationNumber);
                    $('.BioAddr').text(School.Website);
                    $('.BioMotto').text(School.Moto);

                    if (School.LogoString != null) {

                        $('.BioImage').attr("src", "data:image/jpg;base64," + School.LogoString);
                    }
                    else {

                        $('.BioImage').attr("src", "Users/Images/NoImage.png");
                    }

                    // console.log("the source: "+$('.BioImage'))


                    try {

                        for (count = 0; count <= School.ClassInformation.length; count++) {
                            var Class = School.ClassInformation[count];

                            $('.ClassesDrop').append('<option>' + Class.ClassName + '</option>');
                            $('.ClassesDrop2').append('<option>' + Class.ClassName + '</option>');
                        }

                    }

                    catch (Ex) {


                    }
                    console.log(School);





                },
                error: function (result) {

                    console.log(result.error);

                }




            });
        }

        $(document).ready(function () {


            //var SchoolCat = 1;

            //GetSchools(SchoolCat);

            //var SchoolCat = 3;

            //GetSchools(SchoolCat);


            $('#PrimaryLink').on('click', function () {
                {
                    //SchoolCat = 1;
                    //GetSchools(SchoolCat);

                    //SchoolCat = 3;
                    //GetSchools(SchoolCat);


                }

            })


            $('#SecondaryLink').on('click', function () {

                //SchoolCat = 2;

                //GetSchools(SchoolCat);

                //SchoolCat = 4;

                //GetSchools(SchoolCat);


            }
            );


            //$('.SchoolsDrop').change(function () {

            //    $('.ClassesDrop').children().remove();

            //    GetSchool($('.SchoolsDrop').val(), SchoolCat);

            //    console.log("Help me with:" + $('.SchoolsDrop').val());

            //});

            //$('.SchoolsDrop2').change(function () {

            //    $('.ClassesDrop2').children().remove();

            //    GetSchool($('.SchoolsDrop2').val(), SchoolCat);

            //    console.log("Help me with:" + $('.SchoolsDrop2').val());

            //});


        });

    </script>


</asp:Content>

<asp:Content ContentPlaceHolderID="JumbHeader" ID="Header" runat="server"><small>Student Registration</small></asp:Content>

<asp:Content ID="HomeLink" ContentPlaceHolderID="HomeLink" runat="server"><a href="UserPage.aspx">Home</a></asp:Content>

<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">


    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>

    <div class="container">

        <div class="alert alert-warning" id="ErrorAlert" runat="server" visible="false">
            <p><span class="glyphicon glyphicon-warning-sign"></span>&nbsp<span runat="server" id="ErrorMessage"></span></p>
        </div>


        <div id="Tabs" class="tabpanel">

            <ul class="nav nav-tabs nav-justified">
                <li role="presentation" aria-controls="PrimaryPane" class="active"><a id="PrimaryLink" data-toggle="tab" href="#PrimaryPane">Primary</a></li>
                <li role="presentation"><a href="#SecondaryPane" aria-controls="SecondaryPane" id="SecondaryLink" data-toggle="tab">Secondary</a></li>
                <%-- <li role="presentation"><a href="#">University</a></li>--%>
            </ul>

            <br />
            <br />


            <div class="tab-content">

                <div class="tab-pane fade in active" id="PrimaryPane">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-3">

                                            <label runat="server"><b>School:</b></label>

                                        </div>

                                        <asp:UpdatePanel runat="server">
                                            <ContentTemplate>

                                                <div class="col-md-7">
                                                    <asp:DropDownList ID="SchoolsDrop1" CssClass="SchoolsDrop form-control" runat="server" OnSelectedIndexChanged="SchoolsDrop1_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                                                </div>

                                            </ContentTemplate>

                                        </asp:UpdatePanel>



                                    </div>

                                    <br />
                                    <br />


                                    <div class="row">


                                        <div class="col-md-3">

                                            <label runat="server"><b>Class:</b></label>

                                        </div>
                                        <asp:UpdatePanel runat="server">
                                            <ContentTemplate>


                                                <div class="col-md-7">
                                                    <asp:DropDownList ID="ClassesDrop1" CssClass="ClassesDrop" runat="server"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Cosmo_School_TechnologyConnectionString %>"></asp:SqlDataSource>
                                                </div>

                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </div>

                                    <br />
                                    <br />

                                    <div class="row">
                                        <div class="col-md-3">

                                            <label runat="server"><b>Registration Number:</b></label>

                                        </div>
                                        <div class="col-md-7">
                                            <%--<dx:ASPxTextBox onkeydown="return (event.keyCode!=13);" ID="RegistrationNumberBox" runat="server" Width="170px"></dx:ASPxTextBox>--%>
                                        </div>



                                    </div>

                                    <br />
                                    <br />

                                    <div class="row">
                                        <div class="col-md-3">

                                            <label runat="server"><b>Licence No:</b></label>

                                        </div>
                                        <div class="col-md-7">
                                            <small>
                                                <p>XXXX-XXX-XXX</p>
                                            </small>

                                            <%--<dx:ASPxTextBox onkeydown="return (event.keyCode!=13);" ID="LicenceCodeBox" runat="server" Width="170px"></dx:ASPxTextBox>--%>

                                        </div>



                                    </div>

                                </div>
                                <div class="col-md-3">
                                </div>

                            </div>

                        </div>

                        <div class="col-md-4 col-md-pull-2">

                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <img id="BioImage1" style="min-height: 100px; min-width: 100px; max-height: 100px; max-width: 100px;" runat="server" class="BioImage" src="~/Users/Images/NoImage.png" />
                                        </div>

                                        <div class="col-md-8">
                                            <div class="row">
                                                <b>Name: </b><span runat="server" id="BioName1" class="BioName"></span>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <b>Reg No: </b><span runat="server" id="BioReg1" class="BioReg"></span>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <b>Address: </b><span runat="server" id="BioAddr1" class="BioAddr"></span>
                                            </div>



                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-10">
                                            <b>Motto:</b> <span runat="server" id="BioMotto" class="BioMotto"></span>
                                        </div>

                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-6">
                                            <b>More:</b>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-3">
                                            <b>Website:</b>&nbsp<a href="#" runat="server" id="BioWebLink1"><span runat="server" id="BioWebsite1" class="BioWebsite1"></span></a>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>


                    </div>



                </div>
                <div class="tab-pane fade in" id="SecondaryPane">

                    <div class="row">

                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-2">

                                    <label runat="server"><b>School:</b></label>

                                </div>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>


                                        <div class="col-md-7">
                                            <asp:DropDownList ID="SchoolsDrop2" runat="server" AutoPostBack="true" class="SchoolsDrop2" OnSelectedIndexChanged="SchoolsDrop2_SelectedIndexChanged"></asp:DropDownList>

                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                            <br />
                            <br />

                            <div class="row">
                                <div class="col-md-2">

                                    <label runat="server"><b>Class:</b></label>

                                </div>

                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>

                                        <div class="col-md-7">

                                            <asp:DropDownList ID="ClassesDrop2" OnSelectedIndexChanged="ClassesDrop2_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="ClassesDrop2"></asp:DropDownList>

                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="col-md-3">
                                </div>

                            </div>

                            <br />

                            <br />


                            <div class="row">



                                <div class="col-md-3">
                                </div>

                            </div>

                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>

                                    <div class="row" runat="server" id="CombinationRow">
                                        <div class="col-md-2">

                                            <label runat="server"><b>Combination:</b></label>

                                        </div>

                                        <div class="col-md-7">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <small>Subject 1:</small>
                                                </div>

                                                <div class="col-md-6">
                                                    <asp:TextBox onkeydown="return (event.keyCode!=13);" ID="Subject1Box" runat="server" Width="170px"></asp:TextBox>


                                                    <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" ServiceMethod="GetSubjectsOffered(1)" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="false" TargetControlID="Subject1Box" FirstRowSelected="false" runat="server"></ajaxToolkit:AutoCompleteExtender>



                                                </div>

                                            </div>

                                            <br />

                                            <div class="row">
                                                <div class="col-md-3">
                                                    <small>Subject 2:</small>
                                                </div>

                                                <div class="col-md-6">
                                                    <asp:TextBox onkeydown="return (event.keyCode!=13);" ID="Subject2Box" runat="server" Width="170px"></asp:TextBox>
                                                </div>

                                            </div>
                                            <br />
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <small>Subject 3: </small>
                                                </div>

                                                <div class="col-md-6">
                                                    <asp:TextBox onkeydown="return (event.keyCode!=13);" ID="Subject3Box" runat="server" Width="170px"></asp:TextBox>
                                                </div>

                                            </div>
                                            <br />
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <small>Optional:</small>
                                                </div>

                                                <div class="col-md-6">
                                                    <asp:TextBox onkeydown="return (event.keyCode!=13);" ID="Subject4Box" runat="server" Width="170px"></asp:TextBox>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="col-md-3">
                                        </div>

                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <br />
                            <br />

                            <div class="row">
                                <div class="col-md-2">

                                    <label runat="server"><b>Registration Number:</b></label>

                                </div>
                                <div class="col-md-7">
                                    <%--<dx:ASPxTextBox onkeydown="return (event.keyCode!=13);" ID="RegNumberBox" runat="server" Width="170px"></dx:ASPxTextBox>--%>
                                </div>

                                <div class="col-md-3">
                                </div>

                            </div>

                            <br />
                            <br />

                            <div class="row">
                                <div class="col-md-2">

                                    <label runat="server"><b>Licence No:</b></label>

                                </div>
                                <div class="col-md-7">
                                    <small>
                                        <p>XXXX-XXX-XXX</p>
                                    </small>

                                    <input type="text" id="LicenseBox" runat="server" onkeydown="return (event.keyCode!=13);" />

                                </div>

                                <div class="col-md-3">
                                </div>

                            </div>

                        </div>

                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>


                                <div class="col-md-4">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <img id="BioImage2" style="min-height: 100px; min-width: 100px; max-height: 100px; max-width: 100px;" runat="server" class="BioImage img-circle" src="~/Users/Images/NoImage.png" />
                                        </div>

                                        <div class="col-md-8">
                                            <div class="row">
                                                <b>Name: </b><span runat="server" id="BioName2" class="BioName"></span>

                                            </div>
                                            <br />
                                            <div class="row">
                                                <b>Reg No: </b><span runat="server" id="BioReg2" class="BioReg"></span>

                                            </div>
                                            <br />
                                            <div class="row">
                                                <b>Address: </b><span runat="server" id="BioAddr2" class="BioAddr"></span>

                                            </div>



                                        </div>
                                    </div>

                                    <br />

                                    <div class="row">
                                        <div class="col-md-10">
                                            <b>Motto:</b> <span runat="server" id="BioMotto2" class="BioMotto"></span>
                                        </div>

                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-6">
                                            <b>More:</b>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-3">
                                            <b>Website:</b>&nbsp<a href="#" runat="server" id="BioLink2"><span runat="server" id="BioWebsite2" class="BioWebsite1"></span></a>
                                        </div>
                                    </div>

                                </div>


                            </ContentTemplate>
                        </asp:UpdatePanel>



                    </div>

                </div>

            </div>

        </div>

        <br />

        <br />

        <hr />

        <div>

            <asp:Button CssClass="btn btn-info pull-right" ID="RegisterButton2" OnClick="RegisterButton2_Click" runat="server" Text="Register" />


        </div>

    </div>
</asp:Content>

