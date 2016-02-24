<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="asp\opendb.asp"-->
<head>
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
names=request("username")
yearN=request("myyear")
monthN=request("mymonth")
'response.Write(names)
'response.Write(yearN)
'response.Write("<br>")
'response.Write(monthN)
'response.Write("<br>")
t1=DateSerial(yearN,monthN,1)

t2=DateSerial(yearN,monthN+1,1)
'response.Write(t1)
'response.Write("<br>")
'response.Write(t2)
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>详细工作信息</title>
</head>
<body>
<div align="center">
<%=names%><%=yearN%>年<%=monthN%>月工作汇表
<table border="1" cellpadding="1" cellspacing="0" width="100%" >
<tr >
    <td width="103">
	   时间	</td>
	 <td width="103">
	   标题	</td>
    <td width="1217">
	   工作内容	</td>
	<td>
	   是否重要	
	  </td>
	<td width="117">
	   是否完成	</td>
</tr>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from workrep where username="&"'"&names&"'"&"and recdate>= " & t1 &" and recdate<"&t2&" order by recdate"
rs.open sql,conn,1,1
do while not rs.eof 
%>
<tr>
    <td>
	  <%response.Write(formatdatetime(rs("recdate"), 1))%>
	</td>
	 <td>
	   <%=rs("title")%>
	</td>
    <td>
	   <%=rs("remark")%>
	</td>
	<td width="69">
      <% if rs("imp")="yes" then
	      response.Write("重要")
	   else
	      response.Write("否")
		end if 
	   %>
	</td>
	<td>
      <% if rs("finished")="yes" then
	      response.Write("完成")
	   else
	      response.Write("否")
		end if 
	   %>
	</td>
</tr>
<%
  rs.movenext
  loop 

%>
</table>
</div>
</body>
</html>
