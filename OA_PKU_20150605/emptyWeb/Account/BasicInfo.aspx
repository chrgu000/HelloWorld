<%@ Page Language="C#" AutoEventWireup="true" StyleSheetTheme="personal" MasterPageFile="~/Finance/User.master" CodeFile="BasicInfo.aspx.cs" Inherits="Acount_BasicInfo" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">基本信息</div><br />
        <table class="firstTable" >
            <tr>
                <td >
                    <table class="innerTable" id="basic" >
                        <tr>
                          <td class="bold">姓名</td>
                          <td class="diy" ><asp:Literal ID="staffName" runat="server" /></td>
                          <td class="bold">曾用名</td>
                          <td class="diy" ><asp:Literal ID="oldName" runat="server" /></td>
                          <td rowspan="5"></td> 
                         </tr>
                        <tr>
                          <td class="bold">性别</td>
                          <td class="diy" ><asp:Literal ID="gender" runat="server" /></td>
                          <td class="bold">民族</td>
                          <td class="diy" ><asp:Literal ID="race" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="bold">所属机构</td>
                            <td class="diy"><asp:Literal ID="company" runat="server" /></td>
                            <td class="bold">部门</td>
                            <td class="diy"><asp:Literal ID="department" runat="server" /></td>
                        </tr>
                        <tr>
                          <td class="bold">职务</td>
                          <td class="diy" ><asp:Literal ID="position" runat="server" /></td>
                          <td class="bold">职称</td>
                          <td class="diy" ><asp:Literal ID="title" runat="server" /></td> 
                         </tr>
                        <tr>
                          <td class="bold">籍贯</td>
                          <td class="diy" ><asp:Literal ID="native" runat="server" /></td>
                          <td class="bold">出生日期</td>
                          <td class="diy" ><asp:Literal ID="birth" runat="server" /></td> 
                         </tr>
                         <tr>
                          <td class="bold">政治面貌</td>
                          <td class="diy" ><asp:Literal ID="political" runat="server" /></td>
                          <td class="bold">学历</td>
                          <td class="diy" ><asp:Literal ID="education" runat="server" /></td> 
                         </tr>
                    </table>
                </td>  
                
            </tr>    
            <tr>
              <td>
                  <table class="innerTable" id="long">                      
                    <tr>
                        <td class="bold">现住址</td>
                        <td class="addr"><asp:Literal ID="address" runat="server" /></td>              
                    </tr>
                    
                    <tr>
                        <td class="bold">档案存放地</td>
                        <td class="addr"><asp:Literal ID="fileAddr" runat="server" /></td>              
                    </tr>                  
                   
                  </table>
              </td>         
             </tr>
            <tr>
                 <td>
                     <table class="innerTable" id="splitTwo">

                        <tr>
                          <td class="bold">本人联系方式</td>
                          <td class="partTwo"><asp:Literal ID="contact" runat="server" /></td>
                          <td class="bold">邮箱</td>
                          <td class="partTwo"><asp:Literal ID="mail" runat="server" /></td>
                        </tr>
                        <tr>
                          <td class="bold">婚姻状况</td>
                          <td class="partTwo"><asp:Literal ID="marriage" runat="server" /></td>
                          <td class="bold">身份证号</td>
                          <td class="partTwo"><asp:Literal ID="identifyID" runat="server" /></td>
                        </tr>
                        
                        <tr>
                          <td class="bold">毕业院校</td>
                          <td class="partTwo"><asp:Literal ID="school" runat="server" /></td>
                          <td class="bold">专业</td>
                          <td class="partTwo"><asp:Literal ID="major" runat="server" /></td>
                        </tr>
                        <tr>
                          <td class="bold">外语语种</td>
                          <td class="partTwo"><asp:Literal ID="foreignLan" runat="server" /></td>
                          <td class="bold">外语水平</td>
                          <td class="partTwo"><asp:Literal ID="foreignLev" runat="server" /></td>
                        </tr>
                        <tr>
                          <td class="bold">紧急联系人</td>
                          <td class="partTwo"><asp:Literal ID="urgenPerson" runat="server" /></td>
                          <td class="bold">紧急联系方式</td>
                          <td class="partTwo"><asp:Literal ID="urgenContact" runat="server" /></td>
                        </tr>
                     </table>
                 </td>
            </tr>
                        
        </table>
        <asp:Button ID="confirm" text="编辑" class="noSubmitButton"  runat="server" OnClick="confirm_Click"/>
    </div>


 </asp:Content>
