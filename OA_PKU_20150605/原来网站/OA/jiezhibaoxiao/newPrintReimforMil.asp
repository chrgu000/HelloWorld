<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>�鿴������</title>
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
<td>���</td>
<td>���</td>
<td>��ϸ˵��</td>
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
<div align="center"><font size="+2"> ���ñ�����</font></div>
<table width="555" height="421"  border="1"  cellpadding="0" cellspacing="0">
<tr>
<td >������</td>
<td><%=rs("Reimfinance")%></td>
<td>����</td><td colspan="3">
<%if rs("ProductDepartM")>0 then 
 response.Write("��Ʒ����"&rs("ProductDepartM")&"Ԫ&nbsp;")
 end if %>
 <%if rs("EngineeringDepartM")>0 then 
 response.Write("���̲���"& rs("EngineeringDepartM")&"Ԫ&nbsp;")
 end if %>
 <%if rs("EduTrainDepartM")>0 then 
 response.Write( "������ѵ����"&rs("EduTrainDepartM")&"Ԫ&nbsp;")
 end if %>
 <%if rs("MarketDepartM")>0 then 
 response.Write("ҵ��չ����"& rs("MarketDepartM")&"Ԫ&nbsp;")
 end if %>
 <%if rs("GeneManageDepartM")>0 then 
 response.Write( "�ۺϹ�����"&rs("GeneManageDepartM")&"Ԫ&nbsp;")
 end if %>
 <%if rs("sichuanJDM")>0 then 
 response.Write( "�Ĵ����أ�"&rs("sichuanJDM")&"Ԫ")
 end if %>
 <%if rs("YanFDepartM")>0 then 
 response.Write( "�з�����"&rs("YanFDepartM")&"Ԫ")
 end if %>
 <%if rs("SDepartM")>0 then 
 response.Write( "ʱ����Ϣ������ѵ����"&rs("SDepartM")&"Ԫ")
 end if %>
</td>
</tr>
<tr>
<td colspan="2">��������</td><td colspan="4"><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
</tr>
<tr>
<td >��������</td><td >��Ŀ���</td><td >ժҪ</td><td >��ע</td><td >��������</td><td >���</td>
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

<td ><%=rsItem("remark")&"&nbsp;"%></td><td ><%=rsItem("billCount")&"��"%></td><td ><%=rsItem("money")&"Ԫ"%></td></tr>
<% 
rsItem.movenext
loop
%>
<tr>
<td colspan="4">�ϼ�</td><td ><%=rs("BillCount")&"��"%></td><td ><%=rs("MoneySum")&"Ԫ"%></td>
</tr>
<tr>
<td colspan="2">����д��</td><td colspan="4"><%=Bmoney%></td>
</tr>
<tr>
<td rowspan="1" colspan="2">����(����������)</td><td colspan="4">
<%if rs("ManagerAgrTime")<>"" then
response.Write("��ǩ��")
end if
%></td>
</tr>
<tr>
<td colspan="6" align="justify"> �����ˣ� &nbsp; &nbsp; ���ɣ� &nbsp; &nbsp;����ˣ�&nbsp;&nbsp; &nbsp; ������ڣ� &nbsp; &nbsp;��  &nbsp;��  &nbsp;��</td>
</tr>
</table>
 </form>
</div>
</body>
<script language="javascript">
if (confirm('�뵥����ȷ������ť��ʼ��ӡ��������ȡ������ť����ӡ��'))
{
	window.print();
}
</script>
</html>
