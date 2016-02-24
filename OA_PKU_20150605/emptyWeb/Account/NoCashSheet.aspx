<%@ Page Language="C#" StyleSheetTheme="personal" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="NoCashSheet.aspx.cs" Inherits="Account_NoCashSheet" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">历史表单列表</div><br /><br />

        <table class="firstTable">
            <tr class="tableHead">
                <td>序号</td>
                <td>申请类型</td>
                <td>申请人</td>
                <td>申请日期</td>                
            </tr>
            <asp:Literal ID="UserRowsTemp" runat="server" />
        </table>

</asp:Content>