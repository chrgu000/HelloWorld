<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改报销单</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='mainReim.asp';")
	response.write("</script>")
	response.end
end if
remark=request("remark")
money=request("money")
billCount=request("billCount")
id=request("id")
bid=request("bid")
summary=request("summary")
'response.write(id)
%>
</head>

<body>
<%
set cn=opendb("finance","conn","sql server")
set rs2=server.CreateObject("adodb.recordset")
sql2="select * from reimlisttable where id ="&bid
rs2.open sql2,cn,1,3
if not rs2.eof then
  if money <>"" and billCount <>"" and money <>"0" then
  rs2("money")=money
  rs2("remark")=remark
  rs2("billCount")=billCount
  rs2("summary")=summary
  end if
end if
rs2.update
%>

<div align="center">
<form>
<input type="button" value="关闭" onclick="javascript:window.history.back();" />
</form>
</form>
</body>
</html>
