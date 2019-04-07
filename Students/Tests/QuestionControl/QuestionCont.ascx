<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuestionCont.ascx.cs" Inherits="Students_Tests_QuestionControl_QuestionCont" %>
<%--<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>--%>


<link href="../../../Content/bootstrap.css" rel="stylesheet"/>
<link href="../../Content/bootstrap.min.css" rel="stylesheet"/>
<link href="../../Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../../Content/bootstrap-datetimepicker.css" rel="stylesheet" />

   
    <%--BootStrap and JQuery Links--%>
    <script src="../../Scripts/jquery-3.1.0.intellisense.js"></script>
 <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>--%>
    <script src="../../Scripts/jquery-3.1.0.js"></script>
    <script src="../../Scripts/jquery-3.1.0.min.js"></script>
    <script src="../../Scripts/bootstrap.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../../Scripts/jquery.min.js"></script>
    <script src="../../Scripts/moment.js"></script>
    <script src="../../Scripts/bootstrap-datetimepicker.min.js"></script>


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
    
    <div class="col-md-7">
    
    <label class="text-muted question" runat="server" id="QuestionContent"></label> 
    

        <asp:Image  class="Qsimage" runat="server" id="QuestImage"  />

        <%--<dx:ASPxRadioButtonList Theme="BlackGlass" ID="ObjectivesRadio"  runat="server" ValueType="System.String"></dx:ASPxRadioButtonList>--%>

        <br />
  
        <textarea ID="StructureBox" placeholder="Answer The Above Question here." cols="80" rows="3" runat="server"  Width="100%" Theme="Metropolis"></textarea>
       
         <br />
        <br />
         </div>

    <div class="col-md-3"></div>
</div>
        

  
   


