<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%       
  'Response.Buffer     =     True       
  'Response.ContentType     =     "application/vnd.ms-excel"      
  %>
<!--#include file="opendb.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
code=oabusyuserlevelCode
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
function sqlstr(data)
sqlstr="'" & replace(data,"'","''") & "'"
end function
function getrel(reqvalue)
if reqvalue=null  then
value=0
else
value=reqvalue
end if
end function

timein=year(now())&"��"&month(now())&"��"&day(now())&"��"
timeinB=year(now())&"��"&month(now())+1&"��"&day(now())&"��"
'response.Write(month(now()))
if request("submit")="Ӧ��" then

usnamefw=request("usnamefw")
usdeptfw=request("usdeptfw")
usjixiaofw=request("usjixiaofw")
usbuzhufw=request("usbuzhufw")
usyingfafw=request("usyingfafw")
usyibaofw=request("usyibaofw")
usylaofw=request("usylaofw")
usshiyefw=request("usshiyefw")
uskaoqinfw=request("uskaoqinfw")
usotherfw=request("usotherfw")
usgrshui=request("usgrshui")
usshifafw=request("usshifafw")
usdanweibaoxianfw=request("usdanweibaoxianfw")
usjibenfw=request("usjibenfw")
uscontentfw=request("uscontentfw")

tablename="monthslr"&month(now())

set conn=opendb(year(now())&"##qsc","conn","accessdsn")
sql="update "&tablename&" set "
sql=sql & "usnamefw=" & sqlstr(usnamefw) & ", usdeptfw="&sqlstr(usdeptfw)&", usjixiaofw="&sqlstr(usjixiaofw)&", usbuzhufw="&sqlstr(usbuzhufw)&",usyingfafw="&sqlstr(usyingfafw)&",usyibaofw="&sqlstr(usyibaofw)&",usylaofw="&sqlstr(usylaofw)&",usshiyefw="&sqlstr(usshiyefw)&",uskaoqinfw="&sqlstr(uskaoqinfw)&",usotherfw="&sqlstr(usotherfw)&",usgrshui="&sqlstr(usgrshui)&",usshifafw="&sqlstr(usshifafw)&", usdanweibaoxianfw="&sqlstr(usdanweibaoxianfw)&",usjibenfw="&sqlstr(usjibenfw)&",uscontentfw="&sqlstr(uscontentfw)&"  where usnamefw='" &usnamefw&"'"
conn.Execute sql
end if

if request("submit")="ɾ��" then
usnamefw=request("usnamefw")
usdeptfw=request("usdeptfw")
tablename="monthslr"&month(now())
set conn=opendb(year(now())&"##qsc","conn","accessdsn")
sql="delete "&tablename&" where usnamefw='" &usnamefw&"'"
conn.Execute sql
end if

mp=0
if mp=0 then
	set conn=opendb("yygy","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select  * from  monthkqtemp where flag='Y' and time between '"&Cdate(timein)&"' and '"&Cdate(timeinB)&"' order by dept" 
	rs.open sql,conn,1,1 
	  do while  not rs.eof and not rs.bof 
	  		set cn=opendb("yygy","conn","accessdsn")
			set r=server.createobject("adodb.recordset")
			sl="select * from  monthkq where name='"&rs("name")&"' and time between '"&Cdate(timein)&"' and '"&Cdate(timeinB)&"'"
			r.open sl,cn,1,1 
				i=0
				do while not r.bof and not r.eof
				i=i+1 
				r.movenext
				loop
				'response.Write(i)
				if i=0 then
					set conn2=opendb("yygy","conn","accessdsn")
					sql2="insert into  monthkq (name,record,reason,otherpan,dept,score,deptview,flag,time) values ('"&rs("name")&"','"&rs("record")&"','"&rs("reason")&"','"&rs("otherpan")&"','"&rs("dept")&"','"&rs("score")&"','"&rs("deptview")&"','"&rs("flag")&"','"&rs("time")&"')"
					conn2.Execute sql2
					set conn3=opendb(year(now())&"##qsc","conn","accessdsn")
					tablename="monthslr"&month(now())
					sql3="insert into  "&tablename&" (usnamefw,usdeptfw,uskaoqinfw) values ('"&rs("name")&"','"&rs("dept")&"','"&rs("score")&"')"
					conn3.Execute sql3
					
					set conn5=opendb(year(now())&"##qsc","conn","accessdsn")
					tablename="monthslr"&month(now())
					sql5="delelte ornot where month like '"&tablename&"'"
					conn5.Execute sql5
					
					set conn4=opendb(year(now())&"##qsc","conn","accessdsn")
					tablename="monthslr"&month(now())
					sql4="insert into  ornot (month,stage,flag) values ('"&tablename&"',0,'has')"
					conn4.Execute sql4
				end if
			set r=nothing
	        set cn=nothing
	  rs.movenext
	  loop
	set rs=nothing
	set conn=nothing
	
	set conn=opendb("yygy","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select  * from  monthkqtemp where flag='Y' and time between '"&Cdate(timein)&"' and '"&Cdate(timeinB)&"' order by dept" 
	rs.open sql,conn,1,3
	 do while  not rs.eof and not rs.bof
	 
	 rs.movenext
	 loop 
	set rs=nothing
	set conn=nothing
 mp=mp+1
end if
if mp>0 then
	set conn=opendb("yygy","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select  * from  monthkqtemp where flag='Y' and time between '"&Cdate(timein)&"' and '"&Cdate(timeinB)&"' order by dept" 
	rs.open sql,conn,1,3 
		 do while  not rs.eof and not rs.bof 
		 rs.delete
		 rs.update
		 rs.movenext
		 loop
	set rs=nothing
	set conn=nothing	 
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
</head>

<body>
<center>
<table cellspacing="0" cellpadding="0" border="1" bordercolor="#000000">
  <tr>
    <td>����</td>
    <td>����</td>
    <td>��Ч</td>
    <td>����</td>
    <td>Ӧ�����</td>
    <td>����Ӧ�ɱ���(ҽ��)</td>
    <td>����Ӧ�ɱ���(����)</td>
    <td>����Ӧ�ɱ���(ʧҵ)</td>
    <td>����</td>
    <td>�����ۿ�</td>
    <td>��������˰</td>
    <td>ʵ�����</td>
    <td>��λӦ�ɱ���</td>
    <td>��������</td>
    <td>˵��</td>
	<td>����</td>
  </tr>
  
  <%
   
  	set conn=opendb(year(now())&"##qsc","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	tablename="monthslr"&month(now())
	sql="select  * from  "&tablename&" order by usdeptfw" 
	rs.open sql,conn,1,1 
	do while not rs.bof and not rs.eof  'slrlevel
	if rs("usshifafw")>0 then
  %>
  	<tr bgcolor="#3399FF">
	<%else%>
	<tr>
	<%end if%>
	<form name="form" action="buildslr.asp" method="post">
    <td><%=rs("usnamefw")%><input type="hidden" name="usnamefw" value="<%=rs("usnamefw")%>" /></td>
    <td><%=rs("usdeptfw")%><input type="hidden" name="usdeptfw" value="<%=rs("usdeptfw")%>" /></td>
	<%
  	set cn=opendb("lmtof","conn","accessdsn")
	set r=server.createobject("adodb.recordset")
	sl="select slrlevel from userinf where name='"&rs("usnamefw")&"'"
	r.open sl,cn,1,1 
	slrlevel=r("slrlevel")
	'response.Write(slrlevel&"fdffffff")
    %>
	<%
  	set cnm=opendb("yzzz#in","conn","accessdsn")
	set rm=server.createobject("adodb.recordset")
	slm="select  *  from  xslevel where level='"&slrlevel&"'" 
	rm.open slm,cnm,1,1 
	if not rs.eof and not rs.bof then
    %>	
    <td><%response.Write(2*(rm("money")))%><input type="hidden" name="usjixiaofw" value="<%=2*(rm("money"))%>" /></td>
    <td>&nbsp;<%response.Write(rm("buzhu"))%><input type="hidden" name="usbuzhufw" value="<%=(rm("buzhu"))%>" /></td>
	<td>&nbsp;<input type="text" name="usyingfafw" size="4" <%if rs("usyingfafw")=null then%> value="0" <%else %> value="<%=rs("usyingfafw")%>" <%end if%> /></td>
    <td>&nbsp;<input type="text" name="usyibaofw"  size="4" <%if rs("usyibaofw")=null then%> value="0" <%else %> value="<%=rs("usyibaofw")%>" <%end if%>/> </td>
    <td>&nbsp;<input type="text" name="usylaofw" size="4" <%if rs("usylaofw")=null then%> value="0" <%else %> value="<%=rs("usylaofw")%>" <%end if%> /> </td>
    <td>&nbsp;<input type="text" name="usshiyefw" size="4" <%if rs("usshiyefw")=null then%> value="0" <%else %> value="<%=rs("usshiyefw")%>" <%end if%>/> </td>
    <td>-<%=rs("uskaoqinfw")%><input type="hidden" name="uskaoqinfw" value="<%=-rs("uskaoqinfw")%>" /></td>
    <td>&nbsp;<input type="text" name="usotherfw" size="4" <%if rs("usotherfw")=null then%> value="0" <%else %> value="<%=rs("usotherfw")%>" <%end if%>/> </td>
    <td>&nbsp;<input type="text" name="usgrshui" size="4" <%if rs("usgrshui")=null then%> value="0" <%else %> value="<%=rs("usgrshui")%>" <%end if%>/> </td>
    <td>&nbsp;<input type="text" name="usshifafw" size="4" <%if rs("usshifafw")=null then%> value="0" <%else %> value="<%=rs("usshifafw")%>" <%end if%>/> </td>
    <td>&nbsp;<input type="text" name="usdanweibaoxianfw" size="4" <%if rs("usdanweibaoxianfw")=null then%> value="0" <%else %> value="<%=rs("usdanweibaoxianfw")%>" <%end if%>/> </td>
    <td><%response.Write(rm("money"))%><input type="hidden" name="usjibenfw" value="<%=(rm("money"))%>" /></td>
    <td>&nbsp;&nbsp;<input type="text" name="uscontentfw" <%if rs("uscontentfw")=null then%> value=" " <%else %> value="<%=rs("uscontentfw")%>" <%end if%> /> </td>
	<td><input type="submit" name="submit" value="Ӧ��" /><!--<input type="submit" name="submit" value="ɾ��" />--></td>
	
	<%

	set rm=nothing
	set cnm=nothing
	set r=nothing
	set cn=nothing
	end if
  %>
  </form>
  </tr>
  <%
    rs.movenext
	loop
	set rs=nothing
	set conn=nothing
  %>
</table>
<%'response.Write("<script LANGUAGE=javascript>alert('����ɹ�');window.close();/script>")%>
<form name="fm" action="tijiao.asp" method="post">
<input type="hidden" name="dbname" value="<%=year(now())&"##qsc"%>" />
<input type="hidden" name="tbname" value="<%=tablename%>" />
<input type="submit" name="sub" value="�ύ" />
</form>
</center>
</body>
</html>
