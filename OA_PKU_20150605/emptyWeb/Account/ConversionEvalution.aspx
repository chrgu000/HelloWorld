<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="ConversionEvalution.aspx.cs" Inherits="Account_ConversionEvalution" %>


<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">转正考核表</div><br />
        <table class="firstTable">
            <tr>
                <td class="bold">姓名</td>
                <td class="diy"></td>
                <td class="bold">部门</td>
                <td class="diy"></td>
                <td class="bold">职位</td>
                <td class="diy"></td>
            </tr>
             <tr>
                <td class="bold">入职时间</td>
                <td class="diy"></td>
                <td class="bold">转正时间</td>
                <td class="diy"></td>
                <td class="bold">部门经理</td>
                <td class="diy"></td>
            </tr>
            <tr>
                <td colspan="6">
                    <table class="innerTable">
                        <tr>
                            <td colspan="3" rowspan="2">考核内容</td>
                            <td colspan="2">部门经理考核结果</td>
                            <td  colspan="2">事业部经理考核结果</td>
                            <td rowspan="2">总评分</td>
                        </tr>
                        <tr>                            
                            <td class="smallCell">评级</td>
                            <td class="smallCell">评分</td>
                            <td class="smallCell">评级</td>
                            <td class="smallCell">评分</td>
                        </tr>
                        <tr>
                            <td  rowspan="3">能力（30分）</td>
                            <td class="midCell">理解能力</td>
                            <td class="longCell">理解能力强，反应敏捷</td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                        </tr>
                        <tr>
                            <td class="midCell">统筹能力</td>
                            <td class="longCell">善于统筹，条理性强</td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                        </tr>
                        <tr>
                            <td class="midCell">处理能力</td>
                            <td class="longCell">处理及时妥当</td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                        </tr>
                        <tr>
                            <td rowspan="6">状态（60分）</td>
                            <td class="midCell">工作态度</td>
                            <td class="longCell">积极主动</td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                        </tr>
                        <tr>
                            <td class="midCell">工作作风</td>
                            <td class="longCell">反应迅速，行动快</td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                        </tr>
                        <tr>
                            <td class="midCell">协作配合力</td>
                            <td class="longCell">服从意识强，积极主动</td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                        </tr>
                        <tr>
                            <td class="midCell">纪律性</td>
                            <td class="longCell">严格要求，纪律性强</td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                        </tr>
                        <tr>
                            <td class="midCell">责任心</td>
                            <td class="longCell">认真负责，兢兢业业</td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                        </tr>
                        <tr>
                            <td class="midCell">吃苦精神</td>
                            <td class="longCell">吃苦耐劳</td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                        </tr>
                        <tr>
                            <td  rowspan="2">效果（10分）</td>
                            <td class="midCell">工作效率</td>
                            <td class="longCell">效率高</td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                        </tr>
                        <tr>
                            <td class="midCell">工作质量</td>
                            <td class="longCell">质量高</td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                            <td class="smallCell"></td>
                        </tr>
                        <tr>
                            <td colspan="8">评级：A．好；B. 较好；C. 一般；D. 较差</td>
                        </tr>
                        <tr>
                            <td colspan="7">综合考评得分</td>
                            <td class="smallCell"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="bold">部门经理考核意见及建议</td>
                <td colspan="5"></td>
            </tr>
            <tr>
                <td class="bold">事业部经理考核意见及建议</td>
                <td colspan="5"></td>
            </tr>
            <tr>
                <td class="bold">办公会议讨论意见</td>
                <td colspan="5"></td>
            </tr>
            <tr>
                <td colspan="6">考核审批</td>
            </tr>
            
            <tr>
                <td colspan="6">
                    <table class="innerTable">
                        <tr>
                            <td style="width:200px">部门经理意见</td>
                            <td style="width:200px">事业部经理意见</td>
                            <td style="width:200px">机构负责人意见</td>                     
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>日期</td>
                            <td>日期</td>
                            <td>日期</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
