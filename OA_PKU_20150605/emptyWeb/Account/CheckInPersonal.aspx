<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master"  AutoEventWireup="true" CodeFile="CheckInPersonal.aspx.cs" Inherits="Account_CheckInPersonal" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
	<div class="titlehead">员工考勤明细</div>
	<table class="firstTable">
        <tr>
            <td class="bold">姓名</td>
            <td class="diy"><input name="staffName" type="text" id="staffName" class="Text" runat="server"/>
                <br /><asp:RequiredFieldValidator ControlToValidate="staffName" ErrorMessage="员工姓名不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator5"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>            
            <td class="bold">部门</td>
            <td class="diy">
                <asp:DropDownList ID="depList" runat="server">
                </asp:DropDownList>
            </td>
            <td class="bold">入职时间</td>
            <td class="diy">
                <input name="startDate" type="text" id="startDate" class="Text" runat="server" onClick="WdatePicker()"/>
                <br /><asp:RequiredFieldValidator ControlToValidate="startDate" ErrorMessage="入职时间不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="bold">应出勤天数</td>
            <td class="diy"><input name="shouldBe" type="text" id="shouldBe" class="Text" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ControlToValidate="shouldBe" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator1" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="天数只能是数字" Display="Dynamic" />
            </td>            
            <td class="bold">实际出勤天数</td>
            <td class="diy"><input name="actualBe" type="text" id="actualBe" class="Text" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ControlToValidate="actualBe" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator2" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="天数只能是数字" Display="Dynamic" />
            </td>
            <td class="bold">10分钟以内</td>
            <td class="diy"><input name="innerTen" type="text" id="innerTen" class="Text" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ControlToValidate="innerTen" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator3" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="天数只能是数字" Display="Dynamic" />
            </td>
        </tr> 
        <tr>
            <td class="bold">10~30分钟</td>
            <td class="diy"><input name="innerThirty" type="text" id="innerThirty" class="Text" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ControlToValidate="innerThirty" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator4" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="天数只能是数字" Display="Dynamic" />
            </td>
            <td class="bold">30分钟以上</td>
            <td class="diy"><input name="overThirty" type="text" id="overThirty" class="Text" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ControlToValidate="overThirty" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator5" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="天数只能是数字" Display="Dynamic" />
            </td>            
            <td class="bold">迟到/早退（次数）</td>
            <td class="diy"><input name="late" type="text" id="late" class="Text" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ControlToValidate="late" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator6" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="天数只能是数字" Display="Dynamic" />
            </td>
            
        </tr> 

        <tr>
          <td class="bold">丧假（天）</td>
          <td class="diy"><input name="funeral" type="text" id="funeral" class="Text" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ControlToValidate="funeral" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator7" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="天数只能是数字" Display="Dynamic" />
          </td>
          <td class="bold">病假（天）</td>
          <td class="diy"><input name="sick" type="text" id="sick" class="Text" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ControlToValidate="sick" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator8" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="天数只能是数字" Display="Dynamic" />
          </td>       
          <td class="bold">事假</td>
          <td class="diy"><input name="matter" type="text" id="matter" class="Text" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ControlToValidate="matter" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator9" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="天数只能是数字" Display="Dynamic" />
          </td>         
        </tr>      
        <tr>
            <td class="bold">考勤绩效加减分</td>
            <td class="diy"><input name="performance" type="text" id="performance" class="Text" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ControlToValidate="performance" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator10" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="天数只能是数字" Display="Dynamic" />
            </td>
            <td class="bold">年末结余假（小时）</td>
            <td class="diy"><input name="remaining" type="text" id="remaining" class="Text" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ControlToValidate="remaining" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator11" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="小时只能是数字" Display="Dynamic" />
            </td>            
            <td class="bold">本月加班（小时）</td>
            <td class="diy"><input name="overTime" type="text" id="overTime" class="Text" runat="server"/>
                                <br />
                <asp:RegularExpressionValidator ControlToValidate="overTime" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator12" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="小时只能是数字" Display="Dynamic" />
            </td>
            
        </tr> 
        <tr>
            <td class="bold">本月调休（小时）</td>
            <td class="diy"><input name="shift" type="text" id="shift" class="Text" runat="server"/>
                                <br />
                <asp:RegularExpressionValidator ControlToValidate="shift" style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator13" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="小时只能是数字" Display="Dynamic" />
            </td>
            
        
        </tr> 
	</table>
     <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click"/>
        <asp:Button ID="finish" text="录入完毕" class="noSubmitButton"  runat="server" OnClick="finish_Click"/>
 </div>

</asp:Content>
