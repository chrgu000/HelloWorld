<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
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
projectId=request("projectId")
dept=request("dept")
financeCount=request("financeCount")
projectName=request("projectName")
principal1=request("principal1")
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("GFProjectType.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("GFProjectType","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from projectType where  projectId="&"'"&projectId&"'"
rs.open sql,conn,1,3
if not rs.eof then
rs("projectId")=projectId
rs("dept")=dept
rs("financeCount")=financeCount
rs("projectName")=projectName
rs("principal1")=principal1
rs.update
rs.movenext
response.Write("<div align=center>修改成功</div>")
else 
 response.Write("<div align=center>修改失败</div>")
end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改项目信息</title>
</head>

<body>
<div align="center">
<form action="seeProject.asp" method="post">
<input type="submit" value="关闭" />
</form>
</div>
</body>
</html>
