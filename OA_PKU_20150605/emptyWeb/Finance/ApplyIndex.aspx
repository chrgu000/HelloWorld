<%@ Page Language="C#" StyleSheetTheme="login" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="ApplyIndex.aspx.cs" Inherits="Finance_ApplyIndex" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">请选择申请类型</div>
        <table class="firstTable">
            <tr>
                <td>
                    <asp:DropDownList ID="applyType" runat="server" OnSelectedIndexChanged="applyType_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Selected="True">财务申请</asp:ListItem>
                        <asp:ListItem>其他申请</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:DropDownList id="detailList" runat="server" >                     
                                                             
                                <asp:ListItem>年度经费概算</asp:ListItem>
                                <asp:ListItem>到款分配-校内</asp:ListItem> 
                                <asp:ListItem>到款分配-校外</asp:ListItem>  
                                <asp:ListItem Selected="True">费用报销</asp:ListItem>
                                <asp:ListItem>出差申请</asp:ListItem>
                                <asp:ListItem>出差报销</asp:ListItem> 
                                <asp:ListItem>出差总结</asp:ListItem>
                                <asp:ListItem>办公用品申购</asp:ListItem> 
                                <asp:ListItem>资金使用审批</asp:ListItem> 
                                <asp:ListItem>合同审批</asp:ListItem> 
                                <asp:ListItem>员工用餐</asp:ListItem> 
                                <asp:ListItem>固定资产报修</asp:ListItem> 
                                <asp:ListItem>统一结算申请</asp:ListItem>
                                <asp:ListItem>工资表</asp:ListItem>                                  
                            </asp:DropDownList>            
                        </ContentTemplate>            
                    </asp:UpdatePanel>   
                    
                </td>                
            </tr>
            <tr><td></td><td></td></tr>
            <tr>
                <td colspan="2">
                    <asp:Button text="确认" id="redictor" 
                        style="width:80px;height:30px;position: relative;
    display: inline-block;
    min-width: 30px;
    max-width: 200px;
    word-break: break-all;
    word-wrap: break-word;
    min-height: 22px;
    background: #3399FF;
    border-radius: 15px;
    margin-bottom: 20px;
    
    -webkit-box-shadow: 0px 1px 2px #000, inset 0px 4px 4px rgba(0,0,0,.3), inset 0px -4px 4px rgba(87,213,224,.5);
    -moz-shadow: 0px 1px 2px #000, inset 0px 4px 4px rgba(0,0,0,.3), inset 0px -4px 4px rgba(87,213,224,.5);
    box-shadow: 0px 1px 2px #000, inset 0px 4px 4px rgba(0,0,0,.3), inset 0px -4px 4px rgba(87,213,224,.5);" 
                        runat="server" OnClick="redictButton_Click"/>
                    
                </td>

            </tr>
        </table>

    </div>


</asp:Content>