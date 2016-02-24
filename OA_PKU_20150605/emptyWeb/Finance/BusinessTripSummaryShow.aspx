<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="BusinessTripSummaryShow.aspx.cs" Inherits="Finance_BusinessTripSummaryShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">出差总结报告</div>
        <table class="firstTable">
            <tr>
                <td class="bold">姓名</td>
                <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
                <td class="bold">部门</td>
                <td class="diy"><asp:Literal ID="department" runat="server"></asp:Literal></td> 
                 <td class="bold">所属项目</td>
                <td class="diy"><asp:Literal ID="projectName" runat="server"></asp:Literal></td>               
            </tr>
            <tr>
                <td class="bold">出差日期</td>
                <td colspan="5"><asp:Literal ID="duringDate" runat="server"></asp:Literal></td>
               
            </tr>
            <tr>
                <td class="bold">出差地点或客户名称</td>
                <td colspan="5"><asp:Literal ID="location" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">费用</td>
                <td colspan="5"><asp:Literal ID="expense" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">行程</td>
                <td colspan="5"><asp:Literal ID="travel" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold" colspan="6">出差总结</td>                
            </tr>
            <tr>
                <td class="bold">出差目的</td>
                <td colspan="5"><asp:Literal ID="reason" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">已完成工作内容</td>
                <td colspan="5"><asp:Literal ID="finished" runat="server"></asp:Literal></td>
            </tr>
             <tr>
                <td class="bold">未完成工作内容</td>
                <td colspan="5"><asp:Literal ID="unfinished" runat="server"></asp:Literal></td>
            </tr>            
        </table>
        <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server" OnClick="agreeButton_Click"/>
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server" OnClick="disagreeButton_Click"/>
        <br />  
        <asp:TextBox ID="whyDisagree" runat="server" Text="若不同意请注明理由：" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>   
        <br /><asp:Literal ID="processShow" runat="server"></asp:Literal>
    </div>

 </asp:Content>
