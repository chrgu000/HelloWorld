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
'           path=server.MapPath("note.mdb")
'           conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
			set conn=opendb("note","conn","sql")
       set rs=server.createobject("adodb.recordset")
          sql="select * from [note]"
       rs.open sql,conn,1,3
        rs.addnew
		rs("name")="jun"
		rs("time")=year(now())&"年"&month(now())&"月"&day(now())&"日"
		rs("note")="de"
		rs("advise")="dd"
		rs.update
		rs.movenext
       set conn=nothing
       set rs=nothing
	   response.Write("提交完成")

	   %>
<body>
</body>
</html>
