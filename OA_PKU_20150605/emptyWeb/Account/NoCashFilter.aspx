<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="NoCashFilter.aspx.cs" Inherits="Account_NoCashFilter" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">历史表单查询</div>
        <table class="firstTable">
            <tr>               

                <td>
                    <asp:CheckBox ID="staff"  Text="申请人" runat="server"/>
                    <input name="staffName" type="text" id="staffName" class="Text" runat="server"/>
                </td>  
                <td>
                    <asp:CheckBox ID="sheetType"  Text="表单类型" runat="server" Checked="true" Enabled="false"/>
                    <asp:DropDownList ID="typeList" runat="server"></asp:DropDownList>
                </td>              
            </tr>
            <tr>
                <td colspan="2">
                    <asp:CheckBox ID="happenDate"  Text="填表时间" runat="server" Enabled="false" Checked="true"/>
                    <input name="reimburseDate" type="text" id="startDate" class="Text" runat="server" onClick="WdatePicker()"/>
                    <asp:RequiredFieldValidator ControlToValidate="startDate" ErrorMessage="日期不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator6"  Display="Dynamic"></asp:RequiredFieldValidator>
                    至<input name="reimburseDate" type="text" id="endDate" class="Text" runat="server" onClick="WdatePicker()"/>
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