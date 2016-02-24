<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<!--#include file="getverifyR.asp"-->
<title>提交报销单</title>
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
id=request("id")
money=request("money")
billCount=request("billCount")
remark=request("remark")
summary=request("summary")
str=id+borrowTime+repayTime+money+content
%>
<%

set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable where id="&request("id")
rs.open sql,conn,1,3
verify=rs("willverify")
mystr=split(verify,"--")
haveverify=""
nowverify=mystr(0)
willverify=right(verify,len(verify)-(len(mystr(0))+2))
getstage=split(mystr(0),":")
stage=getstage(0)
if not rs.eof then
'----------------------------------------------------------------------------------------
rs("stage")=stage
rs("money")=money
rs("billCount")=billCount
rs("summary")=summary
rs("reimburseDate")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs("haveverify")=haveverify
rs("nowverify")=nowverify
rs("willverify")=willverify
rs("notes")=""
rs.update
rs.movenext
response.Write("<div align=center>提交成功</div>")
end if
'----------------------------------------------------------------------------------------
if rs.eof and rs.bof then
response.Write("<div align=center>提交失败</div>")
end if
set conn=nothing
set rs=nothing
%>
</head>

<body>
<div align="center">
<form action="mainReim.asp" method="post">
<input type="submit" value="关闭" />
</form>
</div>
</body>
</html>
