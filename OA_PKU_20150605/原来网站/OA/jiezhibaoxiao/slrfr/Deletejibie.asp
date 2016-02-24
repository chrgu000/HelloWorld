<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
<title>删除项目摘要</title>

</head>

<body>
<div align="center">
<%
'projectID=request("projectId")
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("yzzz#in.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("yzzz#in","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from xslevel where id = "&request("id")
'response.Write(request("projectId"))
rs.open sql,conn,1,3
if not rs.eof then
rs.delete
rs.update
rs.movenext
response.Write("删除成功")
end if

%>
</div>
<div align="center">
</div>
</body>
</html>
