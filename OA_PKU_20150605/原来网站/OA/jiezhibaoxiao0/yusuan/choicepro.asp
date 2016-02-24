<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>选择项目名称</title>
</head>

<body>
<font color="#0d79b3" size="-1">
<div align="center">
	请选择您要增加项目的凭证号
</div>
<br /><br />
<div align="center">

<form name="f" action="writebuget2.asp" method="post">
	<select name="certificateNo" >

	<option value="BD">BD</option>
	<option value="方位">方位</option>
	<option value="奥赛">奥赛</option>
	</select><br /><br /><br />
   <input type="submit"  value="确定" />
   </form>
</div>

</font>
</body>
</html>
