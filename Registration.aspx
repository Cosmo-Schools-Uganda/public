<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title></title>

    <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>--%>
    <%--BootStrap and JQuery Links--%>

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />


    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                            ControlToValidate="EmailBox" ErrorMessage="Please Enter your Email ID"
                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid Email"></asp:RegularExpressionValidator>--%>
    <script src="Scripts/jquery-3.1.0.intellisense.js"></script>
    <script src="Scripts/jquery-3.1.0.js"></script>
    <script src="Scripts/jquery-3.1.0.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.min.js"></script>


    <script>
        function previewFile() {
            var preview = document.querySelector('#<%=Avatar.ClientID %>');
            var file = document.querySelector('#<%=ProfilePictureUpload.ClientID %>').files[0];
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
    </script>

</asp:Content>

<asp:Content ID="JumbHeader" runat="server" ContentPlaceHolderID="JumbHeader">User Registration</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


    <form runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         

                <div class="container">
                     <asp:UpdatePanel runat="server">

            <ContentTemplate>
                    <div class="alert alert-warning fade in" role="alert" runat="server" id="AlertContainer" visible="false">
                        <strong runat="server" id="AlertMessage">This is where you'll see the message pop up</strong>

                    </div>
                   
                  </ContentTemplate>
                         </asp:UpdatePanel>

                     <p class="text-info"><em>Please Fill in the following fields</em></p>

                    <div class="well">

                        <h3 class="page-header">1.User Information</h3>

                        <div class="form-group row">

                            <div class="col-md-4">

                                <label class="control-label">First Name</label>
                                <input type="text" class="form-control" id="FirstNameBox" runat="server" placeholder="e.g Steven" />
                            </div>

                            <div class="col-md-4">
                                <label class="control-label">Last Name</label>
                                <input type="text" class="form-control" id="LastNameBox" runat="server" placeholder="e.g Katabalwa" />

                            </div>

                            <div class="col-md-4">

                                <label class="control-label">Middle Name</label>
                                <input type="text" class="form-control" id="MiddleNameBox" runat="server" placeholder="e.g Stek" />
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12"></div>
                        </div>




                        <div class="form-group row">

                            <div class="col-md-4">
                                <label class="control-label">User Name</label>
                                <input type="text" class="form-control" id="UserNameBox" runat="server" placeholder="e.g Mawaazo" />

                                <hr />
                                <div class="row" style="margin-top: 10px;">

                                    <div class="col-md-12 form-group">

                                        <label class="control-label" for="EmailBox">Email</label>
                                        <input type="text" class="form-control" id="EmailBox" runat="server" placeholder="Enter email" />

                                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                            ControlToValidate="EmailBox" ErrorMessage="Please Enter your Email ID"
                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid Email"></asp:RegularExpressionValidator>--%>
                                    </div>
                                </div>

                                <div class="row" style="margin-top: 10px;">

                                    <div class="col-md-12 form-group">

                                        <label class="control-label">Password</label>
                                        <input type="password" id="PasswordBox" runat="server" class="form-control" />

                                    </div>

                                    <div class="col-md-12 form-group">

                                        <label class="control-label">Repeat Password</label>
                                        <input type="password" id="RptPasswordBox" runat="server" class="form-control" />

                                    </div>


                                </div>



                            </div>
                          
                              <div class="col-md-4">

                                <label class="control-label">Profile Picture</label>

                                <br />


                                <asp:Image ID="Avatar" runat="server" Height="200px" ImageUrl="~/Images/Users/Unknown-person2.gif" Width="225px" />


                                <asp:FileUpload ID="ProfilePictureUpload" type="file" name="file" onchange="previewFile()" runat="server" />

                                <div class="input-group-btn">
                                    <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
                                        Load From <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li role="presentation"><a href="#" role="menuitem">Web Camera</a></li>
                                        <li role="presentation"><a id="OpenFileAnchor" role="menuitem" runat="server" data-toggle="modal" data-target="#FileBrowser">Folder</a></li>

                                    </ul>


                                    <div class="modal fade" role="dialog" id="FileBrowser">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Modal Header</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div>


                                                        <p>BROWSE</p>
                                                        <span>
                                                            <asp:FileUpload ID="FileUpload1"
                                                                runat="server"></asp:FileUpload></span>

                                                        <br />
                                                        <br />

                                                        <asp:Button ID="UploadButton"
                                                            Text="Upload file"
                                                            runat="server"></asp:Button>

                                                        <hr />

                                                        <asp:Label ID="UploadStatusLabel"
                                                            runat="server">
                                                        </asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>

                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-4 form-group">

                                <label class="control-label">Gender</label>


                                <asp:DropDownList runat="server" ID="GenderSelectionBox" CssClass="btn btn-default form-control">
                                    <asp:ListItem Text="Male"></asp:ListItem>
                                    <asp:ListItem Text="Female"></asp:ListItem>
                                </asp:DropDownList>

                            </div>

                            <div class='col-md-4'>
                                <label class="control-label">Birth Day</label>
                                <span class="glyphicon glyphicon-calendar"></span>
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker1'>

                                        <dx:ASPxDateEdit ID="BirthDaySelection" CssClass="form-control" runat="server" EnableTheming="True" Theme="Metropolis">
                                        </dx:ASPxDateEdit>
                                    </div>


                                </div>

                            </div>

                            <div class="col-md-4">
                                <label class="control-label">Nationality</label>
                                <asp:DropDownList runat="server" CssClass="btn-sm form-control" ID="CountrySelectBtn" DataSourceID="RegistrationDataSource" DataTextField="Geo_Name" DataValueField="Geo_Name">
                                </asp:DropDownList>

                             
                                <asp:SqlDataSource ID="RegistrationDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Cosmo_School_TechnologyConnectionString %>" SelectCommand="SELECT [Geo_Name], [Geo_Area_id] FROM [GeographyArea] WHERE ([Geo_level] = @Geo_level)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="Geo_level" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                             
                            </div>
                        </div>

                    </div>

                    <div class="well">

                        <h3 class="page-header">2. Address</h3>
                        <div class="row">
                            <div class="col-md-4">
                                <label class="control-label">Phone</label>
                                <input type='text' runat="server" id="PhoneNumberBox" class="form-control" />
                            </div>

                            <div class="col-md-4">
                                <label class="control-label">Work</label>
                                <input type='text' runat="server" id="WorkNumberBox" class="form-control" />
                            </div>

                            <div class="col-md-4">
                                <label class="control-label">Home</label>
                                <input type='text' runat="server" id="HomeNumberBox" class="form-control" />
                            </div>

                        </div>
                        <br />
                        
                         <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                       
                             <div class="row">
                            <div class="col-md-4">
                                <label class="control-label">Country</label>
                                <br />
                                <asp:DropDownList runat="server" CssClass="btn-sm" AutoPostBack="true" ID="CountrySelectionDrop" DataSourceID="RegistrationDataSource" DataTextField="Geo_Name" DataValueField="Geo_Area_id" OnSelectedIndexChanged="CountrySelectionDrop_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4">

                                <label class="control-label">City</label>
                                <br />
                                <asp:DropDownList runat="server" CssClass="btn-sm" ID="CityDrop">
                                </asp:DropDownList>

                            </div>

                            <div class="col-md-4">
                                <label class="control-label">Town</label>
                                <br />
                                <asp:DropDownList runat="server" CssClass="btn-sm" ID="DropDownList3">
                                </asp:DropDownList>
                            </div>
                        </div>

                          </ContentTemplate>
                             </asp:UpdatePanel>

                    </div>

                      
                       
                    <div class="container">

                        <div class="checkbox">
                            <input type="checkbox" />
                            <span>
                                <small>I HereBy Accept.......</small>
                            </span>
                        </div>
                    </div>

                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                    <button runat="server" id="SubmitInfo" type="submit" class="btn btn-default pull-right" onserverclick="SubmitInfo_ServerClick">Submit</button>

              
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

           

                      
    </form>
</asp:Content>
