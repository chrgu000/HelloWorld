<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>查看报销单</title>
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
Id=request("id")
Bmoney=request("Bmoney")

%>

</head>

<body>
<div align="center" >
<form action="printreim.asp" method="post">
<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable where id="&Id
rs.open sql,conn,1,1
%>
<div align="center"><font size="+2"> 费用报销单</font></div>
<%response.Write(Id)%>
<table width="614" height="316" border="1"  cellpadding="0" cellspacing="0">
<tr>
<td height="39" >报销人</td>
<td><%=rs("claimant")%></td><td>部门</td><td><%=getdept(rs("claimantdeptcode"))%></td><td>项目负责人</td><td colspan="2"><%=getprojectprin(rs("projectId"))%></td>
</tr>
<tr>
<td height="35" colspan="2">报销日期</td>
<td colspan="5"><%response.Write(formatdatetime(rs("reimburseDate"), 1))%></td>
</tr>
<tr>
<td height="26" >发生日期</td>
<td >项目编号</td><td >摘要</td><td colspan="2">备注</td><td >单据张数</td><td >金额</td>
</tr>
<tr><td height="33"  ><%response.Write(formatdatetime(rs("occurDate"), 1))%></td><td ><%=rs("projectId")%></td><td ><%=rs("summary")&"&nbsp;"%></td><td colspan="2"><%=rs("remark")&"&nbsp;"%></td><td ><%=rs("billCount")%></td><td ><%=rs("money")%></td></tr>
<tr>
<td height="37" colspan="5">合计</td>
<td ><%=rs("billCount")%></td><td ><%=rs("money")%></td>
</tr>
<tr>
<td height="33" colspan="2">金额（大写）</td>
<td colspan="5"><%=Bmoney%></td>
</tr>
<tr>
<td>审批</td>
<td colspan="6"><%
if rs("notes")<>"" then
notenew=replace(rs("notes"),"####","<br>")
response.Write(notenew)
else 
response.Write("&nbsp;&nbsp;")
end if
%></td>
</tr>
<tr>
<td height="51" colspan="7" align="justify">&nbsp; &nbsp;领款人：&nbsp;&nbsp; &nbsp; 领款日期： &nbsp; &nbsp;年  &nbsp;月  &nbsp;日</td>
</tr>
</table>
<input type="hidden" name="id" value="<%=Id%>" /><input type="hidden" name="Bmoney" value="<%=Bmoney%>" />
<input type="submit" value="确认打印" />
 </form>
</div>
</body>
</html>