<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="PositionTargetShow.aspx.cs" Inherits="Account_PositionTargetShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">岗位目标责任书</div>
        <table class="firstTable">
            <tr>
                <td class="bold">姓名</td>
                <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
                <td class="bold">岗位名称</td>
                <td class="diy"><asp:Literal ID="position" runat="server"></asp:Literal></td>
                <td class="bold">部门</td>
                <td class="diy"><asp:Literal ID="department" runat="server"></asp:Literal></td>                
            </tr>
            <tr>
                <td class="bold">直接主管</td>
                <td class="diy"><asp:Literal ID="leader" runat="server"></asp:Literal></td>
                <td class="bold">原岗位级别</td>
                <td class="diy"><asp:Literal ID="formerPosition" runat="server"></asp:Literal></td>
                <td class="bold">新聘岗位级别</td>
                <td class="diy"><asp:Literal ID="newPosition" runat="server"></asp:Literal></td>                
            </tr>
            <tr>
                <td class="bold">考核期限</td>
                <td class="diy" colspan="5">
                    <asp:Literal ID="year" runat="server"></asp:Literal>
                </td>                
            </tr>
            <tr>
                <td class="bold" colspan="3">岗位职责</td>
                <td class="bold" colspan="3">工作目标与主要任务</td>
            </tr>
            <tr>
                <td colspan="3" rowspan="3">
                    <asp:Literal ID="duty" runat="server"></asp:Literal>
                </td>
                <td >最低经济指标-12万元</td>
                <td colspan="2" rowspan="3">
                    <asp:Literal ID="target" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td>一般经济指标-10万元</td>
            </tr>
            <tr>
                <td>最高经济指标-8万元</td>
            </tr>
            <tr>
                <td colspan="6"><b>经营指标：“一般目标”</b></td>
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
                            <td><asp:Literal ID="january" runat="server" ></asp:Literal></td>
                            <td><asp:Literal ID="february" runat="server" ></asp:Literal></td>
                            <td><asp:Literal ID="march" runat="server"></asp:Literal></td>
                            <td><asp:Literal ID="april" runat="server"></asp:Literal></td>
                            <td><asp:Literal ID="may" runat="server" ></asp:Literal></td>
                            <td><asp:Literal ID="june" runat="server" ></asp:Literal></td>
                            <td><asp:Literal ID="july" runat="server" ></asp:Literal></td>
                            <td><asp:Literal ID="august" runat="server" ></asp:Literal></td>
                            <td><asp:Literal ID="september" runat="server" ></asp:Literal></td>
                            <td><asp:Literal ID="october" runat="server" ></asp:Literal></td>
                            <td><asp:Literal ID="november" runat="server" ></asp:Literal></td>
                            <td><asp:Literal ID="december" runat="server" ></asp:Literal></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">工资级别</td>
                <td colspan="3"><asp:Literal ID="salaryLevel" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="6"><b>责任确认（签字）</b></td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:left">本人确认履行以上岗位职责，努力实现确定的工作目标。<br /><br />
                    责任人（签名）：<br /><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;月&nbsp;&nbsp;日
                </td>
                <td colspan="3" style="text-align:left">上述职责和工作目标符合**发展规划与要求。<br /><br />
                    直接主管（签名）：<br /><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;月&nbsp;&nbsp;日
                </td>
            </tr>
         </table>
        <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server" OnClick="agreeButton_Click"/>
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server" OnClick="disagreeButton_Click"/>
        <br />  
        <asp:TextBox ID="whyDisagree" runat="server" Text="若不同意请注明理由：" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>   
        <br /><asp:Literal ID="processShow" runat="server"></asp:Literal>
    </div>

</asp:Content>
