<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="ConversionApplyShow.aspx.cs" Inherits="Account_ConversionApplyShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">员工转正申请表</div>
        <table class="firstTable">
            <tr>
                <td class="bold">姓名</td>
                <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
                <td class="bold">学历</td>
                <td class="diy"><asp:Literal ID="education" runat="server"></asp:Literal></td>
                <td class="bold">部门</td>
                <td class="diy"><asp:Literal ID="department" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">到岗日期</td>
                <td class="diy"><asp:Literal ID="startDate" runat="server"></asp:Literal></td>
                <td class="bold">试用级别</td>
                <td class="diy"><asp:Literal ID="level" runat="server"></asp:Literal></td>
                <td class="bold">申请日期</td>
                <td class="diy"><asp:Literal ID="applyDate" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold" style="height:100px">个人总结</td>
                <td colspan="5"><asp:Literal ID="summary" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold" style="height:80px">部门经理意见</td>
                <td colspan="5">
                    <br /><br /><br />
                    签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：
                </td>
            </tr>
            <tr>
                <td class="bold" style="height:80px">事业部经理意见</td>
                <td colspan="5">
                    <br /><br /><br />
                    签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：
                </td>
            </tr>
            <tr>
                <td class="bold" style="height:80px">办公会议讨论意见</td>
                <td colspan="5"></td>
            </tr>
            <tr>
                <td class="bold" >转正工资级别</td>
                <td colspan="5"><asp:Literal ID="salaryLevel" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold" style="height:80px">机构负责人意见</td>
                <td colspan="5">
                    <br /><br /><br />
                    签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：
                </td>
            </tr>
        </table>
        <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server" OnClick="agreeButton_Click" />
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server"  OnClick="disagreeButton_Click" />
        <br /><asp:TextBox ID="processShow" runat="server" Style="height:80px;width:500px"></asp:TextBox>
    </div>

</asp:Content>
