<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>������֧��</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")
notes=request("notes")
if notes="" then 
	response.write("<script language=""javascript"">")
	response.write("alert('�����ͬ�����ע��ԭ��');")
	response.write("window.history.go(-1);")
	response.write("</script>")
	response.End()
end if
%>
<%

set conn1=opendb("lmtof","conn","sql")
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from userinf where username="&"'"&oabusyusername&"'"
rs1.open sql1,conn1,1,1

set conn1=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from borrowlist where id="&request("id")
rs.open sql,conn1,1,3
dstatus="��ͬ��"
success="flase"
'-----------------------------------------------------------------------
rs("stage")=10
oldnowverify=rs("nowverify")
rs("notes")=rs("notes")&oldnowverify&":"&dstatus&notes&"####" 
rs("willverify")=rs("haveverify")&rs("nowverify")&"--"&rs("willverify")
rs("haveverify")=""
rs("nowverify")=""
rs.update
success="true"
'-----------------------------------------------------------------------
	response.write("<script language=""javascript"">")
	response.write("window.location.href='mainborrow.asp';")
	response.write("</script>")
%>
</head>
<body>
<div align="center">
<%
if success="true" then 
response.write("<script language=""javascript"">")
response.write("alert(""��������ɹ�"");")
response.write("window.location.href='mainborrow.asp';")
response.write("</script>")
else
response.write("<script language=""javascript"">")
response.write("alert(""�������δ�ɹ�������ϵ����Ա"");")
response.write("window.location.href='mainborrow.asp';")
response.write("</script>")
end if
%>
</div>
</body>
</html>
