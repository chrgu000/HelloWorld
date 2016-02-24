<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
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

%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目类型</title>
<link rel="stylesheet" href="css/css.css">
<style type="text/css">
<!--
.style1 {color: #098abb}
-->
body {SCROLLBAR-FACE-COLOR:#3499D0;
SCROLLBAR-HIGHLIGHT-COLOR:#CCFFFF;
SCROLLBAR-SHADOW-COLOR:#2587C3;
SCROLLBAR-ARROW-COLOR:#CCFFFF;
SCROLLBAR-BASE-COLOR:#1068A4; 
SCROLLBAR-DARK-SHADOW-COLOR:#3499D0} 
</style>
<style type="text/css">
<!--
.style1 {color: #0d79b3}
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
.style8 {color: #2b486a}
-->
</style>
<script language="javascript">
function addzhaiyao()  
{
    
	window.open('addzhaiyao.asp',"_self");
}
</script>
</head>

<body>
<div align="center">
<table border=0 cellspacing="1" bgcolor="B0C8EA" align="center" width="95%">
<tr bgcolor="D7E8F8"> 
	<td><span class="style8"><font size="3">项目编号</font></span></td>
    <td><span class="style8"><font size="3">部门</font></span></td>
    <td><span class="style8"><font size="3">帐号</font></span></td>
    <td><span class="style8"><font size="3">项目名称</font></span></td>
    <td><span class="style8"><font size="3">项目负责人</font></span></td>
	<%if oabusyuserlevel="财务" or oabusyuserlevel="出纳" then%><td><span class="style8"><font size="2">操作</font></span></td><% end if%>
</tr>
<%
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("GFProjectType.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("GFProjectType","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from projectType_old "
rs.open sql,conn,1,1
do while not rs.eof 
%>
<tr>
<td><%=rs("projectId")%></td>
<td><%=rs("dept")%></td>
<td><%=rs("financeCount")%></td>
<td><%=rs("projectName")%></td>
<td><%=rs("principal1")%></td>
<%if oabusyuserlevelCode="CW" or oabusyuserlevelCode="CN" then%><td><a href=editProject.asp?projectId=<%response.Write(rs("projectId"))%>>编辑</a></td><% end if%>
</tr>
<%
rs.movenext
loop
%>
</table>
<form name="form" method="post" action="addItem.asp">
<%if oabusyuserlevelCode="CW" or oabusyuserlevelCode="CN" then%><input type="submit" value="增加项目编号"  /><%end  if%>
</form>
</div>
</body>
</html>
