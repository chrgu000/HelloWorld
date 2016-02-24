<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
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
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from borrowlist where id="&Id
rs.open sql,conn,1,1

'set cn=server.CreateObject("adodb.connection")
'ph=server.MapPath("../db/lmtof.mdb")
'cn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & ph
set cn=opendb("lmtof","conn","sql")
set r=server.CreateObject("adodb.recordset")
'if rs("dept")<>"综合管理部" then
sl="select * from userinf where userdept ="&"'"& rs("dept")&"'"&" and (levelCode1 = 'BMJL' or levelCode = 'BMJL')"
'else
'sl="select * from userinf where userdept ="&"'"& rs("dept")&"'"
'end if
r.open sl,cn,1,1
%>
<form>
<div align="center"><font size="+2">费用借支单</font></div>
<table width="655" height="298" border="1" cellpadding="0" cellspacing="0" >
<tr>
<td height="32">申请人</td>
<td><%=rs("borrower")%></td><td colspan="2">部门</td><td><%=rs("dept")%></td><td colspan="2">部门负责人</td>
<td>
<%
'if rs("dept")<>"综合管理部" then
%>
<%=r("name")%>
</td>
</tr>
<tr>
<td height="29">申请日期</td>
<td><%response.Write(formatdatetime(rs("date"), 1))%></td><td colspan="2">借款日期</td><td><%response.Write(formatdatetime(rs("borrowTime"), 1))%></td><td colspan="2">还款日期</td>
<td><%response.Write(formatdatetime(rs("repayTime"), 1))%></td></tr>
<tr>
<td height="40">金额（小写）</td>
<td><%=rs("money")%></td><td>金额（大写）</td><td colspan="6"><%=Bmoney%></td>
</tr>
<tr>
<td >事由</td><td height="94" colspan="8" bordercolor="#D4D0C8"><%=rs("content")&"&nbsp;&nbsp;"%> &nbsp; </td>
</tr>
<tr>
<td rowspan="2">审批</td>
<td height="31" colspan="2">项目负责人</td>
<td colspan="2">部门负责人</td><td colspan="2">财务负责人</td><td colspan="2">机构负责人</td>
</tr>
<tr>
<td height="32" colspan="2">&nbsp;&nbsp;</td>
<td colspan="2">
<%if rs("deptApprovalTime")<>"" then
response.Write("&nbsp; ")
else
response.Write("&nbsp;&nbsp;")
end if
 %>
</td>
<td colspan="2">
<%if rs("financialApprovalTime")<>"" then
response.Write("&nbsp; ")
else
response.Write("&nbsp;&nbsp;")
end if
 %>
</td>
<td colspan="2">
<%if rs("gManagerApprovalTime")<>"" then
response.Write("&nbsp; ")
else
response.Write("&nbsp;&nbsp;")
end if
 %>
</td>
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

