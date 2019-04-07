<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Recovery.aspx.cs" Inherits="Recovery" %>

<asp:Content runat="server" ContentPlaceHolderID="JumbHeader" ID="Header">Account <small>Recovery</small></asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="body" ID="Body">


    <p class="text-center">As <b>Cosmo Schools Inc.</b> We try as much as we can to secure your information on this platform. Restricted access is a priority to our Clients. Please Enter Your E-mail here to receive the reset Code for your account.</p>

    <form runat="server">
        <p class="text-center text-primary" style="margin-top:10%;"><span><asp:TextBox ID="EmailBox" PlaceHolder=" Email" runat="server" Width="20%" Height="4%" Wrap="True"></asp:TextBox></span></p>
        <br />

        <p id="ErrorMessage" class="text-center text-primary" runat="server" visible="false">Please Enter a Valid Mail Account</p>

        <asp:Button ID="Continue" CssClass="center-block btn-lg" runat="server" Text="CONTINUE" Width="10%" OnClick="Continue_Click" />
  
        
          </form>

</asp:Content>
