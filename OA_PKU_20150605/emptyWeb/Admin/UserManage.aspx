<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="UserManage.aspx.cs" Inherits="Admin_UserManage" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">用户管理（管理职位，涉及权限）</div><br />      
        

        <table class="firstTable">
            <tr>
                <td>姓名</td>
                <td>性别</td>
                <td>部门</td>
                <td>职位</td>
                <td>职称</td>
                <td>入职时间</td>
                <td>在职状态</td>
                <td>密码重置</td>
                <td>离职注销</td>
            </tr>
            <asp:Literal ID="BasicInfoRowsTemp" runat="server" />
        </table>
    </div>


</asp:Content>
