<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
Code=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='mainReim.asp';")
	response.write("</script>")
	response.end
end if
if code<>"CWZG" and oabusyuserlevelCode1<>"CWZG" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='mainReim.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")
notes=request("notes")

if notes="" then 
	response.write("<script language=""javascript"">")
	response.write("alert('如果不同意必须注明原因');")
	response.write("window.history.go(-1);")
	response.write("</script>")
	response.End()
end if
%>
<%
dstatus="帐号需要调整："
success="false"
		  set conn=opendb("finance","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from reimlisttable where id="&id
          rs.open sql,conn,1,3
		  oldwillverify=rs("willverify")
		  oldnowverify=rs("nowverify")
		  rs("willverify")=rs("nowverify")&"--"&oldwillverify
		  haveverifytemp=rs("haveverify")
		  mystr=split(haveverifytemp,"--")
		  nowverify=mystr(ubound(mystr)-1)
		  rs("nowverify")=nowverify
		  haveverify=left(haveverifytemp,len(haveverifytemp)-(len(mystr(ubound(mystr)-1))+2))
		  rs("haveverify") =haveverify   
		  getstage=split(mystr(ubound(mystr)-1),":")
		  stage=getstage(0)
		  rs("stage")=stage
		  rs("notes")=rs("notes")&oldnowverify&":"&dstatus&notes&"####" 
		  
		  rs.update
		  success="true"
		  'rs.movenext
		  set rs=nothing
		  set conn=nothing
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>财务页面</title>
</head>

<body>
<%
if success="true" then 
response.write("<script language=""javascript"">")
response.write("alert(""完成审批完成"");")
response.write("window.location.href='mainReim.asp';")
response.write("</script>")
else
response.write("<script language=""javascript"">")
response.write("alert(""完成审批未成功，请联系管理员"");")
response.write("window.location.href='mainReim.asp';")
response.write("</script>")
end if
%>
</body>
</html>
