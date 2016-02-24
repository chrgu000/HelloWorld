<%@ Page Language="C#" MasterPageFile="~/Site.master" StyleSheetTheme="login" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Acount_Login" %>
<%@ Register Src="~/Controls/VerifyCode.ascx" TagName="VerifyCode" TagPrefix="OA" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="Server">
    
    <div id="logon">
        <table id="LoginTable">
          <tr><td>请输入用户名：</td><td></td></tr>
          <tr>                        
            <td>              
                <asp:TextBox name="Username" type="text" id="Username" class="Text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" style="color:red;font-size:12px" ID="validatorUser" ControlToValidate="Username" ErrorMessage="用户名不能为空" Display="Static"></asp:RequiredFieldValidator>             
            </td>
          </tr>
            <tr></tr>
          <tr><td>请输入密码：</td><td></td></tr>
          <tr> 
             <td>
               <input name="Password" type="password" id="Password" class="Text" />
             </td>
          </tr>
            <tr></tr>
          <tr><td>请输入验证码：</td><td></td></tr>
          <tr>                        
              <td>
                 <input name="VerifyCodeText" type="text" id="VerifyCodeText" class="Text" />
              </td>              
          </tr>
            <tr>
               <td id="VerifyCodeContainer">
                  <OA:VerifyCode ID="VerifyCode" runat="server" />
              </td>
            </tr>
          <tr>
            <td colspan="3">
                <asp:Button ID="confirm" text="确认" class="Button"  runat="server" OnClick="confirm_Click"/>
             
              <a href="Register.aspx">新用户注册</a><span id="ErrorSpan" runat="server" visible="false"
                                style="color: #F00">登录失败—错误的用户名或密码</span></td>
         </tr>
      </table> 
        
    </div>
       

     
       
 </asp:Content>
