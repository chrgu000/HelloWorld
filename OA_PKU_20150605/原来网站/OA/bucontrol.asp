<%@ LANGUAGE = VBScript %>
<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->

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
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<script language="javascript1.2" src="js/openwin.js"></script>
<title>oa�칫ϵͳ</title>
<style type="text/css">
<!--
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
-->
</style>
</head>
<body  topmargin="0" leftmargin="0">

<center>
  <table width="583"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="21"><div align="center">
          <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="2" height="25"><span class="style2"><img src="images/main/l3.gif" width="2" height="25"></span></td>
              <td background="images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="21"><div align="center"><span class="style2"><img src="images/main/icon.gif" width="15" height="12"></span></div></td>
                    <td class="style7">�û�����</td>
                  </tr>
              </table></td>
              <td width="1"><span class="style2"><img src="images/main/r3.gif" width="1" height="25"></span></td>
            </tr>
          </table>
          <font color="0D79B3"></font></div></td>
    </tr>
  </table>
  <br>
  <table>
<tr>
<td>��ҵ�����ƹ���&nbsp;&nbsp;&nbsp;&nbsp</td>
<form method="post" action="adduser.asp">
<td>
<input type="submit" name="submit" value="�����û�">
</td>
</form>
<form method="post" action="userlevelcontrol.asp">
<td>
<input type="submit" name="submit" value="ְλ���ƹ���">
</td>
</form>
</tr>
</table>
</center>

<br>
<center>
<%
buname=request("buname")
oldbuname=request("oldbuname")
bucode=request("bucode")
id=request("id")
'response.Write(buname)
'-----------------------------------------------
if request("submit")="����" and buname<>"" then

'�ж��Ƿ��������ӵĲ�����ͬ��
set conn=opendb("lmtof","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from dept where code='B' and dept=" & sqlstr(buname)
'response.write(sql)
rs.open sql,conn,1
if not rs.eof and not rs.bof then
%>
<font color=red><%=buname%>����ҵ���Ѿ����ڣ���ѡ��������ҵ����</font><br>
<%

else
sql = "Insert Into dept (dept,code,bucode) Values( " & sqlstr(buname) & ",'B',"& sqlstr(bucode) &")"
conn.Execute sql
%>
<font color=red><%=buname%>���ӳɹ���</font>
<%
end if
end if
'---------------------------------------------------
if request("submit")="ɾ��" then
set conn=opendb("lmtof","conn","accessdsn")
sql="delete  from dept where code='B' and dept=" & sqlstr(oldbuname)
conn.Execute sql
%>
<font color=red><%=buname%>ɾ���ɹ���</font>
<%
end if
'---------------------------------------------------
if request("submit")="�޸�" then

'�ж��Ƿ������޸ĵĲ�����ͬ��
set conn=opendb("lmtof","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from dept where dept=" & sqlstr(buname) & " and id<>" & id
rs.open sql,conn,1
if not rs.eof and not rs.bof then
%>
<font color=red><%=buname%>����ҵ���Ѿ����ڣ������޸�Ϊ�����ƣ�</font><br>
<%
else
sql = "update dept set dept=" & sqlstr(buname) & ",bucode="& sqlstr(bucode) & " where id=" & id
conn.Execute sql

sql = "update userinf set userdept=" & sqlstr(buname) & " where userdept=" & sqlstr(oldbuname)
'response.write(sql)
conn.Execute sql

%>
<font color=red>�޸ĳɹ���</font>
<%
end if
end if
%>
<table border="0" cellpadding="0"  cellspacing="1" bgcolor="B0C8EA">
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from dept where code='B'"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<tr>
<form method="post" action="bucontrol.asp">
<td bgcolor="#FFFFFF">
<input type="submit" name="submit" value="ɾ��"></td><td bgcolor="#FFFFFF"><input type="hidden" name="oldbuname" value="<%=rs("dept")%>">
  <input type="hidden" name="id" value=<%=rs("id")%>> <input type="text" name="buname" value="<%=rs("dept")%>"><input type="text" name="bucode" value="<%=rs("bucode")%>"></td><td bgcolor="#FFFFFF"><input type="submit" name="submit" value="�޸�"></td>
</form>
</tr>
<%
rs.movenext
wend
%>
</table>
<form method="post" action="bucontrol.asp">
��ҵ��:<input type="text" name="buname">����:<input type="text" name="bucode"><input type="submit" name="submit" value="����">
</form>
</center>
<%

%>
</body>
</html>