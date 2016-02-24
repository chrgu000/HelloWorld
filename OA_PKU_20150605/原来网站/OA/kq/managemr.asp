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
if request("submit")="保存" then
usname=trim(request("usname"))
id=request("id")
deptview=request("deptview")
score=request("score")
set conn=opendb("yygy","conn","accessdsn")
sql="update monthkqtemp set deptview = '"&deptview&"', score = '"&score&"' , flag = 'Y' where id = "&id&" and name='"&usname&"'"
conn.Execute sql
end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>审批本部门已填写原因的记录</title>
</head>

<body>
<center>
  <table width="95%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="21"><div align="center">
          <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="2" height="25"><span class="style2"><img src="../images/main/l3.gif" width="2" height="25"></span></td>
              <td background="../images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="21"><div align="center"><span class="style2"><img src="../images/main/icon.gif" width="15" height="12"></span></div></td>
                    <td class="style7" align="left">考勤系统@审核未考勤记录</td>
                  </tr>
              </table></td>
              <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
            </tr>
          </table>
          <font color="0D79B3"></font></div></td>
    </tr>
  </table>
  <table border="1" cellpadding="1" cellspacing="1" width="95%"  bgcolor="D7E8F8" bordercolor="#339999">
	  <tr>
	  		<td>姓名</td>
			<td>记录</td>
			<td>填写原因</td>
			<td>调休请假计划</td>
			<td>审核意见</td>
			<td>考勤扣款</td>
			<td>操作</td>
	  </tr>
	  <%
	    set conn=opendb("yygy","conn","accessdsn")
		set rs=server.createobject("adodb.recordset")
		sql="select *  from monthkqtemp where dept='"&oabusyuserdept&"'"
		rs.open sql,conn,1,1
		do while not rs.eof and not rs.bof
	  %>
	  <form  action="managemr.asp" method="post" name="form" >
	  <tr>
	  		<td><%=rs("name")%></td>
			<td><%=rs("record")%></td>
			<td>&nbsp;<%=rs("reason")%></td>
			<td>&nbsp;<%=rs("otherpan")%></td>
			<% if rs("flag")<>"Y" then%>
			<td><textarea rows="4" cols="60" name="deptview"></textarea></td>
			<td><input type="text" name="score" /></td>
			<td><input type="submit" name="submit" value="保存" /></td>
			<%end if%>
			<% if rs("flag")="Y" then%>
			<td>&nbsp;<%=rs("deptview")%></td>
			<td>&nbsp;<%=rs("score")%></td>
			<td>&nbsp;</td>
			<%end if%>
	  </tr>
	  <input type="hidden" name="id" value="<%=rs("id")%>" /> <input type="hidden" name="usname" value="<%=rs("name")%>" />
	  </form>
	  <%
	   rs.movenext
	   loop
	   set rs=nothing
	   set conn=nothing
	  %>
  </table>
  <div align=center><br><br><a href='javascript:window.close();'>关闭</a><div>
 </center>
</body>
</html>
