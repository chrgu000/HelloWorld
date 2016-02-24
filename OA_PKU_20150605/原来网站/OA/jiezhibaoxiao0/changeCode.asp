<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<link rel="stylesheet" href="css/css.css">
<style type="text/css">
<!--
.style1 {color: #098abb}
-->
body {SCROLLBAR-FACE-COLOR:#3499D0;
SCROLLBAR-HIGHLIGHT-COLOR:#CCFFFF;
SCROLLBAR-SHADOW-COLOR:#2587C3;
SCROLLBAR-ARROW-COLOR:#CCFFFF;
SCROLLBAR-BASE-COLOR:#1068A4; 
SCROLLBAR-DARK-SHADOW-COLOR:#3499D0} 
</style>
<style type="text/css">
<!--
.style1 {color: #0d79b3}
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
.style8 {color: #2b486a}
-->
</style>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
code=oabusyuserlevelCode
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("../db/lmtof.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("lmtof","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select username,levelCode,id from userinf order by levelCode desc"
rs.open sql,conn,1,1
%>
<div align="center">
<table border=0 width=80% cellspacing="1" bgcolor="B0C8EA">
<tr bgcolor="D7E8F8"> 
	<td><span class="style8"><font size="2">姓名</font></span></td>
	<td><span class="style8"><font size="2">员工职称</font></span></td>
	<td><span class="style8"><font size="2">修改员工职称</font></span></td>
</tr>
<% do while not rs.eof %>
<tr bgcolor="#FFFFFF">
	<td><span class="style8"><font size="2"><%=rs("username")%></font></span></td>
	<td><font size="2"><%=rs("levelCode")%></font></td>
    <td><font size="2"><a href="changCode.asp?id=<%=rs("id")%>"><%=rs("id")%></a></font></td>
</tr>
<%
rs.movenext
loop%>
</table>
</div>
</body>
</html>
