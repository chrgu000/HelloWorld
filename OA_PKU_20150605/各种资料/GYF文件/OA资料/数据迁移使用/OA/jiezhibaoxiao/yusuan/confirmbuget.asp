<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->

<%
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
Response.AddHeader "Pragma", "No-Cache"
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
code=oabusyuserlevelCode
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end()
end if

projectid=request("projectid")
certificateNo=request("certificateNo")

    set conn=opendb("GFProjectType","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select * from projectType where projectId='"&projectid&"'"
	rs.open sql,conn,1,1
	if not rs.bof and not rs.eof  then
	proLeader=rs("principal1")
	end if
	if rs.eof or rs.bof then
	response.End()
	end if
	set rs=nothing
	set conn=nothing
	
	set conn=opendb("symx","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select * from accProj where projectid='"&projectid&"'"
	rs.open sql,conn,1,3
	if not rs.bof and not rs.eof then
	response.write("<script language=""javascript"">")
	response.write("alert('数据库中已有该项目的预算！');window.location.href='mainbudget.asp';")
	response.write("</script>")
	response.end()
	end if
	set rs=nothing
	set conn=nothing
'	
'	set conn=opendb("symx","conn","accessdsn")
'    set rs=server.createobject("adodb.recordset")
'	sql="select * from submoney where projectid='"&idPro&"'"
'	rs.open sql,conn,1,3
'		do while not rs.eof and not rs.bof 
'		rs.delete
'		rs.movenext
'		loop
'	set rs=nothing
'	set conn=nothing
'	
'	set conn=opendb("GFProjectType","conn","accessdsn")
'    set rs=server.createobject("adodb.recordset")
'	sql="select * from projectType where projectid='"&idPro&"'"
'	rs.open sql,conn,1,3
'		do while not rs.eof and not rs.bof 
'		rs.delete
'		rs.movenext
'		loop
'	set rs=nothing
'	set conn=nothing
	
	'getgf=split(idPro,"-")
'	if Ubound(getgf)>0 and getgf(1)="GF" then
'	types="A"
'	else 
'	types="B"
'	end if
'	
'	set conn=opendb("GFProjectType","conn","accessdsn")
'    set rs=server.createobject("adodb.recordset")
'	sql="select * from projectType where projectid='"&idPro&"'"
'	rs.open sql,conn,1,3
'		rs.addnew
'		rs("projectId")=idPro
'		rs("type")=types
'		rs("dept")=oabusyuserdept
'		rs("projectName")=namePro
'		rs("principal1")=oabusyname
'		rs.update
'	set rs=nothing
'	set conn=nothing
	
pcycle=trim(request("pcycle"))
summoney=trim(request("summoney"))
initProUnit=trim(request("initProUnit"))
proforDept=trim(request("proforDept"))
attendeeDept=trim(request("attendeeDept"))
taxes=trim(request("taxes"))
accrul=trim(request("accrul"))
groundFee=trim(request("groundFee"))
collaborCosts=trim(request("collaborCosts"))

nameit=trim(request("name"))
'response.Write((28 mod 14))
	namearr=split(nameit,",")
	'response.Write(Ubound(namearr)+1)
	h=(Ubound(namearr)+1) / 3
	'response.Write(h)
	for i=0 to Ubound(namearr)
	'response.Write(namearr(i))
	if ((i+1) mod 3)=0  then
	'response.Write("<br>")
	end if
	next
 if h>0 then
	set conn=opendb("symx","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select * from accProj "
	rs.open sql,conn,1,3
		rs.addnew
		if code="BMJL"  then
		rs("stage")=2
		end if
		if code="DSZ"  then
		rs("stage")=3
		end if
		if code<>"BMJL" and code<>"DSZ"  then
		rs("stage")=0
		end if
		rs("projectid")=projectid
		rs("certificateNo")=certificateNo
		rs("pcycle")=pcycle
		rs("summoney")=summoney
		rs("initProUnit")=initProUnit
		rs("proforDept")=proforDept
		rs("attendeeDept")=attendeeDept
		rs("taxes")=taxes
		rs("accrul")=accrul
		rs("groundFee")=groundFee
		rs("collaborCosts")=collaborCosts
		rs("inputMan")=oabusyname
		rs("timewrite")=year(now())&"年"&month(now())&"月"&day(now())&"日"
		rs("proLeader")=proLeader
		rs.update
	set rs=nothing
	set conn=nothing
	
	set conn=opendb("symx","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select * from submoney "
	rs.open sql,conn,1,3
	for i=0 to h-1
		rs.addnew
		rs("projectid")=projectid
		rs("timewrite")=year(now())&"年"&month(now())&"月"&day(now())&"日"
		
			for b=0 to 2
				if b=0 then
				rs("msub")=trim(namearr(i*3+b))
				end if
				if b=1 then
				rs("sub")=trim(namearr(i*3+b))
				end if
				if b=2 then
				rs("money")=trim(namearr(i*3+b))
				end if
			next
		rs.update
    next
	response.Write("<script LANGUAGE=javascript>alert('添加成功');window.location.href='mainbudget.asp';</script>")
	set rs=nothing
	set conn=nothing
 end if
 if h=0 then
 response.Write("<script languange=javascript>alert('请填写详细科目及金额');</script>")
 end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>确认是否有误</title>
</head>

<body>
</body>
</html>
