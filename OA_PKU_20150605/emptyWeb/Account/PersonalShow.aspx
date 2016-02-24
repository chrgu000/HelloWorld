<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="PersonalShow.aspx.cs" Inherits="Account_PersonalShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">
            <asp:Literal ID="titleHeader" runat="server" />
        </div><br /><br />

        <table class="firstTable">            
            <asp:Literal ID="UserRowsTemp" runat="server" />
        </table>

</asp:Content>
