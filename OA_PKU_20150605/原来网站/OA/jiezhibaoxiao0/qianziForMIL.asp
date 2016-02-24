<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")
response.Write(id)
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from ReimMilti where id="&id
rs.open sql,conn,1,3
if oabusyuserlevelCode="CW" or oabusyuserlevelCode="CN" then 
rs("Stage")=6
rs.update
response.Write("处理成功")
end if
%>
</head>

<body>
<div align="center">
<form action="mainReim.asp" method="post">
<input  type="submit" value="关闭" />
</form>
</div>
</body>
</html>