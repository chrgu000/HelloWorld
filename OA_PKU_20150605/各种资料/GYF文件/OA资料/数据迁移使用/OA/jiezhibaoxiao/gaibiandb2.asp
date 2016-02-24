<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
</head>
<%
set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
sql= "select * from borrowlist"
rs.open sql,conn,1,3
do while not rs.bof and not rs.eof   
   '-------------------------------------------
   if rs("stage")=25 then
   rs("stage")=7
   end if
   if rs("stage")=26 then
   rs("stage")=8
   end if
   if rs("stage")=27 then
   rs("stage")=9
   end if
   if rs("stage")=28 then
   rs("stage")=10
   end if
   if rs("stage")=29 then
   rs("stage")=12
   end if
   if rs("stage")=30 then
   rs("stage")=13
   end if
   if rs("stage")=31 then
   rs("stage")=11
   end if
rs.movenext
loop
%>
<body>
</body>
</html>