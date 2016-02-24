<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
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
level=request("level")
money=request("money")
buzhu=request("buzhu")
id=request("id")
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("yzzz#in.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("yzzz#in","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from xslevel where id="&id
rs.open sql,conn,1,3
if not rs.eof then
rs("level")=level
rs("money")=money
rs("buzhu")=buzhu
rs.update
rs.movenext
response.Write("<div align=center>修改成功</div>")
else 
 response.Write("<div align=center>修改失败</div>")
end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<div align="center"><a href="javascript:history.go(-1);" target="_self">关闭本页面</a></div>
</body>
</html>