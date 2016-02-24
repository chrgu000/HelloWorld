<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="BusinessTripApplyShow.aspx.cs" Inherits="Finance_BusinessTripApplyShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <div class="outTable" >  
         <div id="test" runat="server">
        <div class="titlehead">出差申请表</div>   
        <table class="firstTable" >
            <tr>
                <td class="bold">姓名</td>
                <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
                <td class="bold">部门</td>
                <td class="diy">
                    <asp:Literal ID="department" runat="server"></asp:Literal>
                </td>
                <td class="bold">申请日期</td>
                <td class="diy"><asp:Literal ID="applyDate" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">出差日期</td>
                <td colspan="3"><asp:Literal ID="startDate" runat="server"></asp:Literal>
                    至<asp:Literal ID="endDate" runat="server"></asp:Literal>
                </td>
                <td class="bold">所属项目</td>
                <td class="diy">
                    <asp:Literal ID="projectName" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="bold">随行人员、出差地点及事由</td>
                <td colspan="5">
                    <asp:Literal ID="reason" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="bold">交通费（飞机、火车、轮船）(预算)</td>
                <td colspan="5">
                   <asp:Literal ID="traffic" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="bold">车费（市内和外地地铁、打的费等）(预算)</td>
                <td colspan="5">
                   <asp:Literal ID="cars" runat="server"> </asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="bold">住宿费(预算)</td>
                <td colspan="5">
                    <asp:Literal ID="hotel" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="bold">餐费(预算)</td>
                <td colspan="5">
                   <asp:Literal ID="meal" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="bold">其他（邮费、礼品等不可预见)(预算)</td>
                <td colspan="5">
                    <asp:Literal ID="others" runat="server"> </asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="bold">预借现金合计</td>
                <td class="diy"><asp:Literal ID="moneyEstimate" runat="server"></asp:Literal></td>    
                <td class="bold">领款人：</td>
                <td class="diy"><asp:Literal ID="Literal1" runat="server"></asp:Literal></td>                
                            
                <td class="bold">报销账号</td>
                <td class="diy">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:DropDownList ID="accountList" runat="server" Enabled="false">
                            </asp:DropDownList>            
                        </ContentTemplate>            
                    </asp:UpdatePanel> 

                </td>
            </tr>
            <tr>
                <td class="bold">项目经理</td>
                <td class="diy"><asp:Literal ID="proManager" runat="server"></asp:Literal></td> 
                <td class="bold">部门经理</td>
                <td class="diy"><asp:Literal ID="depManager" runat="server"></asp:Literal></td>                
                <td class="bold">财务主管</td>
                <td class="diy"><asp:Literal ID="financial" runat="server"></asp:Literal></td>                               
            </tr>
        </table>
       </div>
        <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server" OnClick="agreeButton_Click"/>
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server" OnClick="disagreeButton_Click"/> 
        <asp:Button ID="printBtn" class="noSubmitButton"  Text="打印" runat="server"  Visible="false"  OnClick="printBtn_Click"/>
        <br /><asp:TextBox ID="whyDisagree" runat="server" Text="若不同意请注明理由：" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>   
        <br /><asp:Literal ID="processShow" runat="server"></asp:Literal>
    </div>
</asp:Content>
