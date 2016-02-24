<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master"  AutoEventWireup="true" CodeFile="DismissApply.aspx.cs" Inherits="Account_DismissApply" %>


<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">离职申请表</div>
        <table class="firstTable">
            <tr>
                <td class="bold">姓名</td>
                <td class="diy"><input name="staffName" type="text" id="staffName" class="Text" /></td>
                <td class="bold">部门</td>
                <td class="diy">
                    <asp:DropDownList ID="depList" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="bold">事业部</td>
                <td class="diy">
                    <asp:DropDownList ID="buList" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="bold">入职时间</td>
                <td class="diy">
                    <input name="startDate" type="text" id="startDate" class="Text" runat="server" onClick="WdatePicker()"/>
                </td>
                <td class="bold">职位</td>
                <td class="diy">
                     <asp:DropDownList id="posList" runat="server">
                     </asp:DropDownList>
                </td>
                <td class="bold">离职时间</td>
                <td class="diy">
                    <input name="endDate" type="text" id="endDate" class="Text" runat="server" onClick="WdatePicker()"/>
                </td>
            </tr>
            <tr>
                <td class="bold">联系地址</td>
                <td colspan="3">
                    <input name="address" type="text" id="address" class="Text" />
                </td>
                <td class="bold">联系电话</td>
                <td class="diy"><input name="telephone" type="text" id="telephone" class="Text" /></td>
            </tr>
            <tr>
                <td class="bold">离职原因</td>
                <td colspan="5" style="height:80px;" class="singleTd">
                    <asp:RadioButtonList  ID="reason" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="自动辞职">自动辞职</asp:ListItem>
                        <asp:ListItem Value="公司辞退">公司辞退</asp:ListItem>
                        <asp:ListItem Value="其他原因">其他原因</asp:ListItem>
                    </asp:RadioButtonList><br /><br />
                    离职人员签字：<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日
                </td>
            </tr>
            <tr>
                <td colspan="6">办理离职手续流程</td>
            </tr>
            <tr>
                <td class="bold">本部门工作交接情况</td>
                <td colspan="5" class="singleTd" style="height:80px">
                    <br />
                    <asp:CheckBox  ID="handOver" Text="本职工作交接已完成" runat="server"/>
                    <asp:CheckBox  ID="returnThings" Text="文档、资料、数据、书刊已归还" runat="server"/>
                    <br />
                    其他说明:<br /><br /><br />
                    部门经理签字：<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日
                </td>
            </tr>
            <tr>
                <td class="bold">财务报销与借支情况</td>
                <td colspan="5" class="singleTd" style="height:80px">
                    <br />
                    <asp:CheckBox  ID="reimburse" Text="业务费用已报销完毕" runat="server"/>
                    <asp:CheckBox  ID="borrow" Text="借支款项已还清" runat="server"/>
                    <br />
                    其他说明:<br /><br /><br />
                    财务负责人签字：<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日
                </td>
            </tr>
            <tr>
                <td class="bold">办公用品与图书资料归还情况及综管办意见</td>
                <td colspan="5" class="singleTd" style="height:80px">
                    <br />
                    <asp:CheckBox  ID="removibleDisk" Text="移动盘已归还" runat="server"/>
                    <asp:CheckBox  ID="computer" Text="计算机已归还" runat="server"/>
                    <asp:CheckBox  ID="communication" Text="通讯设备已归还" runat="server"/>
                    <asp:CheckBox  ID="books" Text="借阅图书资料已归还" runat="server"/>
                    <asp:CheckBox  ID="reCheckHandOver" Text="复核部门交接工作" runat="server"/>
                    <asp:CheckBox  ID="keys" Text="办公桌（室）、书柜钥匙已归还" runat="server"/>
                    <asp:CheckBox  ID="officeThings" Text="个人所借办公用品已归还" runat="server"/>
                    <br />
                    其他说明:<br /><br /><br />
                    管委会办公室负责人签字：<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日
                </td>
            </tr>
            <tr>
                <td rowspan="2" class="bold">审批意见</td>
                <td class="singleTd" colspan="5" style="height:80px;">
                    <br /><br />
                    事业部经理签字：<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日
                </td>
            </tr>
            <tr>
                <td class="singleTd" colspan="5" style="height:80px">
                    <br /><br />
                    机构负责人签字：<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日
                </td>
            </tr>
        </table>
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click" />
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>

</asp:Content>