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
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if

%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目摘要</title>
<script language="javascript">
function addzhaiyao()  
{
    
	window.open('addzhaiyao.asp',"_self");
}
</script>
</head>

<body>
<div align="center">
<table border="1" cellpadding="1" cellspacing="0" width="40%">
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td>项目类型</td><td>详细摘要</td><%if oabusyuserlevelCode="CW" or oabusyuserlevelCode="CWZG" then%><td>操作</td><% end if%>
</tr>
<%
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("CostType.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("CostType","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from costtype "
rs.open sql,conn,1,1
do while not rs.eof 
%>
<tr>
<td><%=rs("type")%></td>
<td><%=rs("content")%></td>

<%if oabusyuserlevelCode="CW" or oabusyuserlevelCode="CWZG" then%><td><a href=editZhaiyao.asp?id=<%response.Write(rs("id"))%>>编辑</a></td><% end if%>
</tr>
<%
rs.movenext
loop
%>
</table>
<form name="form" method="post" action="addItem.asp">
<%if oabusyuserlevelCode="CW" or oabusyuserlevelCode="CWZG" then%> <input type="button" value="增加摘要信息"  onclick="addzhaiyao();"/><%end  if%>
</form>
</div>
</body>
</html>
