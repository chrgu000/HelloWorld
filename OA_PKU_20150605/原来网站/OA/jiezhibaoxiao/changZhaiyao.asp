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
type1=request.Form("type")
content=request.Form("content")
id=request.Form("id")

'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("CostType.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("CostType","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from costtype where id="&id
rs.open sql,conn,1,3
if not rs.eof and not rs.bof then
rs("type")=type1
rs("content")=content
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
</body>
</html>
