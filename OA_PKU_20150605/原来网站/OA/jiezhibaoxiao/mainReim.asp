<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<base target="_self">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>报销单处理页面</title>
<%
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
Response.AddHeader "Pragma", "No-Cache"

oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
oabusyuserlevelCode2=request.cookies("oabusyuserlevelCode2")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if

%>
<script language="javascript" >
function newReim()
{
window.open("newReim.asp","_blank");
}
</script>
<script language="javascript" >
function manageReimList()
{
window.open("manageReimlist.asp","_blank");
}
</script>

<script language="javascript" >
function seeoldReimList()
{
window.open("../oldcaiwu/seeoldReimList.asp","_blank");
}
</script>

<script language="javascript" >
function seeAllReimListforM()
{
window.open("seeAllReimListforM.asp","_blank");
}
</script>

<script language="javascript" >
function seeAllReimList()
{
window.open("seeAllReimList.asp","_blank");
}
</script>

<script language="javascript" >
function seeManageReimList()
{
window.open("seeManageReimList.asp","_blank");
}
</script>

<script language="javascript" >
function seeManageReimListforM()
{
window.open("seeManageReimListforM.asp","_blank");
}
</script>

<style type="text/css">
<!--
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
.style8 {color: #2b486a}
-->
</style>


</head>

<body>
<font size="-1">
<div align="center">
<table width="80%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="21"><div align="center">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="2" height="25"><span class="style2"><img src="../images/main/l3.gif" width="2" height="25"></span></td>
            <td background="../images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="21"><div align="center"><span class="style2"><img src="../images/main/icon.gif" width="15" height="12"></span></div></td>
                  <td align="left"class="style7"><font size="-1">报销模块</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>

<%
'说明：由于在2010年1月末到2010年12月24日 期间 报销的流程是 【报销人--->项目经理---->部门经理(综合管理部经理)---->财务主管---->总经理（董事长）---->出纳---->财务调账--->
' 财务主管确认----->完成  】 但是期间由于种种原因，不能及时调账（之前修改sql语句前，出现很多未处理报销单），所以 在数据库中存在很多 ch状态为 N的数据
'新修改的sql语句 只检索 【报销人--->项目经理---->部门经理(综合管理部经理)---->财务主管---->总经理（董事长）---》财务调账】的数据，之后的流程是 【财务主管确认---》出纳--》完成】
%>
<%
set conn=opendb("lmtof","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username = " & "'"& oabusyusername & "'"
rs.open sql,conn,1,1
if not rs.eof then
uStatus=rs("levelCode")
end if
%>
</form>
<font color="#330033" size="-1">以下是您需要处理的申请：</font>
<form id="form1" name="form22" method="post">
<table border="1" cellpadding="1" cellspacing="0" width="80%">
<tr bgcolor="D7E8F8" bordercolor="#339999"><td><font color="#0d79b3" size="-1">编号</font></td><td><font color="#0d79b3" size="-1">申请人</font></td><td><font color="#0d79b3" size="-1">报销日期</font></td><td><font color="#0d79b3" size="-1">金额(元)</font></td><td><font color="#0d79b3" size="-1">状态</font></td></tr>
<%
set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
sqlborr="select * from reimlisttable where nowverify like '%"&oabusyusername&"%'"
rsborr.open sqlborr,cnborr,1,1
do while not rsborr.eof %>

<tr bordercolor="#339999"><td><a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a></td>
<td><!--<a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("claimant"))%></a>--><%response.Write(rsborr("claimant"))%></td><td><%response.Write(formatdatetime(rsborr("reimburseDate"), 1))%></td><td><%response.Write(rsborr("money"))%></td>
<td>
<%
set cnSt=opendb("finance","conn","sql")
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt")&"【<font color=red>"&rsborr("nowverify")&"</font>】")
%>
</td>
</tr>
<%
rsborr.movenext
loop
set cnborr=nothing
%>
</table>
</form>

<font color="#330033" size="-1">以下是您还没有提交或被退回的申请：</font>
<form id="form1" name="form1" method="post">
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><font color="#0d79b3" size="-1">编号</font></td>
<td><font color="#0d79b3" size="-1">申请人</font></td>
<td><font color="#0d79b3" size="-1">报销日期</font></td>
<td><font color="#0d79b3" size="-1">金额(元)</font></td><!--<td><font color="#0d79b3" size="-1">财务</font></td>-->
<%if (oabusyuserlevelCode="CN" or oabusyuserlevelCode="CW" or oabusyuserlevelCode="CWZG" or oabusyuserlevelCode1="CWZG") then%><td><font color="#0d79b3" size="-1">报销帐号</font></td><%end if%>
<td><font color="#0d79b3" size="-1">状态</font></td></tr>
<%
set cnborr=opendb("finance","conn","sql server")
set rsborr=server.CreateObject("adodb.recordset")
sqlborr="select * from reimlisttable  where  claimant = "& "'" & oabusyusername & "' and (stage =10 or stage =0)"
rsborr.open sqlborr,cnborr,1,1
i=0
do while not rsborr.eof %>
<tr bordercolor="#339999">
<td>
<%if rsborr("stage")<>7 then%><a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a><%end if%>
<%if rsborr("stage")=7 then%><%response.Write(rsborr("id"))%></a><%end if%>
</td>
<td><%response.Write(rsborr("claimant"))%></td>
<td><%response.Write(formatdatetime(rsborr("reimburseDate"), 1))%></td>
<td><%response.Write(rsborr("money"))%></td><!--<td><%'response.Write(rsborr("finance"))%></td>-->
<%if (oabusyuserlevelCode="CN" or oabusyuserlevelCode="CW" or oabusyuserlevelCode="CWZG" or oabusyuserlevelCode1="CWZG") then%><td><%response.Write(rsborr("givecount"))%></td><%end if%>
<td>
<%
set cnSt=opendb("finance","conn","sql server 2005")
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt"))
%>
</td></tr>
<%
rsborr.movenext
loop
set rsSt=nothing  'add at 2010-2-24  by zhaoshijun 
set cnSt=nothing  'add at 2010-2-24  by zhaoshijun 
%>
</table>
</form>

<!------------------------------------------------------------------------------------------------------------------------------------------>
<%
 if ( uStatus="DSZ"  or  uStatus="CN"   or uStatus="CWZG") then
	set connf=opendb("finance","conn","sql server")
	set rsf=server.CreateObject("adodb.recordset")
   if uStatus="CWZG" then
   sqlf="select * from ReimMilti where Stage = 3  "
   end if
   if uStatus="DSZ" then
   sqlf="select * from ReimMilti where Stage = 4 "
   end if
   if uStatus="CN" then
   sqlf="select * from ReimMilti where Stage =7 or Stage =10"
   end if
   'if uStatus="CW" then
'   sqlf="select * from ReimMilti where Stage=8 or  Stage =9"
'   end if
   rsf.open sqlf,connf,1,1 
   if not rsf.eof or not rsf.bof then
%>
<div align="center">
<br><font color="#330033" size="-1">以下是您需要处理多部门报销单：</font>
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999"><td><font color="#0d79b3" size="-1">编号</font></td><td><font color="#0d79b3" size="-1">报销日期</font></td><td><font color="#0d79b3" size="-1">金额(元)</font></td><!--<td><font color="#0d79b3" size="-1">部门</font></td>--><td><font color="#0d79b3" size="-1">状态</font></td></tr>
<%do while not rsf.eof %>
<tr>
<td>
<a href="editReimForMil.asp?id=<%=rsf("id")%>" target="_self"><%=rsf("id")%></a>
</td>
<td><%response.Write(formatdatetime(rsf("ReimDate"), 1))%></td>
<td><%=rsf("MoneySum")%></td>
<td>
<%
set cnSt=opendb("finance","conn","sql server")
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsf("Stage")
rsSt.open sqlS,cnSt,1,1
if rsf("Stage")=4 then
%>
<font  color="#6600FF"><%response.Write(rsSt("txt"))%></font>
<% 
end if
if rsf("Stage")<>4 then
response.Write(rsSt("txt"))
end if
%>
</td>
</tr>
<%
rsf.movenext
loop
%>
</table>
</div>
<%
end if
end if
%>
<!------------------------------------------------------------------------------------------------------------------------------------------>

<%
 if uStatus="BMJL" and uStatus="TEST" then
   set connfm=opendb("finance","conn","sql")
   set rsfm=server.CreateObject("adodb.recordset")
   if oabusyuserdept="产品部" then
   sqlfm="select * from ReimMilti where Stage = 11 and ProductDepartM > 0 and ProductDepartAg='No' "
   end if
   if oabusyuserdept="工程部" then
   sqlfm="select * from ReimMilti where Stage = 11 and EngineeringDepartM > 0 and EngineeringDepartAg='No'  "
   end if
   if oabusyuserdept="教育培训部" then
   sqlfm="select * from ReimMilti where Stage = 11 and EduTrainDepartM > 0 and EduTrainDepartAg='No'  "
   end if
   if oabusyuserdept="业务发展部" then
   sqlfm="select * from ReimMilti where Stage = 11 and MarketDepartM > 0 and MarketDepartAg='No'"
   end if
   if oabusyuserdept="综合管理部" then
   sqlfm="select * from ReimMilti where Stage = 11 and GeneManageDepartM > 0 and GeneManageDepartAg='No' "
   end if
   if oabusyuserdept="四川基地" then
   sqlfm="select * from ReimMilti where Stage = 11 and sichuanJDM > 0   and sichuanJDAg='No' "
   end if
   if oabusyuserdept="研发部" then
   sqlfm="select * from ReimMilti where Stage = 11 and YanFDepartM > 0   and YanFDepartAg='No' "
   end if
   if oabusyuserdept="时空信息技术培训部" then
   sqlfm="select * from ReimMilti where Stage = 11 and SDepartM > 0   and SDepartAg='No' "
   end if
   response.Write(sqlfm)
   rsfm.open sqlfm,connfm,1,1 
   if not rsfm.eof or not rsfm.bof then
%>
<div align="center">
<br><font color="#330033" size="-1">以下是您需要处理的多部门报销单：</font>
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999"><td><font color="#0d79b3" size="-1">编号</font></td><td><font color="#0d79b3" size="-1">日期</font></td><td><font color="#0d79b3" size="-1">金额(元)</font></td><td><font color="#0d79b3" size="-1">部门</font></td><td><font color="#0d79b3" size="-1">状态</font></td></tr>
<%do while not rsfm.eof %>
<tr>
<td>
<a href="editReimForMil.asp?id=<%=rsfm("id")%>" target="_self"><%=rsfm("id")%></a>
</td>
<td><%response.Write(formatdatetime(rsfm("ReimDate"), 1))%></td>
<td><%=rsfm("MoneySum")%></td>
<td>
<%if oabusyuserdept="产品部" then 
response.Write("产品部："&rsfm("ProductDepartM")&"元&nbsp;")
end if %>
<%if oabusyuserdept="工程部" then 
response.Write("工程部："& rsfm("EngineeringDepartM")&"元&nbsp;")
end if %>
<%if oabusyuserdept="教育培训部" then 
response.Write( "教育培训部："&rsfm("EduTrainDepartM")&"元&nbsp;")
end if %>
<%if oabusyuserdept="业务发展部" then 
response.Write("业务发展部："& rsfm("MarketDepartM")&"元&nbsp;")
end if %>
<%if oabusyuserdept="综合管理部" then 
response.Write( "综合管理部："&rsfm("GeneManageDepartM")&"元&nbsp;")
end if %>
<%if oabusyuserdept="四川基地" then 
response.Write( "四川基地："&rsfm("sichuanJDM")&"元")
end if %>
<%if oabusyuserdept="研发部" then 
response.Write( "研发部："&rsfm("YanFDepartM")&"元")
end if %>
<%if oabusyuserdept="时空信息技术培训部" then 
response.Write( "时空信息技术培训部："&rsfm("SDepartM")&"元")
end if %>
</td>
<td>
<%
set cnStm=opendb("finance","conn","sql server")
set rsStm=server.CreateObject("adodb.recordset")
sqlSm="select * from stage where stage="&rsfm("Stage")
rsStm.open sqlSm,cnStm,1,1
if rsfm("Stage")=9 then
%>
<font  color="#6600FF"><%response.Write(rsStm("txt"))%></font>
<% 
end if
if rsfm("Stage")<>9 then
response.Write(rsStm("txt"))
end if
%>
</td>
</tr>
<%
rsfm.movenext
loop
%>
</table>
</div>
<%
end if
end if
%>

<!------------------------------------------------------------------------------------------------------------------------------------------>
<form  id="form4" name="form4" >
<input type="button"  value="新建报销单" onclick="newReim()">
<input type="button" value="查看报销单" onclick="manageReimList()" />
<!-----------------------------------------------不能删除----------------------------------------------->
<% if uStatus="CWZG" or uStatus="CW" or uStatus="CN" then %>
<!--<input type="button" value="查看所有报销单" onclick="seeAllReimList()" />-->
<input type="button" value="查看历史报销" onclick="seeoldReimList()" />
<input type="button" value="查看混合报销单" onclick="seeAllReimListforM()" />
<% end if %>
<% if oabusyuserlevel<>"" and uStatus<>"ZSYG" and uStatus<>"CW" and uStatus<>"CN" and uStatus<>"CWZG" then 
%>
<!--<input type="button" value="表单统计" onclick="seeManageReimList()" />-->
<input type="button" value="多部门报销统计" onclick="seeManageReimListforM()" />
<% end if %>
<!-----------------------------------------------不能删除----------------------------------------------->
</form>
</div>
</font>
<!--<div align="center"><a href="qianyiuse.asp" target="_self">迁移使用</a></div>-->
</body>
</html>
