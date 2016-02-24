<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
<%
type1=request.Form("type")
content=request.Form("content")
if type1=""  then
    response.write("<script language=""javascript"">")
	response.write("window.alert('项目分类不可以为空');window.top.location.href='seeZhaiyao.asp';")
	response.write("</script>")
	response.End()
	end if
	if content=""  then
    response.write("<script language=""javascript"">")
	response.write("window.alert('详细摘要不能为空');window.top.location.href='seeZhaiyao.asp';")
	response.write("</script>")
	response.End()
	end if
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("CostType.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("CostType","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from costtype "
rs.open sql,conn,1,3
if not rs.eof then
rs.addnew
rs("type")=type1
rs("content")=content
rs.update
end if
%>
</head>

<body>
<div align="center">
增加成功
</div>
</body>
</html>