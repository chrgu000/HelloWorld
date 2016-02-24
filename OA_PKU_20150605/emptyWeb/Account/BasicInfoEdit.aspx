<%@ Page Language="C#" StyleSheetTheme="personal" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="BasicInfoEdit.aspx.cs" Inherits="Account_BasicInfoEdit" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    <div class="outTable">
        <div class="titlehead">基本信息</div>
        <table class="firstTable">
            <tr>
              <td>姓名：</td>
              <td><input name="staffName" type="text" id="staffName" class="Text" runat="server"/>
                  <br /><asp:RequiredFieldValidator ControlToValidate="staffName" ErrorMessage="姓名不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator6"  Display="Dynamic"></asp:RequiredFieldValidator>
              </td>    
            </tr>
            <tr>
              <td>曾用名：</td>
              <td><input name="oldName" type="text" id="oldName" class="Text" runat="server"/></td>    
            </tr>
             <tr>
                <td>在职状态：</td>
                <td>
                     <asp:RadioButtonList ID="onJob" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Enabled="false">
                    <asp:ListItem Selected="True">在职</asp:ListItem>
                    <asp:ListItem>离职</asp:ListItem>
                </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
              <td>性别</td>
              <td><br />
                <asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Selected="True">男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:RadioButtonList>
              </td>    
            </tr>
            <tr>
                <td>民族</td>
                <td>
                    <asp:DropDownList ID="raceList" runat="server">
                    <asp:ListItem Text="汉族" Value="汉族" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="阿昌族" Value="阿昌族"></asp:ListItem>
                    <asp:ListItem Text="白族" Value="白族"></asp:ListItem>
                    <asp:ListItem Text="保安族" Value="保安族"></asp:ListItem> 
                    <asp:ListItem Text="布朗族" Value="布朗族"></asp:ListItem>
                    <asp:ListItem Text="布依族" Value="布依族"></asp:ListItem>
                    <asp:ListItem Text="朝鲜族" Value="朝鲜族"></asp:ListItem>
                    <asp:ListItem Text="达斡尔族" Value="达斡尔族"></asp:ListItem>
                    <asp:ListItem Text="傣族" Value="傣族"></asp:ListItem>
                    <asp:ListItem Text="德昂族" Value="德昂族"></asp:ListItem>
                    <asp:ListItem Text="侗族" Value="侗族"></asp:ListItem>
                    <asp:ListItem Text="东乡族" Value="东乡族"></asp:ListItem>
                    <asp:ListItem Text="独龙族" Value="独龙族"></asp:ListItem>
                    <asp:ListItem Text="鄂伦春族" Value="鄂伦春族"></asp:ListItem>
                    <asp:ListItem Text="俄罗斯族" Value="俄罗斯族"></asp:ListItem>
                    <asp:ListItem Text="鄂温克族" Value="鄂温克族"></asp:ListItem>
                    <asp:ListItem Text="高山族" Value="高山族"></asp:ListItem>
                    <asp:ListItem Text="仡佬族" Value="仡佬族"></asp:ListItem>
                    <asp:ListItem Text="哈尼族" Value="哈尼族"></asp:ListItem>
                    <asp:ListItem Text="哈萨克族" Value="哈萨克族"></asp:ListItem>
                    <asp:ListItem Text="赫哲族" Value="赫哲族"></asp:ListItem>
                    <asp:ListItem Text="回族" Value="回族"></asp:ListItem>
                    <asp:ListItem Text="基诺族" Value="基诺族"></asp:ListItem>
                    <asp:ListItem Text="京族" Value="京族"></asp:ListItem>
                    <asp:ListItem Text="景颇族" Value="景颇族"></asp:ListItem>
                    <asp:ListItem Text="柯尔克孜族" Value="柯尔克孜族"></asp:ListItem>
                    <asp:ListItem Text="拉祜族" Value="拉祜族"></asp:ListItem>
                    <asp:ListItem Text="黎族" Value="黎族"></asp:ListItem>
                    <asp:ListItem Text="傈僳族" Value="傈僳族"></asp:ListItem>
                    <asp:ListItem Text="珞巴族" Value="珞巴族"></asp:ListItem>
                    <asp:ListItem Text="满族" Value="满族"></asp:ListItem>
                    <asp:ListItem Text="毛南族" Value="毛南族"></asp:ListItem>
                    <asp:ListItem Text="门巴族" Value="门巴族"></asp:ListItem>
                    <asp:ListItem Text="蒙古族" Value="蒙古族"></asp:ListItem>
                    <asp:ListItem Text="苗族" Value="苗族"></asp:ListItem>
                    <asp:ListItem Text="仫佬族" Value="仫佬族"></asp:ListItem>
                    <asp:ListItem Text="纳西族" Value="纳西族"></asp:ListItem>
                    <asp:ListItem Text="怒族" Value="怒族"></asp:ListItem>
                    <asp:ListItem Text="普米族" Value="普米族"></asp:ListItem>
                    <asp:ListItem Text="羌族" Value="羌族"></asp:ListItem>
                    <asp:ListItem Text="撒拉族" Value="撒拉族"></asp:ListItem>
                    <asp:ListItem Text="畲族" Value="畲族"></asp:ListItem>
                    <asp:ListItem Text="水族" Value="水族"></asp:ListItem>
                    <asp:ListItem Text="塔吉克族" Value="塔吉克族"></asp:ListItem>
                    <asp:ListItem Text="塔塔尔族" Value="塔塔尔族"></asp:ListItem>
                    <asp:ListItem Text="土族" Value="土族"></asp:ListItem>
                    <asp:ListItem Text="土家族" Value="土家族"></asp:ListItem>
                    <asp:ListItem Text="佤族" Value="佤族"></asp:ListItem>
                    <asp:ListItem Text="锡伯族" Value="锡伯族"></asp:ListItem>
                    <asp:ListItem Text="乌兹别克族" Value="乌兹别克族"></asp:ListItem>
                    <asp:ListItem Text="瑶族" Value="瑶族"></asp:ListItem>
                    <asp:ListItem Text="彝族" Value="彝族"></asp:ListItem>
                    <asp:ListItem Text="裕固族" Value="裕固族"></asp:ListItem>
                    <asp:ListItem Text="裕固族" Value="裕固族"></asp:ListItem>
                    <asp:ListItem Text="维吾尔族" Value="维吾尔族"></asp:ListItem>
                    <asp:ListItem Text="壮族" Value="壮族"></asp:ListItem>
         </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>出生日期：</td>
                <td><input name="birthday" type="text" id="birthday" class="Text" runat="server" onClick="WdatePicker()"/></td>
                <br /><asp:RequiredFieldValidator ControlToValidate="birthday" ErrorMessage="出生日期不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator1"  Display="Dynamic"></asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td>职务：</td>
                <td>
                    <asp:DropDownList id="posList" runat="server" Enabled="false">

                    </asp:DropDownList>
                </td>

            </tr>
            <tr>
                <td>职称：</td>
                <td>
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
            </tr>
            <tr>
                <td>所属机构：</td>
                <td>
                    <asp:DropDownList ID="comList" runat="server">
                        <asp:ListItem>北京京元数研科技有限公司</asp:ListItem>
                        <asp:ListItem>北京海淀奥赛科技发展中心</asp:ListItem>
                        <asp:ListItem>北京京元智慧应急技术有限公司</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>部门：</td>
                <td>
                    <asp:DropDownList ID="depList" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>政治面貌</td>
                <td>
                     <asp:DropDownList id="politicsList" runat="server">
                        <asp:ListItem Text="中共党员" Value="中共党员" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="群众" Value="群众"></asp:ListItem>
                        <asp:ListItem Text="中国国民党革命委员会" Value="中国国民党革命委员会"></asp:ListItem>
                        <asp:ListItem Text="中国民主同盟" Value="中国民主同盟"></asp:ListItem>
                        <asp:ListItem Text="中国民主建国会" Value="中国民主建国会"></asp:ListItem>
                        <asp:ListItem Text="中国民主促进会" Value="中国民主促进会"></asp:ListItem>
                        <asp:ListItem Text="中国农工民主党" Value="中国农工民主党"></asp:ListItem>
                        <asp:ListItem Text="中国致公党" Value="中国致公党"></asp:ListItem>
                        <asp:ListItem Text="九三学社" Value="九三学社"></asp:ListItem>
                        <asp:ListItem Text="台湾民主自治同盟" Value="台湾民主自治同盟"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>            
            
            <tr>
                <td>身份证号：</td>
                <td><input name="cardID" type="text" id="cardID" class="Text" runat="server"/></td>
                <br /><asp:RequiredFieldValidator ControlToValidate="cardID" ErrorMessage="身份证号不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator5"  Display="Dynamic"></asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td>婚姻状况：</td>
                <td>
                    <asp:RadioButtonList ID="marriage" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True">未婚</asp:ListItem>
                        <asp:ListItem>已婚</asp:ListItem>
                        <asp:ListItem>离异</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>毕业院校：</td>
                <td><input name="school" type="text" id="school" class="Text" runat="server"/></td>
                <br /><asp:RequiredFieldValidator ControlToValidate="school" ErrorMessage="毕业院校不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator3"  Display="Dynamic"></asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td>专业：</td>
                <td><input name="major" type="text" id="major" class="Text" runat="server"/></td>
                <br /><asp:RequiredFieldValidator ControlToValidate="major" ErrorMessage="专业不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator4"  Display="Dynamic"></asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td>学历：</td>
                <td>
                    <asp:DropDownList ID="education" runat="server">
                        <asp:ListItem Text="本科" Value="本科" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="硕士研究生" Value="硕士研究生"></asp:ListItem>
                        <asp:ListItem Text="博士研究生" Value="博士研究生"></asp:ListItem>
                        <asp:ListItem Text="专科" Value="专科"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>入职时间：</td>
                <td><input name="enterDate" type="text" id="enterDate" class="Text" runat="server" onClick="WdatePicker()"/></td>
                <br /><asp:RequiredFieldValidator ControlToValidate="enterDate" ErrorMessage="入职时间不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator2"  Display="Dynamic"></asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td>外语语种：</td>
                <td><input name="foreignLan" type="text" id="foreignLan" class="Text" runat="server"/></td>
            </tr>
            <tr>
                <td>外语水平：</td>
                <td><input name="foreignLev" type="text" id="foreignLev" class="Text" runat="server"/></td>
            </tr>
            <tr>
                <td>计算机能力</td>
                <td><input name="computer" type="text" id="computer" class="Text" runat="server"/></td>
            </tr>
            
            <tr>
                <td>档案所在地：</td>
                <td><input name="fileAddr" type="text" id="fileAddr" class="Text" runat="server"/></td>
            </tr>
            <tr>
                <td>现住址：</td>
                <td><input name="address" type="text" id="address" class="Text" runat="server"/></td>
                <br /><asp:RequiredFieldValidator ControlToValidate="address" ErrorMessage="住址不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator7"  Display="Dynamic"></asp:RequiredFieldValidator>
            </tr>            
                  
            <tr>
                <td>本人联系方式：</td>
                <td><input name="contact" type="text" id="contact" class="Text" runat="server"/></td>
                <br /><asp:RequiredFieldValidator ControlToValidate="contact" ErrorMessage="联系方式不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator8"  Display="Dynamic"></asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td><input name="email" type="text" id="email" class="Text" runat="server"/></td>
                <br /><asp:RequiredFieldValidator ControlToValidate="email" ErrorMessage="邮箱不能为空" runat="server" style="color:red;font-size:12px" ID="RequiredFieldValidator9"  Display="Dynamic"></asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td>紧急联系人：</td>
                <td><input name="urgentPerson" type="text" id="urgenPerson" class="Text" runat="server"/></td>
            </tr>
            <tr>
                <td>紧急联系方式：</td>
                <td><input name="urgentContact" type="text" id="urgenContact" class="Text" runat="server"/></td>
            </tr>
            
        </table>
        <div class="buttonLay">
            <asp:Button ID="confirm" text="确定" class="noSubmitButton"  runat="server" OnClick="confirm_Click"/>
            <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />  
        </div>
    </div>
</asp:Content>
