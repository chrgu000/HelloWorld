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
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")
    set conn=opendb("symx","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select * from proinM where id="&id
	rs.open sql,conn,1,1
	if not rs.eof and not rs.bof  then
		danwei=rs("danwei")
		projectname=rs("projectname")
		deptleader=rs("deptleader")
		inpaydanwei=rs("inpaydanwei")
		money=rs("money")
		feipeiM=rs("feipeiM")
		pzh=rs("pzh")
		prodept=rs("prodept")
		jiaoxxcontent=rs("jiaoxxcontent")
		jiaoxxM=rs("jiaoxxM")
		jiaoyxscontent=rs("jiaoyxscontent")
		jiaoyxsM=rs("jiaoyxsM")
		content=rs("content")
	end if
	set rs=nothing
	set conn=nothing
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
</head>

<body>
<font color="#0d79b3" size="-1">
<center>
<table cellspacing="0" cellpadding="0" bgcolor="D7E8F8" bordercolor="#339999" border="1" width="60%">
  <col width="113" />
  <col width="72" span="7" />
  <th colspan="8">
    ������䵥
  </th>
  <tr height="18">
    <td height="18">��λ</td>
    <td>&nbsp;&nbsp;<%=danwei%></td>
    <td>��Ŀ����</td>
    <td colspan="2">&nbsp;&nbsp;<%=projectname%>
	</td>
    <td>������</td>
    <td colspan="2">&nbsp;&nbsp;<%=deptleader%></td>
  </tr>
  <tr height="18">
    <td height="18">���λ</td>
    <td>&nbsp;&nbsp;<%=inpaydanwei%></td>
    <td>�����</td>
    <td colspan="2">&nbsp;&nbsp;<%=money%></td>
    <td>�����</td>
    <td colspan="2">&nbsp;&nbsp;<%=feipeiM%></td>
  </tr>
  <tr height="18">
    <td height="18">ƾ֤��</td>
    <td colspan="2">&nbsp;&nbsp;<%=pzh%></td>
    <td colspan="2">��Ŀ���ڲ���</td>
    <td colspan="3">&nbsp;&nbsp;<%=prodept%></td>
    <!--<td>����</td>
    <td><input type="text" /></td>
    <td>���Ѻ�</td>
    <td>��</td>-->
  </tr>
  <tr height="18">
    <td colspan="8" height="18">���ݻ������ƹ涨</td>
  </tr>
  <tr height="18">
    <td height="18">�Ͻ�ѧУ</td>
    <td colspan="4">&nbsp;&nbsp;<%=jiaoxxcontent%></td>
    <td colspan="3">&nbsp;&nbsp;<%=jiaoxxM%></td>
  </tr>
  <tr height="18">
    <td height="18">�Ͻ�Ժ��ϵ����</td>
    <td colspan="4">&nbsp;&nbsp;<%=jiaoyxscontent%></td>
    <td colspan="3">&nbsp;&nbsp;<%=jiaoyxsM%></td>
  </tr>
  <tr height="18">
    <td height="18">��ע</td>
    <td colspan="7">&nbsp;&nbsp;<%=content%></td>
  </tr>
</table>
</html>
