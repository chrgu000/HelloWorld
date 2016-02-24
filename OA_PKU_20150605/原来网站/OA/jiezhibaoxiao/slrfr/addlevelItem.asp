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
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>增加项目编号</title>

</head>

<body>
<form action="addlevelItem2.asp" method="post">
<table border=0 width=90% cellspacing="1" bgcolor="B0C8EA">
<tr bgcolor="D7E8F8"> 
	<td><span class="style8"><font size="2">级别</font></span></td>
    <td><span class="style8"><font size="2"><input type="text" name="level" /></font></span></td>
	<td><span class="style8"><font size="2">金额</font></span></td>
    <td><span class="style8"><font size="2"><input type="text" name="money" /></font></span></td>
	<td><span class="style8"><font size="2">补助</font></span></td>
    <td><span class="style8"><font size="2"><input type="text" name="buzhu" /></font></span></td>
</tr>
<tr bgcolor="D7E8F8"> 
	<td colspan="10" align="center"><input type="submit" value="确定" /></td>
</tr>
</table>
</form>
</body>
</html>