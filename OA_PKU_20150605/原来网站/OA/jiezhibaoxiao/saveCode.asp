

<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("../db/lmtof.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("lmtof","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from userinf where ID = "&request("Codeid")
rs.open sql,conn,1,3
rs("levelCode")=request("levelCode")
rs.update
response.Write("<div align=center>修改成功</div>")
set conn=nothing
%>
</body>
</html>
