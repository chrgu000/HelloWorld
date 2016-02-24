<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="PerformanceShow.aspx.cs" Inherits="Account_PerformanceShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div id="projectRei" class="outTable">
        <div class="titlehead">考勤表</div>
        <table class="firstTable" style="width:800px">
            <tr>
                <td class="bold">序号</td>
                <td class="bold">部门</td>
                <td class="bold">姓名</td>

                <td class="bold">月份</td>
                <td class="bold">第一周</td>
                <td class="bold">第二周</td> 
                <td class="bold">第三周</td>
                <td class="bold">第四周</td>

                <td class="bold">周平均分</td>
                
            </tr>
            <asp:Literal ID="performanceList" runat="server" />         

        </table>
        
    </div>


</asp:Content>
