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
projectid=request("projectid")


set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
sql= "select * from borrowlist where borrower='"&borrower&"'  and money="&moneyS&" and content='"&content&"'  and projectid='"&projectid&"'"
rs.open sql,conn,1,1
if not rs.eof and not rs.bof then
	response.write("<script language=""javascript"">")
	response.write("alert(""已经提交过该借支，请勿重复提交"");")
	response.write("window.close();")
	response.write("</script>")
	chongfu="TRUE"
set conn=nothing
set sql=nothing
set rs=nothing
end if 


set conn=opendb("lmtof","conn","sql")
set rs=server.createobject("adodb.recordset")
sql= "select deptcode from dept where dept='"&dept&"'"
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
end if 

set conn=opendb("lmtof","conn","sql")
set rs=server.createobject("adodb.recordset")
sql= "select username from userinf where userdept='"&dept&"' and username='"&borrower&"'"
rs.open sql,conn,1,1
if  rs.eof or rs.bof then
	response.write("<script language=""javascript"">")
	response.write("alert(""请将报销人的部门填写正确！"");")
	response.write("window.history.go(-1);")
	response.write("</script>")
set conn=nothing
set rs=nothing
end if 

if chongfu<>"TRUE" then
	set conn=opendb("finance","conn","sql")
	set rs=server.createobject("adodb.recordset")
	sql= "select * from borrowlist"
	rs.open sql,conn,1,3
	
	set cn=opendb("lmtof","conn","sql")
	set rs2=server.CreateObject("adodb.recordset")
	sql2="select * from userinf where username="& "'"& oabusyusername & "'"
	rs2.open sql2,cn,1,1
	verify=getverify(projectid,"B")
	if not rs2.eof then
	'response.Write(rs2("userdept"))
	end if
	if  borrowTime<>"" and repayTime<>"" and  moneyS<>""  then 
	rs.addnew
	mystr=split(verify,"--")
	haveverify=""
	nowverify=mystr(0)
	willverify=right(verify,len(verify)-(len(mystr(0))+2))
	getstage=split(mystr(0),":")
	stage=getstage(0)
	rs("borrower")=borrower
	rs("borrowerdeptcode")=deptcode
	rs("stage")=stage
	rs("borrowTime")=borrowTime
	rs("repayTime")=repayTime
	rs("money")=moneyS
	rs("content")=content
	rs("projectid")=projectid
	rs("asktime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
	rs("haveverify")=haveverify
	rs("nowverify")=nowverify
	rs("willverify")=willverify
	rs("projectdeptcode")=getprojectdeptcode(projectId)
	rs.update
	end if
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
