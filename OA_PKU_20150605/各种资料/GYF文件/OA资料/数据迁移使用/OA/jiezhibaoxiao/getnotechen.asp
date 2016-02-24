<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="opendb.asp"-->
<%
id=Request.QueryString("id")
notechen=Request.QueryString("notec")
'response.Write(notechen)
'response.Write(id)
if Trim(notechen)="" then
response.Write("<script languange=javascript>alert('请您填写您的意见');window.history.back();</script>")
response.end
end if
if Trim(notechen)<>"" then
set conn=opendb("finance","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select * from reimlisttable where id="&id
        rs.open sql,conn,1,3
        if not rs.eof and not rs.bof then
           rs("notechen")=notechen
        rs.update
        rs.movenext
        end if
        set rs=nothing
        set conn=nothing
	response.Write("您的意见已经保存")
end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
</body>
</html>
