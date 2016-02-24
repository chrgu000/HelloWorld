<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="SalaryShow.aspx.cs" Inherits="Finance_SalaryShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="projectRei" class="outTable">
        <div class="titlehead">工资表</div>
        <table id="projectReiTable" class="firstTable" style="width:800px">
            <tr>
                <td class="bold" rowspan="2">序号</td>
                <td class="bold" rowspan="2">部门</td>
                <td class="bold" rowspan="2">姓名</td>
                <td class="bold" colspan="6">应发工资</td>
                <td class="bold" colspan="5">扣除额</td>
                <td></td>
                <td class="bold" colspan="3">应交个人所得税</td>
                <td class="bold" rowspan="2">实发工资</td>
                <td class="bold" rowspan="2">备注</td>
            </tr>
            <tr>
                <td class="bold">基本工资</td>
                <td class="bold">绩效工资</td>
                <td class="bold">绩效工资20%</td>
                <td class="bold">其他扣款</td>
                <td class="bold">其他增项</td> 
                <td class="bold">小计</td> 

                <td class="bold">养老</td>
                <td class="bold">失业</td>
                <td class="bold">医疗</td>
                <td class="bold">住房基金</td>
                <td class="bold">社保小计（个人扣除部分）</td> 

                <td class="bold">计税收入（扣款后小计）</td> 

                <td class="bold">税率</td>
                <td class="bold">速算扣除数</td>
                <td class="bold">应交个人所得税</td>


            </tr>
            
            <asp:Literal ID="salaryList" runat="server" />         
            <tr>
                <td class="bold" colspan="3">审批</td>
                <td class="bold" colspan="2">项目经理</td>                             
                <td class="diy" colspan="3"><asp:Literal ID="proManager" runat="server"></asp:Literal></td>
                <td class="bold">部门经理</td>
                <td class="diy" colspan="3"><asp:Literal ID="depManager" runat="server"></asp:Literal></td>
                <td class="bold">财务主管</td>
                <td class="diy" colspan="3"><asp:Literal ID="financial" runat="server"></asp:Literal></td>
                <td class="bold">机构负责人</td>
                <td class="diy" colspan="3"><asp:Literal ID="company" runat="server"></asp:Literal></td>
            </tr>
        </table>
        <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server" OnClick="agreeButton_Click"/>
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server" OnClick="disagreeButton_Click" />
        <br /><asp:Button ID="cashierButton" Text="可以记账" runat="server"  class="noSubmitButton" OnClick="cashierButton_Click"/>
        <asp:Button ID="rejectButton" name="rejectButton" text="学校未通过" class="noSubmitButton"  runat="server" OnClick="rejectButton_Click"/>
        <br />  
        <asp:TextBox ID="whyDisagree" runat="server" Text="若不同意请注明理由：" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>   
        <br /><asp:Literal ID="processShow" runat="server"></asp:Literal>
    </div>


</asp:Content>
