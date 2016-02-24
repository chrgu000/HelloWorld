<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="StaffMealApplyShow.aspx.cs" Inherits="Finance_StaffMealApplyShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">员工用餐申请单</div>
        <table class="firstTable">
            <tr>
                <td class="bold">经办人</td>
                <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
                <td class="bold">部门</td>
                <td class="diy"><asp:Literal ID="department" runat="server"></asp:Literal></td>
                <td class="bold">职务</td>
                <td class="diy"><asp:Literal ID="position" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">用餐人数</td>
                <td class="diy"><asp:Literal ID="persons" runat="server"></asp:Literal></td>
                <td class="bold">用餐时间</td>
                <td class="diy"><asp:Literal ID="mealDate" runat="server"></asp:Literal></td>
                <td class="bold">金额</td>
                <td class="diy"><asp:Literal ID="money" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">用餐事由</td>
                <td colspan="5"><asp:Literal ID="reason" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">用餐标准</td>
                <td colspan="5"><asp:Literal ID="standard" runat="server"></asp:Literal></td>
            </tr>
                        <tr>
                <td class="bold">是否符合公司规定</td>
                <td colspan="5">
                    <asp:RadioButtonList ID="legal" runat="server" RepeatDirection="Horizontal" Width="450px" RepeatLayout="Flow">
                        <asp:ListItem>是</asp:ListItem>
                        <asp:ListItem>否</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="bold">用餐结算方式</td>
                <td colspan="5">
                    <asp:RadioButtonList ID="style" runat="server" RepeatDirection="Horizontal" Width="450px" RepeatLayout="Flow">
                        <asp:ListItem>自付现金</asp:ListItem>
                        <asp:ListItem>出纳处领款</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            
            <tr>
                <td class="bold">部门经理</td>
                <td class="diy" colspan="2"><asp:Literal ID="depManager" runat="server"></asp:Literal></td>
                <td class="bold">机构负责人</td>
                <td class="diy" colspan="2"><asp:Literal ID="company" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">领款人</td>
                <td class="diy" colspan="2"></td>
                <td class="bold">领款时间</td>
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
