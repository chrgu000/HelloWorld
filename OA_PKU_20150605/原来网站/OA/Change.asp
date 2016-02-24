<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="asp/opendb.asp"-->
<title>修改</title>
<%
username=request("username")
password=request("password")
repassword=request("repassword")
name=request("name")
dept=request("dept")
userlevel=request("userlevel")

if password<>repassword then
    response.write("<script language=""javascript"">")
	response.write("window.alert('两次密码输入不同一');")
	response.write("window.history.go(-1);")
	response.write("</script>")
	response.end
end if

set conn=opendb("lmtof","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql= "select * from userinf where username = "&"'"&username&"'" 
rs.open sql,conn,1,3
if  not rs.eof and not rs.bof  then
rs("name")=name
rs("password")=password
rs("userdept")=dept
rs("userlevel")=userlevel
rs.update
'rs.movenext
response.Write("<div align=center>修改成功</div>")
else
response.Write("<div align=center>修改不成功</div>")
end if



%>
</head>

<body>
<div align="center">

<form>
<input type="button" value="关闭"  onclick="window.location.href='usercontrol.asp'"/>
</form>
</div>
</body>
</html>
