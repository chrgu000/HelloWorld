<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
</head>
<%
'set conn=server.CreateObject("adodb.connection")
'DBPath1=server.mappath("finance.mdb")
'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
sql= "select * from borrowlist"
rs.open sql,conn,1,3
do while not rs.bof and not rs.eof 
   if rs("stage")=5 then
   rs("stage")=25
   end if
   if rs("stage")=6 then
   rs("stage")=26
   end if
   if rs("stage")=7 then
   rs("stage")=27
   end if
   if rs("stage")=8 then
   rs("stage")=28
   end if
   if rs("stage")=9 then
   rs("stage")=29
   end if
   if rs("stage")=10 then
   rs("stage")=30
   end if
   if rs("stage")=11 then
   rs("stage")=31
   end if  
rs.movenext
loop
%>
<body>
</body>
</html>
