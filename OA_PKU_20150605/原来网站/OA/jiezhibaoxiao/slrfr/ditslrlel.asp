<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<head>
<!--#include file="opendb.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>
<script language="javascript">
function Deletejibie()
{
window.open('Deletejibie.asp?id='+ document.form.id.value,"_self");
}
</script>
<%
if id<>"" then
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("yzzz#in.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("yzzz#in","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from xslevel where id="&id
rs.open sql,conn,1,1
do while not rs.eof 
%>
<body>
<div align="center">
<form name="form" action="changexslevel.asp" method="post">
<table border=0 width=90% cellspacing="1" bgcolor="B0C8EA">
<tr bgcolor="D7E8F8"> 
	<td><span class="style8"><font size="2">级别</font></span></td>
	<td><span class="style8"><font size="2">金额</font></span></td>
	<td><span class="style8"><font size="2">补助</font></span></td>
</tr>
<tr>
<td><input type="hidden" name="id" value="<%=rs("id")%>" /><input type="text" name="level" value="<%=rs("level")%>" /></td>
<td><input type="text" name="money" value="<%=rs("money")%>" /></td>
<td><input type="text" name="buzhu" value="<%=rs("buzhu")%>" /></td>
</tr>
</table>

<%
rs.movenext
loop
%>
<input type="submit" value="修改" />
<input type="button" value="关闭" onclick="window.top.history.go(-1);" />
<input type="button" value="删除" onclick="Deletejibie();" />
</form>
<%end if%>

<%
if id="" then
response.Write("请先增加记录")
end if
%>
</div>
</body>
</html>
