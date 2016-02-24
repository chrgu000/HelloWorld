<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<!--#include file="getverifyR.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>提交单据</title>
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
<table border=0 cellspacing="1" bgcolor="B0C8EA" align="center" width="95%">
<tr bgcolor="D7E8F8"> 
	<td><span class="style8"><font size="3">项目名称</font></span></td>
    <td><span class="style8"><font size="3">项目编号</font></span></td>
    <td><span class="style8"><font size="3">部门</font></span></td>
    <td><span class="style8"><font size="3">帐号</font></span></td>
    <td><span class="style8"><font size="3">项目负责人</font></span></td>
    <td><span class="style8"><font size="3">审批流程</font></span></td>
</tr>
<%
set conn=opendb("GFProjectType","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select  * from projectType where jieti='NO'"
rs.open sql,conn,1,1
do while not rs.eof
%>
<tr> 
<td><%=rs("projectName")%></td>
<td><%=rs("projectId")%></td>
<td><%=rs("dept")%></td>
<td><%=rs("financeCount")%></td>
<td><%=rs("principal1")%></td>
<td><%=getverifyR(rs("projectId"),"R","AA")%></td>
</tr>
<%
rs.movenext
loop
set conn=nothing
set rs=nothing        
%>
</table>
</head>

<body>
</body>
</html>
