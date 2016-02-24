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
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>未提交借支单入库</title>
<%
borrower=request("borrower")
dept=request("userdept")
borrowTime=trim(request("borrowTime"))
repayTime=trim(request("repayTime"))
moneyS=request("moneyS")
content=request("content")
finance=request("finance")
'response.Write(borrower)
'response.Write(dept)
'response.Write(FormatDateTime(borrowTime, 1))
'response.Write(repayTime)
'response.Write(moneyS)
'response.Write(content)


'set conn=server.CreateObject("adodb.connection")
'DBPath1=server.mappath("finance.mdb")
'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
sql= "select * from borrowlist"
rs.open sql,conn,1,3
'set cn=server.CreateObject("adodb.connection")
'DBPath2=server.mappath("../db/lmtof.mdb")
'cn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath2
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
rs("date")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs("stage")="0"
rs("finance")=finance
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