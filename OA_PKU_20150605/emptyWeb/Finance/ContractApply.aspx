<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="ContractApply.aspx.cs" Inherits="Finance_ContractApply" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">合同审批单</div>
        <table class="firstTable">
            <tr>
                <td class="bold">申请人</td>
                <td class="diy"><asp:Literal ID="staffName" runat="server"></asp:Literal></td>
                <td class="bold">部门</td>
                <td class="diy">
                    <asp:Literal ID="department" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="bold">合同名称</td>
                <td><input name="contractName" type="text" id="contractName" class="Text" runat="server"/>
                    <br /><asp:RequiredFieldValidator ControlToValidate="contractName" ErrorMessage="合同名称不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator4"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                 <td class="bold">合同总金额</td>
                <td>
                    <asp:TextBox runat="server" name="money" type="text" id="money" class="Text"></asp:TextBox>
                    <asp:RegularExpressionValidator style="color:red;font-size:12px" runat="server" ID="validatorMoney" ControlToValidate="money" ValidationExpression="^[1-9]\d*(\.\d+)?$" ErrorMessage="金额只能是数字" Display="Static" />

                </td>
            </tr>
            <tr>                
                <td class="bold">所属项目</td>
                <td class="diy">
                    <asp:DropDownList ID="projectNameList" class="project" runat="server" OnSelectedIndexChanged="projectNameList_SelectedIndexChanged" AutoPostBack="true" >
                    </asp:DropDownList>
                </td>
                <td class="bold">项目编号</td>
                <td class="diy">                    
                    <asp:UpdatePanel ID="projectCodeShow" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Literal ID="projectCode" runat="server"></asp:Literal>            
                        </ContentTemplate>            
                    </asp:UpdatePanel> 
                </td>
            </tr>
            <tr>
                <td class="bold">对方单位名称</td>
                <td colspan="3">
                    <table class="innerTable">
                        <tr>
                            <td class="longTd"><input name="partyBName" type="text" id="partyBName" class="longTd" runat="server"/>
                                <br /><asp:RequiredFieldValidator ControlToValidate="partyBName" ErrorMessage="单位名称不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                            <td class="bold">联系人</td>
                            <td class="diy"><input name="partyBContact" type="text" id="partyBContact" class="Text" runat="server"/>
                                <br /><asp:RequiredFieldValidator ControlToValidate="partyBContact" ErrorMessage="联系人不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator2"  Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </td>

            </tr>
            <tr>
                <td class="bold">对方单位地址</td>
                <td colspan="3">
                    <table class="innerTable">
                        <tr>
                            <td class="longTd"><input name="partyBAddress" type="text" id="partyBAddress" class="longTd" runat="server"/>
                                <br /><asp:RequiredFieldValidator ControlToValidate="partyBAddress" ErrorMessage="对方单位地址不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator3"  Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                            <td class="bold">电话</td>
                            <td class="diy"><input name="partyBTelephone" type="text" id="partyBTelephone" class="Text" runat="server"/>
                                <br /><asp:RequiredFieldValidator ControlToValidate="partyBTelephone" ErrorMessage="电话不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator5"  Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="4">对方主体资格审查</td>
            </tr>
            <tr>
                <td colspan="4" class="singleTd">
                    <asp:CheckBox id="businessLicense" runat="server"/>已取得对方营业执照、组织机构代码证、税务登记证复印件
                </td>
            </tr>
            <tr>
                <td colspan="4" class="singleTd">
                    <asp:CheckBox ID="industoryLicense" runat="server" />具备合同规定的行业相关资质和合法批准手续
                </td>
            </tr>
            <tr>
                <td colspan="4" class="singleTd">
                    <asp:CheckBox  ID="others" runat="server"/>其他<input name="otherInfo" type="text" id="otherInfo" class="Text" />
                </td>
            </tr>
            <!--
            <tr>
                <td class="bold">经办人意见</td>
                <td colspan="3">
                    <table class="innerTable">
                        <tr>
                            <td class="longTd" style="text-align:left">已通过对签约单位的生产规模、设备数量、商业信誉、产品质量的考察，符合我方合同目的</td>
                            <td class="diy" style="text-align:left">签名：</td>
                            <td class="diy">&nbsp;年&nbsp;月&nbsp;日</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="4">合同会签意见</td>
            </tr>
            <tr>
                <td class="bold">部门经理意见</td>
                <td colspan="3">
                    <table class="innerTable">
                        <tr>
                            <td class="longTd" style="text-align:left">经办部门认为合同主体及内容合法，质量及价格符合公司要求，主要条款具备，不具有不利于我司的因素及风险，可以签约及履行。</td>
                            <td class="diy" style="text-align:left">签名：</td>
                            <td class="diy">&nbsp;年&nbsp;月&nbsp;日</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="bold">法务部意见</td>
                <td colspan="3">
                    <table class="innerTable">
                        <tr>
                            <td class="longTd" style="text-align:left">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="150px" RepeatLayout="Flow">
                                    <asp:ListItem>同意</asp:ListItem>
                                    <asp:ListItem>暂不同意</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="diy" style="text-align:left">签名：</td>
                            <td class="diy">&nbsp;年&nbsp;月&nbsp;日</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="bold">财务部意见</td>
                <td colspan="3">
                    <table class="innerTable">
                        <tr>
                            <td class="longTd" style="text-align:left">
                                进行了财务预算、履行程序及付款条件等财务方面的审核。<br />
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" Width="150px">
                                    <asp:ListItem>同意</asp:ListItem>
                                    <asp:ListItem>暂不同意</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="diy" style="text-align:left">签名：</td>
                            <td class="diy">&nbsp;年&nbsp;月&nbsp;日</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="bold">机构负责人意见</td>
                <td colspan="3">
                    <table class="innerTable">
                        <tr>
                            <td class="longTd" style="text-align:left">
                                <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" Width="150px">
                                    <asp:ListItem>同意</asp:ListItem>
                                    <asp:ListItem>暂不同意</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="diy" style="text-align:left">签名：</td>
                            <td class="diy">&nbsp;年&nbsp;月&nbsp;日</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="bold">管委会意见</td>
                <td colspan="3">
                    <table class="innerTable">
                        <tr>
                            <td class="longTd" style="text-align:left">
                                <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" Width="150px">
                                    <asp:ListItem>同意</asp:ListItem>
                                    <asp:ListItem>暂不同意</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="diy" style="text-align:left">签名：</td>
                            <td class="diy">&nbsp;年&nbsp;月&nbsp;日</td>
                        </tr>
                    </table>
                </td>
            </tr>-->

        </table>
        <asp:Button ID="confirmButton" text="确认" class="noSubmitButton"  runat="server" OnClick="confirmButton_Click"  />
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>

</asp:Content>