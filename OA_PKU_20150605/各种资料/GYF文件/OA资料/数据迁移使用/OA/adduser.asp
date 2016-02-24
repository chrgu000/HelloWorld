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
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username='" & oabusyusername&"'"
rs.open sql,conn,1
cook_allow_control_all_user=rs("allow_control_all_user")     
conn.close
set conn=nothing
set rs=nothing
if cook_allow_control_all_user="no" then
response.write("<font color=red size=""+1"">对不起，您没有这个权限！</font>")
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
<title>oa办公系统</title>
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
<SCRIPT language=javascript>
<!--
if (window.Event) 
　document.captureEvents(Event.MOUSEUP); 
 
function nocontextmenu() {
 event.cancelBubble = true
 event.returnvalue = false;
 return false;
}
 
function norightclick(e) {
 if (window.Event) {
　if (e.which == 2 || e.which == 3)
　 return false;
 } else if (event.button == 2 || event.button == 3) {
　 event.cancelBubble = true
　 event.returnvalue = false;
　 return false;
 } 
}
 
document.oncontextmenu = nocontextmenu;　// for IE5+
document.onmousedown = norightclick;　　 // for all others
//-->
</SCRIPT>
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
                    <td class="style7">用户设置</td>
                  </tr>
              </table></td>
              <td width="1"><span class="style2"><img src="images/main/r3.gif" width="1" height="25"></span></td>
            </tr>
          </table>
          <font color="0D79B3"></font></div></td>
    </tr>
  </table>
  <br>
  <br>
  <table>
<tr>
<td>增加用户&nbsp;&nbsp;&nbsp;&nbsp;</td>
<form method="post" action="deptcontrol.asp">
<td>
<input type="submit" name="submit" value="部门名称管理">
</td>
</form>
<form method="post" action="userlevelcontrol.asp">
<td>
<input type="submit" name="submit" value="职位名称管理">
</td>
</form>
</tr>
</table>
</center>

<%
oabusyuserdept=request.cookies("oabusyuserdept")
if request("submit")="增加" then
username=request("username")
password=request("password")
name=request("name")
userdept=request("userdept")
userlevel=request("userlevel")
'判断是否有与申请的用户名相同的
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(username) 
rs.open sql,conn,1
if not rs.eof and not rs.bof then
%>
<center>
<br><br>
<font color=red>用户名为<%=username%>的用户已经存在，请选择其他用户名</font><br>
<a href="javascript:void(null)" onClick="history.go( -1 );return true;"><font color="blue">返回</font></a>
</center>
<%
else
	sql = "Insert Into [userinf] ([username],[password],[name],[userdept],[userlevel],[allow_slr_pay],[forbid]) Values("
	sql = sql & SqlStr(username) & ","
	sql = sql & SqlStr(password) & ","
	sql = sql & SqlStr(name) & ","
	sql = sql & SqlStr(userdept) & ","
	sql = sql & SqlStr(userlevel) & ","
	sql = sql & SqlStr("yes")& ","
	sql = sql & SqlStr("no")&")"
	'Response.Write (sql)
	'Response.End ()
	conn.Execute sql
%>
<br><br>
<center>
<font color=red>用户名为<%=username%>的用户注册成功！</font>
</center>
<%
end if
else
%>
<br>
<center>
<script Language="JavaScript">
 function maxlength(str,minl,maxl) {
    if(str.length <= maxl && str.length >= minl){return true;}else{return false;}
                                    }

 function form_check(){
   var l1=maxlength(document.form2.username.value,1,20);
   if(!l1){window.alert("用户名的长度大于1位小于20位");document.form2.username.focus();return (false);}

   var l2=maxlength(document.form2.password.value,1,20);
   if(!l2){window.alert("密码的长度大于1位小于20位");document.form2.password.focus();return (false);}

   var a1=document.form2.password.value;
   var a2=document.form2.repassword.value;
   if(a1!=a2){window.alert("两次输入的密码应相同");document.form2.repassword.focus();return (false);}

   var l3=maxlength(document.form2.name.value,1,20);
   if(!l3){window.alert("姓名的长度大于1位小于20位");document.form2.name.focus();return (false);}

                    }
</script>
<form action="adduser.asp" method=post name="form2" onSubmit="return form_check();">
<table border=0 cellpadding="0" cellspacing="1" bgcolor="B0C8EA">
<tr>
<td bgcolor="D7E8F8">
用户名：</td><td bgcolor="#FFFFFF"><input type=text name="username" size=20><font color=red>*</font>
</td>
</tr>
<tr>
<td bgcolor="D7E8F8">
密码：</td><td bgcolor="#FFFFFF"><input type="password" name="password" size=20><font color=red>*</font>
</td>
</tr>
<tr>
<td bgcolor="D7E8F8">
密码确认：</td><td bgcolor="#FFFFFF"><input type="password" name="repassword" size=20><font color=red>*</font>
</td>
</tr>
<tr>
<td bgcolor="D7E8F8">
姓名：</td><td bgcolor="#FFFFFF"><input type="text" name="name" size=20><font color=red>*</font>
</td>
</tr>
<tr>
<td bgcolor="D7E8F8">
部门：</td><td bgcolor="#FFFFFF">
<select size=1 name="userdept">
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from dept"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<option value="<%=rs("dept")%>"><%=rs("dept")%></option>
<%
rs.movenext
wend
%>
</select><font color=red>*</font>
</td>
</tr>
<tr>
<td bgcolor="D7E8F8">
职位:</td><td bgcolor="#FFFFFF"><select name="userlevel" size=1>
<option value="总管">总管</option>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userlevel"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<option value="<%=rs("userlevel")%>"><%=rs("userlevel")%></option>
<%
rs.movenext
wend
%>
</select><font color=red>*</font>
</td>
</tr>
<tr bgcolor="#FFFFFF">
<td colspan="2" align=center>
<font color=red>*</font>必须填&nbsp;&nbsp;
<input type="submit" name="submit" value="增加"></td>
</tr>
</table>
</form>
</center>
<%
end if

%>
</body>
</html>