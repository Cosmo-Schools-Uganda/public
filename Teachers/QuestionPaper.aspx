<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="QuestionPaper.aspx.cs" Inherits="Teachers_QuestionPaper" %>

<%--<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>--%>

<%@ Register Src="~/Teachers/QuestionControl/QuestionCont.ascx" TagName="QuestionControl" TagPrefix="CustomControl" %>

<%@ Register Src="~/Teachers/ExamModal.ascx" TagName="ExamModal" TagPrefix="CustomControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" href="QuestionBank/QBStyles.css" type="text/css" />


    <style>
        .overall{
            position:relative;
            height:100%;
          
        }

        .col-generator{

            position:relative;
            height:500px;
        }

        .backg {
            position: absolute;
            z-index: 0;
            display: block;
            min-height: 50%;
            min-width: 50%;
            top: 25%;
        }

        .backgtxt {
            color: lightgrey;
            font-size: 180px;
            transform: rotate(300deg);
            opacity: 0.5;
        }

         .affix
    {
          
             top:10%;
            max-height:400px;
            max-width:755px;

    }

         .paperheaderaffixed{

            z-index:10;
            
            min-width:50%;
            
            

         }

       
        

    </style>
    
    <%--<script src="../Scripts/bootstrap.js"></script>--%>

    <script>


        $(document).ready(function () {

            $('.paperheader').on('affixed.bs.affix', function () {

                $(this).addClass('paperheaderaffixed');
               
            });

          

        });
    </script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbHeader" runat="Server">
</asp:Content>

<asp:Content ID="Home" ContentPlaceHolderID="HomeLink" runat="server"><a href="Teachers_Home_Default.aspx">Home</a></asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">


        <asp:ScriptManagerProxy ID="ScriptManager1" runat="server"></asp:ScriptManagerProxy>

        <div class="container-fluid overall">

            <div class="col-md-6 ">

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                       <div class="row paperheader">
                          <div class="col-md-6">

                              <h3 class="text-left" ><span>Paper: </span><a href="PaperProperties.aspx" style="text-decoration:none"><span class="text-info"  id="PaperHeader" runat="server"></span></a></h3>                            
                           
                          </div>
                           
                            <div class="col-md-6">
                                <h3 class="text-muted text-right">Preview Pane</h3>
                                     <br /> 
                            <br />
                          
                            </div>
                        
                           </div>
                      
                        <div class="container-fluid " runat="server" id="QuestionPanel">
                         
                          

                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="col-md-6 col-generator"  >

                <div class="tab-content"style=" width:100%; height:100%;"  data-spy="affi" data-offset-top="200">
                    
                     <QuestionBanker:questionbank runat="server" ID="MyBank" />
                    
                 <CustomControl:ExamModal runat="server" ID="ExamModal"/> 
                </div>


            </div>

        </div>



</asp:Content>
