<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="YearlyBudgetShow.aspx.cs" Inherits="Finance_YearlyBudgetShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">        
        <div class="cashHead">年度概算表</div>        
        <table class="firstTable">            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Literal ID="yearlyBudgetRowsTemp" runat="server" />     
                </ContentTemplate>            
            </asp:UpdatePanel> 
            
        </table>
    </div>
</asp:Content>
