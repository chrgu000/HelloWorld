<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master"  AutoEventWireup="true" CodeFile="BusinessTripSummary.aspx.cs" Inherits="Finance_BusinessTripSummary" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">出差总结报告</div>
        <table class="firstTable">
            <tr>
                <td class="bold">姓名</td>
                <td class="diy">
                    <asp:Literal ID="staffName" runat="server"></asp:Literal>
                </td>
                <td class="bold">部门</td>
                <td class="diy">
                    <asp:Literal ID="department" runat="server"></asp:Literal>
                </td> 
                 <td class="bold">所属项目</td>
                <td class="diy">
                     <asp:DropDownList ID="projectNameList" runat="server" class="project" >
                    </asp:DropDownList>
                </td>               
            </tr>
            <tr>
                <td class="bold">出差日期</td>
                <td colspan="5"><input name="startDate" type="text" id="startDate" class="Text" runat="server" onClick="WdatePicker()"/>
                    至<input name="endDate" type="text" id="endDate" class="Text" runat="server" onClick="WdatePicker()"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="startDate" ErrorMessage="开始日期不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator2"  Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator3" ControlToValidate="endDate" ErrorMessage="结束日期不能为空" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
               
            </tr>
            <tr>
                <td class="bold">出差地点或客户名称</td>
                <td colspan="5">
                    <input name="location" type="text" id="location" class="Text" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="location" ErrorMessage="出差地点或客户名称不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">费用</td>
                <td colspan="5">
                   <asp:TextBox ID="expense" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                    <br /><asp:RequiredFieldValidator ControlToValidate="expense" ErrorMessage="费用不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator4"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">行程</td>
                <td colspan="5">
                   <asp:TextBox ID="travels" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                <br /><asp:RequiredFieldValidator ControlToValidate="travels" ErrorMessage="行程不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator5"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold" colspan="6">出差总结</td>                
            </tr>
            <tr>
                <td class="bold">出差目的</td>
                <td colspan="5">
                   <asp:TextBox ID="reason" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                   <br /><asp:RequiredFieldValidator ControlToValidate="reason" ErrorMessage="出差事由不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator6"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">已完成工作内容</td>
                <td colspan="5">
                    <asp:TextBox ID="finished" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                    <br /><asp:RequiredFieldValidator ControlToValidate="finished" ErrorMessage="已完成工作内容不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator7"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td class="bold">未完成工作内容</td>
                <td colspan="5">
                    <asp:TextBox ID="unfinished" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                    <br /><asp:RequiredFieldValidator ControlToValidate="unfinished" ErrorMessage="未完成内容不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator8"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>            
        </table>
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click"/>
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>

 </asp:Content>
