<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="asp/opendb.asp"-->
<title>�޸�</title>
<%
username=request("username")
password=request("password")
repassword=request("repassword")
name=request("name")
dept=request("dept")
userlevel=request("userlevel")

if password<>repassword then
    response.write("<script language=""javascript"">")
	response.write("window.alert('�����������벻ͬһ');")
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
response.Write("<div align=center>�޸ĳɹ�</div>")
else
response.Write("<div align=center>�޸Ĳ��ɹ�</div>")
end if



%>
</head>

<body>
<div align="center">

<form>
<input type="button" value="�ر�"  onclick="window.location.href='usercontrol.asp'"/>
</form>
</div>
</body>
</html>
