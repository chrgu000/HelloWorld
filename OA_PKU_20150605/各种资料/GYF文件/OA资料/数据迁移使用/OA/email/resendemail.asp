<%@ LANGUAGE = VBScript %>
<%response.expires=0%>

<!--#include file="publiclist.asp"-->
<!--#include file="../asp/opendb.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyuserid=request.cookies("oabusyuserid")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" or oabusyuserid="" then 
	response.write("<script language=""javascript"">")
	response.write("alert(""���Ѿ����ڣ������µ�¼��"");")
	response.write("window.close();")
	response.write("</script>")
	response.end
end if
id=request.querystring("id")
if id="" then
	response.write("<script language=""javascript"">")
	response.write("alert(""���ݴ��ͳ������رմ��ڣ�"");")
	response.write("window.close();")
	response.write("</script>")
	response.end
end if	
if request("submit")="���·���" then
	emailtitle=rtrim(request("title"))
	emailcontent=rtrim(request("content"))
	adduser=trim(request("getuser"))
	hidevalue=trim(request("hidevalue"))
	call sendemailsub("change")
	response.write("<p align=""center""><font color=""#dd0000"">����2�����Զ��رգ�</font></p>")
	response.write("<script language=""javascript"">")
	response.write("opener.location.reload();")
	response.write("setTimeout('window.close()',2000);")
	response.write("</script>")
	response.end
end if
set conn=opendb("oabusy","conn","accessdsn")
'on error resume next
set rs=server.createobject("adodb.recordset")
sql="select * from sendemailtable where sendemailtable.autoid="&id
rs.open sql,conn,1
if not rs.eof and not rs.bof then
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/css.css">
<SCRIPT language=javascript>
<!--
if (window.Event) 
��document.captureEvents(Event.MOUSEUP); 
 
function nocontextmenu() {
 event.cancelBubble = true
 event.returnvalue = false;
 return false;
}
 
function norightclick(e) {
 if (window.Event) {
��if (e.which == 2 || e.which == 3)
�� return false;
 } else if (event.button == 2 || event.button == 3) {
�� event.cancelBubble = true
�� event.returnvalue = false;
�� return false;
 } 
}
 
document.oncontextmenu = nocontextmenu;��// for IE5+
document.onmousedown = norightclick;���� // for all others
//-->
</SCRIPT>
<script language="javascript">
function addgetemailuser()
{
	win=window.open('addgetuser.asp','adduserwin','toolbar=no,scrollbars=yes,resizable=0,menubar=no,width=450,height=440');
}
function checkform()
{
	if (document.form1.getuser.value.length<1)
		{
			alert("�ռ��˲���Ϊ�գ��밴�����ӡ���ť�����ռ��ˣ�");
			document.form1.adduser.focus();
			return (false);
		}
	if (document.form1.title.value.length<1)
		{
			alert("�ʼ����ⲻ�ܿգ�");
			document.form1.title.focus();
			return (false);
		}
	return (true);
}
</script>
<title>���·����ʼ���</title>
</head>
<body>
<center>
<p><font size="+1" color="#dd0000">���·����ʼ�</font></p>
  <table border="1" width="500" cellspacing="0" cellpadding="0" bordercolorlight="#6FECFF" bordercolordark="#FFFFFF">
    <tr>
      <td bgcolor="D8F7FF" bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF" align="left" width="488" height=30>
      <font color="#336699"><%=server.htmlencode(rs("emailtitle"))%>��<%=cstr(rs("emaildate"))%>���͸�<%=server.htmlencode(rs("explain"))%>��</font>	  </td>
    </tr>
  <center>
    <tr>
      <td width="488" align="left">
<%
	content=server.htmlencode(rs("emailcontent"))
	content=replace(content,chr(13)&chr(10),"<br>")
	content=replace(content," ","&nbsp;")
	response.write(content)
%>		
	</td>
    </tr>
  </table>
<br><center><font color="#dd0000" size="+1">�ظ��ʼ�</font></center>
<form method="post" name="form1" action="resendemail.asp?id=<%=id%>" onSubmit="return checkform();"> 
<table width="500" border="0" cellpadding="0" cellspacing="1" bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF" bgcolor="#6FECFF"> 
<tr> 
<td bgcolor="D8F7FF"> 
�� �� �ˣ�
  <input type="text" name="getuser" size="50" value="<%=server.htmlencode(rs("explain"))%>" onFocus="document.form1.title.focus();"><font color=red>*<input type="button" value="����" name="adduser" onClick="addgetemailuser();"></font>
<input type="hidden" name="hidevalue" value="<%=rs("explain1")%>"></td>
</tr>
<tr>
<td bgcolor="D8F7FF">
�ʼ����⣺
  <input type="text" name="title" size=50 value="<%=server.htmlencode(rs("emailtitle"))%>"><font color=red>*</font></td>
</tr>
<tr>
<td bgcolor="D8F7FF">
<center>�ʼ�����</center><textarea rows="9" name="content" cols="60"><%=server.htmlencode(rs("emailcontent"))%></textarea></td>
</tr>
</table>
<br>
<input type="submit" name="submit" value="���·���">&nbsp;&nbsp;<input type="button" value="�ر�" onClick="window.close()">
</form>
</center>	
</body>
</html>
<%
conn.close
end if
%>
