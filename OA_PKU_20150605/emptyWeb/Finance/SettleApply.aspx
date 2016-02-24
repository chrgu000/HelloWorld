<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="SettleApply.aspx.cs" Inherits="Finance_SettleApply" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">统一结算申请单</div>
        <table class="firstTable">
            <tr>
                <td class="bold">经办人</td>
                <td colspan="3">
                    <table class="innerTable">
                        <tr>
                            <td width="100px"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
                            <td class="bold">部门</td>
                            <td width="150px">
                                <asp:Literal ID="department" runat="server"></asp:Literal>
                            </td>
                            <td class="bold">职务</td>
                            <td >
                                <asp:Literal ID="position" runat="server"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="bold">统一结算事由</td>
                <td colspan="3">
                    <asp:TextBox ID="reason" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>
                    <br /><asp:RequiredFieldValidator ControlToValidate="reason" ErrorMessage="结算事由不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator4"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">预计结算时间</td>
                <td class="diy"><input name="settleDate" type="text" id="settleDate" class="Text" runat="server" onClick="WdatePicker()"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="settleDate" ErrorMessage="预计结算时间不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="bold">金额</td>
                <td class="diy">
                     <asp:TextBox runat="server" name="money" type="text" id="money" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="validatorMoney" ControlToValidate="money" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>
            </tr>
            <tr>
                <td class="bold">是否符合公司规定</td>
                <td >
                    <asp:RadioButtonList ID="legal" runat="server" RepeatDirection="Horizontal" Width="150px" RepeatLayout="Flow">
                        <asp:ListItem Value="true" Selected="True">是</asp:ListItem>
                        <asp:ListItem Value="false">否</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="bold">报销账号</td>
                <td class="diy">
                    <asp:DropDownList ID="accountList"  runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="bold">费用预算</td>
                <td colspan="3">
                    <asp:RadioButtonList ID="innerBudget" runat="server" RepeatDirection="Horizontal" Width="150px" RepeatLayout="Flow">
                        <asp:ListItem Value="true" Selected="True">预算内</asp:ListItem>
                        <asp:ListItem Value="false">预算外</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="bold">结算方式</td>
                <td colspan="3">
                    <asp:CheckBox ID="check_if" runat="server"/>
                    签单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(合作单位)请注明：<input name="checkBill" type="text" id="checkBill" class="Text" runat="server"/>
                </td>
            </tr>
           
        </table>
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click" />
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>
    

</asp:Content>
