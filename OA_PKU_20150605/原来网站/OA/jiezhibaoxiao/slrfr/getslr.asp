<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<!--#include file="opendb.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>生成本月工资页面</title>
</head>

<body>
<center> <span class="style8"><font size="3">已通过考勤审核的员工 </font></span>
  <table border=0 width=80% cellspacing="1" bgcolor="B0C8EA">
	<tr bgcolor="D7E8F8"> 
	  		<td><span class="style8"><font size="2">姓名</font></span></td>
			<td><span class="style8"><font size="2">部门</font></span></td>
	</tr>
<%
	set conn=opendb("yygy","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select  * from  monthkqtemp where flag='Y' order by dept" '
	rs.open sql,conn,1,1
	i=0 
	  do while  not rs.eof and not rs.bof 
%><tr bgcolor="D7E8F8">
	  		<td><span class="style8"><font size="2"><%=rs("name")%></font></span></td>
			<td><span class="style8"><font size="2"><%=rs("dept")%></font></span></td>
	  </tr>
<%
	i=i+1
	  rs.movenext
	  loop
	set rs=nothing
	set conn=nothing

%>
</table>
<br /><br /><br />
<%if i>0 then%><a href="buildslr.asp" target="_self"><span class="style8"><font size="2">生成本月工资表</font></span></a><%end if%>&nbsp;&nbsp;&nbsp;<a href="seeslr.asp" target="_self"><span class="style8"><font size="2">查看工资表</font></span></a>&nbsp;&nbsp;&nbsp;<span class="style8"><font size="2">点击后需要刷新页面</font></span>&nbsp;&nbsp;&nbsp;<a href="javascript:window.close()" target="_self"><span class="style8"><font size="2">关闭本页面</font></span></a>
</center>
</body>
</html>
