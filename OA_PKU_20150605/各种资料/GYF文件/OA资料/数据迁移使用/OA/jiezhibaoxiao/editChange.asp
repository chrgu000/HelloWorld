<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<%
id=request("Id")
borrowTime=request("borrowTime")
repayTime=request("repayTime")
money=request("money")	
content=request("content")
finance=request("finance")
%>
<%
boo=IsNumeric(money)
if boo=false then
  	response.write("<script language=""javascript"">")
	response.write("window.alert('��Ǯ����Ϊ����');window.history.go(-1);")
	response.write("</script>")
response.End()
end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
</head>
<body>
<%
str=id+borrowTime+repayTime+money+content
'response.Write(str)
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from borrowlist where id="&request("Id")
rs.open sql,conn,1,3
if not rs.eof then
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=money
rs("content")=content
rs("deptNotes")=""
rs("financialNotes")=""
rs("gManagerNotes")=""
rs("stage")=0
rs("finance")=finance
rs("date")=year(now)&"��"&month(now)&"��"&day(now)&"��"
rs.update
rs.movenext
response.Write("<div align=center>�޸ĳɹ�</div>")
end if
if rs.eof and rs.bof then 
response.Write("<div align=center>�޸�ʧ��</div>")
end if
%>
<div align="center">
<form action="mainborrow.asp" method="post">
<input type="submit" value="�ر�" />
</form>
</div>
</body>
</html>
