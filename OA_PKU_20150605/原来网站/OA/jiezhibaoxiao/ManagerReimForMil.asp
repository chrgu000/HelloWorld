<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>需处理的处理报销单查看</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
</head>

<body>
<div align="center">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="21"><div align="center">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="2" height="25"><span class="style2"><img src="../images/main/l3.gif" width="2" height="25"></span></td>
            <td background="../images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="21"><div align="center"><span class="style2"><img src="../images/main/icon.gif" width="15" height="12"></span></div></td>
                  <td align="left"class="style7"><font size="-1">报销模块</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<font size="-1">
<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
if oabusyuserlevelCode="CW" then
sql="select * from ReimMilti "
end if
if oabusyuserlevelCode="DSZ" then
sql="select * from ReimMilti "
end if
rs.open sql,conn,1,1
%>
<%
'set connItem=server.CreateObject("adodb.connection")
'pathItem=server.MapPath("finance.mdb")
'connItem.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathItem
set connItem=opendb("finance","conn","sql")
set rsItem=server.CreateObject("adodb.recordset")
sqlItem="select * from reimburseItem " 
rsItem.open sqlItem,connItem,1,1
%>

<table border="1"  cellspacing="1" cellspacing="0">
<tr bgcolor="D7E8F8" bordercolor="#339999"><td>报销人</td><td>报销日期</td><td>报销总金额</td><td>单据总数</td><td>状态</td></tr>
<%do while not rs.eof %>
<tr><td><%=rs("Reimfinance")%></td><td><%=rs("ReimDate")%></td><td><%=rs("MoneySum")%></td><td><%=rs("BillCount")%></td>
<td>
<%
'set connTS=server.CreateObject("adodb.connection")
'pathTS=server.MapPath("finance.mdb")
'connTS.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathTS
set connTS=opendb("finance","conn","sql")
set rsTS=server.CreateObject("adodb.recordset")
sqlTS="select * from stage where stage="&rs("stage")
rsTS.open sqlTS,connTS,1,1
%>
<%=rsTS("txt")%>
</td><td>
<a href=editReimForMil.asp?id=<%=rs("id")%>>
<%if rs("stage")=0 or rs("stage")=6 or rs("stage")=3 then %>
查看
<% else %>
处理
<%end if%>
</a>
</td></tr>
<%
 rs.movenext 
loop %>
</table>

</div>
</font>
</body>
</html>
