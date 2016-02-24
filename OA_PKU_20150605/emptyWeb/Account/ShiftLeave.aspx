<%@ Page Language="C#" StyleSheetTheme="personal" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="ShiftLeave.aspx.cs" Inherits="Account_ShiftLeave" %>


<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="overtimeInfo">
        <div class="titlehead"> 调休申请</div>
        <table id="overtimeTable">
            <tr>
                <td>
                    <table class="innerTable">
                        <tr>
                            <td class="bold">姓名</td>
                            <td class="diy"><input name="staffName" type="text" id="name" class="Text"/></td>
                            <td class="bold">部门</td>
                            <td class="diy">
                                <asp:DropDownList ID="depList" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td width="122px">申请时间</td>
                            <td class="diy"><input name="applyDate" type="text" id="applyDate" class="Text" runat="server" onClick="WdatePicker()"/></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>调休时间：<input name="startDate" type="text" id="startDate" runat="server" onClick="WdatePicker()"/>
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
                <td>
                    <table class="innerTable">
                        <tr>
                            <td rowspan="3" width="400px"><asp:TextBox ID="reason" height="80px" width="385px" runat="server" text="事由：" TextMode="MultiLine" OnTextChanged="reason_TextChanged"></asp:TextBox></td>
                            <td class="bold">项目经理</td>
                            <td class="diy">
                              <asp:DropDownList ID="proManagerList" runat="server">
                              </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="bold">部门经理</td>
                            <td class="diy">test</td>
                        </tr>
                        <tr>
                            <td class="bold">机构负责人</td>
                            <td class="diy">test</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Button ID="confirm" text="确认" class="noSubmitButton"  runat="server" OnClick="confirm_Click" />
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>


</asp:Content>
