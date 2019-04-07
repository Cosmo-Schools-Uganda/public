<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/UserMasterPage.master" CodeFile="PasswordModifier.aspx.cs" Inherits="PasswordModifier" %>

<asp:Content runat="server" ID="Header" ContentPlaceHolderID="JumbHeader"></asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="head" ID="head"></asp:Content>

<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<body>
    
   <h4 class="text-justify">&nbsp <b>Change Your Password !</b></h4>

    <div class="row" style="min-height:80%;">
        <div class="col-md-7">

        </div>
        <div class="col-md-5 well">
            <div class="col-md-4">
                <div class="row">
                    Password: 
                </div>
                
                <br />
                
                <div class="row">

                    Repeat Password:
                
                </div>
           
                 </div>

            <div class="col-md-8">

                <div class="row">

                    <asp:TextBox ID="PasswordBox" runat="server" TextMode="Password"></asp:TextBox>

                </div>

                <br />

                <div class="row">

                     <asp:TextBox ID="RptPasswordBox" runat="server" TextMode="Password"></asp:TextBox>
                 
                </div>

            </div>
  
        </div>

    </div>

     <asp:Button ID="SaveBtn" style="position:absolute;right:10px; bottom:10px;" runat="server" Text="Save" CssClass="btn btn-lg" />

</body>
</html>
</asp:Content>
