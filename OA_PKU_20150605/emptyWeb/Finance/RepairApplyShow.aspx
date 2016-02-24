<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="RepairApplyShow.aspx.cs" Inherits="Finance_RepairApplyShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
 <div class="outTable">
	<div class="titlehead">固定资产（办公设备）报修申请单</div>
	<table class="firstTable">
        <tr>
            <td class="bold">资产名称</td>
            <td class="diy"><asp:Literal ID="equipmentName" runat="server"></asp:Literal></td>
            <td class="bold">规格型号</td>
            <td class="diy"><asp:Literal ID="equipmentType" runat="server"></asp:Literal></td>
            <td class="bold">购买时间</td>
            <td class="diy"><asp:Literal ID="buyDate" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="bold">使用人</td>
            <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
            <td class="bold">部门</td>
            <td class="diy"><asp:Literal ID="department" runat="server"></asp:Literal></td>
            <td class="bold">故障时间</td>
            <td class="diy"><asp:Literal ID="bugDate" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="bold">设备故障情况</td>
            <td colspan="5"><asp:Literal ID="bugDetail" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="bold">送修时间</td>
            <td class="diy"><asp:Literal ID="sentToRepair" runat="server"></asp:Literal></td>
            <td class="bold">希望修复时间</td>
            <td class="diy"><asp:Literal ID="fixDate" runat="server"></asp:Literal></td>
            <td class="bold">是否在保修期</td>
            <td >
                <asp:Literal ID="duringGuarantee" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="bold">修理方式</td>
            <td colspan="5">
                <asp:Literal ID="repairSelf" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="bold">修理费用预算</td>
            <td colspan="5"><asp:Literal ID="budget" runat="server"></asp:Literal></td>
        </tr>
                <tr>
            <td class="bold">结算方式</td>
            <td colspan="5">
                <asp:Literal ID="settleType" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="bold">部门经理</td>
            <td class="diy"><asp:Literal ID="depManager" runat="server"></asp:Literal></td>
            <td class="bold">机构负责人</td>
            <td class="diy"><asp:Literal ID="proManager" runat="server"></asp:Literal></td>
            <td class="bold">管委会办公室</td>
            <td class="diy"><asp:Literal ID="guanwei" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="bold">送修时间</td>
            <td class="diy" colspan="5"></td>
        </tr>
	</table>
     <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server"  OnClick="agreeButton_Click" />
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server"  OnClick="disagreeButton_Click" />
        <br />  
     <asp:TextBox ID="whyDisagree" runat="server" Text="若不同意请注明理由：" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>   
      <br /><asp:Literal ID="processShow" runat="server"></asp:Literal>
 </div>

</asp:Content>
