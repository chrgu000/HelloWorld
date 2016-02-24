<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
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
id=request("id")
money=request("money")
billCount=request("billCount")
remark=request("remark")
types=request("type")
summary=request("summary")
str=id+borrowTime+repayTime+money+content
ft=20

%>
<%

set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable where id="&request("id")
rs.open sql,conn,1,3
stage=rs("stage")
if not rs.eof then
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="ZSYG"  or oabusyuserlevelCode="SYYG" then
ft=0
rs("stage")=1
rs("money")=money
rs("billCount")=billCount
rs("summary")=summary
rs("type")=types
rs("reimburseDate")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="BMJL" or oabusyuserlevelCode1="BMJL"then
 if  oabusyuserdept<>"综合管理部" and types="B" then
        if stage=0 OR stage=10  then
        rs ("stage")=1
       end if
       if stage<>0 AND stage<>10 then
          rs ("stage")=3
	    end if 
 else if oabusyuserdept<>"综合管理部" and types="A" then
   if stage=0 OR stage=10  then
     rs ("stage")=1
   end if
   if stage<>0 AND stage<>10 then
      rs ("stage")=13
	end if
 end if 
 end if
 if  oabusyuserdept="综合管理部"  then
  rs ("stage")=3
 end if
  rs("money")=money
  rs("billCount")=billCount
  rs("summary")=summary
  rs("type")=types
  rs("reimburseDate")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="CN" then
  rs("stage")=1
  rs("money")=money
  rs("billCount")=billCount
  rs("summary")=summary
  rs("type")=types
  rs("reimburseDate")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
rs.movenext
end if
'----------------------------------------------------------------------------------------
if oabusyuserlevelCode="CWZG" then
 if stage=0 OR stage=10 then 
   rs("stage")=1
  end if
  if stage=3 then 
  rs("stage")=4
  end if
  rs("money")=money
  rs("billCount")=billCount
  rs("summary")=summary
  rs("type")=types
  rs("reimburseDate")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
rs.movenext

response.Write("<div align=center>提交成功</div>")
end if
'----------------------------------------------------------------------------------------

end if
if rs.eof and rs.bof then
response.Write("<div align=center>提交失败</div>")
end if

set conn=nothing
set rs=nothing

    
    'set cn=server.CreateObject("adodb.connection")
'    ph=server.MapPath("finance.mdb")
'    cn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & ph
'    set r=server.CreateObject("adodb.recordset")
'    sq="select * from reimburseItem where Itemid="&request("id")
'    r.open sq,cn,1,3
'	if not r.eof then
'	   r("money") = money
'	   r("billCount")=billCount
'	   r("summary")=summary
'	   r.movenext
'	end if

 
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
