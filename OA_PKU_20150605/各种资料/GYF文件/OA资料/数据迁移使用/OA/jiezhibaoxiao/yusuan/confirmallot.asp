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
code1=oabusyuserlevelCode1

if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end()
end if

projectid=request("projectid")
certificateNo=request("certificateNo")
'response.Write(projectid)

    set conn=opendb("GFProjectType","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select * from projectType where projectId='"&projectid&"'"
	rs.open sql,conn,1,1
	if not rs.bof and not rs.eof  then
	proLeader=rs("principal1")
	'response.Write(proLeader)
	end if
	if rs.eof or rs.bof then
	response.End()
	end if
	set rs=nothing
	set conn=nothing
	
	
	
pcycle=trim(request("pcycle"))
summoney=trim(request("summoney"))
initProUnit=trim(request("initProUnit"))
proforDept=trim(request("proforDept"))
attendeeDept=trim(request("attendeeDept"))
taxes=trim(request("taxes"))
accrul=trim(request("accrul"))
groundFee=trim(request("groundFee"))
collaborCosts=trim(request("collaborCosts"))
inpaytime=trim(request("inpaytime"))

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
 if h>0 then' h>0
	set conn=opendb("symx","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select * from proinM "
	rs.open sql,conn,1,3
		rs.addnew
		if (code="BMJL" or ( code="DSZ" and code1="BMJL")) then
		rs("stage")=2
		end if
		if code="DSZ" and code1=NULL then
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
		rs("inpaytime")=inpaytime
		rs.update
	set rs=nothing
	set conn=nothing
	
	set conn=opendb("symx","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select top 1 id from proinM order by id desc"
	rs.open sql,conn,1,1
	proinMid=rs("id")
	set rs=nothing
	set conn=nothing

	
	set conn=opendb("symx","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select * from subProin "
	rs.open sql,conn,1,3
	for i=0 to h-1
		rs.addnew
		rs("proinMid")=proinMid
		rs("projectid")=projectid
		'rs("timewrite")=year(now())&"年"&month(now())&"月"&day(now())&"日"
		
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
	response.Write("<script LANGUAGE=javascript>alert('添加成功');window.location.href='manageallot.asp';</script>")
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
