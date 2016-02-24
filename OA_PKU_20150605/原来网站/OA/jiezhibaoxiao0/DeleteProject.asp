<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>删除项目编号</title>

</head>

<body>
<div align="center">
<%
projectID=request("projectId")
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("GFProjectType.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("GFProjectType","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from projectType_old where projectId = "&"'"&request("projectId")&"'"
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
</body>
</html>
