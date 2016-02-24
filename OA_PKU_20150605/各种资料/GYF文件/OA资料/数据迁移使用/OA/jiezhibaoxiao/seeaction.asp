<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")
    set conn=opendb("finance","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select * from cnaction where id="&id
	rs.open sql,conn,1,1
		if not rs.eof and not rs.bof then
		pzh=rs("pzh")
		writetime=rs("writetime")
		content=rs("content")
		inmoney=rs("inmoney")
		outmoney=rs("outmoney")
		yhshouru=rs("yhshouru")
		xjshouru=rs("xjshouru")
		yhzhichu=rs("yhzhichu")
		xjzhichu=rs("xjzhichu")
		end if

	set rs=nothing
	set conn=nothing
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>查看收支记录</title>
</head>
<body>
<font color="#0d79b3" size="-1">
<center>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="21"><div align="center">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="2" height="25"><span class="style2"><img src="../images/main/l3.gif" width="2" height="25"></span></td>
            <td background="../images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="21"><div align="center"><span class="style2"><img src="../images/main/icon.gif" width="15" height="12"></span></div></td>
                  <td align="left"class="style7"><font size="-1">收支记录</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>

<form name="f" method="post" action="cnaction2.asp">

<table cellspacing="0" cellpadding="0" bgcolor="D7E8F8" bordercolor="#339999" border="1" width="60%">
	<tr>
		<td>收入金额</td>
		<td>&nbsp;<%=inmoney%></td>
		<td>支出金额</td>
		<td>&nbsp;<%=outmoney%></td>
	</tr>
	<tr>
		<td>备注</td>
		<td colspan="3">&nbsp;<%=content%></td>
	</tr>
	<tr>
		<td>选项</td>
		<td>&nbsp;
			<%if yhshouru="Y" then response.Write("银行收入 ") %>
			<%if zjshouru="Y" then response.Write("现金收入 ") %>
			<%if yhzhichu="Y" then response.Write("银行支出 ") %>
			<%if xjzhichu="Y" then response.Write("现金支出 ") %>
		</td>
		<td>经办人</td>
		<td>&nbsp;<%=jinbanren%></td>
	</tr>
	<tr>
		<td>凭证号</td>
		<td>&nbsp;<%=pzh%></td>
		<td>填写时间</td>
		<td>&nbsp;<%=writetime%></td>
	</tr>
</table>
</center>
</font>
</body>
</html>
