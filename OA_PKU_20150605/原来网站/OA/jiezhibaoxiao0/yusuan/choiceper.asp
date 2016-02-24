<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<div align="center">
<form name="f1" method="post">
<table border="1" >
<th colspan="4">请选择需要评分的员工</th>
<tr>
<td>姓名</td>
<td>是否需要填写说明</td>
<td>是否已经评分</td>
<td>选择</td>
</tr>
<tr>
<td>赵师军</td>
<td>是</td>
<td>否</td>
<td><input type="checkbox" name="vehicle" value="Bike"/></td>
</tr>
<tr>
<td>李一</td>
<td>是</td>
<td>否</td>
<td><input type="checkbox" name="vehicle" value="Bike"/></td>
</tr>
<tr>
<td>王三</td>
<td>是</td>
<td>是</td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="4" align="center"><input type="submit" value="确定" /><input type="submit" value="代写" /></td>
</tr>
</table>
</form>
</div>
</body>
</html>
