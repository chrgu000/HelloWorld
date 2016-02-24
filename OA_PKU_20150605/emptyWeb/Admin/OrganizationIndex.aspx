<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="OrganizationIndex.aspx.cs" Inherits="Admin_OrganizationIndex" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">请选择添加组织类型</div>
        <table class="firstTable">
            <tr>
                <td>
                    <asp:DropDownList ID="organizationType" runat="server">
                        <asp:ListItem>添加事业部</asp:ListItem>
                        <asp:ListItem Selected="True">添加部门</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <asp:Button ID="confirmButton" text="确认" class="noSubmitButton"  runat="server" OnClick="confirmButton_Click"  />
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>


</asp:Content>
