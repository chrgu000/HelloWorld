<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="BunisessTripRei.aspx.cs" Inherits="Finance_BunisessTripRei" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">出差报销表</div>
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
                <td class="bold">申请日期</td>
                <td class="diy">
                    <asp:Literal ID="applyDate" runat="server"></asp:Literal>                    
                </td>
            </tr>
            <tr>
                <td class="bold">出差日期</td>
                <td colspan="3"><input name="startDate" type="text" id="startDate" class="Text" runat="server" onClick="WdatePicker()"/>
                    至<input name="endDate" type="text" id="endDate" class="Text" runat="server" onClick="WdatePicker()"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="startDate" ErrorMessage="开始日期不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator2"  Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator3" ControlToValidate="endDate" ErrorMessage="结束日期不能为空" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="bold">所属项目</td>
                <td class="diy">
                     <asp:DropDownList ID="projectNameList" class="project" runat="server" OnSelectedIndexChanged="projectNameList_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="bold">随行人员、出差地点及事由</td>
                <td colspan="5">
                    <asp:TextBox ID="reason" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                    <br /><asp:RequiredFieldValidator ControlToValidate="reason" ErrorMessage="随行人员、出差地点及事由不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator4"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">交通费（飞机、火车、轮船）</td>
                <td colspan="5">
                   <asp:TextBox ID="traffic" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                   <br /><asp:RequiredFieldValidator ControlToValidate="traffic" ErrorMessage="交通费不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator5"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">车费（市内和外地地铁、打的费等）</td>
                <td colspan="5">
                   <asp:TextBox ID="cars" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                   <br /><asp:RequiredFieldValidator ControlToValidate="cars" ErrorMessage="车费不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator6"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">住宿费</td>
                <td colspan="5">
                    <asp:TextBox ID="hotels" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                    <br /><asp:RequiredFieldValidator ControlToValidate="hotels" ErrorMessage="住宿费不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator7"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">餐费</td>
                <td colspan="5">
                   <asp:TextBox ID="meal" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                    <br /><asp:RequiredFieldValidator ControlToValidate="meal" ErrorMessage="餐费不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator8"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">其他（邮费、礼品等不可预见）</td>
                <td colspan="5">
                    <asp:TextBox ID="others" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                    <br /><asp:RequiredFieldValidator ControlToValidate="others" ErrorMessage="其他不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator9"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">预借现金合计</td>
                <td class="diy">
                    <asp:TextBox runat="server" name="moneyEstimate" type="text" id="moneyEstimate" class="Text"></asp:TextBox>
                    <br />
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="validatorMoney" ControlToValidate="moneyEstimate" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Dynamic"/>
                </td>
                <td class="bold">实际报销金额</td>
                <td class="diy">
                    <asp:TextBox runat="server" name="moneyRei" type="text" id="moneyRei" class="Text"></asp:TextBox>
                    <br />
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator1" ControlToValidate="moneyRei" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Dynamic" />
                </td>
                <td class="bold">报销账号</td>
                <td class="diy">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:DropDownList ID="accountList" runat="server" Enabled="false">
                            </asp:DropDownList>            
                        </ContentTemplate>            
                    </asp:UpdatePanel> 

                </td>
            </tr>
        </table>
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click"/>
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>
</asp:Content>
