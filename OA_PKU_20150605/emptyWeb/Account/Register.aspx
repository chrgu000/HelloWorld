<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.master" StyleSheetTheme="login" CodeFile="Register.aspx.cs" Inherits="Acount_Register" %>

<%@ Register Src="~/Controls/VerifyCode.ascx" TagName="VerifyCode" TagPrefix="OA" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="Register">       
        <div class="titlehead">新用户注册</div>
        <table id="RegisterTable">
            <tr>
              <td>用户名</td>
              <td><input name="Username" type="text" id="Username" class="Text" /></td>              
            </tr>
            <tr>
                <td colspan="2" class="explain">用户名由1~20位的英文字母、阿拉伯数字和下划线组成</td>
            </tr>
            <tr>
              <td>密码</td>
              <td><input name="Password" type="password" id="Password" class="Text" /></td>
              
            </tr>
            <tr>
                <td colspan="2" class="explain">请选择方便记忆的密码，此密码区分大小写</td>
            </tr>
            <tr>
              <td>确认密码</td>
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
