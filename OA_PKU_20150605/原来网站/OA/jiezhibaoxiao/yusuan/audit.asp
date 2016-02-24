<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
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
</head>

<body>
<div align="center">
<table border="1" width="80%">
<tr align="center">
<td>姓名</td>
<td>迟到未考勤记录</td>
<td>填写原因</td>
<td>请假或者调休计划</td>
<td>请假或调休意见</td>
<td>评分</td>
</tr>
<tr align="center">
<td>赵师军</td>
<td>未考勤：22号
迟到：24日 9：45</td>
<td>22号，因为外出所以不能及时考勤；24号，忘记考勤，所以未能及时考勤</td>
<td>无</td>
<td>&nbsp;</td>
<td><input type="text" name="score" value="部门经理填写审核评分"/></td>
</tr>
<tr align="center">
<td>王三</td>
<td>未考勤：3号
迟到：14日 9：05</td>
<td>3号，因为外出所以不能及时考勤；14号，忘记考勤，所以未能及时考勤</td>
<td>27号想请假半天</td>
<td><input type="text" name="conten" value="如果有请假或调休计划，部门经理填写意见"/></td>
<td><input type="text" name="score" value="部门经理填写审核评分" /></td>
</tr>
<tr align="center">
<td>李一</td>
<td>未有迟到记录 未考勤记录</td>
<td>&nbsp;</td>
<td>无</td>
<td>&nbsp;</td>
<td><input type="text" name="score" value="部门经理填写审核评分"/></td>
</tr>
<tr align="center">
<td colspan="6"><input type="submit" value="提交" /></td>
</tr>
</table>
</div>
</body>
</html>
