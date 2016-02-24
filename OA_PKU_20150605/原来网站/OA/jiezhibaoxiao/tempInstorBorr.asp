<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<!--#include file="getverify.asp"-->
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
projectid=request("projectid")

set conn=opendb("lmtof","conn","sql")
set rs=server.createobject("adodb.recordset")
sql="select dept,deptcode from dept where dept='"&dept&"'"
rs.open sql,conn,1,1
if  rs.eof or rs.bof then
	response.write("<script language=""javascript"">")
	response.write("alert(""报销人的部门信息出错，请联系管理员"");")
	response.write("window.history.go(-1);")
	response.write("</script>")
else
	deptcode=rs("deptcode")
set conn=nothing
set rs=nothing
set sql=nothing
end if 




set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
sql= "select * from borrowlist where borrower='"&borrower&"' and borrowerdeptcode='"&deptcode&"' and money="&moneyS&" and content='"&content&"'  and projectid='"&projectid&"' and stage=0"
rs.open sql,conn,1,1
if not rs.eof and not rs.bof then
	response.write("<script language=""javascript"">")
	response.write("alert(""已经提交过该借支，请勿重复提交"");")
	response.write("window.history.go(-1);")
	response.write("</script>")
set conn=nothing
set rs=nothing
end if


set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
sql= "select * from borrowlist"
rs.open sql,conn,1,3
  set cn=opendb("lmtof","conn","sql")
  set rs2=server.CreateObject("adodb.recordset")
  sql2="select * from userinf where username="& "'"& oabusyusername & "'"
  rs2.open sql2,cn,1,1
  if not rs2.eof then
  end if
if  borrowTime<>"" and repayTime<>"" and moneyS<>""  then 
'rs.movelast
rs.addnew
rs("projectid")=projectid
rs("money")=moneyS
rs("borrower")=borrower
rs("borrowerdeptcode")=deptcode
rs("content")=content
rs("borrowTime")=FormatDateTime(borrowTime, 1)
rs("repayTime")=FormatDateTime(repayTime, 1)
rs("asktime")=date
rs("stage")="0"	
rs("haveverify")=""
rs("nowverify")=""
rs("willverify")=getverify(projectid,"B")
rs("projectdeptcode")=getprojectdeptcode(projectId)
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