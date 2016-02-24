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
<table width="583"  border="0" cellspacing="0" cellpadding="0">
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
'response.Write("你的名称是："&oabusyusername)
set conn=opendb("lmtof","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username = " & "'"& oabusyusername & "'"
rs.open sql,conn,1,1
if not rs.eof then
uStatus=rs("levelCode")
u2Status=rs("levelCode1")
end if
%>



<!--显示当用户为部门负责人时的内容-->
<%if uStatus="BMJL" or u2Status="BMJL" then %>
<hr>
</form>
<font color="#330033" size="-1">以下是您需要处理的申请：</font>
<form id="form1" name="form22" method="post">
<table border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999"><td><font color="#0d79b3" size="-1">编号</font></td><td><font color="#0d79b3" size="-1">申请人</font></td><td><font color="#0d79b3" size="-1">报销日期</font></td><td><font color="#0d79b3" size="-1">金额(元)</font></td><td><font color="#0d79b3" size="-1">状态</font></td></tr>
<%
set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
if oabusyuserdept<>"综合管理部" then
 '首先是非项目成本自己填写的、别人填写的和被退回的已完成；然后是项目成本 自己是项目经理的但不是项目负责人已完成，项目成本的项目负责人是自己，提交的或未提交的已完成
  sqlborr="select * from reimlisttable where (type='A' and projectDept = "& "'" & oabusyuserdept & "' and (stage=1  or stage=2)) or (type='B'and ((projectDept = "& "'" & oabusyuserdept & "' and  stage =2 ) or(dept = "& "'" & oabusyuserdept & "' and (stage=1 or (claimant="&"'"&oabusyusername&"' and stage=0) ))))"
 end if
if oabusyuserdept="综合管理部" then
 sqlborr="select * from reimlisttable where stage=13 or (type='A' and projectDept = "& "'" & oabusyuserdept & "'" & "and (stage =1  or stage=2 )) or (type='B' and projectDept = "& "'" & oabusyuserdept & "'" & "and stage =2 ) or (type='B' and principal = "& "'" & oabusyusername & "'" & "and (stage =1 or stage =0) )"
 '首先是非项目成本自己填写的、别人填写的和被退回的；然后是项目成本 自己是项目经理的但不是项目负责人，项目成本的项目负责人是自己，提交的或未提交的
 end if
rsborr.open sqlborr,cnborr,1,1
do while not rsborr.eof %>

<tr bordercolor="#339999"><td><a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a></td>
<td><!--<a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("claimant"))%></a>--><%response.Write(rsborr("claimant"))%></td><td><%response.Write(formatdatetime(rsborr("reimburseDate"), 1))%></td><td><%response.Write(rsborr("money"))%></td>

<td>
<%
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql")
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt"))
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
<%end if%>
<!--显示当用户为财务主管时的内容-->
<%if uStatus="CWZG" then %>
<font color="#330033" size="-1">以下是您需要处理的申请：</font>
<form id="form1" name="form32" method="post" >
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><font color="#0d79b3" size="-1">编号</font></td>
<td><font color="#0d79b3" size="-1">申请人</font></td>
<td><font color="#0d79b3" size="-1">报销日期</font></td>
<td><font color="#0d79b3" size="-1">金额(元)</font></td>
<td><font color="#0d79b3" size="-1">状态</font></td></tr>
<%
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
'set cnborr=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnborr.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set  cnborr=opendb("finance","conn","sql")
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
set rsborr=server.CreateObject("adodb.recordset")
sqlborr="select * from reimlisttable where stage=3 or (stage=6 and ch<>'') or (type='A' and dept = "& "'" & oabusyuserdept & "' and stage =1 or (claimant="&"'"&oabusyusername&"' and stage=0 ))"
rsborr.open sqlborr,cnborr,1,1
j=0
do while not rsborr.eof %>

<tr bordercolor="#339999">
<td><a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a></td>
<td><!--<a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("claimant"))%></a>--><%response.Write(rsborr("claimant"))%></td>
<td><%response.Write(formatdatetime(rsborr("reimburseDate"), 1))%></td>
<td><%response.Write(rsborr("money"))%></td>
<td>
<%
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql")
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt"))
%>
</td>
</tr>
<%
rsborr.movenext
loop%>
</table>
</form>
<%end if%>


<!--显示当用户为出纳时的内容-->
<%if uStatus="CN" then %>
<font color="#330033" size="-1">以下是您需要处理的申请：</font>
<form id="form1" name="form32" method="post" >
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><font color="#0d79b3" size="-1">编号</font></td>
<td><font color="#0d79b3" size="-1">申请人</font></td>
<td><font color="#0d79b3" size="-1">报销日期</font></td>
<td><font color="#0d79b3" size="-1">金额(元)</font></td>
<td><font color="#0d79b3" size="-1">状态</font></td></tr>
<%
set cnborr=opendb("finance","conn","accessdsn")
set rsborr=server.createobject("adodb.recordset")
'change by zhaoshijun at 2010-2-24 for change database to sql server 2005
'set cnborr=server.CreateObject("adodb.connection")  
'path=server.MapPath("finance.mdb")
'cnborr.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
'set rsborr=server.CreateObject("adodb.recordset")
'change by zhaoshijun at 2010-2-24 for change database to sql server 2005

sqlborr="select * from reimlisttable where stage =7 or (type='A' and dept = "& "'" & oabusyuserdept & "'" & "and ((claimant="&"'"&oabusyusername&"' and stage=0)))"
'sqlborr="select * from reimlisttable where  (type='A' and dept = "& "'" & oabusyuserdept & "'" & "and ((claimant="&"'"&oabusyusername&"' and stage=0)))"
rsborr.open sqlborr,cnborr,1,1
j=0
do while not rsborr.eof %>

<tr bordercolor="#339999">
<td><a href=editReim.asp?id=<%response.Write(rsborr("id"))%> ><%response.Write(rsborr("id"))%></a></td>
<td><!--<a href=editReim.asp?id=<%response.Write(rsborr("id"))%> ><%response.Write(rsborr("claimant"))%></a>--><%response.Write(rsborr("claimant"))%></td>
<td><%response.Write(formatdatetime(rsborr("reimburseDate"), 1))%></td>
<td><%response.Write(rsborr("money"))%></td>
<td>
<%
' change by zhaoshijun at 2010-2-24 for changing database to sql server 2005
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
'set rsSt=server.CreateObject("adodb.recordset")
' change by zhaoshijun at 2010-2-24 for changing database to sql server 2005
set cnSt=opendb("finance","conn","sql server")
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt"))
%>
</td>
</tr>
<%
rsborr.movenext
loop%>
</table>
</form>
<%end if%>

<!--显示当用户为机构负责人时的内容-->
<%if uStatus="DSZ" or uStatus="CW" then %>
<font color="#330033" size="-1">以下是您需要处理的申请：</font>
<form id="form1" name="form4" method="post">
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><font color="#0d79b3" size="-1">编号</font></td>
<td><font color="#0d79b3" size="-1">申请人</font></td>
<td><font color="#0d79b3" size="-1">报销日期</font></td>
<td><font color="#0d79b3" size="-1">金额(元)</font></td>
<td><font color="#0d79b3" size="-1">状态</font></td></tr>
<%
'changged by zhaoshijun with qq:515447782 at 2010-2-24 for update database
'set cnborr=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnborr.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnborr=opendb("finance","conn","sql server")
'changged by zhaoshijun with qq:515447782 at 2010-2-24 for update database
set rsborr=server.CreateObject("adodb.recordset")
if uStatus="DSZ" and  oabusyuserlevelCode1<>"BMJL" then
sqlborr="select * from reimlisttable where stage=4 "
end if
if uStatus="DSZ" and oabusyuserlevelCode1="BMJL" then
sqlborr="select * from reimlisttable where (stage =4 and relclaimant<>'陈秀万' ) or (type='A' and (projectDept = '产品部' or projectDept = '工程部') and (stage=1  or stage=2)) or (type='B'and (((projectDept = '产品部' or projectDept = '工程部') and  stage =2 ) or((projectDept = '产品部' or projectDept = '工程部') and (stage=1 or (claimant="&"'"&oabusyusername&"' and stage=0))))) "
'2010 年2月1日 将陈老师的功能修改回来 zhaoshijun
'sqlborr="select * from reimlisttable where (stage =4  ) or (type='A' and (projectDept = '产品部' or projectDept = '工程部') and (stage=1  or stage=2)) or (type='B'and (((projectDept = '产品部' or projectDept = '工程部') and  stage =2 ) or((projectDept = '产品部' or projectDept = '工程部') and (stage=1 or (claimant="&"'"&oabusyusername&"' and stage=0))))) "
end if
if uStatus="DSZ" and oabusyusername="陈秀万"  then
sqlborr="select * from reimlisttable where stage =4 and relclaimant='陈秀万'"
end if
if uStatus="CW" then
'sqlborr="select * from reimlisttable where (stage=8 or stage=9 or stage=5) and ch='N'" '这个是2010-12-24之前使用的语句
sqlborr="select * from reimlisttable where stage=5 and ch='N'" '这个是2010-12-24之后使用的语句
'说明：由于在2010年1月末到2010年12月24日 期间 报销的流程是 【报销人--->项目经理---->部门经理(综合管理部经理)---->财务主管---->总经理（董事长）---->出纳---->财务调账--->
' 财务主管确认----->完成  】 但是 期间由于种种原因，不能及时调账（之前修改sql语句前，出现很多未处理报销单），所以 在数据库中存在很多 ch状态为 N的数据
'新修改的sql语句 只检索 【报销人--->项目经理---->部门经理(综合管理部经理)---->财务主管---->总经理（董事长）---》财务调账】的数据，之后的流程是 【财务主管确认---》出纳--》完成】
end if
rsborr.open sqlborr,cnborr,1,1
do while not rsborr.eof %>

<tr bordercolor="#339999">
<td><a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a></td>
<td><!--<a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("claimant"))%></a>--><%response.Write(rsborr("claimant"))%></td>
<td><%response.Write(formatdatetime(rsborr("reimburseDate"), 1))%></td>
<td><%response.Write(rsborr("money"))%></td>
<td>
<%
'changged by zhaoshijun with qq:515447782 at 2010-2-24 for update database
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql server")
'changged by zhaoshijun with qq:515447782 at 2010-2-24 for update database
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt"))
%>
</td>
</tr>
<%
rsborr.movenext
loop%>
</table>
</form>
<%end if%>

<% if (uStatus<> "DSZ") or (uStatus="DSZ" and oabusyuserlevelCode1<>"")  then %>
<!--显示当用户为普通用户时的内容-->
<font color="#330033" size="-1">以下是您需要注意的的申请：</font>
<form id="form1" name="form1" method="post">
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><font color="#0d79b3" size="-1">编号</font></td>
<td><font color="#0d79b3" size="-1">申请人</font></td>
<td><font color="#0d79b3" size="-1">报销日期</font></td>
<td><font color="#0d79b3" size="-1">金额(元)</font></td><!--<td><font color="#0d79b3" size="-1">财务</font></td>-->
<td><font color="#0d79b3" size="-1">状态</font></td></tr>
<%
'changed by zhaoshijun at 2010-2-24 for changing access data to sql server 2005 
'set cnborr=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnborr.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path 
'set rsborr=server.CreateObject("adodb.recordset")
set cnborr=opendb("finance","conn","sql server")
set rsborr=server.CreateObject("adodb.recordset")
'changed by zhaoshijun at 2010-2-24 for changing access data to sql server 2005 

'(type='A' claimant = "& "'" & oabusyusername & "' and (stage = 8 or stage = 5)) or (type='B' principal = "& "'" & oabusyusername & "' and (stage = 8 or stage = 5))
sqlborr="select * from reimlisttable  where (type='A'and  claimant = "& "'" & oabusyusername & "' and (stage = 10 or stage = 7)) or (type='B'and claimant = "& "'" & oabusyusername & "' and (stage = 10 or stage = 7))  or (claimant="&"'"&oabusyusername&"' and stage=0) or (stage=1 and principal= "& "'" & oabusyusername & "')"
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
<td>
<%
'changed by zhaoshijun at 2010-2-24 foe changing access data to sql server 2005
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
'set rsSt=server.CreateObject("adodb.recordset")
set cnSt=opendb("finance","conn","sql server 2005")
set rsSt=server.CreateObject("adodb.recordset")
'changed by zhaoshijun at 2010-2-24 foe changing access data to sql server 2005
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
<%end if%>
<!------------------------------------------------------------------------------------------------------------------------------------------>
<%
 if ( uStatus="DSZ"  or  uStatus="CN"  or  uStatus="CW" or uStatus="CWZG") then
   ' changed by zhaoshjun with qq:515447782 at 2010-2-24 for changing access da to sql server 
   'set connf=server.CreateObject("adodb.connection")
'   dpathf=server.Mappath("finance.mdb")
'   connf.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpathf
'   set rsf=server.CreateObject("adodb.recordset")
	set connf=opendb("finance","conn","sql server")
	set rsf=server.CreateObject("adodb.recordset")
   ' changed by zhaoshjun with qq:515447782 at 2010-2-24 for changing access da to sql server 
   if uStatus="CWZG" then
   sqlf="select * from ReimMilti where Stage = 3  "
   end if
   if uStatus="DSZ" then
   sqlf="select * from ReimMilti where Stage = 4 "
   end if
   if uStatus="CN" then
   sqlf="select * from ReimMilti where Stage =7 or Stage =10"
   end if
   if uStatus="CW" then
   sqlf="select * from ReimMilti where Stage=8 or  Stage =9"
   end if
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
' changed by zhaoshijun with qq:515447782 at 2010-2-24 for updating datdabase
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql server")
' changed by zhaoshijun with qq:515447782 at 2010-2-24 for updating datdabase
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
 if uStatus="BMJL"  then
   ' changed by zhaoshijun at 2010-2-24
   'set connfm=server.CreateObject("adodb.connection")
'   dpathfm=server.Mappath("finance.mdb")
'   connfm.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpathfm
	set connfm=opendb("finance","conn","sql")
    ' changed by zhaoshijun at 2010-2-24
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
   'sqlfm="select * from ReimMilti where Stage = 1 and MarketDepartM > 0 and MarketDepartAg='No' "
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
'changed by zhaoshijun at 2010-2-24
'set cnStm=server.CreateObject("adodb.connection")
'pathm=server.MapPath("finance.mdb")
'cnStm.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathm
set cnStm=opendb("finance","conn","sql server")
'changed by zhaoshijun at 2010-2-24
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
<% if uStatus<>"DSZ"  then %>
<input type="button"  value="新建报销单" onclick="newReim()">
<% end if %>
<% if uStatus="DSZ" and  oabusyuserlevelCode1="BMJL"  then %>
<input type="button"  value="新建报销单" onclick="newReim()">
<% end if %>
<input type="button" value="查看报销单" onclick="manageReimList()" />
<!-----------------------------------------------不能删除----------------------------------------------->
<% if uStatus="CWZG" or uStatus="CW" or uStatus="CN" then %>
<!--<input type="button" value="查看所有报销单" onclick="seeAllReimList()" />-->
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
</body>
</html>
