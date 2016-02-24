<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<%
level=request.Form("level")
money=request.Form("money")
buzhu=request.Form("buzhu")

    if level=""  then
    response.write("<script language=""javascript"">")
	response.write("window.alert('级别不可以为空');window.top.history.go(-1);")
	response.write("</script>")
	response.End()
	end if
	if money=""  then
    response.write("<script language=""javascript"">")
	response.write("window.alert('金额不可以为空');window.top.history.go(-1);")
	response.write("</script>")
	response.End()
	end if
	if buzhu=""  then
    response.write("<script language=""javascript"">")
	response.write("window.alert('补助不可以为空');window.top.history.go(-1);")
	response.write("</script>")
	response.End()
	end if
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("yzzz#in.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("yzzz#in","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from xslevel "
rs.open sql,conn,1,3

rs.addnew
rs("level")=level
rs("money")=money
rs("buzhu")=buzhu
rs.update
response.Write("增加成功")

%>
</head>

<body>
<div align="center">
<br />
</div>
</body>
</html>
