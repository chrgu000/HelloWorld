<%@ Page Language="C#"  StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="RepairApply.aspx.cs" Inherits="Finance_RepairApply" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
 <div class="outTable">
	<div class="titlehead">固定资产（办公设备）报修申请单</div>
	<table class="firstTable">
        <tr>
            <td class="bold">资产名称</td>
            <td class="diy"><input name="equipmentName" type="text" id="equipmentName" class="Text" runat="server"/>
                <br /><asp:RequiredFieldValidator ControlToValidate="equipmentName" ErrorMessage="资产名称不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator2"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td class="bold">规格型号</td>
            <td class="diy"><input name="equipmentType" type="text" id="equipmentType" class="Text" runat="server"/>
                <br /><asp:RequiredFieldValidator ControlToValidate="equipmentType" ErrorMessage="规格型号不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td class="bold">购买时间</td>
            <td class="diy">
                <input name="buyDate" type="text" id="buyDate" class="Text" runat="server" onClick="WdatePicker()"/>
                <br /><asp:RequiredFieldValidator ControlToValidate="buyDate" ErrorMessage="购买时间不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator3"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="bold">使用人</td>
            <td class="diy">
                <asp:Literal ID="staffName" runat="server"></asp:Literal>
            </td>
            <td class="bold">部门</td>
            <td class="diy">
                <asp:Literal ID="department" runat="server"></asp:Literal>
            </td>
            <td class="bold">故障时间</td>
            <td class="diy">
                <input name="bugDate" type="text" id="bugDate" class="Text" runat="server" onClick="WdatePicker()"/>
                <br /><asp:RequiredFieldValidator ControlToValidate="bugDate" ErrorMessage="故障时间不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator4"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="bold">设备故障情况</td>
            <td colspan="5">
                <asp:TextBox ID="bugDetail" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>
                <br /><asp:RequiredFieldValidator ControlToValidate="bugDetail" ErrorMessage="设备故障情况不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator5"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="bold">送修时间</td>
            <td class="diy">
                 <input name="sentToRepair" type="text" id="sentToRepair" class="Text" runat="server" onClick="WdatePicker()"/>
                <br /><asp:RequiredFieldValidator ControlToValidate="sentToRepair" ErrorMessage="送修时间不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator6"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td class="bold">希望修复时间</td>
            <td class="diy">
                <input name="fixDate" type="text" id="fixDate" class="Text" runat="server" onClick="WdatePicker()"/>
                <br /><asp:RequiredFieldValidator ControlToValidate="fixDate" ErrorMessage="购买时间不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator7"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td class="bold">是否在保修期</td>
            <td >
                <asp:RadioButtonList ID="duringGuarantee" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Selected="True">是</asp:ListItem>
                    <asp:ListItem>否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="bold">修理方式</td>
            <td colspan="5">
                <asp:RadioButtonList ID="RepairSelf" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Selected="True">自修</asp:ListItem>
                    <asp:ListItem>送修</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="bold">修理费用预算</td>
            <td colspan="5">
                 <asp:TextBox runat="server" name="budget" type="text" id="budget" class="Text"></asp:TextBox>
                 <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="validatorMoney" ControlToValidate="budget" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
            </td>
        </tr>
        <tr>
            <td class="bold">结算方式</td>
            <td colspan="5">
                <asp:RadioButtonList ID="settleType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="支票" Selected="True">支票</asp:ListItem>
                    <asp:ListItem Value="现金">现金</asp:ListItem>
                    <asp:ListItem Value="签单">签单(合作单位)请注明：<input name="checkBill" type="text" id="checkBill" class="Text" /></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>        
       

	</table>
     <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click" />
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
 </div>

</asp:Content>