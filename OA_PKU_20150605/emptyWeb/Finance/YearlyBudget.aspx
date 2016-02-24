<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="YearlyBudget.aspx.cs" Inherits="Finance_YearlyBudget" %>
<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">年度经费概算表
            <br />年份：<asp:TextBox runat="server" name="year" type="text" id="year_txt" class="Text"></asp:TextBox>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table class="firstTable" id="itemList" runat="server">
                    <tr>
                        <td>项目类型</td>
                        <td>项目子类型</td>
                        <td>概算金额</td>
                    </tr>          
                </table>           
            </ContentTemplate>            
        </asp:UpdatePanel> 
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click"/>
        <asp:Button ID="addRow" text="添加新项" class="noSubmitButton"  runat="server" OnClick="addRow_Click"/>
    </div>
</asp:Content>