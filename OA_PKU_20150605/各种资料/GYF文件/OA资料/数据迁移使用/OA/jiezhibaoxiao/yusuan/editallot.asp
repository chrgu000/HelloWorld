<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"--><head>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
<%

code=request.cookies("oabusyuserlevelCode")
code1=request.cookies("oabusyuserlevelCode1")
id=request.QueryString("id")
projectid=request("projectid")
'response.Write(projectid)
%>
  <%
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from proinM where id="&id
	rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
		summoney=rs("summoney")
		initProUnit=rs("initProUnit")
		proforDept=rs("proforDept")
		attendeeDept=rs("attendeeDept")
		proLeader=rs("proLeader")
		certificateNo=rs("certificateNo")
		accrul=rs("accrul")
		taxes=rs("taxes")
		groundFee=rs("groundFee")
		collaborCosts=rs("collaborCosts")
		timewrite=rs("timewrite")
		stage=rs("stage")
		inpaytime=rs("inpaytime")
	end if
	if rs.eof or rs.bof then 
	response.write("<script language=""javascript"">")
	response.write("alert('error!#332');history.go(-1);")
	response.write("</script>")
	response.end
	end if
	set rs=nothing
	set conn=nothing
	
	set conn=opendb("GFProjectType","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select projectName from projectType where projectId='"&projectid&"'"
	rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
	projectname=rs("projectName")
	rs.movenext
	end if
	set rs=nothing
	set conn=nothing
	flag=0
	if (code="BMJL" and (stage=1 or stage=0)) or  (code="CWZG" and ( stage=2 or stage=1 or stage=0)) OR (code="DSZ" and (stage=3 or (stage=1 or stage=0))) then
	flag=1
	end if
  %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�鿴�������</title>
</head>

<body>
<div align="center">
<form name="xx" action="agrornotforallot.asp" method="post">
<font color="#0d79b3" size="-1">
<table border="1" cellspacing="0" cellpadding="0" bgcolor="D7E8F8" bordercolor="#339999" width="95%">
  <tr>
    <td>��Ŀ����</td><td><%=projectname%></td>
    <td>��Ŀ���</td><td><%=projectid%></td>
    <td>���ʱ��</td><td><%=inpaytime%></td>
    <td>�ܽ��</td><td><%=summoney%></td>
   </tr>
    <td>���λ</td><td><%=initProUnit%></td>
    <td>�е�����</td><td><%=proforDept%></td>
    <td>�μӲ���</td><td><%=attendeeDept%></td>
    <td>��Ŀ����</td><td><%=proLeader%></td>
  </tr>
    <td>˰��/����</td><td><%=taxes%></td>
    <td>��������</td><td><%=accrul%></td>
    <td>��չ����</td><td><%=groundFee%></td>
    <td>Э����</td><td><%=collaborCosts%></td>
  </tr>
  <tr>
	<td colspan="2">ƾ֤��</td><td colspan="6"><%=certificateNo%></td>
  </tr>
  <tr >
    <td colspan="8" >
		<TABLE id="table1" cellspacing="0" cellpadding="0" border=1 width="100%" bgcolor="D7E8F8" bordercolor="#339999">
  <tr>
			<td>��Ŀ</td>
    		<td>��ϸ��Ŀ</td>
    		<td>���</td>
  </tr>
   <%
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from subProin where proinMid='"&id&"'"
	rs.open sql,conn,1,1
	do while not rs.eof and not rs.bof 
%>
  <TR>
   <TD><%=rs("msub")%></TD><TD><%=rs("sub")%></TD><TD><%=rs("money")%></TD>
  </TR>
<%
	rs.movenext
	loop
	set rs=nothing
	set conn=nothing
  %>
 
</TABLE> 
	</td>
  </tr>
  <%
  if flag=1 then
   %>
  <tr height="18">
    <td>�����������</td>
    <td colspan="13"><textarea cols="150" rows="4" name="note"></textarea></td>
  </tr>
  <%end if%>
  </font>
</table>
<!--<a href="editsaveallot.asp?id=<%=server.URLEncode(id)%>&projectid=<%=server.URLEncode(projectid)%>">�޸�</a>-->
 <%
  if flag=1 then
   %>
<input type="hidden" name="id" value="<%=id%>" />
<input type="submit" name="submit" value="������" /><input type="submit" name="submit" value="��ͨ�����" />
</form>
 <%end if%>
 <%
 if (code="CN" and stage=4) then
 %>
 <A href=signfiveforallot.asp?kt=ok&id=<%=id%>>�洢Ϊ�����</A>
 <%
 end if
 %>
</div>
</body>
</html>
