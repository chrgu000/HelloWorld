<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
%>
<%
name1=request("name")
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>

</head>
<script language="javascript" >
function add()
{
window.open("add.asp","_blank");
}
</script>

<script language="javascript" >
function del()
{
window.open("del.asp?id="+document.form.id.value,"_blank");
}
</script>

<script language="javascript" >
function save()
{
window.open("save.asp","_blank");
}
</script>
<body>
<%
set conn=server.CreateObject("adodb.connection")
path=server.MapPath("..\db\book.mdb")
conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set rs=server.CreateObject("adodb.recordset")
sql="select * from books  where name='"&name1&"'"
rs.open sql,conn,1,1
%>
<form  name="form" action="save.asp" method="post">
  <table border="1" align="center" cellpadding="0" cellspacing="0" width="80%">
    <tr bgcolor="D7E8F8">
      <td><font color="#660033" size="+1"><strong>名称</strong></font></td>
      <td><font color="#660033" size="+1"><strong>出版社</strong></font></td>
      <td><font color="#660033" size="+1"><strong>备注</strong></font></td>
      <td><font color="#660033" size="+1"><strong>是否借出</strong></font></td>
    </tr>
    <tr bgcolor="D7E8F8" >
      <td><input type="text" name="name" value="<%=rs("name")%>" /></td>
      <td><input type="text" name="press" value="<%=rs("press")%>" /></td>
      <td width="50%"><input name="content" type="text" value="<%=rs("content")%>" size="80" /></td>
      <td><input type="text" name="wether" value="<%=rs("wether")%>" /></td>
    </tr>
	<tr>
	<%if oabusyusername="赵师军" then%><td colspan="4"><div align="center"><input type="hidden" name="id" value="<%=rs("id")%>"><input type="button" value="新增" onclick="add();" />********<input type="submit" value="保存"  />********<input type="reset" value="重置"  />********<input type="button" value="删除" onclick="del();" />
	</div></td><%end if%>
	</tr>
    <%
rs.movenext
%>
  </table>
</form>
</body>
</html>
