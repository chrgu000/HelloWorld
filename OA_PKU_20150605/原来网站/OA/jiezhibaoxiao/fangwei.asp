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
code=oabusyuserlevelCode
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
function sqlstr(data)
sqlstr="'" & replace(data,"'","''") & "'"
end function
'signtime=request("signtime")
'
'timeT=year(signtime)&"年"&month(signtime)&"月"&day(signtime)&"日"
'
'if request("subm")="应用" then
'signtime=trim(request("signtime"))
'gid=request("gid")
' if signtime<>"" then
'set conn=opendb("finance.mdb","conn","accessdsn")
'sql="update reimlisttable set "
'sql=sql & "signtime='" &timeT& "' where id=" & gid
'conn.Execute sql
' end if
'
'end if

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改2010年1月份已签字的报销单</title>
</head>

<body>
<div align="center">
<table border="1" cellpadding="1" cellspacing="1" bgcolor="D7E8F8" width="95%">
<tr  bgcolor="D7E8F8" bordercolor="#339999">
<td><font color="#334d66" size="-1">序号</font></td>
<td><font color="#334d66" size="-1">填写报销单日期</font></td>
<td><font color="#334d66" size="-1">项目编号</font></td>
<td><font color="#334d66" size="-1">报销账号</font></td>
<td><font color="#334d66" size="-1">摘要</font></td>
<td width="20%"><font color="#334d66" size="-1">备注</font></td>
<td><font color="#334d66" size="-1">金额</td>
<td><font color="#334d66" size="-1">申请人</font></td>
<td><font color="#334d66" size="-1">部门</font></td>
<td><font color="#334d66" size="-1">状态</font></td>
<td><font color="#334d66" size="-1">签字时间</font></td>
</tr>
<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable where stage>=5 and stage<=8 and reimburseDate between '2010-1-1' and '2010-3-31' order by  signtime desc, reimburseDate desc"
%>
<%
rs.open sql,conn,1,1
do while not rs.eof and not rs.bof 
%>
<form  name="form" action="fangwei2.asp" method="post">
<tr>
<td ><font color="#334d66" size="-1"><%=rs("id")%></font></td>
<td><font color="#334d66" size="-1"><%=rs("reimburseDate")%></font></td>
<td><font color="#334d66" size="-1"><%=rs("projectId")%></font></td>
<td><font color="#334d66" size="-1"><%=rs("givecount")%></font></td>
<td><font color="#334d66" size="-1"><%=rs("summary")%></font></td>
<td><font color="#334d66" size="-1"><%=rs("remark")%></font></td>
<td><font color="#334d66" size="-1"><%=rs("money")%></font></td>
<td><font color="#334d66" size="-1"><%=rs("claimant")%></font></td>
<td><font color="#334d66" size="-1"><%=rs("projectDept")%></font></td>
<td>
<%
set cnSt=opendb("finance","conn","sql")
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rs("stage")
rsSt.open sqlS,cnSt,1,1
if not rsSt.eof and not rsSt.bof then
%>
<font color="#334d66" size="-1"><%response.Write(rsSt("txt"))%></font>
<% 
end if
set rsSt=nothing
set cnSt=nothing
%>
</td>
<td>
<input type="text" name="signtime"  size="10" value="<%=rs("signtime")%>"/><input type="hidden" name="gid"  value="<%=rs("id")%>"/><input type="submit" name="subm" value="应用"></td>
</tr>

</form>
<%
rs.movenext
loop
set rs=nothing
set conn=nothing
%>
</table>
</div>
<center><input type="button" value="修改完毕" onclick="javascript:window.close();" /></center>
</body>
</html>