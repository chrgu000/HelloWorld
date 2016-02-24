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
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
code=oabusyuserlevelCode
%>
<title>无标题文档</title>
<%
dbname=request.Form("dbname")
tbname=request.Form("tbname")
content=request("content")
sumbit=request("sub")
%>
</head>

<body>
<%
set conn=opendb(dbname,"conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select  * from  ornot where month='"&tbname&"'" 
rs.open sql,conn,1,3 
if sumbit="同意" then
if code="CN" then 
rs("stage")=1
end if
if code=code then 
rs("stage")=2

end if
if code="DSZ" then 
rs("stage")=3
end if
end if
if sumbit="不同意" then 
rs("stage")=0
end if
if sumbit="提交" then
	if code="CN" then 
	rs("stage")=1
	end if
end if
rs.update
rs.movenext
set rs=nothing
set conn=nothing
%>
<div align="center"><a href="javascript:window.close();">关闭</a></div>
</body>
</html>
