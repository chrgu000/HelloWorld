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
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
projectId=request("projectId")

function selected(req,reqvalue)
if req=reqvalue then
selected=" selected"
else
selected=""
end if
end function

%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑项目信息</title>
</head>
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
function DeleteProject()
{
window.open('DeleteProject.asp?projectId='+ document.form.projectId.value,"_self");
}
</script>
<%
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("GFProjectType.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("GFProjectType","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from projectType where  projectId="&"'"&projectId&"'"
rs.open sql,conn,1,1
do while not rs.eof 
%>
<body>
<div align="center">
<form name="form" action="changProject.asp" method="post">
<table border=0 cellspacing="1" bgcolor="B0C8EA" align="center" width="98%">
<tr bgcolor="D7E8F8"> 
	<td><span class="style8"><font size="2">项目编号</font></span></td>
	<td><span class="style8"><font size="2">部门</font></span></td>
    <td><span class="style8"><font size="2">帐号</font></span></td>
    <td><span class="style8"><font size="2">项目名称</font></span></td>
    <td><span class="style8"><font size="2">项目负责人</font></span></td>
</tr>
<tr bgcolor="D7E8F8"> 
	<td><input type="text" name="projectId" value="<%=rs("projectId")%>" /></td>
	<td>
    	<!--<input type="text" name="dept" value="<%=rs("dept")%>" />-->
        <select name="dept">
             <%
    
              set connd=opendb("lmtof","conn","sql")
              set ds=server.CreateObject("adodb.recordset")
              sqld="select  dept from dept order by dept"
              ds.open sqld,connd,1,1
              
              %>
                <%do  while not ds.eof  %>
                     <option value=<%=ds("dept")%> <%=selected(ds("dept"),rs("dept"))%>><%=ds("dept")%></option>
                <%
                 ds.movenext
                 loop
                 set ds=nothing
                 set connd=nothing
                %>
           </select>
    </td>
	<td><input type="text" name="financeCount" value="<%=rs("financeCount")%>"/></td>
	<td><input type="text" name="projectName" value="<%=rs("projectName")%>" /></td>
	<td>
    	<!--<input type="text" name="principal1" value="<%=rs("principal1")%>" />-->
        <select name="principal1">
                 <%
        
                  set connp=opendb("lmtof","conn","sql")
                  set ps=server.CreateObject("adodb.recordset")
                  sqlp="SELECT  distinct name FROM userinf  where forbid='no'and levelcode!='' order by name desc"
                  ps.open sqlp,connp,1,1
                  
                  %>
                    <%do  while not ps.eof  %>
                         <option value=<%=ps("name")%> <%=selected(ps("name"),rs("principal1"))%>><%=ps("name")%></option>
                    <%
                     ps.movenext
                     loop
                     set ps=nothing
                     set connp=nothing
                    %>
               </select>
    </td>
</table>

<%
rs.movenext
loop
%>
<input type="submit" value="修改" />
<input type="button" value="关闭" onclick="javascript:window.close();" />
<input type="button" value="删除" onclick="DeleteProject();" />
</form>
</div>
</body>
</html>
