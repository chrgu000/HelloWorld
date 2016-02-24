<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>表单签字</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='mainReim.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")
signtime=year(now())&"年"&month(now())&"月"&day(now())&"日"
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable where id="&id
rs.open sql,conn,1,3
rs("stage")=9
rs("haveverify")=rs("haveverify")&rs("nowverify")
rs("nowverify")=""
rs("signtime")=signtime
rs.update
rs.close
set rs=nothing
set conn=nothing
%>
</head>

<body>
<div align="center">
<form action="mainReim.asp" method="post">
<input  type="submit" value="关闭" />
</form>
</div>
</body>
</html>
