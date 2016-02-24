<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="ConversionApply.aspx.cs" Inherits="Account_ConversionApply" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">员工转正申请表</div>
        <table class="firstTable">
            <tr>
                <td class="bold">姓名</td>
                <td class="diy"><input name="staffName" type="text" id="staffName" class="Text" /></td>
                <td class="bold">学历</td>
                <td class="diy"><input name="education" type="text" id="education" class="Text" /></td>
                <td class="bold">部门</td>
                <td class="diy">
                    <asp:DropDownList ID="depList" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="bold">到岗日期</td>
                <td class="diy">
                    <input name="startDate" type="text" id="startDate" class="Text" runat="server" onClick="WdatePicker()"/>
                </td>
                <td class="bold">试用级别</td>
                <td class="diy"><input name="level" type="text" id="level" class="Text" /></td>
                <td class="bold">申请日期</td>
                <td class="diy">
                    <input name="applyDate" type="text" id="apply" class="Text" runat="server" onClick="WdatePicker()"/>
                </td>
            </tr>
            <tr>
                <td class="bold" style="height:100px">个人总结</td>
                <td colspan="5">
                    <asp:TextBox ID="summary" height="80px" width="385px" runat="server" TextMode="MultiLine" ></asp:TextBox>
                </td>
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
                <td colspan="5"><input name="salaryLevel" type="text" id="salaryLevel" class="Text" /></td>
            </tr>
            <tr>
                <td class="bold" style="height:80px">机构负责人意见</td>
                <td colspan="5">
                    <br /><br /><br />
                    签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：
                </td>
            </tr>
        </table>
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click" />
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>

</asp:Content>
