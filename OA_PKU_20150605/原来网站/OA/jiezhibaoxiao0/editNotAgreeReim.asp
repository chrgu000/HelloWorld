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
	response.write("alert('如果不同意必须注明原因');")
	response.write("window.history.go(-1);")
	response.write("</script>")
	response.End()
end if

%>
<%
'set conn1=server.CreateObject("adodb.connection")
'path1=server.MapPath("../db/lmtof.mdb")
'conn1.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path1
set conn1=opendb("lmtof","conn","sql")
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from userinf where username="&"'"&oabusyusername&"'"
rs1.open sql1,conn1,1,1
'response.Write(rs1("userlevel"))
'-----------------------------------------------------------------------
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable_old where id="&request("id")
rs.open sql,conn,1,3
stage=rs("stage")
rs("stage")=10
'-----------------------------------------------------------------------
if rs1("levelCode")="BMJL" then 
  if stage=1 then
     rs("principalNotes")=notes
     rs("principalDissentTime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
  end if 
  if stage=2 then
     rs("deptNotes")=notes
     rs("deptDissentTime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
   end if
rs.update
end if
'-----------------------------------------------------------------------
if rs1("levelCode")="CWZG" then 
rs("financialNotes")=notes
rs("financialDissentTime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
end if
'-----------------------------------------------------------------------
if rs1("levelCode")="DSZ" then 
rs("gManagerNotes")=notes
rs("gManagerDissentTime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
end if
'-----------------------------------------------------------------------
	response.write("<script language=""javascript"">")
	response.write("window.location.href='mainReim.asp';")
	response.write("</script>")
%>
</head>
<body>
<div align="center">
<form action="mainReim.asp" method="post">
<input type="submit" value="关闭" />
</form>
</div>
</body>
</html>
