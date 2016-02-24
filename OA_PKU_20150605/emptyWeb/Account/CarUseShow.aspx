<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="CarUseShow.aspx.cs" Inherits="Account_CarUseShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div id="test" runat="server">
        <div class="titlehead">车辆使用登记表</div>
        <table class="firstTable">
            <tr>
                <td class="bold">申请人</td>
                <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
                <td class="bold">部门</td>
                <td class="diy"><asp:Literal ID="department" runat="server"></asp:Literal></td>
                <td class="bold">随行人数</td>
                <td class="diy"><asp:Literal ID="alongCount" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">计划用车时间</td>
                <td colspan="5"><asp:Literal ID="timeInUse" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">乘坐人员</td>
                <td colspan="5"><asp:Literal ID="alongName" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">目的地</td>
                <td colspan="5"><asp:Literal ID="destination" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">用车事由</td>
                <td colspan="5"><asp:Literal ID="reason" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">司机姓名</td>
                <td colspan="2"><asp:Literal ID="driver" runat="server"></asp:Literal></td>
                <td class="bold">车牌号</td>
                <td colspan="2"><asp:Literal ID="carNum" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">行车记录</td>
                <td colspan="5">
                   <table class="innerTable" id="itemList">
                                    <tr>                                        
                                        <td class="diy" >目的地</td>
                                        <td class="bold">所用时间</td>
                                        <td class="diy">行车后里程数</td>                
                                        <td class="diy">行车前里程数</td>
                                    </tr>
                                    <asp:Literal ID="recordList" runat="server" />                    
                                </table> 

                </td>
            </tr>
           
            <tr>
                <td class="bold">备注</td>
                <td colspan="5">
                     <asp:Literal ID="note" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
            <td class="bold">部门经理</td>
            <td class="diy" colspan="2"><asp:Literal ID="proManager" runat="server"></asp:Literal></td>
            <td class="bold">机构负责人</td>
            <td class="diy" colspan="2"><asp:Literal ID="company" runat="server"></asp:Literal></td>
        </tr>
        </table></div>
        <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server"  OnClick="agreeButton_Click" />
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server"  OnClick="disagreeButton_Click" />
        <asp:Button ID="printBtn" class="noSubmitButton"  Text="打印" runat="server"  Visible="false" OnClick="printBtn_Click"/>
        <br />  
        <asp:TextBox ID="whyDisagree" runat="server" Text="若不同意请注明理由：" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>   
        <br /><asp:Literal ID="processShow" runat="server"></asp:Literal>
    </div>


</asp:Content>
