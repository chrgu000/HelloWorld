<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="ProjectReimbursement.aspx.cs" Inherits="Finance_ProjectReimbursement" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="projectRei" class="outTable">
        <div class="titlehead">费用报销申请</div>
        <table id="projectReiTable" class="firstTable">
            <tr>
                <td class="bold">报销人</td>
                <td class="diy">
                    <asp:Literal ID="staffName" runat="server"></asp:Literal>
                </td>
                <td class="bold">部门</td>
                <td class="diy">
                    <asp:Literal ID="department" runat="server"></asp:Literal>
                </td>
                <td class="bold">项目负责人</td>
                <td class="diy">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Literal ID="manager" runat="server"></asp:Literal>            
                        </ContentTemplate>            
                    </asp:UpdatePanel>                  

                </td>
            </tr>
            <tr>
                <td class="bold">报销时间</td>
                <td class="diy">
                    <asp:Literal ID="applyDate" runat="server"></asp:Literal>
                </td>
                <td class="bold">发生日期</td>
                <td class="diy"><input name="happenDate" type="text" id="happenDate" class="Text" runat="server" onClick="WdatePicker()"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="happenDate" ErrorMessage="日期不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator2"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="bold">项目编号</td>
                <td class="diy">
                    <asp:DropDownList ID="projectCodeList" class="project" runat="server" OnSelectedIndexChanged="projectCodeList_SelectedIndexChanged" AutoPostBack="true" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="bold">摘要</td>
                <td colspan="5" style="height:200px">
                    <asp:TextBox ID="remarkBox" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                    <br /><asp:RequiredFieldValidator ControlToValidate="remarkBox" ErrorMessage="摘要不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">单据张数</td>
                <td class="diy"><input name="bill" type="text" id="bill" class="Text" runat="server"/>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator2" ControlToValidate="expense" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="张数只能是数字" Display="Static" />
                </td>
                <td class="bold">金额</td>
                <td class="diy">
                     <asp:TextBox runat="server" name="expense" type="text" id="expense" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="validatorMoney" ControlToValidate="expense" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>
                <td class="bold">合计</td>
                <td class="diy">
                    <asp:TextBox runat="server" name="allExpense" ID="allExpense" OnTextChanged="allExpense_TextChanged" AutoPostBack="true"></asp:TextBox>
                <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator1" ControlToValidate="allExpense" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>
            </tr>
            <tr>
                <td class="bold">金额大写</td>
                <td colspan="5">                    
                    <asp:UpdatePanel ID="capitalShow" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Literal ID="capital" runat="server"></asp:Literal>            
                        </ContentTemplate>            
                    </asp:UpdatePanel> 
                </td>
            </tr>            
            

        </table>
        <asp:Button text="确认" class="noSubmitButton"  runat="server" OnClick="redictor_Click" />
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>


</asp:Content>
