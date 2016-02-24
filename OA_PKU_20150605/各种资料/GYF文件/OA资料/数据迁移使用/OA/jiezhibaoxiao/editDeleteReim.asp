<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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

%>
</head>

<body>
<div align="center">
<%
set conn=opendb("finance","conn","sql")
set rs = server.CreateObject("adodb.recordset")
sql="select * from reimlisttable where id="&id ' 这个地方可能会出现错误的 因为sql 语法不知道是否使用正确了
rs.open sql,conn,1,3
if not rs.eof then
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
</div>
</body>
</html>
