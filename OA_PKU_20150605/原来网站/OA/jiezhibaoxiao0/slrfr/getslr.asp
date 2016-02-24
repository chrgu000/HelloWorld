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
<center> 已通过考勤审核的员工 
  <table border="1" cellpadding="1" cellspacing="1" width="20%"  bgcolor="D7E8F8" bordercolor="#339999">
	  <tr>
	  		<td>姓名</td>
			<td>部门</td>
	  </tr>
<%
	set conn=opendb("yygy","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select  * from  monthkqtemp where flag='Y' order by dept" '
	rs.open sql,conn,1,1
	i=0 
	  do while  not rs.eof and not rs.bof 
%><tr>
	  		<td><%=rs("name")%></td>
			<td><%=rs("dept")%></td>
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
<%if i>0 then%><a href="buildslr.asp" target="_self">生成本月工资表</a><%end if%>&nbsp;&nbsp;&nbsp;<a href="seeslr.asp" target="_self">查看工资表</a>&nbsp;&nbsp;&nbsp;点击后需要刷新页面&nbsp;&nbsp;&nbsp;<a href="javascript:window.close()" target="_self">关闭本页面</a>
</center>
</body>
</html>
