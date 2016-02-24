<%@ Page Language="C#" MasterPageFile="~/Site.master" StyleSheetTheme="login" AutoEventWireup="true" CodeFile="changePass.aspx.cs" Inherits="Account_changePass" %>
<%@ Register Src="~/Controls/VerifyCode.ascx" TagName="VerifyCode" TagPrefix="OA" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="Register">       
        <div class="titlehead">密码更改</div>
        <table id="RegisterTable">         
            
            <tr>
              <td>原密码</td>
              <td><input name="Password" type="password" id="Password" class="Text" /></td>             
            </tr>
            <tr>
              <td>新密码</td>
              <td><input name="NewPassword" type="password" id="NewPasswofd" class="Text" /></td>             
            </tr>
            <tr>
                <td colspan="2" class="explain">请选择方便记忆的密码，此密码区分大小写</td>
            </tr>
            <tr>
              <td>确认新密码</td>
              <td><input name="RepeatPassword" type="password" id="RepeatPassword" class="Text" /></td>
              
            </tr>
            <tr>
                <td colspan="2" class="explain">请重复输入密码以进行确认</td>
            </tr>
            <tr>
              <td>验证码</td>
              <td><input name="VerifyCodeText" type="text" id="VerifyCodeText" class="Text" /></td>              
            </tr>
            <tr>
                <td colspan="2" id="VerifyCodeContainer"><OA:VerifyCode id="VerifyCode" runat="server" /></td>
            </tr>
            <tr>
              <td></td><td colspan="2"><input type="submit" name="SubmitForm" value="确认" id="SubmitForm" class="Button" />
                <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
                [<a href="/">用户登录</a>]</td>
            </tr>
        </table>
    </div>   
  

  

</asp:Content>