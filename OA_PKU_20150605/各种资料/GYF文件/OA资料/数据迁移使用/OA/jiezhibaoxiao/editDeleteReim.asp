<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>

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
Tnow=year(now)&"��"&month(now)&"��"&day(now)&"��"
id=request("id")

%>
</head>

<body>
<div align="center">
<%
set conn=opendb("finance","conn","sql")
set rs = server.CreateObject("adodb.recordset")
sql="select * from reimlisttable where id="&id ' ����ط����ܻ���ִ���� ��Ϊsql �﷨��֪���Ƿ�ʹ����ȷ��
rs.open sql,conn,1,3
if not rs.eof then
rs.delete()
rs.update
response.Write("ɾ���ɹ�")
end if
if rs.eof then
response.Write("ɾ��ʧ��")
end if
%>

<form action="mainReim.asp">
<input type="submit" value="�ر�" onclick="javascript��window.history.go(-1);" />
</form>
</form>
</div>
</body>
</html>
