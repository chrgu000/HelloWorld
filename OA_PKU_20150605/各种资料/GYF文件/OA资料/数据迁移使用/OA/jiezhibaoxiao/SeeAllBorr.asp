<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>查看页面</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
Id=request("id")
id=split(Id,",")
n= UBound(id)
%>
<style type="text/css">
<!--
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
.style8 {color: #2b486a}
-->
</style>

</head>
<script language="javascript">
function editChange()
{
    
	window.open('editChange.asp?borrowTime='+ document.form.borrowTime.value+"&money="+document.form.money.value+"&content="+document.form.content.value+"&id="+document.form.Id.value+"&repayTime="+document.form.repayTime.value+"&finance="+document.form.finance.value,"_self");
}
</script>

<script language="javascript">
function editdelete()
{
    
	window.open('editDelete.asp?id='+ document.form.Id.value,"_self");
}
</script>
<script language="javascript">
function editSubmit()
{
    
	window.open('editSubmit.asp?borrowTime='+ document.form.borrowTime.value+"&money="+document.form.money.value+"&content="+document.form.content.value+"&id="+document.form.Id.value+"&repayTime="+document.form.repayTime.value+"&finance="+document.form.finance.value,"_self");
}
</script>
<script language="javascript">
function editAgree()
{
    
	window.open('editAgree.asp?id='+ document.form.Id.value+"&notes="+document.form.notes.value,"_self");
}
</script>
<script language="javascript">
function editNotAgree()
{
    
	window.open('editNotAgree.asp?id='+ document.form.Id.value+"&notes="+document.form.notes.value,"_self");
}
</script>
<script language="javascript">
function SignatureBorr()
{
    
	window.open('SignatureBorr.asp?id='+ document.form.Id.value,"_self");
}
</script>
<body>
<font size="-1">
<div align="center">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="21"><div align="center">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="2" height="25"><span class="style2"><img src="../images/main/l3.gif" width="2" height="25"></span></td>
            <td background="../images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="21"><div align="center"><span class="style2"><img src="../images/main/icon.gif" width="15" height="12"></span></div></td>
                  <td align="left"class="style7"><font size="-1">借支模块</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<%if oabusyuserlevelCode<>"DSZ" then%>
<%
'set conn=server.CreateObject("adodb.connection")
'DBPath1=server.mappath("finance.mdb")
'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
for f=0 to n
response.Write(id(f))
sql1="select * from borrowlist where id="&id(f)
rs.open sql1,conn,1,1
i=1
%>
<table width="80%" border="1"  cellpadding="0" cellspacing="0" bgcolor="D7E8F8">
<%
'set conn2=server.CreateObject("adodb.connection")
'DBPath1=server.mappath("../db/lmtof.mdb")
'conn2.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set conn2=opendb("lmtof","conn","sql")
set rs2=server.createobject("adodb.recordset")
 sql2= "select * from userinf where userdept="&"'"&rs("dept")&"'"&"and  userlevel='部门经理'"
rs2.open sql2,conn2,1,1
if not rs2.eof then
%>
 <tr  bgcolor="D7E8F8" ><td>申请人</td><td><%response.Write(rs("borrower"))%></td><td>部门</td><td>
<% response.Write(rs2("userdept")) %>
</td>
<td colspan="3">部门负责人</td>
<td>
<%response.Write(rs2("username"))%>
<%end if%>
</td>
</tr>
<tr  bgcolor="D7E8F8" >
<td colspan="2">借款日期</td><td colspan="2"><%response.Write(formatdatetime(rs("borrowTime"), 1)) %></td>
<td colspan="2">还款日期</td><td colspan="2"><%response.Write(formatdatetime(rs("repayTime"), 1)) %></td>
</tr>
<tr  bgcolor="D7E8F8" >
<td>金额(元)</td><td colspan="4" align="center"><% response.Write(rs("money"))%></td>
<td>财务人员</td>
<td colspan="2">
<% response.Write(rs("finance"))%></td></tr>
<tr  bgcolor="D7E8F8" >
<td>事由</td><td colspan="7" align="center" ><% response.Write("&nbsp;&nbsp;"&rs("content"))%></td>
</tr>
<tr>
<td>部门批注</td><td colspan="7"><%=rs("deptNotes")&"&nbsp;"%></td>
</tr>
<tr>
<td>财务批注</td><td colspan="7"><%=rs("financialNotes")&"&nbsp;"%></td>
</tr>
<tr>
<td>机构负责人批注</td><td colspan="7"><%=rs("gManagerNotes")&"&nbsp;"%></td>
</tr>
<tr >
<td colspan="9">
</td>
</tr>
</table>
<br />
<br />
<br />
<br />
<%
i=i+1
%>
<%
rs.close
next
%>
<%end if%>
<!---------------------------------------------------------------------------------------------------------------------------->
<%if oabusyuserlevelCode="DSZ" then%>
<table width="80%" border="1"  cellpadding="0" cellspacing="0" bgcolor="D7E8F8">
<tr  bgcolor="D7E8F8" >
<td>申请人</td>
<td>部门</td>
<td>部门负责人</td>
<td>借款日期</td>
<td>还款日期</td>
<td>金额(元)</td>
<td>财务人员</td>
<td>事由</td>
<td>部门批注</td>
<td>财务批注</td>
<td>机构负责人批注</td>
</tr>
<%
'set conn=server.CreateObject("adodb.connection")
'DBPath1=server.mappath("finance.mdb")
'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
for f=0 to n
sql1="select * from borrowlist where id="&id(f)
rs.open sql1,conn,1,1
i=1
%>
<%
'set conn2=server.CreateObject("adodb.connection")
'DBPath1=server.mappath("../db/lmtof.mdb")
'conn2.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set conn2=opendb("lmtof","conn","sql")
set rs2=server.createobject("adodb.recordset")
 'if rs("dept")<>"综合管理部" then
 sql2= "select * from userinf where userdept="&"'"&rs("dept")&"'"&"and  userlevel='部门经理'"
 'else
 'sql2= "select * from userinf where userdept="&"'"&rs("dept")&"'"
 'end if
rs2.open sql2,conn2,1,1
if not rs2.eof then
%>
<tr  bgcolor="D7E8F8" >
<td><%response.Write(rs("borrower"))%></td>
<td><% response.Write(rs2("userdept")) %></td>
<td><%response.Write(rs2("username"))%></td>
<td><%response.Write(formatdatetime(rs("borrowTime"), 1)) %></td>
<td><%response.Write(formatdatetime(rs("repayTime"), 1)) %></td>
<td><% response.Write(rs("money"))%></td>
<td ><% response.Write(rs("finance"))%></td>
<td ><% response.Write("&nbsp;&nbsp;"&rs("content"))%></td>
<td ><%=rs("deptNotes")&"&nbsp;"%></td>
<td ><%=rs("financialNotes")&"&nbsp;"%></td>
<td ><%=rs("gManagerNotes")&"&nbsp;"%></td>
</tr>
<%end if%>
<%
rs.close
next%>
</table>
<%end if%>
</div>
</font>
</body>
</html>
