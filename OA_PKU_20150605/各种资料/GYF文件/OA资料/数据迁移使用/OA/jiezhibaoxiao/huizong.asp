<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>报销单查看</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
code=oabusyuserlevelCode
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
if code="CN" then
tt=request("printid")
end if
if code<>"CN" then
tt=request("id")
end if
id=split(tt,",")
n= UBound(id)

for f=0 to n
'response.Write(id(f))
next 
%>
</head>

<body>
<div align="center">
<font size="-1">
<% if code<>"DSZ" and request("submit")<>"这些已经签字" then%>
<%

set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
i=0

	  
%>
<div align="center">
<table  width="100%"  border="1"  cellpadding="0" cellspacing="0"  bordercolor="#999999" bgcolor="D7E8F8">
<br />
<tr height="10"  bgcolor="D7E8F8" >
<td>报销人</td>
<td>部门</td>
<!--<td>项目负责人</td>-->
<td>报销时间</td>
<td>编号</td>
<td>发生日期</td>
<td>项目编号</td>
<td>摘要</td>
<td>备注</td>
<td>单据(张)</td>
<td>金额(元)</td>
<td>状态</td>
</tr>
<%
for f=0 to n
 sql="select * from reimlisttable where id="&id(f)
 rs.open sql,conn,1,1 

	  set cn=opendb("finance","conn","sql")
      set rsn=server.CreateObject("adodb.recordset")
	  sqln="select  * from reimlisttable where id="&id(f)
	  rsn.open sqln,cn,1,1
	  do while not rsn.eof
	  i=i+1
%>
<tr>
<td><%=rs("claimant")%></td>
<td><%=rs("dept")%></td>
<!--<td ><%=rs("principal")%>&nbsp;</td>-->
<td><%=rs("reimburseDate")%></td>
<td><%=rs("id")%></td>
<td><%=rsn("occurDate")%></td>
<td><%=rsn("projectId")%></td>
<td><%=rsn("summary")%></td>
<td><%=rsn("remark")%></td>
<td><%=rsn("billCount")%></td>
<td><%=rsn("money")%></td>


<td>
<%
set connTS=opendb("finance","conn","sql")
set rsTS=server.CreateObject("adodb.recordset")
sqlTS="select * from stage where stage="&rs("stage")
rsTS.open sqlTS,connTS,1,1
%>
<%=rsTS("txt")%>
</td>
</tr>
<!--<tr>
<td >金额总计</td>
<td colspan="6"><%=rsn("money")%>&nbsp;</td>
</tr>
<tr>
<td >部门批注</td>
<td colspan="6"><%=rs("deptNotes")%>&nbsp;</td>
</tr>
<tr>
<td >财务主管批注</td>
<td colspan="6"><%=rs("financialNotes")%>&nbsp;</td>
</tr>
<tr>
<td >机构负责人批注</td>
<td colspan="6"><%=rs("deptNotes")%>&nbsp;</td>
</tr>-->
<%
	  rsn.movenext
	  loop
	  
	  rs.close
next 
%>

<%
end if
%>
</table>
<br />
<br />
<br />
<br />
</div>
<% if code="CN" and request("submit")<>"这些已经签字" then %>
<script language="javascript">
if (confirm('请单击“确定”按钮开始打印，单击“取消”按钮不打印！'))
{
	window.print();
}
</script>
<%
end if
%>
<% if code="CN" and request("submit")="这些已经签字" then 
signtime=year(now())&"年"&month(now())&"月"&day(now())&"日"
'signtime=year(now())&"-"&month(now())&"-"&day(now())

          for f=0 to n
          'response.write(signtime) 'add junshi for test 20101220
          'set conn=server.CreateObject("adodb.connection")
          'path=server.MapPath("finance.mdb")
          'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
		  set conn=opendb("finance","conn","sql")
		  set rs=server.CreateObject("adodb.recordset")
          sql="select * from reimlisttable where id="&id(f)
          rs.open sql,conn,1,3
          rs("stage")=8  ''''说明 从2010-12-24开始，rs("ch") = 'Y' and stage =8才能表示一条报销单是完成
		  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		  if rs("ch")="N" then 'add by zhaoshijun at 2010-12-24 凡是 rs("ch") is NULL 的数据都是2010年之前的数据
 			rs("stage")=9		'add by zhaoshijun at 2010-12-24 凡是 rs("ch") = 'N' and stage =8  的数据都是2010-12-24之前的由于本页面没有加这三行的原因
 		  end if				'add by zhaoshijun at 2010-12-24 凡是 rs("ch") = 'N' and stage =9	的数据是由2010----2010-12-24之间 出纳通过SignaturerReim.asp确认 和 2010-12-24之后 使用 SignaturerReim.asp 和 本页面确认的
		   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		  rs("signtime")=signtime
          rs.update	 
		  set rs=nothing
		  set conn=nothing
		  next		  
%>
<script language="javascript">
   alert("赋值成功");
</script>
<%
    response.write("<script language=""javascript"">")
	response.write("window.location.href='manageReimlist.asp';")
	response.write("</script>")
end if
%>

<%if code="DSZ" then %>

<!---------------------------------------------------------------------------------------------------------------------------------->
<table  width="100%"  border="1"  cellpadding="0" cellspacing="0"  bordercolor="#999999" bgcolor="D7E8F8">
<br />
<tr height="10"  bgcolor="D7E8F8" >
<td width="50">报销人</td>
<td width="70">部门</td>
<td >项目负责人</td>
<td width="80">报销时间</td>
<td>编号</td>
<td width="80">发生日期</td>
<td>项目编号</td>
<td>摘要</td>
<td>备注</td>
<td>单据(张)</td>
<td>金额(元)</td>
<!--<td >金额总计</td>-->
<!--<td >部门批注</td>
<td >财务主管批注</td>
<td >机构负责人批注</td>-->
</tr>
<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
for f=0 to n
 sql="select * from reimlisttable where id="&id(f)
 rs.open sql,conn,1,1 
       'set cn=server.CreateObject("adodb.connection")
      'pathn=server.MapPath("finance.mdb")
      'cn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathn
	  set conn=opendb("finance","conn","sql")
      set rsn=server.CreateObject("adodb.recordset")
	  sqln="select  * from reimlisttable where id="&id(f)
	  rsn.open sqln,cn,1,1
	  do while not rsn.eof
	  i=i+1
	  
%>
<div align="center">
<tr>
<td ><%=rs("claimant")%></td>
<td ><%=rs("dept")%></td>
<td ><%=rs("principal")%>&nbsp;</td>
<td ><%=FormatDateTime(rs("reimburseDate"),2)%></td>
<td><%=rs("id")%></td>
<td><%=FormatDateTime(rsn("occurDate"),2)%></td>
<td><%=rsn("projectId")%></td>
<td><%=rsn("summary")%></td>
<td><%=rsn("remark")%></td>
<td><%=rsn("billCount")%></td>
<td><%=rsn("money")%></td>
<!--<td ><%=rsn("money")%>&nbsp;</td>-->
<!--<td ><%=rs("deptNotes")%>&nbsp;</td>
<td ><%=rs("financialNotes")%>&nbsp;</td>
<td ><%=rs("deptNotes")%>&nbsp;</td>-->
</tr>
</div>
<%
	  rsn.movenext
	  loop
	  
	  rs.close
next 
%>
</table>

<!------------------------------------------------------------------------------------------------------------------------------->
<% end if%>
</font>
</div>
</body>
</html>
