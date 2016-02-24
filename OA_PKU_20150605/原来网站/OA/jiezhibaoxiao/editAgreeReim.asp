<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<!--#include file="getverifyR.asp"-->
<title>财务审批</title>
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
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")
notes=request("notes")
dstatus="同意申请"
success="flase"
%>
<%
'-----------------------------------------------------------------------
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable where id="&request("id")
rs.open sql,conn,1,3
oldstage=rs("stage")
dealtype=rs("dealtype")
	  rs("haveverify")=rs("haveverify")&rs("nowverify")&"--"	  
	  willverifytemp=rs("willverify")
	  if willverifytemp<>"" then
	    mystr=split(willverifytemp,"--")
	    nowverify=mystr(0)
	    numf=len(willverifytemp)-(len(mystr(0))+2)
		if numf > 0 then
		willverify=right(willverifytemp,len(willverifytemp)-(len(mystr(0))+2))
		end if
		if numf <= 0 then
		willverify=""
		end if
		getstage=split(mystr(0),":")
	    stage=getstage(0) 
	  else
	    nowverify=""
		willverify=""
	  end if
	  
	  oldnowverify=rs("nowverify")
	  rs("nowverify")=nowverify	  
	  rs("willverify")=willverify
	  rs("notes")=rs("notes")&oldnowverify&":"&dstatus&notes&"####" 
	  rs("stage")=stage
	if dealtype="BB" and oldstage=3 then
	  rs("stage")=9
	end if
	if dealtype="CC" and oldstage=3  then
	  rs("stage")=9
	end if
rs.update
success="true"
'-----------------------------------------------------------------------
	response.write("<script language=""javascript"">")
	response.write("window.location.href='mainReim.asp';")
	response.write("</script>")
%>
</head>
<body>
<div align="center">
<%
if success="true" then 
response.write("<script language=""javascript"">")
response.write("alert(""完成审批成功"");")
response.write("window.location.href='mainborrow.asp';")
response.write("</script>")
else
response.write("<script language=""javascript"">")
response.write("alert(""完成审批未成功，请联系管理员"");")
response.write("window.location.href='mainborrow.asp';")
response.write("</script>")
end if
%>
</div>
</body>
</html>
