<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<!--#include file="getverify.asp"-->
<head>
<%
id=request("Id")
borrowTime=request("borrowTime")
repayTime=request("repayTime")
money=request("money")	
content=request("content")
projectid=request("projectid")
verify=getverify(projectid,"B")
'response.Write(verify)

'mystr=split(verify,"--")
'response.write mystr(0) 
'for i=0 to ubound(mystr) 
'response.write mystr(i) 
'next

'用的上的代码
mystr=split(verify,"--")
haveverify=""
nowverify=mystr(0)
willverify=right(verify,len(verify)-(len(mystr(0))+2))
getstage=split(mystr(0),":")
stage=getstage(0)
'response.Write(stage)
'response.Write(haveverify)
'response.Write(nowverify)
'response.Write(willverify)
'用的上的代码
%>
<%
boo=IsNumeric(money)
if boo=false then
  	response.write("<script language=""javascript"">")
	response.write("window.alert('金钱必须为数字');window.history.go(-1);")
	response.write("</script>")
response.End()
end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑修改借支单</title>
</head>
<body>
<%
str=id+borrowTime+repayTime+money+content

set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from borrowlist where id="&request("Id")
rs.open sql,conn,1,3
if not rs.eof then
rs("projectid")=projectid
rs("money")=money
rs("content")=content
rs("stage")=0
rs("haveverify")=""
rs("nowverify")=""
rs("willverify")=verify
rs("notes")=""
rs.update
rs.movenext
response.write("<script language=""javascript"">")
response.write("alert(""修改成功"");")
response.write("window.location.href='mainborrow.asp';")
response.write("</script>")
end if
if rs.eof and rs.bof then 
response.write("<script language=""javascript"">")
response.write("alert(""修改失败"");")
response.write("window.location.href='mainborrow.asp';")
response.write("</script>")
end if
%>
<div align="center">
<form action="mainborrow.asp" method="post">
<input type="submit" value="关闭" />
</form>
</div>
</body>
</html>
