<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="SettleApplyShow.aspx.cs" Inherits="Finance_SettleApplyShow" %>

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
                            <td width="150px"><asp:Literal ID="department" runat="server"></asp:Literal></td>
                            <td class="bold">职务</td>
                            <td ><asp:Literal ID="position" runat="server"></asp:Literal></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="bold">统一结算事由</td>
                <td colspan="3"><asp:Literal ID="reason" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">预计结算时间</td>
                <td class="diy"><asp:Literal ID="settleDate" runat="server"></asp:Literal></td>
                <td class="bold">金额</td>
                <td class="diy"><asp:Literal ID="money" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">项目账号</td>
                <td class="diy">
                    <asp:DropDownList ID="accountList"  runat="server">
                    </asp:DropDownList>
                </td>
                <td class="bold">是否符合公司规定</td>
                <td>
                    <asp:RadioButtonList  ID="legal" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Flow">
                        <asp:ListItem Value="true">是</asp:ListItem>
                        <asp:ListItem Value="false">否</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="bold">费用预算</td>
                <td colspan="3">
                    <asp:RadioButtonList ID="innerBudget" runat="server" RepeatDirection="Horizontal" Width="150px" RepeatLayout="Flow">
                        <asp:ListItem Value="true">预算内</asp:ListItem>
                        <asp:ListItem Value="false">预算外</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="bold">结算方式</td>
                <td colspan="3">
                    <asp:CheckBox runat="server"/>
                    签单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(合作单位)请注明：<asp:Literal ID="checkBill" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="bold">部门经理</td>
                <td class="diy"><asp:Literal ID="depManager" runat="server"></asp:Literal></td>
                <td class="bold">机构负责人</td>
                <td class="diy"><asp:Literal ID="company" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">管委会办公室</td>
                <td class="diy"><asp:Literal ID="guanwei" runat="server"></asp:Literal></td>
                <td class="bold">日期</td>
                <td class="diy"></td>
            </tr>
        </table>
        <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server"  OnClick="agreeButton_Click" />
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server"  OnClick="disagreeButton_Click" />
        <br /><asp:Button ID="cashierButton" Text="可以记账" runat="server"  class="noSubmitButton" OnClick="cashierButton_Click"/>
        <asp:Button ID="rejectButton" name="rejectButton" text="学校未通过" class="noSubmitButton"  runat="server" OnClick="rejectButton_Click"/>
        <br />  
        <asp:TextBox ID="whyDisagree" runat="server" Text="若不同意请注明理由：" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>   
        <br /><asp:Literal ID="processShow" runat="server"></asp:Literal>
    </div>
    

</asp:Content>
