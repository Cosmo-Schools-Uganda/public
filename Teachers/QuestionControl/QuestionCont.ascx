<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuestionCont.ascx.cs" Inherits="Students_Tests_QuestionControl_QuestionCont" %>
<%--<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>--%>


<link href="//Localhost/CosmoSchools/Content/bootstrap.css" rel="stylesheet"/>
<link href="//Localhost/CosmoSchools/Content/bootstrap.min.css" rel="stylesheet"/>
<link href="//Localhost/CosmoSchools/Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="//Localhost/CosmoSchools/Content/bootstrap-datetimepicker.css" rel="stylesheet" />

   
    <%--BootStrap and JQuery Links--%>
   
    <script src="//Localhost/CosmoSchools/Scripts/jquery-3.1.1.js"></script>
    <script src="//Localhost/CosmoSchools/Scripts/jquery-3.1.1.min.js"></script>
    <script src="//Localhost/CosmoSchools/Scripts/bootstrap.js"></script>
    <script src="//Localhost/CosmoSchools/Scripts/bootstrap.min.js"></script>
    <script src="//Localhost/CosmoSchools/Scripts/jquery.min.js"></script>
    <script src="//Localhost/CosmoSchools/Scripts/moment.js"></script>
    <script src="//Localhost/CosmoSchools/Scripts/bootstrap-datetimepicker.min.js"></script>
   


<script runat="server">

    //public string QuestionContent = "This is my Sample Question?";
    //public int QuestionNumber = 1;
    //public bool ImageIncluded=false;

</script>

<style>

    .Qsimage{

        display:block;
        max-height:200px;
        max-width:inherit;
        

    }

    .question{

        font-size:18px;

    }


</style>


   
<div class="row">
    
    <div class="col-md-11" runat="server" id="MyRow">
    
    <label class="text-muted question" runat="server" id="QuestionContent"></label> 
    
        <h2 style="" runat="server" id="TextHeader" class="text-center text-muted" visible="false" >No Question Display Here !!!</h2>
        
        <asp:Image  class="Qsimage" runat="server" id="QuestImage"  />

        <%--<dx:ASPxRadioButtonList Theme="BlackGlass" ID="ObjectivesRadio"  runat="server" ValueType="System.String"></dx:ASPxRadioButtonList>--%>

        <br />
  
        <textarea ID="StructureBox" placeholder="Answer The Above Question here." cols="80" rows="3" runat="server" style="max-height:150px; max-width:600px;"  Width="100%" Theme="Metropolis"></textarea>
       
        
          <br />
         </div>

    <div class="col-md-1"></div>


  
</div>
        
    
  
   


