<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>�ޱ����ĵ�</title>
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
	response.write("window.alert('�������Ϊ��');")
	response.write("</script>")
	response.end
end if
'response.Write(id)
'response.Write(notes)
%>
<%
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from ReimMilti where  id = " &id 
rs.open sql,conn,1,3
if oabusyuserlevelCode="DSZ" then 
rs("Stage")=8
rs("ManagerView")=notes
rs("ManagerDisagrTime")=year(now)&"��"&month(now)&"��"&day(now)&"��"
rs.update
end if
if oabusyuserlevelCode<>"DSZ" then
response.Write("�Բ�������Ȩ�ޣ�")
end if
%>
</head>
<body>
<div align="center">
<form action="mainReim.asp" method="post">
<input type="submit" value="�ر�" />
</form>
</div>
</body>
</html>

