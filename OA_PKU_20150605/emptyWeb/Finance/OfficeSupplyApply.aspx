<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="OfficeSupplyApply.aspx.cs" Inherits="Finance_OfficeSupplyApply" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
	<div class="titlehead">办公用品购买申购单</div>
	<table class="firstTable">
        <tr>
            <td class="bold">申请人</td>
            <td class="diy">
                <asp:Literal ID="staffName" runat="server"></asp:Literal>
            </td>
            <td class="bold">部门</td>
            <td class="diy">
                <asp:Literal ID="department" runat="server"></asp:Literal>
            </td>
            <td class="bold">日期</td>
            <td class="diy">
                <asp:Literal ID="applyDate" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="bold">申请理由</td>
            <td colspan="5">
                <asp:TextBox ID="reason" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>
                <br /><asp:RequiredFieldValidator ControlToValidate="reason" ErrorMessage="申请理由不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator4"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="6">                
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table class="innerTable" id="itemList" runat="server">
                                <tr>
                                    <td class="diy">品名</td>
                                    <td class="diy">型号</td>
                                    <td class="bold">单价</td>
                                    <td class="bold">数量</td>
                                    <td style="width:150px">金额</td>
                                </tr>
                    
                            </table> 
                        </ContentTemplate>            
                </asp:UpdatePanel> 
            </td>
        </tr>
        <tr>
            <td class="bold">所属项目</td>
            <td class="diy" colspan="2">
                <asp:DropDownList ID="projectCodeList" class="project" runat="server" >
                </asp:DropDownList>
            </td>
            <td class="bold">金额小写:</td>
            <td class="diy" colspan="2">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Literal ID="allExpensive" runat="server"></asp:Literal>
                        </ContentTemplate>            
                </asp:UpdatePanel>               

            </td>

        </tr>
        <tr>
            <td class="bold">金额大写</td>
            <td class="diy" colspan="5">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                         <asp:Literal ID="allExpensiveUpper" runat="server"></asp:Literal>
                     </ContentTemplate>            
                </asp:UpdatePanel> 
                

            </td>
        </tr>
        
	</table>
     <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click" />
     <asp:Button ID="addRow" text="添加申购项" class="noSubmitButton"  runat="server" OnClick="addRow_Click"/>
     <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
 </div>

</asp:Content>