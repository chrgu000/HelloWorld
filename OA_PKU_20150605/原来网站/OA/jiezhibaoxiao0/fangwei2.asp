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
code=oabusyuserlevelCode
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
signtime=request.Form("signtime")
if signtime="" then
  response.Write("<script language=javascript>alert('请填写日期');window.history.back();</script>")
  response.End()
  end if
timeT=year(signtime)&"年"&month(signtime)&"月"&day(signtime)&"日"
response.Write("<div align=center>"&timeT&"</div>")
gid=request("gid")
 if signtime<>"" then
set conn=opendb("finance","conn","accessdsn")
sql="update reimlisttable_old set "
sql=sql & "signtime='" &Cdate(timeT)& "' where id=" & gid
conn.Execute sql
response.Write("<script language=javascript>alert('完成提交');window.history.back();</script>")
 response.End()
 end if
 if signtime="" then
  response.Write("<script language=javascript>alert('请填写日期');window.history.back();</script>")
  response.End()
  end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
</body>
</html>
