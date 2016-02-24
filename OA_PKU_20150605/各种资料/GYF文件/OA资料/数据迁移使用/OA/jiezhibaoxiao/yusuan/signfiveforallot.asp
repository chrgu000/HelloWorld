<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<%
kh=request("kt")
id=request("id")
if kh="ok" then
set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select stage from ProinM where id="&id
	rs.open sql,conn,1,3
	if not rs.eof and not rs.bof then
		rs("stage")=6
	rs.update
	end if
	response.Write("<script LANGUAGE=javascript>alert('处理成功');window.location.href='manageallot.asp';</script>")
	set rs=nothing
	set conn=nothing
end if 
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
</body>
</html>
