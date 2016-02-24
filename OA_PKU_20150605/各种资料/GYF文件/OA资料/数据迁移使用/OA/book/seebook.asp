<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>技术资料管理</title>
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
%>
</head>
<%
set conn=server.CreateObject("adodb.connection")
path=server.MapPath("..\db\book.mdb")
conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set rs=server.CreateObject("adodb.recordset")
sql="select * from books  "
rs.open sql,conn,1,1
%>

<body>
<div align="center">
<table border="1" align="center" cellpadding="0" cellspacing="0">
<tr bgcolor="D7E8F8">
<td><font color="#660033" size="+1"><strong>名称</strong></font></td>
<td><font color="#660033" size="+1"><strong>出版社</strong></font></td>
<td><font color="#660033" size="+1"><strong>备注</strong></font></td>
<td><font color="#660033" size="+1"><strong>是否借出</strong></font></td>
</tr>

<%
do while not rs.eof 
%>
<tr bgcolor="D7E8F8" >
<td><% if oabusyname="赵师军" then%>
<a href="managebook.asp?name=<%=rs("name")%>" target="_self"><%=rs("name")%></a>
<%else if oabusyname<>"赵师军" then%>
<%=rs("name")%>
<%
end if
end if
%></td>
<td><%=rs("press")%></td>
<td><%=rs("content")%></td>
<td><%=rs("wether")%></td>
</tr>
<%
rs.movenext
loop
%>
</table>
</div>
</body>
</html>
