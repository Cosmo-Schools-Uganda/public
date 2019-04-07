<%@ Page Title="" Language="C#" MasterPageFile="~/Students/Tests/Tests.master" AutoEventWireup="true" CodeFile="QuestionPaper.aspx.cs" Inherits="Students_Tests_QuestionPaper" %>

<%--<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>--%>

<%@ Register Src="~/Students/Tests/QuestionControl/QuestionCont.ascx" TagName="QuestionControl" TagPrefix="CustomControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script runat="server">

</script>
<script type="text/javascript">
    // <![CDATA[
    function PrepareTimeValue(value) {
        if (value < 10)
            value = "0" + value;
        return value;
    }
    function UpdateTime(s, e) {
        var dateTime = new Date();
        var timeString = PrepareTimeValue(dateTime.getHours()) + ":" + PrepareTimeValue(dateTime.getMinutes()) + ":" +
            PrepareTimeValue(dateTime.getSeconds());
        timeLabel.SetText(timeString);
       
 
    }

    function UpdateRemainingTime(s, e) {
        var RemainingTimeString = PrepareTimeValue(dateTime.getHours()) + ":" + PrepareTimeValue(dateTime.getMinutes()) + ":" +
            PrepareTimeValue(dateTime.getSeconds());
        
        
       
    }

    //$('#section').affix({

    //    offset: {

    //        top:5
        
        
    //    }
    //});

    // ]]> 
</script>


    <style>

        .affix
        {

            /*position:relative;*/
            top:10%;

        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PaperHeader" Runat="Server">

    <h1 class="text-center">Gombe Senior Secondary School</h1>

    <p class="text-center">MATH P203</p>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    
    <section class="container-fluid">
       
        <div class="row">
            <div class="col-md-2">

            <%--<dx:ASPxTimer runat="server" ID="RemainingTimer" ClientInstanceName="remainingtimer" Interval="1000">
                <ClientSideEvents Init="UpdateRemainingTime" Tick="UpdateRemainingTime" />
            </dx:ASPxTimer>   
       <dx:ASPxTimer runat="server" ID="ASPxTimer1" ClientInstanceName="timer" Interval="1000">
                <ClientSideEvents Init="UpdateTime" Tick="UpdateTime" />
            </dx:ASPxTimer>
            <div class="timeContainer">
                <dx:ASPxLabel runat="server" ID="ASPxLabel1" ClientInstanceName="timeLabel2" Font-Bold="true"
                    Font-Size="X-Large">
                </dx:ASPxLabel>--%>
            </div>
            
  
            </div>
             <div class="col-md-8">
               
      
            </div>

            <div class="col-md-2">

                <div data-spy="affix" data-offset-top="190">
                    <h2><span class="glyphicon glyphicon-time"></span> Time</h2>

           <%-- <dx:ASPxTimer runat="server" ID="Timer" ClientInstanceName="timer" Interval="1000">
                <ClientSideEvents Init="UpdateTime" Tick="UpdateTime" />
            </dx:ASPxTimer>
            <div class="timeContainer">
                <dx:ASPxLabel runat="server" ID="TimeLabel" ClientInstanceName="timeLabel" Font-Bold="true"
                    Font-Size="X-Large">
                </dx:ASPxLabel>
            </div>
            <div class="dateContainer">
                <dx:ASPxLabel runat="server" ID="DateLabel" ClientInstanceName="dateLabel" Font-Size="14px">
                </dx:ASPxLabel>--%>
            </div>
                  <%--  <br />
                    <ul class="list-group">
                        <li class="list-group-item">
                            <h1>Start: </h1>
                        </li>
                         <li class="list-group-item">
                            <h1>End: </h1>
                        </li>
                    </ul>

                    </div>--%>

            </div>
            
        </div>
              
        <div class="row">
            <div class="col-md-2"></div>
        
            <div class="col-md-8" id="QuestionPanel" runat="server">

       
                
        </div>
        
            <div class="col-md-2">
            
        
</div>

    </div>
        </section>
</asp:Content>

