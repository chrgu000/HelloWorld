<%@ Page Language="C#"  StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="EntertainApplyShow.aspx.cs" Inherits="Finance_EntertainApplyShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">宴请申请单</div>
        <table class="firstTable">
            <tr>
                <td class="bold">申请部门</td>
                <td class="diy"><asp:Literal ID="department" runat="server"></asp:Literal></td>
                <td class="bold">申请日期</td>
                <td class="diy"><asp:Literal ID="applyDate" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">经办人</td>
                <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
                <td class="bold">部门经理</td>
                <td class="diy"><asp:Literal ID="manager" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">宴请时间</td>
                <td class="diy"><asp:Literal ID="treatDate" runat="server"></asp:Literal></td>
                <td class="bold">宴请标准</td>
                <td class="diy"><asp:Literal ID="treatStandard" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">宴请事由</td>
                <td colspan="3"><asp:Literal ID="reason" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">宴请对象</td>
                <td colspan="3"><asp:Literal ID="treated" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">宴请费用预算</td>
                <td colspan="3"><asp:Literal ID="budget" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">宴请结算方式</td>
                <td colspan="3">
                    <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" Width="350px" RepeatLayout="Flow">
                        <asp:ListItem>支票</asp:ListItem>
                        <asp:ListItem>现金</asp:ListItem>
                        <asp:ListItem>签单(合作餐厅)请注明：</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Literal ID="treatStyle" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="bold">机构负责人</td>
                <td class="diy"><asp:Literal ID="company" runat="server"></asp:Literal></td>
                <td class="bold">综合管理部</td>
                <td class="diy"><asp:Literal ID="financial" runat="server"></asp:Literal></td>
            </tr>
        </table>
        <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server" OnClick="agreeButton_Click" />
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server" OnClick="disagreeButton_Click" />
        <br />
        <asp:TextBox ID="whyDisagree" runat="server" Text="若不同意请注明理由：" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>   
        <asp:TextBox ID="processShow" runat="server" Style="height:80px;width:500px"></asp:TextBox>
    </div>

 </asp:Content>
