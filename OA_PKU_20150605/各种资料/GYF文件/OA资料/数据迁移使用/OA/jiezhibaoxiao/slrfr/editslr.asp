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
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
code=oabusyuserlevelCode
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>

</head>

<body>
<center>
<table cellspacing="0" cellpadding="0" border="1" bordercolor="#000000" width="80%">
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
  </tr>
  <%
   
  	set cn=opendb(year(now())&"##qsc","conn","accessdsn")
	set r=server.createobject("adodb.recordset")
	if code="CWZG" then sl="select  * from ornot  where stage=1" 
	if code="DSZ" then sl="select  * from ornot  where stage=2" 
	if code<>"DSZ" and  code<>"CWZG" then sl="select  * from ornot  where stage=99" 
	i=0 
	r.open sl,cn,1,1 
	do while not r.eof and not r.bof 
	i=i+1
	r.movenext 
	loop
	if i=0 then 
	response.Write("<script languange=javascript>alert('δ������Ҫ���������');</script>")
	response.End()
	end if
	if i>1 then 
	response.Write("javascript:alert('���ݳ������⣬����ϵ�������Ա');")
	response.End()
	end if
	if i=1 then
		set cn2=opendb(year(now())&"##qsc","conn","accessdsn")
		set r2=server.createobject("adodb.recordset")
		if code="CWZG" then sl2="select  * from ornot  where stage=1" 
		if code="DSZ" then sl2="select  * from ornot  where stage=2"
		if code<>"DSZ" and  code<>"CWZG" then sl2="select  * from ornot  where stage=99"
		r2.open sl2,cn2,1,1
		if not r2.eof and not r2.bof then
		tablename=r2("month")
		end if
	end if
  %>
  <%
   
  	set conn=opendb(year(now())&"##qsc","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	'tablename="monthslr"&month(now())
	sql="select  * from  "&tablename&" order by usdeptfw" 
	rs.open sql,conn,1,1 
	do while not rs.bof and not rs.eof  'slrlevel
  %>
  <form name="form" action="tijiao.asp" method="post">
  	<tr bgcolor="#3399FF">
	<tr>
    <td><%=rs("usnamefw")%></td>
    <td><%=rs("usdeptfw")%></td>
    <td>&nbsp;<%=rs("usjixiaofw")%></td>
    <td>&nbsp;<%=rs("usbuzhufw")%></td>
	<td>&nbsp;<%=rs("usyingfafw")%></td>
    <td>&nbsp;<%=rs("usyibaofw")%></td>
    <td>&nbsp;<%=rs("usylaofw")%></td>
    <td>&nbsp;<%=rs("usshiyefw")%></td>
    <td><%=rs("uskaoqinfw")%></td>
    <td>&nbsp;<%=rs("usotherfw")%></td>
    <td>&nbsp;<%=rs("usgrshui")%></td>
    <td>&nbsp;<%=rs("usshifafw")%></td>
    <td>&nbsp;<%=rs("usdanweibaoxianfw")%></td>
    <td><%=rs("usjibenfw")%></td>
    <td>&nbsp;<%=rs("uscontentfw")%></td>
  </tr>
  <%
    rs.movenext
	loop
	set rs=nothing
	set conn=nothing
  %>
  <tr>
  <td>�������</td>
  <td colspan="14"><textarea cols="160" rows="4" name="content"></textarea></td>
  </tr>
</table>
<%'response.Write("<script LANGUAGE=javascript>alert('����ɹ�');window.close();/script>")%>

<input type="hidden" name="dbname" value="<%=year(now())&"##qsc"%>" />
<input type="hidden" name="tbname" value="<%=tablename%>" />
<input type="submit" name="sub" value="ͬ��" /> <input type="submit" name="sub" value="��ͬ��" />
</form>
</center>
</body>
</html>
