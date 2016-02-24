<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>借支单入库</title>
<%
borrower=request("borrower")
dept=request("userdept")
borrowTime=request("borrowTime")
repayTime=request("repayTime")
moneyS=request("moneyS")
content=request("content")
finance=request("finance")
 
set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
sql= "select * from borrowlist"
rs.open sql,conn,1,3

set cn=opendb("lmtof","conn","sql")
set rs2=server.CreateObject("adodb.recordset")
sql2="select * from userinf where username="& "'"& oabusyusername & "'"
rs2.open sql2,cn,1,1
if not rs2.eof then
'response.Write(rs2("userdept"))
end if
if  borrowTime<>"" and repayTime<>"" and moneyS<>""  then 
rs.movelast
rs.addnew
rs("borrower")=borrower
rs("dept")=dept
rs("borrowTime")=FormatDateTime(borrowTime, 1)
rs("repayTime")=FormatDateTime(repayTime, 1)
rs("money")=moneyS
rs("content")=content
rs("finance")=finance
rs("date")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs("stage")="1"


'if (rs2("userlevel")="正式员工" or rs2("userlevel")=" ") and rs2("userdept")="综合管理部" then
'rs("stage")="2"
'end if



rs.update
end if
%>
</head>

<body>
<div align="center">
<form >
<input type="button" value="关闭" onclick="javascript:window.close()" />
</form>
</div>
</body>
</html>
