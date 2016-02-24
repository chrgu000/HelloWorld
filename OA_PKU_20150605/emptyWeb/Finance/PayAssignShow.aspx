<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="PayAssignShow.aspx.cs" Inherits="Finance_PayAssignShow" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div id="PayAssignInfo" class="outTable">
        <div class="titlehead">到款分配表</div><br />
        <table id="PayAssignTable" class="firstTable">
            <tr>
                <td class="bold">所在院系</td>
                <td class="diy">
                    <asp:Literal ID="school" runat="server"></asp:Literal>
                </td>
                <td class="bold">项目名称</td>
                <td class="diy">
                   <asp:Literal ID="projectName" runat="server"></asp:Literal>
                </td>
                <td class="bold">负责人</td>
                <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">付款单位</td>
                <td colspan="5"><asp:Literal ID="payee" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">到款额</td>
                <td class="diy"><asp:Literal ID="payed" runat="server"></asp:Literal></td>
                <td class="bold">收入额</td>
                <td class="diy"><asp:Literal ID="income" runat="server"></asp:Literal></td>
                <td class="bold">分配额</td>
                <td class="diy"><asp:Literal ID="assigned" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">外拨+校内仪器</td>
                <td class="diy"><asp:Literal ID="instrument" runat="server"></asp:Literal></td>
                <td class="bold">代购硬件</td>
                <td class="diy"><asp:Literal ID="hardware" runat="server"></asp:Literal></td>
                <td class="bold">经费号</td>
                <td class="diy"><asp:Literal ID="fundingID" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="6">根据《北京大学科技开发收入管理规定》按下列比例分配：</td>
            </tr>
            <tr>
                <td class="bold">上缴学校</td>
                <td class="bold" colspan="4"><asp:Literal ID="toUniversityDetail" runat="server"></asp:Literal></td>
                <td class="diy" >
                    <asp:Literal ID="toUniversity" runat="server"></asp:Literal>
                </td>               
                
            </tr>
            <tr>
                <td class="bold">上缴院、系、所</td>
                <td class="bold" colspan="4"><asp:Literal ID="toSchoolDetail" runat="server"></asp:Literal></td>
                <td class="diy"><asp:Literal ID="toSchool" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">发展基金</td>
                <td class="bold" colspan="4"><asp:Literal ID="fundingsDetail" runat="server"></asp:Literal></td>
                <td class="diy"><asp:Literal ID="fundings" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">福利及劳务费</td>
                <td class="bold" colspan="4"><asp:Literal ID="welfareDetail" runat="server"></asp:Literal></td>
                <td class="diy"><asp:Literal ID="welfare" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="bold">备注</td>
                <td class="diy" colspan="5">
                    <asp:Literal ID="note" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="bold">北京大学科技开发部（章）：</td>
                <td class="diy"></td>
                <td class="bold">负责人：</td>
                <td class="diy"></td>
                
                <td class="diy" colspan="2">&nbsp&nbsp&nbsp&nbsp年&nbsp&nbsp月&nbsp&nbsp日</td>
            </tr>
        </table>
        <asp:Button text="同意" name="agreeButton" ID="agreeButton" class="noSubmitButton"  runat="server" OnClick="agreeButton_Click"/>
        <asp:Button ID="disagreeButton" name="disagreeButton" text="不同意" class="noSubmitButton"  runat="server" OnClick="disagreeButton_Click"/>
        <br />
        <asp:TextBox ID="whyDisagree" runat="server" Text="若不同意请注明理由：" TextMode="MultiLine" style="height:190px;width:520px;"></asp:TextBox>   
        <br /><asp:Literal ID="processShow" runat="server" ></asp:Literal>
    </div>

    </asp:Content>