<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="LeaveApply.aspx.cs" Inherits="Account_LeaveApply" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">请假单</div>
        <table class="firstTable">
          <tr>
              <td class="bold">姓名</td>
              <td class="diy"><input name="staffName" type="text" id="name" class="Text"/></td>
              <td class="bold">部门</td>
              <td class="diy">
                  <asp:DropDownList ID="depList" runat="server">
                  </asp:DropDownList>
              </td>
              <td class="bold">时间</td>
              <td class="diy">
                  <input name="applyDate" type="text" id="applyDate" class="Text" runat="server" onClick="WdatePicker()"/>
              </td>
          </tr>
          <tr>
              <td colspan="6">
                  请假时间：<input name="startDate" type="text" id="startDate" runat="server" onClick="WdatePicker()"/>
                    <input name="startTime" type="text" id="startTime"/>时
                    至<input name="endDate" type="text" id="endDate"  runat="server" onClick="    WdatePicker()"/>
                    <input name="endTime" type="text" id="endTime" /> 时
                    <asp:UpdatePanel ID="duringsShow" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Literal ID="durings" runat="server"></asp:Literal>            
                        </ContentTemplate>            
                    </asp:UpdatePanel>
              </td>
          </tr>
          <tr>
              <td colspan="6">
                  <table class="innerTable">
                      <tr>
                          <td rowspan="3" style="text-align:left">
                              <asp:RadioButtonList id="leaveType" runat="server" RepeatDirection="Horizontal" Width="450px" RepeatLayout="Flow" >
                                  <asp:ListItem >事假</asp:ListItem>
                                  <asp:ListItem >病假</asp:ListItem>
                                  <asp:ListItem >产假</asp:ListItem>
                                  <asp:ListItem>带薪年假</asp:ListItem>
                                  <asp:ListItem>丧假</asp:ListItem>
                                  <asp:ListItem>婚嫁</asp:ListItem>
                                  <asp:ListItem>探亲假</asp:ListItem>
                                  <asp:ListItem>其他</asp:ListItem>
                              </asp:RadioButtonList><br /><br />
                              <asp:TextBox ID="reason" height="80px" width="385px" runat="server" text="详细说明：" TextMode="MultiLine" OnTextChanged="reason_TextChanged"></asp:TextBox>
                          </td>
                          <td class="bold">项目经理</td>
                          <td class="diy">
                              <asp:DropDownList ID="proManagerList" runat="server">
                              </asp:DropDownList>
                          </td>
                      </tr>
                      <tr>
                          <td class="bold">部门经理</td>
                          <td class="diy"></td>
                      </tr>
                          <td class="bold">机构负责人</td>
                          <td class="diy"></td>
                  </table>
              </td>
          </tr>


        </table>
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server"  OnClick="confirm_Click" />
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>
</asp:Content>