<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>
<%
name1=request("name")
press=request("press")
content=request("content")
wether=request("wether")
%>
<%
set conn=server.CreateObject("adodb.connection")
path=server.MapPath("..\db\book.mdb")
conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set rs=server.CreateObject("adodb.recordset")
sql="select * from books "
rs.open sql,conn,1,3
rs.addnew
rs("name")=name1
rs("content")=content
rs("press")=press
rs("wether")=wether
response.Write("javascript:window.alert('更新成功');")
rs.update
	response.write("<script language=""javascript"">")
	response.write("window.location.href='seebook.asp';")
	response.write("</script>")
%>
<body>
</body>
</html>
