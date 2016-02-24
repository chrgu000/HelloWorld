<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="css/css.css">
<script language="javascript1.2" src="js/openwin.js"></script>
<title>借支单处理页面</title>
<style type="text/css">
<!--
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
-->
</style>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
<script language="javascript" >
function newBorrowList()
{
window.open("newBorr.asp","_blank");
}
</script>
<script language="javascript" >
function manageBorrowList()
{
window.open("manageBorrow.asp","_blank");
}
function viewRefound()
{
window.open("refoundlist.asp","_blank");
}
</script>

<script language="javascript" >
function seeAllList()
{
window.open("seeAllList.asp","_blank");
}
</script>
<script language="javascript" >
function seeManageList()
{
window.open("seeManageList.asp","_self");
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
                  <td align="left"class="style7"><font size="-1">借支模块</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<%
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("../db/lmtof.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("lmtof","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from userinf where username = " & "'"& oabusyusername & "'"
rs.open sql,conn,1,1
if not rs.eof then
uStatus=rs("levelCode")
end if
%>


<!--显示当用户为部门负责人时的内容-->
<%if uStatus="BMJL" then %>
<hr>
</form>
<font color="#330033" size="-1">以下是您需要处理的申请：</font>
<form id="form1" name="form22" method="post">
<table   border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999"><font color="#0d79b3"><td><font color="#0d79b3" size="-1">编号</font></td><td><font color="#0d79b3" size="-1">申请人</font></td><td><font color="#0d79b3" size="-1">日期</font></td><td><font color="#0d79b3" size="-1">金额(元)</font></td><td><font color="#0d79b3" size="-1">状态</font></td></font></tr>
<%
'set cnborr=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnborr.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
 if oabusyuserdept<>"综合管理部" then
     sqlborr="select * from borrowlist where dept = "& "'" & oabusyuserdept & "'" & "and stage =1"
 end if
  if oabusyuserdept="综合管理部" then
     sqlborr="select * from borrowlist where dept = "& "'" & oabusyuserdept & "'" & "and stage =1"
 end if
rsborr.open sqlborr,cnborr,1,1
do while not rsborr.eof %>

<tr bordercolor="#339999"><td><a href=editBorr.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a></td><td><%response.Write(rsborr("borrower"))%></td><td><%response.Write(formatdatetime(rsborr("date"), 1))%></td><td><%response.Write(rsborr("money"))%></td>

<td>
<%
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql")
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt"))
%>
</td></tr><!---------------这里好像没有判断假如部门是综管部的境况啊------>
<%
rsborr.movenext
loop%>
</table>
</form>
<%end if%>


<!--显示当用户为财务主管时的内容-->
<%if uStatus="CWZG" then %>
<font color="#330033" size="-1">以下是您需要处理的申请：</font>
<form id="form1" name="form32" method="post" >
<table bordercolor="#B0C8EA"  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8"  bordercolor="#339999"><td><font color="#0d79b3" size="-1">编号</font></td><td><font color="#0d79b3" size="-1">申请人</font></td><td><font color="#0d79b3" size="-1">日期</font></td><td><font color="#0d79b3" size="-1">金额(元)</font></td><td><font color="#0d79b3" size="-1">状态</font></td></tr>
<%
'set cnborr=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnborr.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
sqlborr="select * from borrowlist where stage =3 "
rsborr.open sqlborr,cnborr,1,1
j=0
do while not rsborr.eof %>

<tr bordercolor="#339999"><td><a href=editBorr.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a></td><td><%response.Write(rsborr("borrower"))%></td><td><%response.Write(formatdatetime(rsborr("date"), 1))%></td><td><%response.Write(rsborr("money"))%></td>
<%
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql")
set rsSt=server.CreateObject("adodb.recordset")
sqlSt="select * from stage where stage="&rsborr("stage")
rsSt.open sqlSt,cnSt,1,1
%>
<td><% if rsborr("stage")=10 then%>
<font  color="#6600FF"><%response.Write(rsSt("txt"))%></font><%else if rsborr("stage")<>10 then %>
<%
response.Write(rsSt("txt")) 
end if 
end if
%>
</td>
<!--<td><a href=editBorr.asp?id=<%response.Write(rsborr("id"))%>>查看</a></td>--></tr>
<%
if rsborr("stage")=5 then
j=j+1
end if
rsborr.movenext
loop%>
</table>
<% if j>0 then%><font color=red>*</font><font color="#0000FF"><%response.Write("有"&j&"个借款申请已经通过，请及时通知申请人！")%></font><%end if%>
</form>
<%end if%>

<!--显示当用户为名誉董事长时的内容-->
<%if uStatus="DSZ" or uStatus="CN" then %>
<font color="#330033" size="-1">以下是您需要处理的申请：</font>
<form id="form1" name="form4" method="post">
<table  border="1" cellpadding="0" cellspacing="0" width="560">
<tr bgcolor="D7E8F8"bordercolor="#339999"><td><font color="#0d79b3" size="-1">编号</font></td><td><font color="#0d79b3" size="-1">申请人</font></td><td><font color="#0d79b3" size="-1">日期</font></td><td><font color="#0d79b3" size="-1">金额(元)</font></td><td><font color="#0d79b3" size="-1">状态</font></td></tr>
<%
'set cnborr=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnborr.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
if uStatus="DSZ" AND oabusyuserlevelCode1<>"BMJL" then
sqlborr="select * from borrowlist where stage =4"
end if
if uStatus="DSZ" AND oabusyuserlevelCode1="BMJL" then
    if oabusyuserdept<>"综合管理部" then
     sqlborr="select * from borrowlist where stage =4 or (dept = "& "'" & oabusyuserdept & "'" & "and stage =1)"
    end if
    if oabusyuserdept="综合管理部" then
     sqlborr="select * from borrowlist where stage =4  or (dept = "& "'" & oabusyuserdept & "'" & "and stage =1)"
    end if
    
end if
if uStatus="CN" then
sqlborr="select * from borrowlist where stage =7"
end if
rsborr.open sqlborr,cnborr,1,1
do while not rsborr.eof %>

<tr bordercolor="#339999"><td><a href=editBorr.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a></td><td><%response.Write(rsborr("borrower"))%></td><td><%response.Write(formatdatetime(rsborr("date"), 1))%></td><td><%response.Write(rsborr("money"))%></td>
<td>
<%
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql")
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt"))
%>
</td>

<!--<td><a href=editBorr.asp?id=<%response.Write(rsborr("id"))%>>查看</a></td>--></tr>
<%
rsborr.movenext
loop%>
</table>
</form>
<%end if%>
<% if uStatus<>"DSZ" OR (uStatus="DSZ" and oabusyuserlevelCode1="BMJL" )then %>
<!--显示当用户为普通用户时的内容-->
<font color="#330033" size="-1">以下是您还没有提交或被退回的申请：</font>
<form id="form1" name="form1" method="post">
<table bordercolor="#339999" border="1" cellpadding="0" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999"><font color="#0d79b3"><td><font color="#0d79b3" size="-1">编号</font></td><td><font color="#0d79b3" size="-1">日期</font></td><td><font color="#0d79b3" size="-1">金额(元)</font></td><td><font color="#0d79b3" size="-1">财务</font></td><td><font color="#0d79b3" size="-1">状态</font></td></font></tr>
<%
'set cnborr=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnborr.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
sqlborr="select * from borrowlist where borrower = "& "'" & oabusyusername & "'" & "and (stage =0 or stage=10)"
rsborr.open sqlborr,cnborr,1,1
i=0
do while not rsborr.eof %>

<tr bordercolor="#339999">
<td><% if rsborr("stage")<>4 then %><a href=editBorr.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a><%end if%><% if rsborr("stage")=4 then %><%response.Write(rsborr("id"))%><%end if%></td>
<td><%response.Write(formatdatetime(rsborr("date"), 1))%></td><td><%=Formatnumber(rsborr("money"))%></td><td><%response.Write(rsborr("finance"))%></td>

<%
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql")
set rsSt=server.CreateObject("adodb.recordset")
sqlSt="select * from stage where stage="&rsborr("stage")
rsSt.open sqlSt,cnSt,1,1
%>
<td>

<% 
if rsborr("stage")<>7 then 
response.Write(rsSt("txt"))
end if
if rsborr("stage")=7 then 
%>
<font  color="#6600FF">
<% response.Write(rsSt("txt"))
end if%>
</font>

</td>

</td><!--<td><% if rsborr("stage")<>7 then %><a href=editBorr.asp?id=<%response.Write(rsborr("id"))%>>查看</a><%end if%></td>--></tr>
<%
if rsborr("stage")=7 then
i=i+1
end if
rsborr.movenext
loop
%>
</table>
<% if i>0 then%><font color=red>*</font><font color="#0000FF"><%response.Write("你有"&i&"个借支申请已经通过，请及时联系财务！")%></font><%end if%>
</form>
<%end if%>


<form  id="form4" name="form4" >
<% if (uStatus<>"DSZ" and oabusyusername<>"admin") OR (uStatus="DSZ" and oabusyuserlevelCode1="BMJL" )   then %>
<input type="button" value="创建新借支单" onclick="newBorrowList()" />
<% end if %>
<input type="button" value="查看还款记录" onclick="viewRefound()" />
<input type="button" value="查看以前借支单" onclick="manageBorrowList()" />
<% if oabusyuserlevelCode="CN"   then %>
<a href="easy.asp"><font color="#330099">还款处理平台</font></a>
<% end if %>
</form>
</div>
</font>
</body>
</html>
