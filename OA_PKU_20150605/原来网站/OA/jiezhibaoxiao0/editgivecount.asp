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
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
if code<>"CWZG" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")

          'set conn=server.CreateObject("adodb.connection")
          'path=server.MapPath("finance.mdb")
          'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
		  set conn=opendb("finance","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from reimlisttable_old where id="&id
          rs.open sql,conn,1,3
		  'rs("stage")=9
		  rs("stage")=7
		  rs.update
		  rs.movenext
		  set rs=nothing
		  set conn=nothing
		  response.write("<script language=""javascript"">")
	      response.write("window.location.href='mainReim.asp';")
	      response.write("</script>")
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>财务页面</title>
</head>

<form name="form" action="fanhui.asp" method="post">
<div align="center"><input type="submit" value="关闭" /></div>
</form>

<body>
</body>
</html>
