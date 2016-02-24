<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="CashFlowFilter.aspx.cs" Inherits="Finance_CashFlowFilter" %>
<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">收支报表查询</div>
        <table class="firstTable">
            <tr>
                <td style="text-align:left">
                    <asp:CheckBox ID="department"  Text="部门" runat="server"/>
                    <asp:DropDownList ID="depList" runat="server"></asp:DropDownList>
                </td>

                <td>
                    <asp:CheckBox ID="staff"  Text="报销人" runat="server"/>
                    <input name="staffName" type="text" id="staffName" class="Text" runat="server"/>
                </td>  
                <td>
                    <asp:CheckBox ID="cashType"  Text="报销类型" runat="server"/>
                    <asp:DropDownList ID="typeList" runat="server"></asp:DropDownList>
                </td>              
            </tr>
            <tr>                
                <td>
                    <asp:CheckBox ID="projectAccount"  Text="报销账号" runat="server"/>
                    <asp:DropDownList ID="accountList" runat="server"></asp:DropDownList>
                </td>
                <td colspan="2">
                    <asp:CheckBox ID="happenDate"  Text="报销时间" runat="server"/>
                    <input name="reimburseDate" type="text" id="startDate" class="Text" runat="server" onClick="WdatePicker()"/>
                    至<input name="reimburseDate" type="text" id="endDate" class="Text" runat="server" onClick="WdatePicker()"/>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:CheckBox ID="project"  Text="项目" runat="server"/>
                    <asp:DropDownList ID="proList" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    
                    <asp:LinkButton ID="linkFilter" Text="查询" runat="server" OnClick="linkFilter_Click"></asp:LinkButton>
                </td>
            </tr>
    </table>


    </div>
</asp:Content>
