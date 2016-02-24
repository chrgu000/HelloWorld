<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="MoneyApply.aspx.cs" Inherits="Finance_MoneyApply" %>


<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">资金使用审批表</div>
        <table class="firstTable">
            <tr>
                <td class="bold">姓名</td>
                <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
                <td class="bold">部门</td>
                <td class="diy">
                    <asp:Literal ID="department" runat="server"></asp:Literal>
                </td>                
            </tr>
            <tr>
                <td class="bold">电话</td>
                <td class="diy">
                    <asp:TextBox runat="server" name="telephone" type="text" id="telephone" class="Text" ></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator1" ControlToValidate="telephone" ValidationExpression="^[1]([3][0-9]{1}|59|58|88|89)[0-9]{8}$" ErrorMessage="电话号码格式不正确" Display="Static">

                    </asp:RegularExpressionValidator>
                </td>
                <td class="bold">金额</td>
                <td class="diy">
                    <asp:TextBox runat="server" name="money" ID="money"  OnTextChanged="money_TextChanged" AutoPostBack="true"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="validatorMoney" ControlToValidate="money" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>
                
            </tr>
            <tr>
                <td class="bold">大写</td>
                <td class="diy" colspan="3">
                    <asp:UpdatePanel ID="capitalShow" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Literal ID="capital" runat="server"></asp:Literal>            
                        </ContentTemplate>            
                    </asp:UpdatePanel> 
                </td>
            </tr>
            <tr>
                <td class="bold">项目编号</td>
                <td class="diy">
                    <asp:DropDownList ID="projectCodeList" class="project" runat="server" >
                    </asp:DropDownList>
                </td>
                <td class="bold">借款方式</td>
                <td class="diy"><input name="style" type="text" id="style" class="Text" value="现金" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="style" ErrorMessage="借款方式不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator5"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">用途</td>
                <td class="diy" colspan="3">
                    <asp:TextBox ID="usage" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>
                    <br /><asp:RequiredFieldValidator ControlToValidate="usage" ErrorMessage="用途不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">还款计划</td>
                <td class="diy" colspan="3">
                    <asp:TextBox ID="plan" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>
                    <br /><asp:RequiredFieldValidator ControlToValidate="plan" ErrorMessage="还款计划不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator2"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">个人承诺</td>
                <td style="text-align:left" class="diy" colspan="3">本人郑重承诺:<br />1.将严格按照还款计划按时足额还款。<br />
                    2.将严格按照单位规定时间内及时报销。<br />
                    3.若本人中途离职（室），承诺在离职（室）前一次性还清借款。<br /><br /><br />
                    承诺人：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：
                </td>
            </tr>
            
         </table>
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click" />
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>

</asp:Content>