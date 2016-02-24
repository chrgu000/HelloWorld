<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="PerformancePersonal.aspx.cs" Inherits="Account_PerformancePersonal" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
	<div class="titlehead">员工绩效明细</div>
	<table class="firstTable">
        <tr>
            <td class="bold">姓名</td>
            <td class="diy"><input name="staffName" type="text" id="staffName" class="Text" runat="server"/>
                <br /><asp:RequiredFieldValidator ControlToValidate="staffName" ErrorMessage="员工姓名不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator4"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>            
            <td class="bold">部门</td>
            <td class="diy">
                <asp:DropDownList ID="depList" runat="server">
                </asp:DropDownList>
            </td>            
        </tr>        

        <tr>
          <td class="bold">第一周</td>
          <td class="diy"><input name="week1" type="text" id="week1" class="Text" runat="server"/>
              <br /><asp:RequiredFieldValidator ControlToValidate="week1" ErrorMessage="绩效成绩不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
          </td>
          <td class="bold">第二周</td>
          <td class="diy"><input name="week2" type="text" id="week2" class="Text" runat="server"/>
              <br /><asp:RequiredFieldValidator ControlToValidate="week2" ErrorMessage="绩效成绩不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator2"  Display="Dynamic"></asp:RequiredFieldValidator>
          </td>    
                 
        </tr>      
        <tr>
            <td class="bold">第三周</td>
            <td class="diy"><input name="week3" type="text" id="week3" class="Text" runat="server"/>
                <br /><asp:RequiredFieldValidator ControlToValidate="week3" ErrorMessage="绩效成绩不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator3"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>  
            <td class="bold">第四周</td>
            <td class="diy"><input name="week4" type="text" id="week4" class="Text" runat="server"/>
                <br /><asp:RequiredFieldValidator ControlToValidate="week4" ErrorMessage="绩效成绩不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator5"  Display="Dynamic"></asp:RequiredFieldValidator>
            </td>        
            
        </tr> 
       
	</table>
     <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click"/>
     <asp:Button ID="finish" text="录入完毕" class="noSubmitButton"  runat="server" OnClick="finish_Click"/>
 </div>

</asp:Content>