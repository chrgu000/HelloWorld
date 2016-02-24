<%@ Page Language="C#" StyleSheetTheme="login" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="PersonalPerformanceIndex.aspx.cs" Inherits="Account_PersonalPerformanceIndex" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="outTable">
        <div class="titlehead">请选择查询条件</div>
        <table class="firstTable">
            <tr><td>查询类型</td><td>查询时间</td></tr>
            <tr>
                <td>
                    <asp:DropDownList ID="checkType" runat="server">
                        <asp:ListItem Selected="True">工资表</asp:ListItem>
                        <asp:ListItem>绩效表</asp:ListItem>
                        <asp:ListItem>考勤表</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>                   
                    <input name="monthFilter" type="text" id="monthFilter" class="Text" runat="server" onClick="WdatePicker()"/>
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
                        runat="server" OnClick="redictor_Click"/>
                    
                </td>

            </tr>
        </table>

    </div>


</asp:Content>