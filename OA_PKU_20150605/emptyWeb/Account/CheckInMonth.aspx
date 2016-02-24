<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master"  AutoEventWireup="true" CodeFile="CheckInMonth.aspx.cs" Inherits="Account_CheckInMonth" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
	<div class="titlehead">新建考勤表</div>
	<table class="firstTable">
        <tr>                       
            <td class="bold">请选择考勤表时间</td>
            <td class="diy">
                <input name="ApplyDate" type="text" id="ApplyDate" class="Text" runat="server" onClick="WdatePicker()"/>
            </td>
        </tr>        
        
	</table>
     <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click"/>
 </div>

</asp:Content>

