<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<%
		set conn=opendb("finance","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select * from reimlisttable_old where stage=8"
        rs.open sql,conn,1,3
        do while not rs.eof and not rs.bof  
           rs("stage")=9
           rs.update
           rs.movenext
        loop
		response.Write("<script language=javascript>alert('完成啦');</script>")
        set rs=nothing
        set conn=nothing
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>改变流程变化的数据库</title>
</head>

<body>
</body>
</html>
