<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="ProjectAdd.aspx.cs" Inherits="Finance_ProjectAdd" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">项目信息表</div>
        <table class="firstTable">
            <tr>
                <td class="bold">项目编号</td>
                <td class="diy"><input name="projectCode" type="text" id="projectCode" class="Text" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="projectCode" ErrorMessage="项目编号不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator5"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="bold">项目经理</td>
                <td class="diy"><input name="manager" type="text" id="manager_txt" class="Text" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="manager_txt" ErrorMessage="项目经理不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="bold">成本预算</td>
                <td class="diy"><input name="budget" type="text" id="budget_txt" class="Text" runat="server"/>
                    <br />
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="validatorMoney" ControlToValidate="budget_txt" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td class="bold">申请日期</td>
                <td class="diy">
                    <asp:Literal ID="applyDate" runat="server"></asp:Literal>
                </td>
                <td class="bold">项目账号</td>
                <td class="diy"><input name="projectAccount_txt" type="text" id="projectAccount_txt" class="Text" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="projectAccount_txt" ErrorMessage="项目账号不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator4"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="bold">已到账</td>
                <td class="diy">
                    <input name="collected" type="text" id="collected_txt" class="Text" runat="server"/>
                    <br />
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator1" ControlToValidate="collected_txt" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td class="bold">项目名称</td>
                <td colspan="3" style="padding:0"><input name="projectName" type="text" id="projectName" class="Text" style=" width:350px;" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="projectName" ErrorMessage="项目名称不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator2"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="bold">所属部门</td>
                <td>
                    <asp:DropDownList ID="depList" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="bold">项目摘要</td>
                <td colspan="5" style="height:200px">
                    <asp:TextBox ID="remarkBox" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                    <br /><asp:RequiredFieldValidator ControlToValidate="remarkBox" ErrorMessage="项目摘要不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator3"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">项目成员</td>
                <td colspan="5" style="height:200px">
                    <asp:TextBox ID="memberList" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                <br /><asp:RequiredFieldValidator ControlToValidate="memberList" ErrorMessage="项目成员不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator6"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <div class="buttonLay">
            <input type="submit" name="SubmitForm" value="确认" id="SubmitForm" class="Button" />
            <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />  
        </div>
    </div>


</asp:Content>