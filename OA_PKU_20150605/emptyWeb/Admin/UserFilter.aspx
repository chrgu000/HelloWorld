<%@ Page Language="C#"  StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="UserFilter.aspx.cs" Inherits="Admin_UserFilter" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">用户管理（管理职位，涉及权限）</div><br />      
        <table class="firstTable">
            <tr>
                <td style="text-align:left">
                    <asp:CheckBox ID="department"  Text="部门" runat="server"/>
                    <asp:DropDownList ID="depList" runat="server"></asp:DropDownList>
                </td>

                <td>
                    <asp:CheckBox ID="staff"  Text="姓名" runat="server"/>
                    <input name="staffName" type="text" id="staffName" class="Text" runat="server"/>
                </td>  
                <td>
                    <asp:CheckBox ID="position"  Text="职位" runat="server"/>
                    <asp:DropDownList ID="posList" runat="server"></asp:DropDownList>
                </td>              
            </tr>
            <tr>                
                <td>
                    <asp:CheckBox ID="title"  Text="职称" runat="server"/>
                    <asp:DropDownList id="titleList" runat="server">
                       <asp:ListItem Text="无" Value="无" Selected="True"></asp:ListItem>
                       <asp:ListItem Text="教授" Value="教授" ></asp:ListItem>
                       <asp:ListItem Text="副教授" Value="副教授"></asp:ListItem>
                       <asp:ListItem Text="讲师" Value="讲师"></asp:ListItem>
                       <asp:ListItem Text="助教" Value="助教"></asp:ListItem>
                       <asp:ListItem Text="高级工程师" Value="高级工程师"></asp:ListItem>
                       <asp:ListItem Text="工程师" Value="工程师"></asp:ListItem>
                       <asp:ListItem Text="助理工程师" Value="助理工程师"></asp:ListItem>
                       <asp:ListItem Text="技术员" Value="技术员"></asp:ListItem>
                       <asp:ListItem Text="研究员" Value="研究员"></asp:ListItem>
                       <asp:ListItem Text="副研究员" Value="副研究员"></asp:ListItem>
                       <asp:ListItem Text="助理研究员" Value="助理研究员"></asp:ListItem>
                       <asp:ListItem Text="研究员" Value="研究员"></asp:ListItem>
                       <asp:ListItem Text="研究员" Value="研究员"></asp:ListItem>
                   </asp:DropDownList>
                </td>
                <td colspan="2">
                    <asp:CheckBox ID="enterDate"  Text="入职时间" runat="server"/>
                    <input name="startDate" type="text" id="startDate" class="Text" runat="server" onClick="WdatePicker()"/>
                    至<input name="endDate" type="text" id="endDate" class="Text" runat="server" onClick="WdatePicker()"/>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:CheckBox ID="onJob"  Text="在职状态" runat="server"/>
                    <asp:DropDownList ID="onJobList" runat="server">
                        <asp:ListItem Text="在职" Value="true"></asp:ListItem>
                       <asp:ListItem Text="离职" Value="false"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    
                    <asp:LinkButton ID="linkFilter" Text="查询" runat="server" OnClick="linkFilter_Click"></asp:LinkButton>
                </td>
            </tr>
    </table>

        
    </div>


</asp:Content>
