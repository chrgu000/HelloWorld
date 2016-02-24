<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>打印借支单</title>
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
Id=request("id")
'response.Write(Id)
Bmoney=request("Bmoney")
%>
</head>

<body>
<div align="center">
<%

set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from borrowlist where id="&Id
rs.open sql,conn,1,1


set cn=opendb("lmtof","conn","sql")
set r=server.CreateObject("adodb.recordset")
sl="select * from userinf where userdept ="&"'"& getdept(rs("borrowerdeptcode"))&"'"&" and (levelCode1 = 'BMJL' or levelCode = 'BMJL')"
r.open sl,cn,1,1
%>
<form>
<div align="center"><font size="+2"><%="编号："&rs("id")&" "%>费用借支单</font></div>
<table width="655" height="298" border="1" cellpadding="0" cellspacing="0" >
<tr>
<td height="32">申请人</td>
<td><%=rs("borrower")%></td><td colspan="2">部门</td><td><%=getdept(rs("borrowerdeptcode"))%></td><td colspan="2">部门负责人</td>
<td>
<%
'if rs("dept")<>"综合管理部" then
%>
<%=r("name")%>
</td>
</tr>
<tr>
<td height="29">申请日期</td>
<td><%response.Write(formatdatetime(rs("asktime"), 1))%></td><td colspan="2">借款日期</td><td><%response.Write(formatdatetime(rs("borrowTime"), 1))%></td><td colspan="2">还款日期</td>
<td><%response.Write(formatdatetime(rs("repayTime"), 1))%></td></tr>
<tr>
<td height="40">金额（小写）</td>
<td><%=rs("money")%></td><td>金额（大写）</td><td colspan="6"><%=Bmoney%></td>
</tr>
<tr>
<td >事由</td><td height="94" colspan="8" bordercolor="#D4D0C8"><%=rs("content")&"&nbsp;&nbsp;"%> &nbsp; </td>
</tr>
<tr>
<td>审批</td>
<td colspan="8">
<%
notenew=replace(rs("notes"),"####","<br>")
%>
<%=notenew%>
</td>
</tr>
<tr>
<td height="38" colspan="1">凭证号</td>
<td height="38" colspan="8">&nbsp; &nbsp; &nbsp;</td>
</tr>
<tr>
<td height="38" colspan="9">领款人： &nbsp; &nbsp; &nbsp;领款日期： &nbsp; &nbsp;     年  &nbsp;月 &nbsp; 日&nbsp;&nbsp;备注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
</table>
</form>
</div>
</body>
<script language="javascript">
if (confirm('请单击“确定”按钮开始打印，单击“取消”按钮不打印！'))
{
	window.print();
}
</script>
</html>

