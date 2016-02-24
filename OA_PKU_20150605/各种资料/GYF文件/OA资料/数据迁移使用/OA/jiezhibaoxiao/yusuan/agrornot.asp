<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->

<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
code=request.cookies("oabusyuserlevelCode")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
<head>
<%
projectid=request.Form("projectid")
submit=request.Form("submit")
note=request.Form("note")
id=request.Form("id")
%>
<%
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from accProj where projectid='"&projectid&"'"
	rs.open sql,conn,1,3
	if not rs.eof and not rs.bof then
		if trim(submit)="审核完毕" then
			if code="BMJL"  then
			rs("stage")=2
			end if
			if code="DSZ"  then
			rs("stage")=4
			end if
			if code="CWZG"  then
			rs("stage")=3
			end if
		end if
		if trim(submit)="不通过审核" then
		rs("stage")=5
		end if
	rs.update
	end if
	set rs=nothing
	set conn=nothing
	
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from accProj where projectid='"&projectid&"'"
	rs.open sql,conn,1,3
	stage=rs("stage")
	if not rs.eof and not rs.bof then
	    if code="BMJL"  then
		rs("deptNote")=note
		end if
		if code="DSZ"  then
		rs("orlNote")=note
		end if
		if code="CWZG"  then
		rs("CWZGNote")=note
		end if
		if stage=0 and code="ZSYG" then
		rs("proLeaderNote")=note
		end if
	rs.update
	response.Write("<script LANGUAGE=javascript>alert('处理成功');window.location.href='mainbudget.asp';</script>")
	end if
	set rs=nothing
	set conn=nothing
	
	if trim(submit)="删除" then
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="delete from accProj where id="&id
	rs.open sql,conn,1,3
	rs.update
	set rs=nothing
	set conn=nothing
	end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
</body>
</html>
