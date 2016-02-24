<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="CashFlowStatistics.aspx.cs" Inherits="Finance_CashFlowStatistics" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">        
        <div class="cashHead">收支一览表</div>
        <div><asp:LinkButton ID="linkExport" Text="导出" runat="server" OnClick="linkExport_Click"/></div>
        <table class="cashTable">
            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Literal ID="CashFlowRowsTemp" runat="server" />     
                </ContentTemplate>            
            </asp:UpdatePanel> 
            
        </table>
    </div>
</asp:Content>
