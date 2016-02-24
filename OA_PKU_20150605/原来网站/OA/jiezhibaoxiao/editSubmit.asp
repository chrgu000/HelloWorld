<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<!--#include file="getverify.asp"-->
<title>借支单提交</title>
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
projectid=request("projectid")
verify=getverify(projectid,"B")
%>
<%
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from borrowlist where id="&request("id")
rs.open sql,conn,1,3
if not rs.eof then
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="ZSYG" then
mystr=split(verify,"--")
haveverify=""
nowverify=mystr(0)
willverify=right(verify,len(verify)-(len(mystr(0))+2))
getstage=split(mystr(0),":")
stage=getstage(0)

rs("stage")=stage
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=money
rs("content")=content
rs("projectid")=projectid
rs("asktime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs("haveverify")=haveverify
rs("nowverify")=nowverify
rs("willverify")=willverify
rs("notes")=""
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="BMJL" then
mystr=split(verify,"--")
haveverify=""
nowverify=mystr(0)
willverify=right(verify,len(verify)-(len(mystr(0))+2))
getstage=split(mystr(0),":")
stage=getstage(0)

rs("stage")=stage
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=money
rs("content")=content
rs("projectid")=projectid
rs("asktime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs("haveverify")=haveverify
rs("nowverify")=nowverify
rs("willverify")=willverify
rs("notes")=""
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="CW" then
mystr=split(verify,"--")
haveverify=""
nowverify=mystr(0)
willverify=right(verify,len(verify)-(len(mystr(0))+2))
getstage=split(mystr(0),":")
stage=getstage(0)

rs("stage")=stage
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=money
rs("content")=content
rs("projectid")=projectid
rs("asktime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs("haveverify")=haveverify
rs("nowverify")=nowverify
rs("willverify")=willverify
rs("notes")=""
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="CWZG" then
mystr=split(verify,"--")
haveverify=""
nowverify=mystr(0)
willverify=right(verify,len(verify)-(len(mystr(0))+2))
getstage=split(mystr(0),":")
stage=getstage(0)

rs("stage")=stage
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=money
rs("content")=content
rs("projectid")=projectid
rs("asktime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs("haveverify")=haveverify
rs("nowverify")=nowverify
rs("willverify")=willverify
rs("notes")=""
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="CN" then
mystr=split(verify,"--")
haveverify=""
nowverify=mystr(0)
willverify=right(verify,len(verify)-(len(mystr(0))+2))
getstage=split(mystr(0),":")
stage=getstage(0)

rs("stage")=stage
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=money
rs("content")=content
rs("projectid")=projectid
rs("asktime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs("haveverify")=haveverify
rs("nowverify")=nowverify
rs("willverify")=willverify
rs("notes")=""
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="DSZ" then
mystr=split(verify,"--")
haveverify=""
nowverify=mystr(0)
willverify=right(verify,len(verify)-(len(mystr(0))+2))
getstage=split(mystr(0),":")
stage=getstage(0)
if stage=10 then
	stage=1
end if
rs("stage")=stage
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=money
rs("content")=content
rs("projectid")=projectid
rs("asktime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs("haveverify")=haveverify
rs("nowverify")=nowverify
rs("willverify")=willverify
rs("notes")=""
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
response.write("<script language=""javascript"">")
response.write("alert(""提交成功"");")
response.write("window.location.href='mainborrow.asp';")
response.write("</script>")
end if
if rs.eof and rs.bof then
response.write("<script language=""javascript"">")
response.write("alert(""提交失败"");")
response.write("window.location.href='mainborrow.asp';")
response.write("</script>")
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
