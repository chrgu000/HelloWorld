<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="SalaryPersonal.aspx.cs" Inherits="Finance_SalaryPersonal" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
	<div class="titlehead">员工工资明细</div>
	<table class="firstTable">
        <tr>
            <td class="bold">姓名</td>
            <td class="diy"><input name="staffName" type="text" id="staffName" class="Text" runat="server"/>
                <br /><asp:RequiredFieldValidator ControlToValidate="staffName" ErrorMessage="员工姓名不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator2"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>            
            <td class="bold">部门</td>
            <td class="diy">
                <asp:DropDownList ID="depList" runat="server">
                </asp:DropDownList>
            </td>
            <td class="bold">日期</td>
            <td class="diy">
                <asp:Literal ID="applyDate" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="bold">基本工资</td>
            <td class="diy"><input name="basicSalary" type="text" id="basicSalary" class="Text" runat="server"/>
                <br />
              <asp:RegularExpressionValidator ControlToValidate="basicSalary" ErrorMessage="金额只能是数字" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator8" ValidationExpression="^[1-9]\d*(\.\d+)?$"  Display="Dynamic" />
            </td>            
            <td class="bold">绩效工资</td>
            <td class="diy"><input name="performanceSalary" type="text" id="performanceSalary" class="Text" runat="server"/>
                <br />
              <asp:RegularExpressionValidator ControlToValidate="performanceSalary" ErrorMessage="金额只能是数字" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator7" ValidationExpression="^[1-9]\d*(\.\d+)?$"  Display="Dynamic" />
            </td>
            <td class="bold">其他扣款</td>
            <td class="diy"><input name="otherWithHold" type="text" id="otherWithHold" class="Text" runat="server"/>
                <br />
              <asp:RegularExpressionValidator ControlToValidate="otherWithHold" ErrorMessage="金额只能是数字" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator6" ValidationExpression="^[1-9]\d*(\.\d+)?$"  Display="Dynamic" />
            </td>
        </tr> 
        <tr>
            <td class="bold">其他增项</td>
            <td class="diy"><input name="otherBonus" type="text" id="otherBonus" class="Text" runat="server"/>
                <br />
              <asp:RegularExpressionValidator ControlToValidate="otherBonus" ErrorMessage="金额只能是数字" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator5" ValidationExpression="^[1-9]\d*(\.\d+)?$"  Display="Dynamic" />
            </td>
            <td class="bold">养老</td>
            <td class="diy"><input name="endowment" type="text" id="endowment" class="Text" runat="server"/>
                <br />
              <asp:RegularExpressionValidator ControlToValidate="endowment" ErrorMessage="金额只能是数字" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator4" ValidationExpression="^[1-9]\d*(\.\d+)?$"  Display="Dynamic" />
            </td>            
            <td class="bold">失业</td>
            <td class="diy"><input name="unemployed" type="text" id="unemployed" class="Text" runat="server"/>
                <br />
              <asp:RegularExpressionValidator ControlToValidate="unemployed" ErrorMessage="金额只能是数字" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator3" ValidationExpression="^[1-9]\d*(\.\d+)?$"  Display="Dynamic" />
            </td>
            
        </tr> 

        <tr>
          <td class="bold">医疗</td>
          <td class="diy"><input name="medical" type="text" id="medical" class="Text" runat="server"/>
              <br />
              <asp:RegularExpressionValidator ControlToValidate="medical" ErrorMessage="金额只能是数字" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator2" ValidationExpression="^[1-9]\d*(\.\d+)?$"  Display="Dynamic" />
          </td>
          <td class="bold">住房基金</td>
          <td class="diy"><input name="house" type="text" id="house" class="Text" runat="server"/>
              <br />
              <asp:RegularExpressionValidator ControlToValidate="house" ErrorMessage="金额只能是数字" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator1" ValidationExpression="^[1-9]\d*(\.\d+)?$"  Display="Dynamic" />
          </td>       
          <td class="bold">备注</td>
          <td class="diy"><asp:TextBox ID="remark" runat="server" AutoPostBack="true" OnTextChanged="remark_TextChanged"></asp:TextBox>

          </td>         
        </tr>      
             
	</table>
     <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click"/>
     <asp:Button ID="finish" text="录入完毕" class="noSubmitButton"  runat="server" OnClick="finish_Click"/>
 </div>

</asp:Content>