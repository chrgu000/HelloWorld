<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
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
inmoney=request.Form("inmoney")
outmoney=request.Form("outmoney")
content=request.Form("content")
yhshouru=request.Form("yhshouru")
if yhshouru="" then yhshouru="no"
xjshouru=request.Form("xjshouru")
 if xjshouru="" then xjshouru="no"
yhzhichu=request.Form("yhzhichu")
 if yhzhichu="" then yhzhichu="no"
xjzhichu=request.Form("xjzhichu")
 if xjzhichu="" then xjzhichu="no"
'if  yhshouru="Y" and xjshouru="Y" then 
'response.Write("<script language=javascript>alert('银行收入和现金收入请分开写');window.history.back();</ script>")
'		response.End()
'end if
'if  yhzhichu="Y" and xjzhichu="Y" then 
'response.Write("<script language=javascript>alert('银行支出和现金支出请分开写');window.history.back();</ script>")
'		response.End()
'end if
 
pzh=request("pzh")
writetime=year(now)&"年"&month(now)&"月"&day(now)&"日"
jinbanren=oabusyname
'response.Write(inmoney)
'response.Write(outmoney)
'response.Write(content)
'response.Write(yhshouru)
'response.Write(xjshouru)
'response.Write(yhzhichu)
'response.Write(xjzhichu)
'response.Write(pzh)
'response.Write(writetime)
if inmoney>=0.00 and outmoney>=0.00 and jinbanren<>"" then
    set conn=opendb("finance","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select * from cnaction"
	rs.open sql,conn,1,3
		rs.addnew
		rs("inmoney")=inmoney
		rs("outmoney")=outmoney
		rs("content")=content
		rs("pzh")=pzh
		rs("writetime")=writetime
		rs("jinbanren")=jinbanren
		rs("yhshouru")=yhshouru
		rs("xjshouru")=xjshouru
		rs("yhzhichu")=yhzhichu
		rs("xjzhichu")=xjzhichu
		rs.update
		response.Write("<script language=javascript>alert('完成提交');window.close();</script>")
	set rs=nothing
	set conn=nothing
 end if
%>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
</body>
</html>
