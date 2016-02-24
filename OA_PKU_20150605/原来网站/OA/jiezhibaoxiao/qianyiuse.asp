<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<!--#include file="updatereim.asp"-->
<!--#include file="getverifyR.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>提交单据</title>
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

set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select  * from reimlisttable"
rs.open sql,conn,1,3
do while not rs.eof
	haveverify=""
	nowverify=""
	willverify=""
	temphaveverify=""
	response.Write(rs("id")&"<br>")
	temptijie=getprojectjie(rs("projectId"))
	if temptijie = "YES" then
		verify="mark"
		'response.Write(verify)
		rs("willverify")=verify
	end if
	if temptijie = "NO" then
		verify=getverifyR(rs("projectId"),"R","AA")
		relclaimantdeptcode=updaterrelcd(rs("id"))
		'response.Write(relclaimantdeptcode&"--实际报销人部门编号<br>")
		rs("relclaimantdeptcode")=relclaimantdeptcode
		claimantdeptcode=updatecd(rs("id"))
		'response.Write(claimantdeptcode&"--报销人部门编号<br>")
		rs("claimantdeptcode")=claimantdeptcode
		projectdeptcode=updatepdc(rs("id"))
		response.Write(projectdeptcode&"--项目的部门编号<br>")
		rs("projectdeptcode")=projectdeptcode
		rs("dealtype")="AA"
		rs("chkormn")="money"
	end if
	if verify <> "mark" then
		notes=rs("principalNotes")&rs("deptNotes")&rs("financialNotes")&rs("gManagerNotes") 
		'response.Write(notes)
		rs("notes")=notes
		if rs("stage")=1 then
			mystr=split(verify,"--")
			haveverify=""
			nowverify=mystr(0)
			willverify=right(verify,len(verify)-(len(mystr(0))+2))
			'response.Write("stage is 1:<br>")
			'response.Write(haveverify&"--haveverify<br>")
			'response.Write(nowverify&"--nowverify<br>")
			'response.Write(willverify&"--willverify<br>")
			rs("haveverify")=haveverify
			rs("nowverify")=nowverify
			rs("willverify")=willverify
		end if
		if rs("stage")=5 then			
			mystr=split(verify,"--")
			numf=ubound(mystr) ''表示数组的上线 numf+1表示数组中集合的个数
			num=0
			For I = Lbound(mystr) to Ubound(mystr) 
			getstage=split(mystr(I),":")
	    	stage=getstage(0)
			temphaveverify=temphaveverify&mystr(I)&"--"
			if stage=5 then
				nowverify=mystr(I)
				haveverify=left(temphaveverify,len(temphaveverify)-(len(mystr(I))+2))
				willverify=right(verify,len(verify)-(len(haveverify&nowverify)+2))
				exit for
			end if
			Next
			'response.Write("stage is 5:<br>")
'			response.Write(haveverify&"--haveverify<br>")
'			response.Write(nowverify&"--nowverify<br>")
'			response.Write(willverify&"--willverify<br>")
			rs("haveverify")=haveverify
			rs("nowverify")=nowverify
			rs("willverify")=willverify
		end if
		if rs("stage")=7 then
			mystr=split(verify,"--")
			numf=ubound(mystr) 
			willverify=""
			nowverify=mystr(numf)
			haveverify=left(verify,len(verify)-(len(nowverify)))
			'response.Write("stage is 7:<br>")
'			response.Write(haveverify&"--haveverify<br>")
'			response.Write(nowverify&"--nowverify<br>")
'			response.Write(willverify&"--willverify<br>")
			rs("haveverify")=haveverify
			rs("nowverify")=nowverify
			rs("willverify")=willverify
		end if
		if rs("stage")=8 then
			haveverify=verify
			nowverify=""
			willverify=""
			'response.Write("stage is 8:<br>")
'			response.Write(haveverify&"--haveverify<br>")
'			response.Write(nowverify&"--nowverify<br>")
'			response.Write(willverify&"--willverify<br>")
			rs("haveverify")=haveverify
			rs("nowverify")=nowverify
			rs("willverify")=willverify
		end if
	end if
	rs.update
rs.movenext
loop
set conn=nothing
set rs=nothing        
%>

</head>

<body>
</body>
</html>
