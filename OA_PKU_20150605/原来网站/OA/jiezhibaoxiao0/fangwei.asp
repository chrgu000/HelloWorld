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
'signtime=request("signtime")
'
'timeT=year(signtime)&"��"&month(signtime)&"��"&day(signtime)&"��"
'
'if request("subm")="Ӧ��" then
'signtime=trim(request("signtime"))
'gid=request("gid")
' if signtime<>"" then
'set conn=opendb("finance.mdb","conn","accessdsn")
'sql="update reimlisttable_old set "
'sql=sql & "signtime='" &timeT& "' where id=" & gid
'conn.Execute sql
' end if
'
'end if

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�޸�2010��1�·���ǩ�ֵı�����</title>
</head>

<body>
<div align="center">
<table border="1" cellpadding="1" cellspacing="1" bgcolor="D7E8F8" width="95%">
<tr  bgcolor="D7E8F8" bordercolor="#339999">
<td>���</td>
<td>��д����������</td>
<td>��Ŀ���</td>
<td>�����˺�</td>
<td>ժҪ</td>
<td>��ע</td>
<td>���</td>
<td>��������</td>
<td>����</td>
<td>״̬</td>
<td>ǩ��ʱ��</td>
</tr>
<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable_old where stage>=5 and stage<=8 and reimburseDate between '2010-1-1' and '2010-3-31' order by reimburseDate desc"
%>
<%
rs.open sql,conn,1,1
do while not rs.eof and not rs.bof 
%>
<form  name="form" action="fangwei2.asp" method="post">
<tr>
<td><%=rs("id")%></td>
<td><%=rs("reimburseDate")%></td>
<td><%=rs("projectId")%></td>
<td><%=rs("givecount")%></td>
<td><%=rs("summary")%></td>
<td><%=rs("remark")%></td>
<td><%=rs("money")%></td>
<td><%=rs("claimant")%></td>
<td><%=rs("projectDept")%></td>
<td>
<%
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql")
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rs("stage")
rsSt.open sqlS,cnSt,1,1
if not rsSt.eof and not rsSt.bof then
%>
<font  color="#6600FF"><%response.Write(rsSt("txt"))%></font>
<% 
end if
set rsSt=nothing
set cnSt=nothing
%>
</td>
<td>
<input type="text" name="signtime"  size="10" value="<%=rs("signtime")%>"/><input type="hidden" name="gid"  value="<%=rs("id")%>"/><input type="submit" name="subm" value="Ӧ��"></td>
</tr>

</form>
<%
rs.movenext
loop
set rs=nothing
set conn=nothing
%>
</table>
</div>
<center><input type="button" value="�޸����" onclick="javascript:window.close();" /></center>
</body>
</html>