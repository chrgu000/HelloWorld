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
response.Write(Id)
%>

</head>

<body>
<div align="center" >


<!--<table>
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td>编号</td>
<td>类别</td>
<td>详细说明</td>
</tr>
<%
'set connCT=server.CreateObject("adodb.connection")
'pathCT=server.MapPath("CostType.mdb")
'connCT.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathCT
set connCT=opendb("CostType","conn","sql")
set rsCT=server.CreateObject("adodb.recordset")
sqlCT="select * from costtype "
rsCT.open sqlCT,connCT,1,1
%>
<%do  while not rsCT.eof  %>
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><%=rsCT("id")%></td>
<td><%=rsCT("type")%></td>
<td><%=rsCT("content")%></td>
</tr>
<%
rsCT.movenext
loop
set rsCT=nothing
%>
</table>-->


<form  method="post">
<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from ReimMilti where id="&Id
rs.open sql,conn,1,1
%>
<%
'set connItem=server.CreateObject("adodb.connection")
'pathItem=server.MapPath("finance.mdb")
'connItem.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathItem
set connItem=opendb("finance","conn","sql")
set rsItem=server.CreateObject("adodb.recordset")
sqlItem="select * from ItemForMilti where Itemid="&Id
rsItem.open sqlItem,connItem,1,1
%>
<div align="center"><font size="+2"> 费用报销单</font></div>
<table width="555" height="421"  border="1"  cellpadding="0" cellspacing="0">
<tr>
<td >报销人</td>
<td><%=rs("Reimfinance")%></td>
<td>部门</td><td colspan="3">
<%if rs("ProductDepartM")>0 then 
 response.Write("产品部："&rs("ProductDepartM")&"元&nbsp;")
 end if %>
 <%if rs("EngineeringDepartM")>0 then 
 response.Write("工程部："& rs("EngineeringDepartM")&"元&nbsp;")
 end if %>
 <%if rs("EduTrainDepartM")>0 then 
 response.Write( "教育培训部："&rs("EduTrainDepartM")&"元&nbsp;")
 end if %>
 <%if rs("MarketDepartM")>0 then 
 response.Write("业务发展部："& rs("MarketDepartM")&"元&nbsp;")
 end if %>
 <%if rs("GeneManageDepartM")>0 then 
 response.Write( "综合管理部："&rs("GeneManageDepartM")&"元&nbsp;")
 end if %>
 <%if rs("sichuanJDM")>0 then 
 response.Write( "四川基地："&rs("sichuanJDM")&"元")
 end if %>
 <%if rs("YanFDepartM")>0 then 
 response.Write( "研发部："&rs("YanFDepartM")&"元")
 end if %>
 <%if rs("SDepartM")>0 then 
 response.Write( "时空信息技术培训部："&rs("SDepartM")&"元")
 end if %>
</td>
</tr>
<tr>
<td colspan="2">报销日期</td><td colspan="4"><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
</tr>
<tr>
<td >发生日期</td><td >项目编号</td><td >摘要</td><td >备注</td><td >单据张数</td><td >金额</td>
</tr>
<% do while not rsItem.eof %>
<tr><td ><%response.Write(formatdatetime(rsItem("occurDate"), 1))%></td><td align="left"><%=rsItem("projectId")%></td>
<%
'set connC=server.CreateObject("adodb.connection")
'pathC=server.MapPath("CostType.mdb")
'connC.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathC
set connC=opendb("CostType","conn","sql")
set rsC=server.CreateObject("adodb.recordset")
sqlC="select * from costtype where type like "&"'"&rsItem("summary")&"'"
rsC.open sqlC,connC,1,1
%>
<td align="center"><%=rsC("type")%></td>

<td ><%=rsItem("remark")&"&nbsp;"%></td><td ><%=rsItem("billCount")&"张"%></td><td ><%=rsItem("money")&"元"%></td></tr>
<% 
rsItem.movenext
loop
%>
<tr>
<td colspan="4">合计</td><td ><%=rs("BillCount")&"张"%></td><td ><%=rs("MoneySum")&"元"%></td>
</tr>
<tr>
<td colspan="2">金额（大写）</td><td colspan="4"><%=Bmoney%></td>
</tr>
<tr>
<td rowspan="1" colspan="2">审批(机构负责人)</td><td colspan="4">
<%if rs("ManagerAgrTime")<>"" then
response.Write("已签字")
end if
%></td>
</tr>
<tr>
<td colspan="6" align="justify"> 报销人： &nbsp; &nbsp; 出纳： &nbsp; &nbsp;领款人：&nbsp;&nbsp; &nbsp; 领款日期： &nbsp; &nbsp;年  &nbsp;月  &nbsp;日</td>
</tr>
</table>
 </form>
</div>
</body>
<script language="javascript">
if (confirm('请单击“确定”按钮开始打印，单击“取消”按钮不打印！'))
{
	window.print();
}
</script>
</html>
