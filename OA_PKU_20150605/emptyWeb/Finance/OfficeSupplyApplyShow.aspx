<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="OfficeSupplyApplyShow.aspx.cs" Inherits="Finance_OfficeSupplyApplyShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
 <div class="outTable">
	<div class="titlehead">办公用品购买申购单</div>
	<table class="firstTable">
        <tr>
            <td class="bold">申请人</td>
            <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
            <td class="bold">部门</td>
            <td class="diy"><asp:Literal ID="department" runat="server"></asp:Literal></td>
            <td class="bold">日期</td>
            <td class="diy"><asp:Literal ID="applyDate" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="bold">申请理由</td>
            <td colspan="5"><asp:Literal ID="reason" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td colspan="6">
                <table class="innerTable">
                    <tr>
                        <td class="diy">品名</td>
                        <td class="diy">型号</td>
                        <td class="bold">单价</td>
                        <td class="bold">数量</td>
                        <td style="width:150px">金额</td>
                    </tr>
                    <asp:Literal ID="supplyList" runat="server" />
                </table>
            </td>
        </tr>
        <tr>
            <td class="bold">金额大写:</td>
            <td class="diy" colspan="2"><asp:Literal ID="allExpensiveUpper" runat="server"></asp:Literal></td>
            <td class="bold">金额小写:</td>
            <td class="diy" colspan="2"><asp:Literal ID="allExpensive" runat="server"></asp:Literal></td>

        </tr>
        <tr>
            <td class="bold">申请人</td>
            <td class="diy"></td>
            <td class="bold">项目经理</td>
            <td class="diy"><asp:Literal ID="proManager" runat="server"></asp:Literal></td>
            <td class="bold">部门经理</td>
            <td class="diy"><asp:Literal ID="depManager" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="bold">机构负责人</td>
            <td class="diy"><asp:Literal ID="company" runat="server"></asp:Literal></td>
            <td class="bold">会计</td>
            <td class="diy"><asp:Literal ID="counter" runat="server"></asp:Literal></td>
            <td class="bold">出纳</td>
            <td class="diy"><asp:Literal ID="cashier" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="bold">领款人</td>
            <td class="diy" colspan="2"></td>
            <td class="bold">领款日期</td>
            <td class="diy" colspan="2"></td>

        </tr>
        
	</table>
     <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server" OnClick="agreeButton_Click" />
     <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server" OnClick="disagreeButton_Click" />
     <br />  
     <asp:TextBox ID="whyDisagree" runat="server" Text="若不同意请注明理由：" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>   
     <br /><asp:Literal ID="processShow" runat="server"></asp:Literal>
 </div>

</asp:Content>
