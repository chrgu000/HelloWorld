<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="CheckInShow.aspx.cs" Inherits="Account_CheckInShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div id="projectRei" class="outTable">
        <div class="titlehead">考勤表</div>
        <table class="firstTable" style="width:800px">
            <tr>
                <td class="bold">部门</td>
                <td class="bold">姓名</td>
                <td class="bold">入职时间</td>
                <td class="bold">应出勤天数</td>
                <td class="bold">实际出勤天数</td>
                 
                <td class="bold">10分钟以内</td> 
                <td class="bold">10分钟以上30分钟以内</td>
                <td class="bold">30分钟以上</td>

                <td class="bold">迟到/早退（次数）</td>

                <td class="bold">丧假</td>
                <td class="bold">病假</td> 
                <td class="bold">事假</td> 

                <td class="bold">考勤绩效加减分</td>
                <td class="bold">年末结余假（小时）</td>
                <td class="bold">本月加班（小时）</td>
                <td class="bold">本月调休（小时）</td>
                <td class="bold">本月末结余假（小时）</td>
            </tr>
            <asp:Literal ID="checkInList" runat="server" />         

        </table>
        
    </div>


</asp:Content>
