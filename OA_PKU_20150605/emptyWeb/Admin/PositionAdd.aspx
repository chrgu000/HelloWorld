<%@ Page Language="C#" StyleSheetTheme="admin" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="PositionAdd.aspx.cs" Inherits="Admin_RoleAdd" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    
    <div class="outTable">
        <div class="titlehead">职位名称</div>
        <table class="firstTable">
            <tr>
                
                <td><input name="PositionName" type="text" id="PositionName" class="Text" /></td>
            </tr>
            
            <tr>
                <td style="align-content:center">
                    <input type="submit" name="SubmitForm" value="确认" id="SubmitForm" class="Button" />
                    <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
                </td>

            </tr>
        </table>
    </div>
    </asp:Content>