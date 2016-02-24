<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="LeaveApplyShow.aspx.cs" Inherits="Account_LeaveApplyShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">

    <div class="outTable">
        <div class="titlehead">请假单</div>
        <table class="firstTable">
          <tr>
              <td class="bold">姓名</td>
              <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
              <td class="bold">部门</td>
              <td class="diy"> <asp:Literal ID="department" runat="server"></asp:Literal></td>
              <td width="122px">申请时间</td>
              <td class="diy"><asp:Literal ID="applyDate" runat="server"></asp:Literal></td>
          </tr>
          <tr>
              <td colspan="6">
                  请假时间：<asp:Literal ID="durings" runat="server"></asp:Literal>
              </td>
          </tr>
          <tr>
              <td colspan="6">
                  <table class="innerTable">
                      <tr>
                          <td rowspan="3" style="text-align:left">
                              <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" Width="450px" RepeatLayout="Flow" >
                                  <asp:ListItem >事假</asp:ListItem>
                                  <asp:ListItem >病假</asp:ListItem>
                                  <asp:ListItem >产假</asp:ListItem>
                                  <asp:ListItem>带薪年假</asp:ListItem>
                                  <asp:ListItem>丧假</asp:ListItem>
                                  <asp:ListItem>婚嫁</asp:ListItem>
                                  <asp:ListItem>探亲假</asp:ListItem>
                                  <asp:ListItem>其他</asp:ListItem>
                              </asp:RadioButtonList><br /><br />
                              <asp:Literal ID="reason" runat="server"></asp:Literal>
                          </td>
                          <td class="bold">项目经理</td>
                          <td class="diy"><asp:Literal ID="proManager" runat="server"></asp:Literal></td>
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
        <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server"  OnClick="agreeButton_Click" />
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server" OnClick="disagreeButton_Click" />
        <br /><asp:TextBox ID="processShow" runat="server" Style="height:80px;width:500px"></asp:TextBox>
    </div>
</asp:Content>
