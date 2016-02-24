<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
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
types=request("type")
'response.Write(id)
%>
<%
'-----------------------------------------------------------------------

set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable where id="&request("id")
rs.open sql,conn,1,3
stage=rs("stage")
'-----------------------------------------------------------------------
if oabusyuserlevelCode="BMJL" or oabusyuserlevelCode1="BMJL" then  
 'if  oabusyuserdept<>"综合管理部" and types="B" then
'  rs ("stage")=3
' else if oabusyuserdept<>"综合管理部" and types="A" then
'  rs ("stage")=13
' end if 
' end if
' if  oabusyuserdept="综合管理部"  then
'  rs ("stage")=3
' end if
 if stage=1 then
    rs ("stage")=2 
	rs("principalNotes")=notes
    rs("principalApprovalTime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
 end if
    if stage<>1 then
      if  oabusyuserdept<>"综合管理部" and types="B" then
        rs ("stage")=3
      else if oabusyuserdept<>"综合管理部" and types="A" then
        rs ("stage")=13
      end if 
      end if
      if  oabusyuserdept="综合管理部"  then
       rs ("stage")=3
      end if
	end if
rs("deptNotes")=notes
rs("deptApprovalTime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
end if
'-----------------------------------------------------------------------
if oabusyuserlevelCode="CWZG" then 
if stage=1 then
    rs ("stage")=2 
 end if
    if stage=3 then
        rs("stage")=4 'add by zhaoshijun 2010-12-24 财务主管 如果阶段为三 提交给机构负责人
    end if
    if stage=6 then
        rs("stage")=7 'add by zhaoshijun 2010-12-24 财务主管审核调整结果 之后 提交为 处理完毕
    end if
rs("financialNotes")=notes
rs("financialApprovalTime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
end if
'-----------------------------------------------------------------------
if oabusyuserlevelCode="DSZ" then 
 if oabusyuserlevelCode1="BMJL" then
    if stage=1 then
    rs("stage")=2 
    rs("principalNotes")=notes
	rs("principalApprovalTime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
	end if
	if stage=2 then
	    if  oabusyuserdept<>"综合管理部" and types="B" then
           rs ("stage")=3
        else if oabusyuserdept<>"综合管理部" and types="A" then
           rs ("stage")=13
        end if
		end if
    rs("deptNotes")=notes
	end if
	if stage=4 then
    'rs("stage")=7 
	rs("stage")=5 
    rs("gManagerNotes")=notes
	end if
 end if
 if oabusyuserlevelCode1<>"BMJL" then
    'rs("stage")=7 
	rs("stage")=5 
    rs("gManagerNotes")=notes
 end if
  rs("gManagerApprovalTime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
end if
'-----------------------------------------------------------------------
	response.write("<script language=""javascript"">")
	response.write("window.location.href='mainReim.asp';")
	response.write("</script>")
%>
</head>
<body>
<div align="center">
<form action="mainReim.asp" method="post">
<input type="submit" value="关闭" />
</form>
</div>
</body>
</html>
