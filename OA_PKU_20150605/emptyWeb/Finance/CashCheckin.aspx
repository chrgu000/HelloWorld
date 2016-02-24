<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="CashCheckin.aspx.cs" Inherits="Finance_CashCheckin" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">

    <div id="projectRei" class="outTable">
        <div class="titlehead">记账明细</div>
        <table id="cashierTable" class="firstTable">
           <tr>
               <td class="bold">记账日期</td>
               <td class="diy"><asp:Literal ID="happenDate" runat="server"></asp:Literal></td>
               <td class="bold">项目编号</td>
               <td class="diy"><asp:Literal ID="projectCode" runat="server"></asp:Literal></td>
               <td class="bold">项目账号</td>
               <td class="diy"><asp:Literal ID="projectAccount" runat="server"></asp:Literal></td>
           </tr>
            <tr>
               <td class="bold">报销类型</td>
               <td class="diy"><asp:Literal ID="cashType" runat="server"></asp:Literal></td>
               <td class="bold">收入</td>
               <td class="diy"><asp:Literal ID="income" runat="server"></asp:Literal></td>
               <td class="bold">支出</td>
               <td class="diy"><asp:Literal ID="expense" runat="server"></asp:Literal></td>
           </tr>
            <tr>
               <td class="bold">部门</td>
               <td class="diy"><asp:Literal ID="department" runat="server"></asp:Literal></td>
               <td class="bold">经办人</td>
               <td class="diy"><asp:Literal ID="handler" runat="server"></asp:Literal></td>
               <td class="bold">摘要</td>
               <td class="diy"><asp:Literal ID="summary" runat="server"></asp:Literal></td>
           </tr>
             <tr>
               <td class="bold">凭单编号</td>
               <td class="diy" colspan="2"><input name="voucherID" type="text" id="voucherID" class="Text" runat="server"/></td>
               <td class="bold">科目编号</td>
               <td class="diy" colspan="2">
                    <asp:DropDownList ID="accountIDList" runat="server">
                        <asp:ListItem>无</asp:ListItem>
                        <asp:ListItem>测试</asp:ListItem>
                    </asp:DropDownList>
                   
               </td>               
           </tr>
        </table>
        <asp:Button text="记账" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server" OnClick="agreeButton_Click" />

    </div>


</asp:Content>