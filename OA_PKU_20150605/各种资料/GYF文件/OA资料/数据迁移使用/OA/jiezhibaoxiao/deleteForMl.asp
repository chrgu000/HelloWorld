<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>

<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
Tnow=year(now)&"年"&month(now)&"月"&day(now)&"日"
id=request("id")
'response.Write(id)
%>
</head>

<body>
<div align="center">
<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs = server.CreateObject("adodb.recordset")
sql="select * from ReimMilti where id="&id
rs.open sql,conn,1,3
if not rs.eof then

on error resume next
'set cn=server.CreateObject("adodb.connection")
'path1=server.MapPath("finance.mdb")
'cn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path1
set cn=opendb("finance","conn","sql")
set rs1= server.CreateObject("adodb.recordset")
sql1="select * from ItemForMilti where Itemid= "&id
rs1.open sql1,cn,1,3
do while not rs1.eof 
rs1.delete()
rs1.movenext
rs1.update
loop

rs.delete()
rs.update
response.Write("删除成功")
end if
if rs.eof then
response.Write("删除失败")
end if

%>

<form action="mainReim.asp">
<input type="submit" value="关闭" onclick="javascript：window.history.go(-1);" />
</form>
</form>
</body>
</div>
</html>