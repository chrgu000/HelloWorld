<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
'set conn=server.CreateObject("adodb.connection")
'DBPath1=server.mappath("finance.mdb")
'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
if oabusyuserlevelCode="BMJL" then
   sqlstr="select * from borrowlist where dept = "& "'" & oabusyuserdept & "'" & "and stage =1"
end if
if oabusyuserlevelCode="CW" then
   sqlstr="select * from  borrowlist where stage=2 or stage=4 or (stage=1 and borrower= "& "'" & oabusyname & "'" &")"
end if
if oabusyuserlevelCode="DSZ" then
   sqlstr="select * from  borrowlist where  stage=3"
end if
if oabusyuserlevelCode="CWZG" then
   sqlstr="select * from  borrowlist where  stage=10"
end if
rs.open sqlstr,conn,1,1
if not rs.eof and not rs.bof then
response.write("借支有问题需要处理")
end if

'set cn=server.CreateObject("adodb.connection")
'DBPath2=server.mappath("finance.mdb")
'cn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath2
set cn=opendb("finance","conn","sql")
set res=server.createobject("adodb.recordset")
if oabusyuserlevelCode="BMJL" then
   sqlstr2="select * from  reimbursementlist where  stage=1 and dept='" &oabusyuserdept &"'"
end if
if oabusyuserlevelCode="CW" then
   sqlstr2="select * from  reimbursementlist where stage=2 or stage=4 or (stage=1 and claimant='"&oabusyname&"' )"
end if
if oabusyuserlevelCode="DSZ" then
   sqlstr2="select * from  reimbursementlist where  stage=3"
end if
if oabusyuserlevelCode="CWZG" then
   sqlstr2="select * from  reimbursementlist where  stage=10"
end if
res.open sqlstr2,cn,1,1

if not res.eof and not res.bof then
response.write("报销有问题需要处理")
end if
%>
</head>

<body>
</body>
</html>
