<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�������鿴</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
code=oabusyuserlevelCode
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
if code="CN" then
tt=request("printid")
end if
if code<>"CN" then
tt=request("id")
end if
id=split(tt,",")
n= UBound(id)

for f=0 to n
'response.Write(id(f))
next 
%>
</head>

<body>
<div align="center">
<font size="-1">
<% if code<>"DSZ" and request("submit")<>"��Щ�Ѿ�ǩ��" then%>
<%

set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
i=0

	  
%>
<div align="center">
<table  width="100%"  border="1"  cellpadding="0" cellspacing="0"  bordercolor="#999999" bgcolor="D7E8F8">
<br />
<tr height="10"  bgcolor="D7E8F8" >
<td>������</td>
<td>����</td>
<!--<td>��Ŀ������</td>-->
<td>����ʱ��</td>
<td>���</td>
<td>��������</td>
<td>��Ŀ���</td>
<td>ժҪ</td>
<td>��ע</td>
<td>����(��)</td>
<td>���(Ԫ)</td>
<td>״̬</td>
</tr>
<%
for f=0 to n
 sql="select * from reimlisttable where id="&id(f)
 rs.open sql,conn,1,1 

	  set cn=opendb("finance","conn","sql")
      set rsn=server.CreateObject("adodb.recordset")
	  sqln="select  * from reimlisttable where id="&id(f)
	  rsn.open sqln,cn,1,1
	  do while not rsn.eof
	  i=i+1
%>
<tr>
<td><%=rs("claimant")%></td>
<td><%=rs("dept")%></td>
<!--<td ><%=rs("principal")%>&nbsp;</td>-->
<td><%=rs("reimburseDate")%></td>
<td><%=rs("id")%></td>
<td><%=rsn("occurDate")%></td>
<td><%=rsn("projectId")%></td>
<td><%=rsn("summary")%></td>
<td><%=rsn("remark")%></td>
<td><%=rsn("billCount")%></td>
<td><%=rsn("money")%></td>


<td>
<%
set connTS=opendb("finance","conn","sql")
set rsTS=server.CreateObject("adodb.recordset")
sqlTS="select * from stage where stage="&rs("stage")
rsTS.open sqlTS,connTS,1,1
%>
<%=rsTS("txt")%>
</td>
</tr>
<!--<tr>
<td >����ܼ�</td>
<td colspan="6"><%=rsn("money")%>&nbsp;</td>
</tr>
<tr>
<td >������ע</td>
<td colspan="6"><%=rs("deptNotes")%>&nbsp;</td>
</tr>
<tr>
<td >����������ע</td>
<td colspan="6"><%=rs("financialNotes")%>&nbsp;</td>
</tr>
<tr>
<td >������������ע</td>
<td colspan="6"><%=rs("deptNotes")%>&nbsp;</td>
</tr>-->
<%
	  rsn.movenext
	  loop
	  
	  rs.close
next 
%>

<%
end if
%>
</table>
<br />
<br />
<br />
<br />
</div>
<% if code="CN" and request("submit")<>"��Щ�Ѿ�ǩ��" then %>
<script language="javascript">
if (confirm('�뵥����ȷ������ť��ʼ��ӡ��������ȡ������ť����ӡ��'))
{
	window.print();
}
</script>
<%
end if
%>
<% if code="CN" and request("submit")="��Щ�Ѿ�ǩ��" then 
signtime=year(now())&"��"&month(now())&"��"&day(now())&"��"
'signtime=year(now())&"-"&month(now())&"-"&day(now())

          for f=0 to n
          'response.write(signtime) 'add junshi for test 20101220
          'set conn=server.CreateObject("adodb.connection")
          'path=server.MapPath("finance.mdb")
          'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
		  set conn=opendb("finance","conn","sql")
		  set rs=server.CreateObject("adodb.recordset")
          sql="select * from reimlisttable where id="&id(f)
          rs.open sql,conn,1,3
          rs("stage")=8  ''''˵�� ��2010-12-24��ʼ��rs("ch") = 'Y' and stage =8���ܱ�ʾһ�������������
		  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		  if rs("ch")="N" then 'add by zhaoshijun at 2010-12-24 ���� rs("ch") is NULL �����ݶ���2010��֮ǰ������
 			rs("stage")=9		'add by zhaoshijun at 2010-12-24 ���� rs("ch") = 'N' and stage =8  �����ݶ���2010-12-24֮ǰ�����ڱ�ҳ��û�м������е�ԭ��
 		  end if				'add by zhaoshijun at 2010-12-24 ���� rs("ch") = 'N' and stage =9	����������2010----2010-12-24֮�� ����ͨ��SignaturerReim.aspȷ�� �� 2010-12-24֮�� ʹ�� SignaturerReim.asp �� ��ҳ��ȷ�ϵ�
		   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		  rs("signtime")=signtime
          rs.update	 
		  set rs=nothing
		  set conn=nothing
		  next		  
%>
<script language="javascript">
   alert("��ֵ�ɹ�");
</script>
<%
    response.write("<script language=""javascript"">")
	response.write("window.location.href='manageReimlist.asp';")
	response.write("</script>")
end if
%>

<%if code="DSZ" then %>

<!---------------------------------------------------------------------------------------------------------------------------------->
<table  width="100%"  border="1"  cellpadding="0" cellspacing="0"  bordercolor="#999999" bgcolor="D7E8F8">
<br />
<tr height="10"  bgcolor="D7E8F8" >
<td width="50">������</td>
<td width="70">����</td>
<td >��Ŀ������</td>
<td width="80">����ʱ��</td>
<td>���</td>
<td width="80">��������</td>
<td>��Ŀ���</td>
<td>ժҪ</td>
<td>��ע</td>
<td>����(��)</td>
<td>���(Ԫ)</td>
<!--<td >����ܼ�</td>-->
<!--<td >������ע</td>
<td >����������ע</td>
<td >������������ע</td>-->
</tr>
<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
for f=0 to n
 sql="select * from reimlisttable where id="&id(f)
 rs.open sql,conn,1,1 
       'set cn=server.CreateObject("adodb.connection")
      'pathn=server.MapPath("finance.mdb")
      'cn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathn
	  set conn=opendb("finance","conn","sql")
      set rsn=server.CreateObject("adodb.recordset")
	  sqln="select  * from reimlisttable where id="&id(f)
	  rsn.open sqln,cn,1,1
	  do while not rsn.eof
	  i=i+1
	  
%>
<div align="center">
<tr>
<td ><%=rs("claimant")%></td>
<td ><%=rs("dept")%></td>
<td ><%=rs("principal")%>&nbsp;</td>
<td ><%=FormatDateTime(rs("reimburseDate"),2)%></td>
<td><%=rs("id")%></td>
<td><%=FormatDateTime(rsn("occurDate"),2)%></td>
<td><%=rsn("projectId")%></td>
<td><%=rsn("summary")%></td>
<td><%=rsn("remark")%></td>
<td><%=rsn("billCount")%></td>
<td><%=rsn("money")%></td>
<!--<td ><%=rsn("money")%>&nbsp;</td>-->
<!--<td ><%=rs("deptNotes")%>&nbsp;</td>
<td ><%=rs("financialNotes")%>&nbsp;</td>
<td ><%=rs("deptNotes")%>&nbsp;</td>-->
</tr>
</div>
<%
	  rsn.movenext
	  loop
	  
	  rs.close
next 
%>
</table>

<!------------------------------------------------------------------------------------------------------------------------------->
<% end if%>
</font>
</div>
</body>
</html>
