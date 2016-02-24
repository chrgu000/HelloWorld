<%@ Page Language="C#" StyleSheetTheme="admin" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="DepartmentAdd.aspx.cs" Inherits="Admin_DepartmentAdd" %>


<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div>
        <table class="firstTable">
            <tr>
                <td>部门名称</td>
                <td><input name="departmentName" type="text" id="departmentName" class="Text" /></td>
            </tr>
            <tr>
                <td>所属事业部</td>
                <td>
                    <asp:DropDownList id="buList" runat="server">

                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>部门经理</td>
                <td><input name="boss" type="text" id="boss" class="Text" /></td>
            </tr>
            <tr>
                <td>机构负责人</td>
                <td><input name="leader" type="text" id="leader" class="Text" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <input type="submit" name="SubmitForm" value="确认" id="SubmitDP" class="Button" runat="server"/>
                    <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
                    
                </td>

            </tr>
        </table>
    </div>

</asp:Content>