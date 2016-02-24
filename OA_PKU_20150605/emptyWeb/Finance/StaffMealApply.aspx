<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="StaffMealApply.aspx.cs" Inherits="Finance_StaffMealApply" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">员工用餐申请单</div>
        <table class="firstTable">
            <tr>
                <td class="bold">经办人</td>
                <td class="diy">
                    <asp:Literal ID="staffName" runat="server"></asp:Literal>
                </td>
                <td class="bold">部门</td>
                <td class="diy">
                    <asp:Literal ID="department" runat="server"></asp:Literal>
                </td>
                <td class="bold">职务</td>
                <td class="diy">
                   <asp:Literal ID="position" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="bold">用餐人数</td>
                <td class="diy"><input name="persons" type="text" id="persons" class="Text" runat="server"/>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator1" ControlToValidate="persons" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Dynamic"/>
                </td>
                <td class="bold">用餐时间</td>
                <td class="diy">
                    <input name="mealDate" type="text" id="mealDate" class="Text" runat="server" onClick="WdatePicker()"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="mealDate" ErrorMessage="用餐时间不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator2"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="bold">金额</td>
                <td class="diy">
                     <asp:TextBox runat="server" name="money" type="text" id="money" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="validatorMoney" ControlToValidate="money" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td class="bold">用餐事由</td>
                <td colspan="5"><input name="reason" type="text" id="reason" class="longTd" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="reason" ErrorMessage="用餐事由不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator4"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">用餐标准</td>
                <td colspan="5"><input name="standard" type="text" id="standard" class="longTd" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="standard" ErrorMessage="用餐标准不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
                        <tr>
                <td class="bold">是否符合公司规定</td>
                <td colspan="5">
                    <asp:RadioButtonList ID="legal" runat="server" RepeatDirection="Horizontal" Width="450px" RepeatLayout="Flow">
                        <asp:ListItem Value="true" Selected="True">是</asp:ListItem>
                        <asp:ListItem Value="false">否</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="bold">用餐结算方式</td>
                <td colspan="5">
                    <asp:RadioButtonList ID="style" runat="server" RepeatDirection="Horizontal" Width="450px" RepeatLayout="Flow">
                        <asp:ListItem Value="true" Selected="True">自付现金</asp:ListItem>
                        <asp:ListItem Value="false">出纳处领款</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            
        </table>
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click" />
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>

</asp:Content>