<%@ Page Language="C#" StyleSheetTheme="personal" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="ApplyListPage.aspx.cs" Inherits="Account_ApplyListPage" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">待审批项</div><br /><br />

        <table class="firstTable">
            <tr class="tableHead">
                <td>序号</td>
                <td>申请类型</td>
                <td>申请人</td>
                <td>申请日期</td>                
            </tr>
            <asp:Literal ID="UserRowsTemp" runat="server" />
        </table>
        <div class="titlehead">我提交的申请</div>
         <table class="firstTable">
            <tr class="tableHead">
                <td>序号</td>
                <td>申请类型</td>
                <td>申请人</td>
                <td>申请日期</td>
                <td>申请状态</td>
                <td>撤销申请</td>                
            </tr>
            <asp:Literal ID="myApply" runat="server" />
        </table>
    </div>


</asp:Content>