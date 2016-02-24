<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>财务审批</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='mainReim.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")
notes=request("notes")
if notes="" then 
	response.write("<script language=""javascript"">")
	response.write("alert('如果不同意必须注明原因');")
	response.write("window.history.go(-1);")
	response.write("</script>")
	response.End()
end if

%>
<%
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable where id="&request("id")
rs.open sql,conn,1,3
dstatus="不同意"
success="flase"
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
	response.write("window.location.href='mainReim.asp';")
	response.write("</script>")
%>
</head>
<body>
<div align="center">
<%
if success="true" then 
response.write("<script language=""javascript"">")
response.write("alert(""完成审批成功"");")
response.write("window.location.href='mainborrow.asp';")
response.write("</script>")
else
response.write("<script language=""javascript"">")
response.write("alert(""完成审批未成功，请联系管理员"");")
response.write("window.location.href='mainborrow.asp';")
response.write("</script>")
end if
%>
</div>
</body>
</html>
