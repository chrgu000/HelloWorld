<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="EntertainApply.aspx.cs" Inherits="Finance_EntertainApply" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">宴请申请单</div>
        <table class="firstTable">
            <tr>
                <td class="bold">申请部门</td>
                <td class="diy">
                    <asp:DropDownList ID="depList" runat="server" OnSelectedIndexChanged="depList_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="bold">申请日期</td>
                <td class="diy">
                    <input name="applyDate" type="text" id="applyDate" class="Text" runat="server" onClick="WdatePicker()"/>
                </td>
            </tr>
            <tr>
                <td class="bold">经办人</td>
                <td class="diy"><input name="staffName" type="text" id="staffName" class="Text" /></td>
                <td class="bold">部门经理</td>
                <td class="diy">
                    <asp:UpdatePanel ID="managerShow" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Literal ID="manager" runat="server"></asp:Literal>            
                        </ContentTemplate>            
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="bold">宴请时间</td>
                <td class="diy">
                    <input name="treatDate" type="text" id="treatDate" class="Text" runat="server" onClick="WdatePicker()"/>
                </td>
                <td class="bold">宴请标准</td>
                <td class="diy"><input name="treatStandard" type="text" id="treatStandard" class="Text" /></td>
            </tr>
            <tr>
                <td class="bold">宴请事由</td>
                <td colspan="3"><input name="reason" type="text" id="reason" class="longTd" /></td>
            </tr>
            <tr>
                <td class="bold">宴请对象</td>
                <td colspan="3"><input name="treated" type="text" id="treated" class="longTd" /></td>
            </tr>
            <tr>
                <td class="bold">宴请费用预算</td>
                <td colspan="3">
                    <asp:TextBox runat="server" name="budget" type="text" id="budget" class="longTd"></asp:TextBox>
                                        <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="validatorMoney" ControlToValidate="budget" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />

                </td>
            </tr>
            <tr>
                <td class="bold">宴请结算方式</td>
                <td colspan="3">
                    <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" Width="350px" RepeatLayout="Flow">
                        <asp:ListItem>支票</asp:ListItem>
                        <asp:ListItem>现金</asp:ListItem>
                        <asp:ListItem>签单(合作餐厅)请注明：</asp:ListItem>
                    </asp:RadioButtonList>
                    <input name="treatStyle" type="text" id="treatStyle" class="Text" />
                </td>
            </tr>
            <tr>
                <td class="bold">机构负责人</td>
                <td class="diy"></td>
                <td class="bold">综合管理部</td>
                <td class="diy"></td>
            </tr>
        </table>
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click" />
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>

 </asp:Content>
