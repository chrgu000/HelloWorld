<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
<%
IDNum=request.Form("IDnum")
dept=request.Form("dept")
IDcount=request.Form("IDcount")
type1=request.Form("type")
Pname=request.Form("Pname")
PLeader=request.Form("PLeader")

if IDNum=""  then
    response.write("<script language=""javascript"">")
	response.write("window.alert('项目编号不可以为空');window.top.location.href='seeProject.asp';")
	response.write("</script>")
	response.End()
	end if
	if dept=""  then
    response.write("<script language=""javascript"">")
	response.write("window.alert('部门不可以为空');window.top.location.href='seeProject.asp';")
	response.write("</script>")
	response.End()
	end if
	if type1=""  then
    response.write("<script language=""javascript"">")
	response.write("window.alert('类型不可以为空');window.top.location.href='seeProject.asp';")
	response.write("</script>")
	response.End()
	end if


set cn=opendb("GFProjectType","conn","accessdsn")
set rs=server.CreateObject("adodb.recordset")
sql="select * from projectType "
rs.open sql,cn,1,3
if not rs.eof then
rs.addnew
rs("projectId")=IDNum
rs("dept")=dept
rs("type")=type1
rs("financeCount")=IDcount
rs("projectName")=Pname
rs("principal1")=PLeader
rs.update
end if
%>
</head>

<body>
<div align="center">
<form action="seeProject.asp" method="post">
<input type="submit" value="关闭" />
</form>
</div>
</body>
</html>

