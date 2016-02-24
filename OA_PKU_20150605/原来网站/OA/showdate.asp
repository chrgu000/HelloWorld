<%@ LANGUAGE = VBScript %>
<%response.expires=0%>
<!--#include file="asp/keepformat.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/checked.asp"-->

<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
allow_transmit_file=request.cookies("allow_transmit_file")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
sendto=request("sendto")
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="css/css.css">
<meta http-equiv="expires" content="no-cache">
<title>回复转发公文</title>
<script Language="JavaScript">
function form_check()
{
	if(document.form4.sendto.value.length<1)
	{
		window.alert("请选择发送目标");
		document.form2.recipient.focus();
		return (false);
	}
}
function addsendtouser()
{
	var sendtouserstr,sendtouserstr1;
	sendtouserstr='|'+document.form1.userdept.value+':'+document.form2.recipient.value;
	sendtouserstr1='|'+document.form1.userdept.value+':所有人';
	if (document.form1.sendto.value.indexOf(sendtouserstr)==-1)
	{
		if (document.form2.recipient.value=="所有人") 
		{	document.form1.sendto.value=document.form1.sendto.value+'|'+document.form1.userdept.value+':'+document.form2.recipient.value;
		document.form4.sendto.value=document.form1.sendto.value;
		}
		else if (document.form2.recipient.value!="所有人" && document.form1.sendto.value.indexOf(sendtouserstr1)==-1)
		{
document.form1.sendto.value=document.form1.sendto.value+'|'+document.form1.userdept.value+':'+document.form2.recipient.value;
		document.form4.sendto.value=document.form1.sendto.value;
		}
		else
		{
			alert("该发送目标已包含在所有人中!");
		}
	}
	else
	{
		alert("该发送目标已经存在!");
	}
}
</script>
<style type="text/css">
<!--
.style4 {color: #2e4869}
.style6 {color: #FF0000}
-->
</style>
</head>
<body bgcolor="#F9F9FF" topmargin="0" leftmargin="5">
<br><table width="550"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="567B98">
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="1"><img src="images/main/l4.gif" width="1" height="21"></td>
                <td background="images/main/m4.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="10">&nbsp;</td>
                      <td><span class="style4">公文传阅</span></td>
                    </tr>
                </table></td>
                <td width="1"><img src="images/main/r4.gif" width="1" height="21"></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td><%

set conn=opendb("oabusy","conn","accessdsn")
set rs=Server.CreateObject("ADODB.recordset")
sql="select * from senddate,texttype where id=" & request("id")&"and senddate.documenttype=texttype.number"
rs.open sql,conn,1
if not rs.eof and not rs.bof then
%>
<center>
<table>
<tr>
<td align=center>
<strong><font size="+1"><%=keepformat(rs("title"))%></font>
<br>
</strong><span class="style6">（<%=server.htmlencode(rs("typename"))%>）
</span></td>
<td rowspan="2">
          <!--  <%
if rs("filename")<>"" then
%>
          <a href="../listsendfile.asp?id=<%=rs("id")%>" target="_blank"><img src="../images/attach.gif" width=30 height=30 border=0 alt="文件名：<%=rs("filename")%>"></a> 
          <%
else
%>
          &nbsp; 
          <%
end if
%>-->
          <!--#include file="showfile.asp"-->

</td>
<tr>
<td>[日期：<%=rs("inputdate")%>][发送人所在部门：
<%
set rs1=Server.CreateObject("ADODB.recordset")
sql="select userdept,name from userinf where username=" & sqlstr(rs("sender"))
rs1.open sql,conn,1
response.write(keepformat(rs1("userdept")))
%>
][发送者：<%=keepformat(rs1("name"))%>]
</td>
</tr>
</table>
</center>

&nbsp;
<div align="center"><br>
  <%=keepformat(rs("content"))%>
  
</div>
<div align="center"><br>
  -----------------------------------<br>
</div>
<center>
 <table border="0" cellpadding="0" cellspacing="1" bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF">
  <tr>
   <td>要转发给</td><td>
     <table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <form action="showdate.asp" method="post" name="form1">
        <td>
         <select name="userdept" size=1 onChange="document.form1.submit();">
<%
'打开数据库读出部门
set rs3=server.createobject("adodb.recordset")
sql="select DISTINCT userdept from userinf"
rs3.open sql,conn,1
if not rs3.eof and not rs3.bof then firstdept=rs3("userdept")
if request("userdept")<>"" then firstdept=request("userdept")
while not rs3.eof and not rs3.bof
%>
<option value="<%=server.htmlencode(rs3("userdept"))%>"<%=selected(firstdept,rs3("userdept"))%>><%=server.htmlencode(rs3("userdept"))%></option>
<%
	rs3.movenext
wend
%>
</select>
<input type="hidden" name="id" value=<%=request("id")%>>
<input type="hidden" name="sendto" value="<%=sendto%>">
</td>
</form>
<td>的</td>
<form name="form2">
<td>
<select name="recipient" size=1>
<option value="所有人">所有人</option>
<%
set rs3=server.createobject("adodb.recordset")
sql="select name,username from userinf where userdept=" & sqlstr(firstdept) & " and forbid='no'"
rs3.open sql,conn,1
while not rs3.eof and not rs3.bof
%>
<option value="<%=server.htmlencode(rs3("name"))%>(<%=rs3("username")%>)"><%=server.htmlencode(rs3("name"))%></option>
<%
	rs3.movenext
wend
%>
</select>
</td>
</form>
<td>
<input type="button" value="增加" onClick="addsendtouser()">
</td>
</tr>
</table>
</td>
</tr>
<tr>
<form method="post" name="form4" action="datereturn.asp">
<input type="hidden" name="title" value="Re:<%=keepformat(rs("title"))%>">
<input type="hidden" name="sender" value="<%=keepformat(oabusyusername)%>">
<input type="hidden" name="recipientusername" value="<%=keepformat(rs("sender"))%>">
<input type="hidden" name="reid" value="<%=rs("id")%>">
<input type="hidden" name="id" value="<%=rs("id")%>">
<input type="hidden" name="documenttype" value="<%=keepformat(rs("documenttype"))%>">
<td>转发给：</td> <td><input type="text" name="sendto" size=45 value="<%=sendto%>" onfocus="document.form4.content.focus();"><input type="button" value="清除" onclick="document.form1.sendto.value='';document.form4.sendto.value=''"></td>
</tr>
<tr>
<td>回复或转<br>发意见：</td>
<td>
<%
'打开数据库读出最后回复
set rs2=Server.CreateObject("ADODB.recordset")
sql="select * from senddate where sender=" & sqlstr(oabusyusername) & " and reid=" & request("id") & " order by id desc"
rs2.open sql,conn,1
if not rs2.eof and not rs.bof then rs2content=rs2("content")
%>
<textarea name="content" rows="10" cols="50"><%=rs2content%></textarea>
</td>
</tr>
<tr>
<td colspan=2 align="center">
<input type="submit" name="submit" value="回复">&nbsp;&nbsp;
<%
if allow_transmit_file="yes" then
%>
<input type="submit" name="submit" value="转发" onclick="return form_check()">
<%
end if
%>
</td>
</form>
</tr>
</table>
</center>
<%
else
%>
<table width="100%"><tr><td></td></tr></table>
<%
	
	response.write("<center><br><br><font color=""#ee0000"" size=""+1"">对不起，该公文已被删除！</font><br><br>")
	response.write("<input type=""button"" value=""关闭"" onclick=""window.close()""></center>")
end if
conn.close
set conn=nothing
%>

<%
%></td>
        </tr>
    </table></td>
  </tr>
</table>

</body>
</html>