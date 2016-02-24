<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='../default.asp';")
	response.write("</script>")
	response.end
end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>审批本部门已填写原因的记录</title>
</head>

<body>
<center>
  <table width="80%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="21"><div align="center">
          <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="2" height="25"><span class="style2"><img src="../images/main/l3.gif" width="2" height="25"></span></td>
              <td background="../images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="21"><div align="center"><span class="style2"><img src="../images/main/icon.gif" width="15" height="12"></span></div></td>
                    <td class="style7" align="left">考勤系统@本人未考勤记录</td>
                  </tr>
              </table></td>
              <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
            </tr>
          </table>
          <font color="0D79B3"></font></div></td>
    </tr>
  </table>
  <table border="1" cellpadding="1" cellspacing="1" width="80%"  bgcolor="D7E8F8" bordercolor="#339999">
	  <tr>
	  		<td>姓名</td>
			<td>记录</td>
			<td>填写原因</td>
			<td>调休请假计划</td>
	  </tr>
	  <%
	    timein=year(now())&"年"&month(now())&"月"&"1日"
        timeinB=year(now())&"年"&month(now())+1&"月"&"1日"
		timenow=year(now())&"年"&month(now())&"月"&day(now())&"日"
		'response.Write(timein&"  "&timeinB)
	    set conn=opendb("yygy","conn","accessdsn")
		set rs=server.createobject("adodb.recordset")
		'sql="select  * from  monthkqtemp  where name='"&oabusyname&"' and time>="&Cdate(timein)&" and time<="&Cdate(timeinB) DATEDIFF(day,'2008-12-30','2008-12-29')
		sql="select  * from  monthkqtemp  where name='"&oabusyname&"' and time between '"&Cdate(timein)&"' and '"&Cdate(timeinB)&"'"
		rs.open sql,conn,1,1
		if not rs.eof and not rs.bof then
	  %>
	  <tr>
	  		<td><%=rs("name")%></td>
			<td><%=rs("record")%></td>
			<td>&nbsp;<%=rs("reason")%></td>
			<td>&nbsp;<%=rs("otherpan")%></td>
	  </tr>
	  <%
	  rs.movenext
	   end if
	   set rs=nothing
	   set conn=nothing
	  %>
  </table>
  <div align=center><br><br><a href='javascript:window.close();'>关闭</a><div>
 </center>
</body>
</html>

