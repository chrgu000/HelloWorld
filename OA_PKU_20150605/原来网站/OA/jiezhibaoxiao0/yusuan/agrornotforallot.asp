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
code1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
<head>
<%
id=request.Form("id")
submit=request.Form("submit")
note=request.Form("note")
%>
<%
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from ProinM where id="&id
	rs.open sql,conn,1,3
	if not rs.eof and not rs.bof then
	stage=rs("stage")
		if trim(submit)="������" then
			if code="BMJL"  then
			rs("stage")=2
			end if
			if code="DSZ"  and stge=3 then
			rs("stage")=4
			end if
			if code="DSZ" and code1="BMJL" and stge=1 then
			rs("stage")=2
			end if
			if code="CWZG"  then
			rs("stage")=3
			end if
		end if
		if trim(submit)="��ͨ�����" then
		rs("stage")=5
		end if
	rs.update
	end if
	set rs=nothing
	set conn=nothing
	
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from ProinM where id="&id
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
	response.Write("<script LANGUAGE=javascript>alert('����ɹ�');window.location.href='manageallot.asp';</script>")
	end if
	set rs=nothing
	set conn=nothing
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
</head>

<body>
</body>
</html>
