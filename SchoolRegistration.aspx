<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/UserMasterPage.master" EnableEventValidation="false" CodeFile="SchoolRegistration.aspx.cs" Inherits="SchoolRegistration" %>

<%--<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>--%>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title></title>


    <script>

        var i = 0
        var elem;


        function GetCities(CountryID) {

            $('.CityDrop').children().remove();

            $.ajax({

                type: 'POST',
                url: 'CosmoService.asmx/GetCities',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({CountryID:CountryID}),
                dataType: 'json',
                success: function (data) {

                    console.log(data);

                    for (i = 0; i < data.d.length; i++) {

                        $('.CityDrop').append('<option value=' + data.d[i].ID + '>' + data.d[i].Name + '</option>')


                    }

                },

                error: function (result) {

                    console.log(result.error);

                }
            });
        }

        function GetCountries() {
            $.ajax({

                type: 'POST',
                url: 'CosmoService.asmx/GetCountries',
                contentType: 'application/json; charset=utf-8',
                data: {},
                dataType: 'json',
                success: function (data) {

                    console.log(data);

                    for (i = 0; i < data.d.length; i++) {

                        $('.CountryDrop').append('<option value=' + data.d[i].ID + '>' + data.d[i].Name + '</option>')


                    }

                },

                error: function (result) {

                    console.log(result.error);

                }
            });
        }

        function GetAffiliations(category, element) {

            $.ajax({

                type: 'POST',
                url: 'CosmoService.asmx/GetAffiliations',
                contentType: 'application/json; charset=utf-8',
                 data: JSON.stringify({ Category: category }),
                dataType: 'json',
                success: function (data) {

                    console.log(data);

                    for (i = 0; i < data.d.length; i++) {

                        element.append('<option value='+data.d[i].ID+'>' + data.d[i].Category + '</option>')

                    
                    }

                },

                error: function (result) {

                    console.log(result.error);

                }
            });
        }

        function GetCategories() {

            $.ajax({

                type: 'POST',
                url: 'CosmoService.asmx/GetStructures',
                contentType: 'application/json; charset=utf-8',
                //data: {},
                dataType: 'json',
                success: function (data) {
                    try{

                        $('.Categories').children().remove();

                        for (i = 0; i <= data.d.length; i++) {

                            console.log(data);

                            $('.Categories').append('<option value='+data.d[i].CategoryId+' >' + data.d[i].SchoolDenomination + ' [' + data.d[i].SchoolCategory + ']' + '</option>');;


                        }

                    }

                    catch(ex){


                    }
                },

                error: function (result) {

                    console.log(result.error);
                }
            });



        }


        function previewFile() {
          

            var preview = document.querySelector('#<%=Logo.ClientID %>');
            var file = document.querySelector('#<%=LogoUpload.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }

        $(document).ready(function () {



            //GetCategories();


            elem = $('.ReligionDrop');
            //GetAffiliations("Religion",elem);




            elem = $('.GenderDrop')
           // GetAffiliations("School Genders",elem);


           // GetCountries();


            //$('.CountryDrop').change(function () {

            // //   GetCities($('.CountryDrop').val());

               

            //});

            $('.Categories').change(function () {

                console.log($('.Categories').val());

            });


        });
    </script>

</asp:Content>



<asp:Content ID="PageHeader" ContentPlaceHolderID="JumbHeader" runat="server"></asp:Content>

<asp:Content ID="body" runat="server" ContentPlaceHolderID="body">

    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>

        <div class="container">
   
        
  
            <div class="panel">
                <div class="panel-heading">
                    <h2>School Biography</h2>
                </div>

                <div class="panel-body">
                 
                    <div class="form-group row">
                 
                             <asp:UpdatePanel ID="Mith" runat="server">
                                <ContentTemplate>
                               <div class="col-md-8">
                  

            <div class="row">
                                <div class="col-md-3">
                                    <p>Category</p>


                                    <asp:DropDownList ID="SchoolCategoriesCombo" runat="server" Theme="MetropolisBlue" CssClass="Categories form-control">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SchoolCategories" runat="server" ConnectionString="<%$ ConnectionStrings:Cosmo_School_TechnologyConnectionString %>" SelectCommand="SELECT * FROM [School_Categories_View]"></asp:SqlDataSource>

                                </div>

                            </div>

                            <br />
                            
   
                            <div class="form-group row">


                                <div class="col-md-5 control-label">
                                    <p>Name:</p>
                                    
                                    <input type="text"  onkeydown="return (event.keyCode!=13);" id="SchoolName" class="form-control" runat="server" />

                                </div>

                                <div class="col-md-4">
                                </div>

                            </div>
                      
                            <br />

                            <br />

                            <div class="row">
                                  <div class="col-md-2">
                                    <p>Reg No:</p>

                                    <asp:TextBox onkeydown="return (event.keyCode!=13);" ID="RegistrationNumberBox" CssClass="list-group-item-text form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>

                            <br />
                            <br />

                            <div class="row">

                                <div class="col-md-5">

                                    <p>Motto</p>
                                    <input type="text"  onkeydown="return (event.keyCode!=13);" placeholder=" If Any" class="form-control"  id="SchoolMotto" runat="server" />
                                    
                                </div>
                            </div>

                        </div>
                           </ContentTemplate>
                            </asp:UpdatePanel>
                       
               <div class="col-md-4 col-md-pull-3">
                         
                            <p>School Logo</p>

                            <asp:Image ID="Logo" ImageUrl="~/Schools/image-unavailable.png" CssClass="img-responsive" Width="100" Height="100" runat="server" />

                            <br />
                            
                           
                           <asp:FileUpload BackColor="WhiteSmoke" ForeColor="YellowGreen" id="LogoUpload" runat="server" onchange="previewFile()" Visible="True">
                               
                           </asp:FileUpload>
                          
                        </div>


                    </div>

                    <br />

                    <br />
                    <hr />

                    <h4>Affiliations</h4>

                    <div class="row">
                        <div class="col-md-3">
                            <p>Religion</p>


                            <asp:DropDownList ID="ReligionDrop" runat="server" Theme="MetropolisBlue" CssClass="ReligionDrop form-control">
                            </asp:DropDownList>



                            <asp:SqlDataSource ID="ReligionData" runat="server" ConnectionString="<%$ ConnectionStrings:Cosmo_School_TechnologyConnectionString %>" SelectCommand="SELECT [Category], [Id] FROM [List_Types] WHERE ([Parent_id] = @Parent_id)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="10" Name="Parent_id" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>

                        <div class="col-md-3">
                            <p>Gender</p>

                            <asp:DropDownList ID="GenderDrop" runat="server" Theme="MetropolisBlue" CssClass="GenderDrop form-control">
                            </asp:DropDownList>


                            <asp:SqlDataSource ID="GenderSource" runat="server" ConnectionString="<%$ ConnectionStrings:Cosmo_School_TechnologyConnectionString %>" SelectCommand="SELECT [Category], [Id] FROM [List_Types] WHERE ([Parent_id] = @Parent_id)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="19" Name="Parent_id" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>


                        </div>
                    </div>

                </div>
            </div>

           
            <br />



            <asp:UpdatePanel runat="server" ID="MyOtherUpdate">
                <ContentTemplate>

              
            <div class="panel">


                <h2 class="panel-heading">Address</h2>

                <div class="panel-body">

                    <div class="row">


                        <div class="col-md-3">
                            <p>Country:</p>

                             <asp:DropDownList ID="CountryDrop" runat="server" Theme="MetropolisBlue" CssClass="CountryDrop form-control" OnSelectedIndexChanged="CountryDrop_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                            </div>

                        <div class="col-md-3">
                            <p>City:</p>

                              <asp:DropDownList ID="CityDrop" runat="server" Theme="MetropolisBlue" CssClass="CityDrop form-control">
                            </asp:DropDownList>


                        </div>

                        <div class="col-md-3">

                            <p>Town:</p>
                            <asp:TextBox onkeydown="return (event.keyCode!=13);" ID="TownBox"  CssClass="list-group-item-text form-control" runat="server"></asp:TextBox >
                        </div>
                    </div>

                    <br />

                    <div class="row">

                        <div class="col-md-3">
                            <p>Phone:</p>
                            <asp:TextBox onkeydown="return (event.keyCode!=13);" ID="PhoneNumberBox1" runat="server" CssClass="list-group-item-text form-control"></asp:TextBox>

                        </div>

                        <div class="col-md-3">
                            <p>Work:</p>
                            <asp:TextBox onkeydown="return (event.keyCode!=13);" ID="PhoneNumberBox2" CssClass="list-group-item-text form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="col-md-3">

                            <p>Fax:</p>
                            <asp:TextBox onkeydown="return (event.keyCode!=13);" ID="FaxBox" CssClass="list-group-item-text form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <br />

                    <h4 class="panel-heading">Mailing & Social Networks</h4>

                    <div class="row">

                        <div class="col-md-3">

                            <p>Primary Mail:</p>
                            <asp:TextBox onkeydown="return (event.keyCode!=13);" ID="MailBox1" CssClass="list-group-item-text form-control" runat="server"></asp:TextBox>

                        </div>

                        <div class="col-md-3">


                            <p>Secondary mail:</p>
                            <asp:TextBox onkeydown="return (event.keyCode!=13);" ID="MailBox2" CssClass="list-group-item-text form-control" runat="server"></asp:TextBox>

                        </div>


                    </div>



                    <br />

                    <div class="row">

                        <div class="col-md-8">
                            <p>School Website</p>
                            <input type="text"  onkeydown="return (event.keyCode!=13);" id="WebBox" runat="server" style="min-width: 400px;" class="form-control" placeholder=" e.g www.cosmoschool.ug" />
                        </div>



                    </div>

                    <br />
                    <br />
                    <div class="row">


                        <div class="col-md-3">
                            <div class="input-group">
                                <span class="input-group-addon btn btn-facebook"><span class="fa fa-facebook fa-facebook-f"></span></span>
                                <input type="text" onkeydown="return (event.keyCode!=13);" class="form-control" placeholder="Input FaceBook Url Here" />
                            </div>
                            <br />
                        </div>
                        <div class="col-md-3">
                            <div class="input-group">
                                <span class="input-group-addon btn btn-twitter"><span class="fa fa-twitter"></span></span>
                                <input type="text" onkeydown="return (event.keyCode!=13);" class="form-control" placeholder="Input Twitter Url Here" />
                            </div>



                        </div>

                    </div>
                </div>
            </div>

                      </ContentTemplate>
            </asp:UpdatePanel>


               <div>

                   <asp:Button CssClass="btn btn-info pull-right" ID="RegisterBtn" runat="server" Text="Register" OnClick="RegisterBtn_Click" />
            
            </div>

        
           
         

        </div>
            
              

   

</asp:Content>
