<%@ Page Language="C#" StyleSheetTheme="personal" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="ShiftLeaveShow.aspx.cs" Inherits="Account_ShiftLeaveShow" %>

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
                            <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
                            <td class="bold">部门</td>
                            <td class="diy"> <asp:Literal ID="department" runat="server"></asp:Literal></td>
                            <td width="122px">申请时间</td>
                            <td class="diy"><asp:Literal ID="applyDate" runat="server"></asp:Literal></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>调休时间：<asp:Literal ID="durings" runat="server"></asp:Literal> </td>
            </tr>
            <tr>
                <td>
                    <table class="innerTable">
                        <tr>
                            <td rowspan="3" width="400px"><asp:Literal ID="reason" runat="server"></asp:Literal></td>
                            <td class="bold">项目经理</td>
                            <td class="diy"></td>
                        </tr>
                        <tr>
                            <td class="bold">部门经理</td>
                            <td class="diy"></td>
                        </tr>
                        <tr>
                            <td class="bold">机构负责人</td>
                            <td class="diy"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server"  OnClick="agreeButton_Click" />
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server" OnClick="disagreeButton_Click" />
        <br /><asp:TextBox ID="processShow" runat="server" Style="height:80px;width:500px"></asp:TextBox>
    </div>


</asp:Content>
