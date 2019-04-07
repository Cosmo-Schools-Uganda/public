<%@ Page Language="C#" MasterPageFile="~/Teachers/Teachers.master" AutoEventWireup="true" CodeFile="PaperProperties.aspx.cs" Inherits="Teachers_PaperProperties" %>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbHeader" runat="Server">
</asp:Content>

 
    <asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
           <form id="form1" runat="server">
    <div>
     <h3 class="text-left" ><span>Paper: </span><a href="PaperProperties.aspx" style="text-decoration:none"><span class="text-info"  id="PaperHeader" runat="server"></span></a></h3>                            
    </div>
    </form>
        </asp:Content>
