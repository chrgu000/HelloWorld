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
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end()
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�޸�remark</title>
</head>
<body>
<%
id=request("id")
sub1=request("sub")
content=request("content")
if sub1="�ύ" then
if id="" or content="" then
	response.write("<script language=""javascript"">")
	response.write("alert('������ID��ע');history.go(-1);")
	response.write("</script>")
	response.end()
end if
	set conn=opendb("finance","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from reimlisttable_old where id="&id
	rs.open sql,conn,1,3
	 On Error Resume Next 
	 	if not rs.eof and not rs.bof then
			rs("remark")=content
			rs.update
			response.Write("<div align=center>�޸����</div>")
			rs.movenext
	 	end if

	Set rs = nothing
	Set conn = nothing
end if
%>
<%
	set conn=opendb("finance","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	if sub1<>"�ύ" then
	sql="select id,claimant,remark,money,stage from reimlisttable_old where id>10000"
	end if
	if sub1="�ύ" then
	sql="select id,claimant,remark,money,stage from reimlisttable_old where id="&id
	end if
	rs.open sql,conn,1,1

'�ֶκ�
fieldCount = rs.Fields.Count

'����ֶκ�
'Response.Write("<div align=center>�ܹ��ж��ٸ��ֶ�" & fieldCount & "</div>")
%><div align=center>
<table cellspacing="0" cellpadding="0" border="1" bgcolor="D7E8F8" bordercolor="#339999" width="75%">
 <tr>
  <!--����ֶε�����-->
  <%
   For i = 0 to fieldCount - 1
    Response.Write("<th>" & rs.Fields(i).Name & "</th>")
   Next
  %>
  
  <!--��������ֶε�����-->
  <%
   Do while not rs.Eof
     temp = "<tr>"
     '----ѭ�������ֶε�ֵ������������
     For n = 0 to fieldCount - 1 
      temp = temp & "<td width=25%   align=justify>&nbsp;" & rs.Fields(n).Value & "</td>"
     Next
     '----End
     Response.Write temp & "</tr>"
   rs.movenext
   Loop
  %>
 </tr>
</table>

<%
rs.close
Set rs = nothing
conn.close
Set conn = nothing
%>

<form action="contentch.asp" method="post">
�����޸ĵ�id��<input type="text" name="id" size="4"/><br />
���뱸ע<textarea name="content"  cols="50" rows="4"/></textarea>
<br /><input type="submit" name="sub" value="�ύ"/>
</form> 
</div>
</body>
</html>
