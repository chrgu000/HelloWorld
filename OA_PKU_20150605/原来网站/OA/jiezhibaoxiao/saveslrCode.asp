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
code=oabusyuserlevelCode
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
</head>
<%
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("../db/lmtof.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("lmtof","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from userinf where ID = "&request("Codeid")
rs.open sql,conn,1,3
rs("slrlevel")=request("slrlevel")
rs.update
response.Write("<div align=center>�޸ĳɹ�</div>")
set conn=nothing
%>
<body>
</body>
</html>
