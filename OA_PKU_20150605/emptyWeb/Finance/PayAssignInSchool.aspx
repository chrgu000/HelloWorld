<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="PayAssignInSchool.aspx.cs" Inherits="Finance_PayAssignInSchool" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div id="PayAssignInfo" class="outTable">
        <div class="titlehead">到款分配表</div><br />
        <table id="PayAssignTable" class="firstTable">
            <tr>
                <td class="bold">所在院系</td>
                <td class="diy">
                    <asp:DropDownList ID="schoolList" runat="server">
                       <asp:ListItem>地球与空间科学学院</asp:ListItem>
                        <asp:ListItem>先进技术研究院</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="bold">项目名称</td>
                <td class="diy">
                    <asp:DropDownList ID="projectNameList" runat="server" class="project">
                    </asp:DropDownList>
                </td>
                <td class="bold">负责人</td>
                <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal>

                </td>
            </tr>
            <tr>
                <td class="bold">付款单位</td>
                <td colspan="5"><input name="payee" type="text" id="payee" class="Text" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="payee" ErrorMessage="付款单位不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator5"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">到款额</td>
                <td class="diy">
                    <asp:TextBox runat="server" name="payed" type="text" id="payed" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="validatorMoney" ControlToValidate="payed" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>
                <td class="bold">收入额</td>
                <td class="diy">
                    <asp:TextBox runat="server" name="income" type="text" id="income" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator1" ControlToValidate="income" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>
                <td class="bold">分配额</td>
                <td class="diy">
                    <asp:TextBox runat="server" name="assigned" type="text" id="assigned" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator2" ControlToValidate="assigned" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>
            </tr>
            <tr>
                <td class="bold">外拨+校内仪器</td>
                <td class="diy">
                    <asp:TextBox runat="server" name="instrument" type="text" id="instrument" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator3" ControlToValidate="instrument" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>
                <td class="bold">代购硬件</td>
                <td class="diy">
                    <asp:TextBox runat="server" name="hardware" type="text" id="hardware" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator4" ControlToValidate="hardware" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>
                <td class="bold">经费号</td>
                <td class="diy"><input name="fundingID" type="text" id="fundingID" class="Text" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="fundingID" ErrorMessage="经费号不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>管理费</td>
                <td colspan="5">
                    <asp:TextBox runat="server" name="management" type="text" id="management" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator5" ControlToValidate="management" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>
            </tr>
            <tr>
                <td class="bold">劳务费</td>
                <td class="diy" colspan="5">
                    <asp:TextBox runat="server" name="labor" type="text" id="labor" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator6" ControlToValidate="labor" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>               
                
            </tr>
            <tr>
                <td class="bold">咨询费</td>
                <td class="diy" colspan="5">
                    <asp:TextBox runat="server" name="consult" type="text" id="consult" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator7" ControlToValidate="consult" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>
            </tr>
            <tr>
                <td class="bold">营业税金及附加</td>
                <td class="diy" colspan="5">
                    <asp:TextBox runat="server" name="businessTax" type="text" id="businessTax" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator8" ControlToValidate="businessTax" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>
            </tr>
            <tr>
                <td class="bold">增值税</td>
                <td class="diy" colspan="5">
                    <asp:TextBox runat="server" name="addedValueTax" type="text" id="addedValueTax" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator9" ControlToValidate="addedValueTax" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />
                </td>
            </tr>
            <tr>
                <td class="bold">备注</td>
                <td class="diy" colspan="5">
                    <asp:TextBox ID="note" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                </td>
            </tr>
        </table>
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click"/>
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>

    </asp:Content>
