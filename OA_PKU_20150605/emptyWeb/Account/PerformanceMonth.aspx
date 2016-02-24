<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master"  AutoEventWireup="true" CodeFile="PerformanceMonth.aspx.cs" Inherits="Account_PerformanceMonth" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
	<div class="titlehead">新增员工月度绩效</div>
	<table class="firstTable">
        <tr>                       
            <td class="bold">请选择考核月份</td>
            <td class="diy">
                <input name="ApplyDate" type="text" id="ApplyDate" class="Text" runat="server" onClick="WdatePicker()"/>
            </td>
        </tr>        
        
	</table>
     <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click"/>
 </div>

</asp:Content>