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
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='../default.asp';")
	response.write("</script>")
	response.end
end if
%>
<%
       name1=request.Form("name")
	   note=request.Form("note")
	   advise=request.Form("advise")
	   time1=year(now())&"��"&month(now())&"��"&day(now())&"��"
	   submit=request.Form("submit")
	   'response.Write(submit)
	   if note="" and submit="�ύ" then
%>
  <script language="javascript">
      alert("����ı���Ϊ�գ���������д");
	  window.location.href="question.asp";
  </script>
<%
	   end if
	   if note<>"" and submit="�ύ" then
       'set conn=server.CreateObject("adodb.connection")
          ' path=server.MapPath("note.mdb")
          ' conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
		  set conn=opendb("note","conn","sql")
       set rs=server.createobject("adodb.recordset")
          sql="select * from question"
       rs.open sql,conn,1,3
        rs.addnew
		rs("name")=name1
		rs("time")=time1
		rs("note")=note
		rs("advise")=advise
		rs.update
		rs.movenext
       set conn=nothing
       set rs=nothing
	   response.Write("<div align=center>�ύ���<br><a href='question.asp' target='_self'>����</a></div>")
	   end if
	   
	   if submit="ɾ��ȫ��" then
       set conn=opendb("note","conn","accessdsn")
       set rs=server.createobject("adodb.recordset")
       sql="select * from question"
       rs.open sql,conn,1,3
        do while not rs.eof and not rs.bof
		 rs.delete 
		 rs.update
		rs.movenext
		loop
       set conn=nothing
       set rs=nothing
	    response.Write("<div align=center>ɾ��ȫ�����<br><a href='question.asp' target='_self'>����</a></div>")
	   end if
	
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����ռ�</title>
</head> 
<style type="text/css">
<!--
body {
	background-color: #335e91;
}
.style2 {color: #2d4865}
.style3 {color: #334d66}
.style4 {color: #2e4869}
-->

img { 
display:block; 
width:800px; 
height:450px; 
padding-bottom:5px; 
background:url(beijing.jpg) no-repeat left bottom; 
} 
</style>
<body background="beijing.jpg">
<div  align="center">
<form action="question.asp" method="post" name="form">
<% if submit="" then%>
<div align="center">����ʦ���������⼰����</div>
<br /><br /><br /><br />
<table bgcolor="#99CCCC">
<tr>
<input type="hidden" name="name" value="<%=oabusyusername%>" />
<td>����������</td>
<td>
<input name="note" type="text" value="" size="80" />
</td>
</tr>
<tr>
<td>
���鷽����
</td>
<td>
<textarea name="advise" cols="79" rows="5"></textarea> 
</td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit"  name="submit" value="�ύ"/><input type="reset" value="����" /><%if oabusyusername="��ʦ��" then %><input type="submit" name="submit" value="��ѯ"/><%end if%>
</td>
</tr>
</table>
<%end if %>
<%if submit="��ѯ"  then
       set conn=opendb("note","conn","accessdsn")
       set rs=server.createobject("adodb.recordset")
       sql="select * from question order by id"
       rs.open sql,conn,1,1
	    if rs.eof and rs.bof then
		response.Write("û�м�¼")
		end if
	if not rs.bof and not rs.eof then
%>
<table bgcolor="#99CCCC" border="1" cellspacing="1" cellpadding="1" width="80%" >
<tr>
<td>���</td>
<td>ʱ��</td>
<td>������</td>
<td>��������</td>
<td>���鷽��</td>
</tr>
<%do while not rs.eof and not rs.bof %>
<tr>
<td><%=rs("id")%></td>
<td><%=rs("time")%></td>
<td><%=rs("name")%></td>
<td><%=rs("note")%></td>
<td><%=rs("advise")&"&nbsp;"%></td>
</tr>
<%
rs.movenext
loop
%>
<%
       set conn=nothing
       set rs=nothing
%>
</table>
<input type="submit" name="submit" value="ɾ��ȫ��" />
<% end if%>
<a href="question.asp" target="_self">����</a>
<%end if%>
</form>
</div>
</body>
</html>
