<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
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
%>
<%
projectId=request.Form("projectId")
'projectname
'projectId
    set conn=opendb("GFProjectType","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select * from projectType_old where projectId='"&trim(projectId)&"'"
	rs.open sql,conn,1,1
		if  not rs.eof and not rs.bof then
		projectname=rs("projectName")
		end if
		if  rs.eof or rs.bof then
		response.Write("<script language=javascript>alert('未有该项目');window.history.go(-1);</script>")
		response.End()
		end if
	set rs=nothing
	set conn=nothing
	
pzh=request.Form("pzh")
money=request.Form("money")
feipeiM=request.Form("feipeiM")
jinbanren=oabusyname
prodept=request.Form("prodept")
writetime=year(now)&"年"&month(now)&"月"&day(now)&"日" '填写到款分配单的日期
danwei=REQUEST.Form("danwei")
deptleader=request.Form("deptleader")
inpaydanwei=request.Form("inpaydanwei")
content=request.Form("content")
jiaoxxM=request.Form("jiaoxxM")
jiaoyxsM=request.Form("jiaoyxsM")
jiaoxxcontent=request.Form("jiaoxxcontent")
jiaoyxscontent=request.Form("jiaoyxscontent")
'response.Write(projectId)
'response.Write(projectname)
'response.Write(pzh)
'response.Write(money)
'response.Write(feipeiM)
'response.Write(prodept)
'response.Write(writetime)
'response.Write(danwei)
'response.Write(deptleader)
'response.Write(inpaydanwei)
'response.Write(content)
'response.Write(jiaoxxM)
'response.Write(jiaoyxsM)
'response.Write(jiaoxxcontent)
'response.Write(jiaoyxscontent)

	set conn=opendb("symx","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select * from proinM where projectId='"&trim(projectId)&"'"
	rs.open sql,conn,1,3
		rs.addnew
		rs("projectId")=trim(projectId)
		rs("projectname")=trim(projectname)
		rs("pzh")=trim(pzh)
		rs("money")=money
		rs("feipeiM")=feipeiM
		rs("jinbanren")=trim(jinbanren)
		rs("prodept")=trim(prodept)
		rs("time")=writetime
		rs("danwei")=trim(danwei)
		rs("deptleader")=trim(deptleader)
		rs("inpaydanwei")=trim(inpaydanwei)
		rs("content")=trim(content)
		rs("jiaoxxM")=jiaoxxM
		rs("jiaoyxsM")=jiaoyxsM
		rs("jiaoxxcontent")=jiaoxxcontent
		rs("jiaoyxscontent")=jiaoyxscontent
		rs.update
		response.Write("<script language=javascript>alert('完成提交');window.close();</script>")
	set rs=nothing
	set conn=nothing

%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>保存页面</title>
</head>

<body>
</body>
</html>
