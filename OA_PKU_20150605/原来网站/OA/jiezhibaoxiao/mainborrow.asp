<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="css/css.css">
<script language="javascript1.2" src="js/openwin.js"></script>
<title>借支单处理页面</title>
<style type="text/css">
<!--
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
-->
</style>
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
%>
<script language="javascript" >
function newBorrowList()
{
window.open("newBorr.asp","_blank");
}
</script>
<script language="javascript" >
function manageBorrowList()
{
window.open("manageBorrow.asp","_blank");
}
function viewRefound()
{
window.open("refoundlist.asp","_blank");
}
</script>

<script language="javascript" >
function seeAllList()
{
window.open("seeAllList.asp","_blank");
}
</script>
<script language="javascript" >
function seeManageList()
{
window.open("seeManageList.asp","_self");
}
</script>

<style type="text/css">
<!--
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
.style8 {color: #2b486a}
-->
</style>
</head>

<body>
<font size="-1">
<div align="center">
<table width="583"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="21"><div align="center">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="2" height="25"><span class="style2"><img src="../images/main/l3.gif" width="2" height="25"></span></td>
            <td background="../images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="21"><div align="center"><span class="style2"><img src="../images/main/icon.gif" width="15" height="12"></span></div></td>
                  <td align="left"class="style7"><font size="-1">借支模块</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<%
set conn=opendb("lmtof","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from userinf where username = " & "'"& oabusyusername & "'"
rs.open sql,conn,1,1
if not rs.eof then
uStatus=rs("levelCode")
end if
%>

<hr>
</form>
<font color="#330033" size="-1">以下是您需要处理的申请：</font>
<form id="form1" name="form22" method="post">
<table   border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999"><font color="#0d79b3"><td><font color="#0d79b3" size="-1">编号</font></td><td><font color="#0d79b3" size="-1">申请人</font></td><td><font color="#0d79b3" size="-1">日期</font></td><td><font color="#0d79b3" size="-1">金额(元)</font></td><td><font color="#0d79b3" size="-1">状态</font></td></font></tr>
<%

	  set connveri=opendb("lmtof","conn","sql")
	  set rsveri=server.createobject("adodb.recordset")
	  sqlveri= "select deptcode from dept where dept='"&oabusyuserdept&"'"
	  rsveri.open sqlveri,connveri,1,1
	  if not rsveri.eof and not rsveri.bof then
		  borrowerdeptcode=rsveri("deptcode")
	  set connveri=nothing
	  set rsveri=nothing
	  set sqlveri=nothing
	  end if


set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
sqlborr="select * from borrowlist where nowverify like '%"&oabusyusername&"%'"
rsborr.open sqlborr,cnborr,1,1
do while not rsborr.eof %>

<tr bordercolor="#339999"><td><a href=editBorr.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a></td><td><%response.Write(rsborr("borrower"))%></td><td><%response.Write(formatdatetime(rsborr("asktime"), 1))%></td><td><%response.Write(rsborr("money"))%></td>

<td>
<%
set cnSt=opendb("finance","conn","sql")
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt")&"【<font color=red>"&rsborr("nowverify")&"</font>】")
%>
</td></tr>
<%
rsborr.movenext
loop%>
</table>
</form>

<!--显示当用户为普通用户时的内容-->
<font color="#330033" size="-1">以下是您还没有提交或被退回的申请：</font>
<form id="form1" name="form1" method="post">
<table bordercolor="#339999" border="1" cellpadding="0" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999"><font color="#0d79b3"><td><font color="#0d79b3" size="-1">编号</font></td><td><font color="#0d79b3" size="-1">日期</font></td><td><font color="#0d79b3" size="-1">金额(元)</font></td><td><font color="#0d79b3" size="-1">状态</font></td></font></tr>
<%
set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
sqlborr="select * from borrowlist where borrower = "& "'" & oabusyusername & "'" & "and (stage =0 or stage=10)"
rsborr.open sqlborr,cnborr,1,1
i=0
do while not rsborr.eof %>

<tr bordercolor="#339999">
<td><% if rsborr("stage")<>4 then %><a href=editBorr.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a><%end if%><% if rsborr("stage")=4 then %><%response.Write(rsborr("id"))%><%end if%></td>
<td><%response.Write(formatdatetime(rsborr("asktime"), 1))%></td><td><%=Formatnumber(rsborr("money"))%></td>
<%
set cnSt=opendb("finance","conn","sql")
set rsSt=server.CreateObject("adodb.recordset")
sqlSt="select * from stage where stage="&rsborr("stage")
rsSt.open sqlSt,cnSt,1,1
%>
<td>

<% 
if rsborr("stage")<>7 then 
response.Write(rsSt("txt"))
end if
if rsborr("stage")=7 then 
%>
<font  color="#6600FF">
<% response.Write(rsSt("txt"))
end if%>
</font>

</td>

</td><!--<td><% if rsborr("stage")<>7 then %><a href=editBorr.asp?id=<%response.Write(rsborr("id"))%>>查看</a><%end if%></td>--></tr>
<%
if rsborr("stage")=7 then
i=i+1
end if
rsborr.movenext
loop
%>
</table>
<% if i>0 then%><font color=red>*</font><font color="#0000FF"><%response.Write("你有"&i&"个借支申请已经通过，请及时联系财务！")%></font><%end if%>
</form>

<form  id="form4" name="form4" >
<% if (oabusyusername<>"admin") OR (uStatus="DSZ" and oabusyuserlevelCode1="BMJL" )   then %>
<input type="button" value="创建新借支单" onclick="newBorrowList()" />
<% end if %>
<!--<input type="button" value="查看还款记录" onclick="viewRefound()" />-->
<input type="button" value="查看借支记录" onclick="manageBorrowList()" />
<% if oabusyuserlevelCode="CN"   then %>
<!--<a href="easy.asp"><font color="#330099">还款处理平台</font></a>-->
<% end if %>
</form>
</div>
</font>
</body>
</html>
