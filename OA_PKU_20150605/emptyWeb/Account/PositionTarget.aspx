<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="PositionTarget.aspx.cs" Inherits="Account_PositionTarget" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">岗位目标责任书</div>
        <table class="firstTable">
            <tr>
                <td class="bold">姓名</td>
                <td class="diy">
                    <asp:Literal ID="staffName" runat="server"></asp:Literal>
                </td>
                <td class="bold">岗位名称</td>
                <td class="diy">
                    <asp:Literal ID="position" runat="server"></asp:Literal>
                </td>
                <td class="bold">部门</td>
                <td class="diy">
                    <asp:Literal ID="department" runat="server"></asp:Literal>
                </td>                
            </tr>
            <tr>
                <td class="bold">直接主管</td>
                <td class="diy"><input name="leader" type="text" id="leader" class="Text" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="leader" ErrorMessage="直接主管不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator7"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="bold">原岗位级别</td>
                <td class="diy"><input name="formerPosition" type="text" id="formerPosition" class="Text" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="formerPosition" ErrorMessage="原岗位级别不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator6"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="bold">新聘岗位级别</td>
                <td class="diy"><input name="newPosition" type="text" id="newPosition" class="Text" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="newPosition" ErrorMessage="新聘岗位级别不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator4"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>                
            </tr>
            <tr>
                <td class="bold">考核期限</td>
                <td class="diy" colspan="2">
                    <input name="happenDate" type="text" id="happenDate" class="Text" runat="server" onClick="WdatePicker()"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="happenDate" ErrorMessage="开始日期不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator3"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="bold">至</td>
                <td class="diy" colspan="2"> 
                    <input name="happenDate" type="text" id="Text2" class="Text" runat="server" onClick="WdatePicker()"/>
                    
                </td>
            </tr>
            <tr>
                <td class="bold" colspan="3">岗位职责</td>
                <td class="bold" colspan="3">工作目标与主要任务</td>
            </tr>
            <tr>
                <td colspan="3" rowspan="3">
                    <asp:TextBox ID="duty" runat="server" TextMode="MultiLine" style="height:190px;"></asp:TextBox> 
                    <br /><asp:RequiredFieldValidator ControlToValidate="duty" ErrorMessage="职责不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator2"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td >最低经济指标-12万元</td>
                <td colspan="2" rowspan="3">
                    <asp:TextBox ID="target" runat="server" TextMode="MultiLine" style="height:190px;"></asp:TextBox>
                    <br /><asp:RequiredFieldValidator ControlToValidate="target" ErrorMessage="工作目标不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>一般经济指标-10万元</td>
            </tr>
            <tr>
                <td>最高经济指标-8万元</td>
            </tr>
            <tr>
                <td colspan="6">经营指标：“一般目标”</td>
            </tr>
            <tr>
                <td colspan="6">营业收入（万元）</td>
            </tr>
            <tr>
                <td colspan="6">
                    <table style="width:600px;">
                        <tr>
                            <td>1月</td>
                            <td>2月</td>
                            <td>3月</td>
                            <td>4月</td>
                            <td>5月</td>
                            <td>6月</td>
                            <td>7月</td>
                            <td>8月</td>
                            <td>9月</td>
                            <td>10月</td>
                            <td>11月</td>
                            <td>12月</td>
                        </tr>
                        <tr>
                            <td><input name="january" type="text" id="january" class="Short"/></td>
                            <td><input name="february" type="text" id="february" class="Short"/></td>
                            <td><input name="march" type="text" id="march" class="Short"/></td>
                            <td><input name="april" type="text" id="april" class="Short"/></td>
                            <td><input name="may" type="text" id="may" class="Short"/></td>
                            <td><input name="june" type="text" id="june" class="Short"/></td>
                            <td><input name="july" type="text" id="july" class="Short"/></td>
                            <td><input name="august" type="text" id="august" class="Short"/></td>
                            <td><input name="september" type="text" id="september" class="Short"/></td>
                            <td><input name="october" type="text" id="october" class="Short"/></td>
                            <td><input name="november" type="text" id="november" class="Short"/></td>
                            <td><input name="december" type="text" id="december" class="Short"/></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">工资级别</td>
                <td colspan="3"><input name="salaryLevel" type="text" id="salaryLevel" class="Text" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="salaryLevel" ErrorMessage="工资级别不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator5"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
         </table>
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click"/>
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>

</asp:Content>
