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
id=request("id")
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
</head>
<script language="javascript">
function DeleteZhaiYao()
{
window.open('DeleteZhaiyao.asp?id='+ document.form.id.value,"_self");
}
</script>
<%
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("CostType.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("CostType","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from costtype where id="&id
rs.open sql,conn,1,1
do while not rs.eof 
%>
<body>
<div align="center">
<form name="form" action="changZhaiyao.asp" method="post">
<table border="1" cellpadding="1" cellspacing="0" width="100%">
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td>��Ŀ����</td><td>��ϸժҪ</td>
</tr>
<tr>
<td><input type="hidden" name="id" value="<%=rs("id")%>" /><input type="text" name="type" value="<%=rs("type")%>" /></td>
<td><input type="text" name="content" value="<%=rs("content")%>" /></td>
</tr>
</table>

<%
rs.movenext
loop
%>
<input type="submit" value="�޸�" />
<input type="button" value="�ر�" onclick="javascript:window.close();" />
<input type="button" value="ɾ��" onclick="DeleteZhaiYao();" />
</form>
</div>
</body>
</html>
