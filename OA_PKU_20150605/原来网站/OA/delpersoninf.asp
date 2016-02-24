<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="asp/opendb.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>删除员工信息</title>
<%
'-----------------------------------------
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
username=request("username")
'response.Write(username)
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from personinf where username=" &"'"&request("username")&"'"
rs.open sql,conn,1,3
if not rs.eof  then
rs.delete
rs.update
rs.movenext
response.Write("<div align=center>删除成功</div>")
else 
response.Write("<div align=center>删除失败</div>")
end if
%>
</head>

<body>
</body>
</html>
