<%response.expires=0%>
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/checked.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/keepformat.asp"-->
<%
'On Error Resume Next
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
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
on error resume next
rs.open "select count(*) as countss from userinf",conn,1,1
usercount=rs("countss")
if usercount >500 then
   rs.close
   set rs=nothing
   %>
   <script language=javascript>
       window.alert("�Բ��𣬳��������ʹ���û�������ɾ�������û���");
       parent("main").location.href="/usercontrol.asp";
   </script>
<%
end if
rs.close
sql="select * from texttype where delflag='false'"
rs.open sql,conn,1
if rs.eof or rs.bof then
	conn.close
	set rs= nothing
	response.write("<script language=""javascript"">")
	response.write("alert(""���Ƚ��빫�Ĺ�����ӹ��ķ��࣡"");")
	response.write("</script>")
	response.end
end if
sendto=request.form("sendto")
title=request.form("hidetitle")
content=request.form("hidecontent")
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="expires" content="no-cache">
<link rel="stylesheet" href="css/css.css">
<script Language="JavaScript">
function form_check()
{
	if(document.form3.sendto.value.length<1)
	{
		window.alert("��ѡ����Ŀ��");
		document.form2.recipient.focus();
		window.location.reload(true);
		return (false);
	}

	if(document.form3.title.value.length<1)
	{
		window.alert("���ⲻ�ܿ�");
		document.form3.title.focus();
		window.location.reload(true);
		return (false);
	}
	if(document.form3.content.value.length<1)
	{
		window.alert("���ݲ��ܿ�");
		document.form3.content.focus();
		window.location.reload(true);
		return (false);
	}

}

function addsendtouser()
{
	var sendtouserstr,sendtouserstr1;
	sendtouserstr='|'+document.form1.userdept.value+':'+document.form2.recipient.value;
	sendtouserstr1='|'+document.form1.userdept.value+':������';
	if (document.form1.sendto.value.indexOf(sendtouserstr)==-1)
	{
		if (document.form2.recipient.value=="������") 
		{	document.form1.sendto.value=document.form1.sendto.value+'|'+document.form1.userdept.value+':'+document.form2.recipient.value;
		document.form3.sendto.value=document.form1.sendto.value;
		}
		else if (document.form2.recipient.value!="������" && document.form1.sendto.value.indexOf(sendtouserstr1)==-1)
		{
document.form1.sendto.value=document.form1.sendto.value+'|'+document.form1.userdept.value+':'+document.form2.recipient.value;
		document.form3.sendto.value=document.form1.sendto.value;
		}
		else
		{
			alert("�÷���Ŀ���Ѱ�������������!");
		}
	}
	else
	{
		alert("�÷���Ŀ���Ѿ�����!");
	}
}
</script>
<script language="javascript">
function check()
{
		 var i;
         var str=document.form3.file1.value;
         i=str.indexOf("/",0);
         if(i<0)
		 alert("�����ļ����ƴ���Ӧ�ý���/��������ļ�������");
         else
         alert("�����ļ�������ȷ");
}
</script>
<title>���Ĵ���</title>
<style type="text/css">
<!--
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
-->
</style>
</head>
<body bgcolor="#ffffff" topmargin="0" leftmargin="0">
<table width="583"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="21"><div align="center">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="2" height="25"><span class="style2"><img src="images/main/l3.gif" width="2" height="25"></span></td>
            <td background="images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="21"><div align="center"><span class="style2"><img src="images/main/icon.gif" width="15" height="12"></span></div></td>
                  <td class="style7">���Ĵ���</td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<%
call bghead()
%>
<%
'response.Write(oabusyname)
'response.Write(oabusyusername)
%>
<center>
<table align="center">
<tr>
<td>
<b>���ķ���</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</td>
<td>
Ҫ���͸�
</td>
<form action="senddate.asp" method="post" name="form1">
<td>
<input type="hidden" name="hidetitle" value="">
<input type="hidden" name="hidecontent" value="">
<select name="userdept" size=1 onChange="document.form1.hidetitle.value=document.form3.title.value;document.form1.hidecontent.value=document.form3.content.value;document.form1.submit();">
<%
'�����ݿ��������
set rs=server.createobject("adodb.recordset")
sql="select DISTINCT userdept from userinf"
rs.open sql,conn,1
if not rs.eof and not rs.bof then firstdept=rs("userdept")
if request("userdept")<>"" then firstdept=request("userdept")
while not rs.eof and not rs.bof
%>
<option value="<%=rs("userdept")%>"<%=selected(firstdept,rs("userdept"))%>><%=keepformat(rs("userdept"))%></option>
<%
	rs.movenext
wend
%>
</select>
<input type="hidden" name="sendto" value="<%=sendto%>">
</td>
</form>
<td>
��
</td>
<form name="form2">
<td>
<select name="recipient" size=1>
<option value="������">������</option>
<%
set rs=server.createobject("adodb.recordset")
sql="select name,username from userinf where userdept=" & sqlstr(firstdept)&"and forbid='no' and username<>'"&oabusyname&"'"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<option value="<%=rs("name")%>(<%=rs("username")%>)"><%=keepformat(rs("name"))%></option>
<%
	rs.movenext
wend
%>
</select>
</td>
</form>
<form name="form4">
<td>
<input type="button" value="����" onClick="addsendtouser()">
</td>
</form>
</tr>
</table>
</center>
<div align="left">
  <%
call bgmid()
%>
</div>
<table width="550" border="0" cellpadding="0" cellspacing="1"  bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF" bgcolor="#B0C8EA">
<form method="post" enctype="multipart/form-data" name="form3" action="sendfileok.asp"  >
<input type="hidden" name="userdept" value="<%=firstdept%>">
<input type="hidden" name="username" value="������">
       <tr bgcolor="#FFFFFF"><td align="center" bgcolor="D7E8F8"><b>������</b></td><td bgcolor="#FFFFFF"><input type="text" name="sendto" size="55" value="<%=sendto%>" onFocus="document.form3.title.focus();"><font color=red>*</font><input type="button" value="���" onClick="document.form1.sendto.value='';document.form3.sendto.value=''"></td></tr>
    <tr bgcolor="#FFFFFF">
      <td align="center" bgcolor="D7E8F8"><b>����:</b></td>
      <td><input type=text name="title" size=60 maxlength="50" value="<%=server.htmlencode(title)%>"><font color=red>*</font></td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="center" bgcolor="D7E8F8"><b>��������:</b></td>
	  <td><select size="1" name="lb">
<%
set rs=server.createobject("adodb.recordset")
sql="select * from texttype where delflag='false'"
rs.open sql,conn,1
do while not rs.eof
	response.write("<option value="&chr(34)&cstr(rs("number"))&chr(34)&">"&keepformat(rs("typename"))&"</option>")
	rs.movenext
loop
'conn.close
'set rs=nothing
%>
	</select>	  </td>
	</tr>
    <tr bgcolor="#FFFFFF">
      <td align="center" bgcolor="D7E8F8"><b>����:</b></td>
      <td><textarea name="content" rows="9" cols="60"><%=server.htmlencode(content)%></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="142" height="23" align="center" bgcolor="D7E8F8"><strong><font color="#000000">����:</font></strong></td>
      <td height="23" bgcolor="#FFFFFF"><p>
        <input name="file1" type="text" id="file1">
		
      <font color="#FF0000">*�����ϴ��ļ�Ȼ����ļ������Ƶ�����</font></p>
        <iframe src="upload.asp" name="ok" width="300" marginwidth="0" height="100" marginheight="0" align="top" scrolling="no" frameborder="0" hspace="0" vspace="0" allowtransparency="true" application="true">
      <p>&nbsp;</p>
      <p>�����������֧�ֿ��ҳ!</p>
      </iframe><font color="#FF0000"><p>*ֻ֧���⼸��("doc,xls,gif,jpg,png,swf,wav,mp3"����ʽ���ļ�</font></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan=2 align=center>



<input type="submit" name="submit" value="����" onClick="form_check()">      </td>
</form>
    </tr>
</table>
</body>  
</html>