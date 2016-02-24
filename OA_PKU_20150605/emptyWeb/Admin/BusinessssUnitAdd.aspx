<%@ Page Language="C#" StyleSheetTheme="admin" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="BusinessssUnitAdd.aspx.cs" Inherits="Admin_BusinessssUnitAdd" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">

    <div>
        <table class="firstTable">
            <tr>
                <td>事业部名称</td>
                <td><input name="BUName" type="text" id="BUName" class="Text" /></td>
            </tr>
            <tr>
                <td>事业部编号</td>
                <td><input name="BUCode" type="text" id="BUCode" class="Text" /></td>
            </tr>
            <tr>
                <td>负责人</td>
                <td><input name="boss" type="text" id="boss" class="Text" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <input type="submit" name="SubmitForm" value="确认" id="SubmitForm" class="Button" />
                    <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
                </td>

            </tr>
        </table>
    </div>
</asp:Content>