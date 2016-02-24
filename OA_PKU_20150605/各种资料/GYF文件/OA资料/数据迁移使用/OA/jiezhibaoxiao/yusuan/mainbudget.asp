<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<%
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
Response.AddHeader "Pragma", "No-Cache"
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
code=request.cookies("oabusyuserlevelCode")
code1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目预算主页面</title>
</head>

<script language="javascript">
	function kk()
	{
		window.open("choicepro.asp");
	}
	function ckys()
	{
		window.open("managebudget.asp");
	}
</script>
<body>
<div align="center">
<font color="#0d79b3" size="-1">
<table width="40%" border="1" cellspacing="0" cellpadding="0" bgcolor="D7E8F8" bordercolor="#339999">
  <th colspan="4">您的需要处理的预算</th>
  <tr>
    <td>时间</td>
	<td onmousemove="">项目编号</td><!--这个地方当鼠标滑过的时候在上方显示出项目名称-->
	<td>状态</td>
  </tr>
  <%
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	if code="ZSYG" then
		sql="select * from accProj where proLeader='"&oabusyname&"' and (stage=0 or stage=5)"
	end if
	if code="BMJL" then
		sql="select * from accProj where (proLeader='"&oabusyname&"' and (stage=0 or stage=5)) or (stage=1 and proforDept='"&oabusyuserdept&"')"
	end if
	if code="CWZG" then
		sql="select * from accProj where (proLeader='"&oabusyname&"' and (stage=0 or stage=5))  or (stage=2)"
	end if
	if code="DSZ" then
		sql="select * from accProj where (proLeader='"&oabusyname&"' and (stage=0 or stage=5)) or (proforDept='"&oabusyuserdept&"' and stage=1) or stage=3"
	end if
	if code="CN" then
		sql="select * from accProj where proLeader='"&oabusyname&"' or stage=4"
	end if
	rs.open sql,conn,1,1
	do while not rs.bof and not rs.eof 
  %>
  <tr>
    <td><%=rs("timewrite")%></td>
	<td><%'if rs("stage")<>5 then%><A href=editbudget.asp?projectid=<%=server.URLEncode(rs("projectid"))%> target="_self"><%=rs("projectid")%></A><%'end if%>
	     <%if rs("stage")=15 then%><A href=changebud.asp?projectid=<%=server.URLEncode(rs("projectid"))%> target="_self"><%=rs("projectid")%></A><%end if%>
	</td>
	<td>
		<%
		'response.Write(rs("stage"))
		set cn=opendb("symx","conn","accessdsn")
		set r=server.createobject("adodb.recordset")
		sl="select txt from stage where stage="&rs("stage")
		r.open sl,cn,1,1
		response.Write(r("txt"))
		set r=nothing
	    set cn=nothing
	  %>
	</td>
  </tr>
  <%
  rs.movenext
  loop
	set rs=nothing
	set conn=nothing
  %>
  
</table>

<form name="f1" method="post" action="">
<input type="button" value="新建预算" name="xj"  onclick="kk()"/><input type="button" value="查看预算" name="ck" onclick="ckys()"  /> 
</form>
</font>
</div>
</body>
</html>
