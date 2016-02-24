<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="ProjectReimbursementShow.aspx.cs" Inherits="Finance_ProjectReimbursementShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="projectRei" class="outTable">
        <div class="titlehead">费用报销申请</div>
        <table id="projectReiTable" class="firstTable">
            <tr>
                <td class="bold">报销人</td>
                <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
                <td class="bold">部门</td>
                <td class="diy"><asp:Literal ID="department" runat="server"></asp:Literal></td>
                <td class="bold">项目负责人</td>
                <td class="diy"><asp:Literal ID="manager" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">报销时间</td>
                <td class="diy"><asp:Literal ID="reimburseDate" runat="server"></asp:Literal></td>
                <td class="bold">发生日期</td>
                <td class="diy"><asp:Literal ID="happenDate" runat="server"></asp:Literal></td>
                <td class="bold">项目编号</td>
                <td class="diy"><asp:Literal ID="projectCode" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">摘要</td>
                <td colspan="5" style="height:200px">
                    <asp:Literal ID="remark" runat="server"></asp:Literal> 
                </td>
            </tr>
            <tr>
                <td class="bold">单据张数</td>
                <td class="diy"><asp:Literal ID="bill" runat="server"></asp:Literal></td>
                <td class="bold">金额</td>
                <td class="diy"><asp:Literal ID="expense" runat="server"></asp:Literal></td>
                <td class="bold">合计</td>
                <td class="diy">
                    <asp:Literal ID="allExpense" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="bold">项目账号</td>
                <td class="diy">
                    <asp:DropDownList ID="accountList"  runat="server">
                    </asp:DropDownList>
                </td>
                <td class="bold">金额大写</td>
                <td colspan="3"><asp:Literal ID="capital" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td rowspan="2" colspan="2">审批</td>
                <td class="bold">项目经理</td>
                <td class="diy"><asp:Literal ID="proManager" runat="server"></asp:Literal></td>
                <td class="bold">部门经理</td>
                <td class="diy"><asp:Literal ID="depManager" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">财务主管</td>
                <td class="diy"><asp:Literal ID="financial" runat="server"></asp:Literal></td>
                <td class="bold">机构负责人</td>
                <td colspan="2" class="diy"><asp:Literal ID="company" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">领款人</td>
                <td class="diy" ><asp:Literal ID="payee" runat="server"></asp:Literal></td>
                <td class="bold">领款日期</td>
                <td class="diy"><asp:Literal ID="payeeDate" runat="server"></asp:Literal></td>
                <td class="bold">备注</td>
                <td class="diy"><asp:Literal ID="note" runat="server"></asp:Literal></td>
            </tr>

        </table>
        <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server"  OnClick="agreeButton_Click"/>
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server" OnClick="disagreeButton_Click" />
        <br /><asp:Button ID="cashierButton" Text="可以记账" runat="server"  class="noSubmitButton" OnClick="cashierButton_Click"/>
        <asp:Button ID="rejectButton" name="rejectButton" text="学校未通过" class="noSubmitButton"  runat="server" OnClick="rejectButton_Click"/>
        <br />  
        <asp:TextBox ID="whyDisagree" runat="server" Text="若不同意请注明理由：" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>   
        <br /><asp:Literal ID="processShow" runat="server"></asp:Literal>
    </div>


</asp:Content>