<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="MoneyApplyShow.aspx.cs" Inherits="Finance_MoneyApplyShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">资金使用审批表</div>
        <table class="firstTable">
            <tr>
                <td class="bold">姓名</td>
                <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
                <td class="bold">部门</td>
                <td class="diy"><asp:Literal ID="department" runat="server"></asp:Literal></td>
                
            </tr>
            <tr>
                <td class="bold">电话</td>
                <td class="diy"><asp:Literal ID="telephone" runat="server"></asp:Literal></td>
                <td class="bold">金额</td>
                <td class="diy"><asp:Literal ID="money" runat="server"></asp:Literal></td>
                
            </tr>
            <tr>
                <td class="bold">项目账号</td>
                <td class="diy">
                    <asp:DropDownList ID="accountList"  runat="server">
                    </asp:DropDownList>
                </td>
                <td class="bold">大写</td>
                <td class="diy"><asp:Literal ID="capital" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">项目编号</td>
                <td class="diy"><asp:Literal ID="projectCode" runat="server"></asp:Literal></td>
                <td class="bold">借款方式</td>
                <td class="diy"><asp:Literal ID="style" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">用途</td>
                <td class="diy" colspan="3"><asp:Literal ID="usage" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">还款计划</td>
                <td class="diy" colspan="3"><asp:Literal ID="plan" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">个人承诺</td>
                <td style="text-align:left" class="diy" colspan="3">本人郑重承诺:<br />1.将严格按照还款计划按时足额还款。<br />
                    2.将严格按照单位规定时间内及时报销。<br />
                    3.若本人中途离职（室），承诺在离职（室）前一次性还清借款。<br /><br /><br />
                    承诺人：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：
                </td>
            </tr>
            <tr>
                <td class="bold">项目经理意见</td>
                <td class="diy"></td>
                <td class="bold">签字</td>
                <td class="diy"><asp:Literal ID="proManager" runat="server"></asp:Literal></td>

            </tr>
            <tr>
                <td class="bold">部门经理意见</td>
                <td class="diy"></td>
                <td class="bold">签字</td>
                <td class="diy"><asp:Literal ID="depManager" runat="server"></asp:Literal></td>

            </tr>
            <tr>
                <td class="bold">财务主管意见</td>
                <td class="diy"></td>
                <td class="bold">签字</td>
                <td class="diy"><asp:Literal ID="financial" runat="server"></asp:Literal></td>

            </tr>
            <tr>
                <td class="bold">机构负责人意见</td>
                <td class="diy"></td>
                <td class="bold">签字</td>
                <td class="diy"><asp:Literal ID="company" runat="server"></asp:Literal></td>

            </tr>
            <tr>
                <td class="bold">管委会意见</td>
                <td class="diy"></td>
                <td class="bold">签字</td>
                <td class="diy"><asp:Literal ID="guanwei" runat="server"></asp:Literal></td>

            </tr>
            <tr>
                <td class="bold">领款人</td>
                <td class="diy" ><asp:Literal ID="payee" runat="server"></asp:Literal></td>
                <td class="bold">领款日期</td>
                <td class="diy" ><asp:Literal ID="payDate" runat="server"></asp:Literal></td>
            </tr>
         </table>
        <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server"  OnClick="agreeButton_Click" />
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server" OnClick="disagreeButton_Click" />
        <br /><asp:Button ID="cashierButton" Text="可以记账" runat="server"  class="noSubmitButton" OnClick="cashierButton_Click"/>
        <asp:Button ID="rejectButton" name="rejectButton" text="学校未通过" class="noSubmitButton"  runat="server" OnClick="rejectButton_Click"/>
        <br />  
        <asp:TextBox ID="whyDisagree" runat="server" Text="若不同意请注明理由：" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>   
        <br /><asp:Literal ID="processShow" runat="server"></asp:Literal>
    </div>

</asp:Content>
