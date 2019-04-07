<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FeedBack.aspx.cs" Inherits="FeedBack" %>

<asp:Content runat="server" ContentPlaceHolderID="JumbHeader" ID="Header">Account <small>Recovery</small></asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="body" ID="Body">


    <h3 class="text-center"><b>A Reset Code has been sent to Your Email. Please Check Your Email and Use this reset Code to change your Password. </b></h3>

    <form runat="server">
       <asp:Button ID="Continue" CssClass="center-block btn-lg" runat="server" Text="CONTINUE" Width="10%" OnClick="Continue_Click" />
  </form>

</asp:Content>
