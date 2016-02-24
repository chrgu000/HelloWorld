<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>新建报销单</title>

</head>
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
%> 
<body >
&nbsp;&nbsp;&nbsp;&nbsp;<div align="center"><img src="13.jpg"  align="middle" width="520" height="300"/></div>&nbsp;&nbsp;
<div align="center"><a href="newReimforMul.asp"  target="_blank">创建新的报销单</a></div>
<!--<div align="center"><a href="ManagerReimForMil.asp"  target="_blank">处理报销单</a></div>-->
</body>
</html>
