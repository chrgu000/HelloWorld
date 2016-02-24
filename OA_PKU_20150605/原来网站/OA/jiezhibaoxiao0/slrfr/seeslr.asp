<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
%>
<title>无标题文档</title>
<%
function selected(req,reqvalue)
if req=reqvalue  then
selected=" selected"
else
selected=""
end if
end function
function sqlstr(data)
sqlstr="'" & replace(data,"'","''") & "'"
end function

yearN=request("year")
monthN=request("month")

if yearN="" then yearN=year(now())
if monthN="" then monthN=month(now())
dbname=yearN&"##qsc"
tbname="monthslr"&monthN
%>
</head>

<body>
<center>
<form  name="form" action="seeslr.asp" method="post">
日期
<select name="year" size="1">
<%for y=2010 to 2019%>
<option value="<%response.Write(y)%>" <%=selected(CInt(yearN),CInt(y))%>><%response.Write(y)%></option>
<%next%>
</select>
年
<select name="month" size="1">
<%for m=1 to 12%>
<option vlue="<%response.Write(m)%>" <%=selected(CInt(monthN),CInt(m))%>><%response.Write(m)%></option>
<%next%>
</select>
月
<input type="submit" name="sub"  value="查询" />
</form>
<p>
<%
set cn=opendb(dbname,"conn","accessdsn")
set r=server.createobject("adodb.recordset")
sl="select stage from  ornot where month='"&tbname&"'" 
r.open sl,cn,1,1 
if not r.bof and not r.eof then
stage=r("stage")
else
response.End()
end if
set r=nothing
set cn=nothing
set cn=opendb(dbname,"conn","accessdsn")
set r=server.createobject("adodb.recordset")
sl="select * from stage where stage="&Cint(stage)
r.open sl,cn,1,1 
if not r.bof and not r.eof then
stagetxt=r("txt")
end if
set r=nothing
set cn=nothing
%>
本月工资表状态：<%=stagetxt%>
<p>
<table cellspacing="0" cellpadding="0" border="1" bordercolor="#000000">
  <tr>
    <td>姓名</td>
    <td>部门</td>
    <td>绩效</td>
    <td>补助</td>
    <td>应发金额</td>
    <td>个人应缴保险(医保)</td>
    <td>个人应缴保险(养老)</td>
    <td>个人应缴保险(失业)</td>
    <td>考勤</td>
    <td>其他扣款</td>
    <td>个人所得税</td>
    <td>实发金额</td>
    <td>单位应缴保险</td>
    <td>基本工资</td>
    <td>说明</td>
  </tr>
<%
set conn1=opendb(dbname,"conn","accessdsn")
set rs1=server.createobject("adodb.recordset")
sql1="select  * from  ornot where month='"&tbname&"'" 
rs1.open sql1,conn1,1,1 
if not rs1.bof and not rs1.eof then
	set conn=opendb(dbname,"conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select  * from  "&tbname&" order by usdeptfw" 
	rs.open sql,conn,1,1 
	do while not rs.eof and not rs.bof
%>
<tr>
    <td><%=rs("usnamefw")%>&nbsp;</td>
    <td><%=rs("usdeptfw")%>&nbsp;</td>
    <td><%=rs("usjixiaofw")%>&nbsp;</td>
    <td><%=rs("usbuzhufw")%>&nbsp;</td>
    <td><%=rs("usyingfafw")%>&nbsp;</td>
    <td><%=rs("usyibaofw")%>&nbsp;</td>
    <td><%=rs("usylaofw")%>&nbsp;</td>
    <td><%=rs("usshiyefw")%>&nbsp;</td>
    <td><%=rs("uskaoqinfw")%>&nbsp;</td>
    <td><%=rs("usotherfw")%>&nbsp;</td>
    <td><%=rs("usgrshui")%>&nbsp;</td>
    <td><%=rs("usshifafw")%>&nbsp;</td>
    <td><%=rs("usdanweibaoxianfw")%>&nbsp;</td>
    <td><%=rs("usjibenfw")%>&nbsp;</td>
    <td><%=rs("uscontentfw")%>&nbsp;</td>
</tr>
<%
	rs.movenext
	loop
end if
%>
</table>
</center>
</body>
</html>
