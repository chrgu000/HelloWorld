<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")
borrowTime=request("borrowTime")
repayTime=request("repayTime")
money=request("money")
content=request("content")
str=id+borrowTime+repayTime+money+content
'response.Write(str)
%>
<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from borrowlist_old where id="&request("id")
rs.open sql,conn,1,3
if not rs.eof then
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="ZSYG" then
rs("stage")=1
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=money
rs("content")=content
rs("date")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="BMJL" then
rs("stage")=2
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=money
rs("content")=content
rs("date")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="CW" then
rs("stage")=3
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=money
rs("content")=content
rs("date")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="CWZG" then
rs("stage")=1
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=money
rs("content")=content
rs("date")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="CN" then
rs("stage")=1
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=money
rs("content")=content
rs("date")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="DSZ" then
rs("stage")=1
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=money
rs("content")=content
rs("date")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
response.Write("<div align=center>提交成功</div>")
end if
if rs.eof and rs.bof then
response.Write("<div align=center>提交失败</div>")
end if
%>
</head>

<body>
<SCRIPT   LANGUAGE="JavaScript">   
  document.onkeydown   =   function()   {   
  if(event.keyCode==116)   {   
  event.keyCode=0;   
  event.returnValue   =   false;   
  }   
  }   
  document.oncontextmenu   =   function()   {event.returnValue   =   false;}   
  </SCRIPT> 
<div align="center">
<form action="mainborrow.asp" method="post">
<input type="submit" value="关闭" />
</form>
</div>
</body>
</html>
