<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
</head>
<%
  set conn=server.CreateObject("adodb.connection")
  path=server.Mappath("db/asset.mdb")
  conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
  set rs=server.CreateObject("adodb.recordset")
  sql="select * from asset "
  rs.open sql,conn,1,1  
%>
<body>
<div align="center">
<table border="1" cellpadding="1" cellspacing="0" width="100%">
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td>���</td><td>ʹ����</td><td>CPU</td><td>��ʾ��</td><td>����</td><td>����</td><td>�ڴ�</td><td>����</td><td>���</td><td>����</td><td>Ӳ��</td><td>�Կ�</td><td>����</td><td>����</td>
</tr>
<% do  while not rs.eof  %>
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><%=rs("ID")%></td><td><%=rs("username")%></td><td><%=rs("CPU")%></td><td><%=rs("display")%></td><td><%=rs("keyboard")%></td><td><%=rs("netcard")%></td><td><%=rs("memory")%></td><td><%=rs("cddriver")%></td><td><%=rs("mouse")%></td><td><%=rs("soundcard")%></td><td><%=rs("harddisk")%></td><td><%=rs("dispalycard")%></td><td><%=rs("mainbord")%></td><td><%=rs("crate")%></td>
</tr>
<% 
rs.movenext
loop 
%>
</table>
</div>
</body>
</html>
