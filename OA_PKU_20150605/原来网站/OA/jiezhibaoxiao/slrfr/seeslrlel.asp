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
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if

%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>工资级别及补助</title>
<script language="javascript">
function addjibie()  
{
    
	window.open('addlevelItem.asp',"_self");
}
</script>
</head>

<body>
<div align="center">
<table border=0 width=80% cellspacing="1" bgcolor="B0C8EA">
<tr bgcolor="D7E8F8"> 
	<td><span class="style8"><font size="2">薪资级别</font></span></td>
    <td><span class="style8"><font size="2">薪资金额</font></span></td>
    <td><span class="style8"><font size="2">补助</font></span></td>
    <td><span class="style8"><font size="2">操作</font></span></td>
<%
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("yzzz#in.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("yzzz#in","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from xslevel "
rs.open sql,conn,1,1
do while not rs.eof 
%>
<tr bgcolor="D7E8F8"> 
	<td><span class="style8"><font size="2"><%=rs("level")%></font></span></td>
	<td><span class="style8"><font size="2"><%=rs("money")%></font></span></td>
	<td><span class="style8"><font size="2"><%=rs("buzhu")%></font></span></td>
	<td><span class="style8"><font size="2"><a href=ditslrlel.asp?id=<%response.Write(rs("id"))%>>编辑</a></font></span></td>
</tr>
<%
rs.movenext
loop
%>
</table>
<form name="form" method="post" action="addlevel.asp">
<input type="button" value="增加级别"  onclick="addjibie();"/>
</form>
</div>
</body>
</html>
