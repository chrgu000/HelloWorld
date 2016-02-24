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
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")
signtime=year(now())&"年"&month(now())&"月"&day(now())&"日"
'response.Write(Id)
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable where id="&id
rs.open sql,conn,1,3
rs("stage")=8
if rs("ch")="N" then 'add by zhaoshijun at 2010-12-24 凡是 rs("ch") is NULL 的数据都是2010年之前的数据
rs("stage")=9
end if
rs("signtime")=signtime
money=cdbl(rs("money"))
username =rs("claimant")
userdept=rs("dept")
projectId=rs("projectId")
rs.update
rs.close
'修改账目欠款
set conn=opendb("lmtof","coynn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username='"&username&"'"
rs.open sql,conn,1,3
arearage =cdbl(rs("arearage"))-money
if(arearage>=0)then
  rs("arearage")=arearage '若余额大于等于0写入欠款
else
  rs("arearage")=0'若余额小于0，则说明花的比借的多，出纳要付多余的钱，欠款清0，多的钱=报销额-欠款
end if
rs.update
rs.close
set rs=nothing
set conn=nothing
set conn=opendb("symx","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from accProj where projectid='"&projectId&"'"
rs.open sql,conn,1,3
if not rs.eof and not rs.bof then
	bala=rs("bala")-money
	rs("bala")=bala	
	'rs.update
end if

'rs.close
set rs=nothing
set conn=nothing
%>
</head>

<body>
<div align="center">
<form action="mainReim.asp" method="post">
<table   border="1" cellpadding="1" cellspacing="0" width="85%">

	<tr bgcolor="D7E8F8" bordercolor="#339999" align="center">
		<td><font color="#0d79b3" size="-1">借款人</font></td>
		<td><font color="#0d79b3" size="-1">部门</font></td>
		<td><font color="#0d79b3" size="-1">余额</font></td>
		<td><font color="#0d79b3" size="-1">应付款</font></td>
	</tr>
	<tr>
	    <td><%=username%></td>
		<td><%=userdept%></td>
		<td><%if arearage>=0 then response.write(arearage) else response.write(0) end if%></td>
		<td><%if arearage<0 then response.write(abs(arearage)) else response.write(0) end if%></td>
	</tr>
</table>
<input  type="submit" value="关闭" />
</form>
</div>
</body>
</html>
