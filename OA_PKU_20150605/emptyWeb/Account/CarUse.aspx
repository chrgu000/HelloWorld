<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="CarUse.aspx.cs" Inherits="Account_CarUse" %>


<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">车辆使用登记表</div>
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
                <td class="bold">随行人数</td>
                <td class="diy"><input name="alongCount" type="text" id="alongCount" class="Text" runat="server"/>
                    <br />
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="RegularExpressionValidator1" ControlToValidate="alongCount" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="人数只能是数字" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td class="bold">计划用车时间</td>
                <td colspan="5">
                    <input name="startDate" type="text" id="startDate" class="Text" runat="server" onClick="WdatePicker()"/>
                    至<input name="endDate" type="text" id="endDate" class="Text" runat="server" onClick="WdatePicker()"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="startDate" ErrorMessage="开始日期不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator2"  Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator3" ControlToValidate="endDate" ErrorMessage="结束日期不能为空" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">乘坐人员</td>
                <td colspan="5">
                    <asp:TextBox ID="alongName" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                    <br /><asp:RequiredFieldValidator ControlToValidate="alongName" ErrorMessage="乘坐人员不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator6"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">目的地</td>
                <td colspan="5"><input name="destination" type="text" id="destination" class="longTd" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="destination" ErrorMessage="目的地不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">用车事由</td>
                <td colspan="5">
                    <asp:TextBox ID="reason" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                    <br /><asp:RequiredFieldValidator ControlToValidate="reason" ErrorMessage="用车事由不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator4"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">司机姓名</td>
                <td colspan="2"><input name="driver" type="text" id="driver" class="Text" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="driver" ErrorMessage="司机姓名不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator5"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="bold">车牌号</td>
                <td colspan="2"><input name="carNum" type="text" id="carNum" class="Text" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="carNum" ErrorMessage="车牌号 不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator7"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="bold">行车记录</td>
                <td colspan="5">
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table class="innerTable" id="itemList" runat="server">
                                    <tr>                                        
                                        <td class="diy" >目的地</td>
                                        <td class="bold">所用时间</td>
                                        <td class="diy">行车后里程数</td>                
                                        <td class="diy">行车前里程数</td>
                                    </tr>                    
                                </table> 
                            </ContentTemplate>            
                    </asp:UpdatePanel>
                </td>
            </tr>
           
            <tr>
                <td class="bold">备注</td>
                <td colspan="5">
                    <asp:TextBox ID="note" runat="server" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox> 
                </td>
            </tr>
        </table>
       
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click" />
        <asp:Button ID="addRow" text="添加记录" class="noSubmitButton"  runat="server" OnClick="addRow_Click"/>
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>


</asp:Content>