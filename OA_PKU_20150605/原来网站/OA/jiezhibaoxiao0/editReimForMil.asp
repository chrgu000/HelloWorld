<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>�账��Ĵ��������鿴</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")
%>
</head>
<script language="javascript" >
function editnotagrformilM()
{
window.open('editNotAgreeReimforMIL.asp?id='+ document.formM.id.value+"&notes="+document.formM.notes.value,"_self");
}
</script>
<script language="javascript" >
function editnotagrformil()
{
window.open('editNotAgreeReimforMIL.asp?id='+ document.form.id.value+"&notes="+document.form.notes.value,"_self");
}
</script>
<script language="javascript" >
function qianziForMIL()
{
window.open('qianziForMIL.asp?id='+ document.form1.id.value,"_self");
}
</script>
<script language="javascript" >
function printforMil()
{
window.open('printforMil.asp?id='+ document.form1.id.value,"_blank");
}
</script>
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
                  <td align="left"class="style7"><font size="-1">����ģ��</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>

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
'set rsCT=server.CreateObject("adodb.recordset")
'sqlCT="select * from costtype "
'rsCT.open sqlCT,connCT,1,1
%>
<%'do  while not rsCT.eof  %>
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><%'=rsCT("id")%></td>
<td><%'=rsCT("type")%></td>
<td><%'=rsCT("content")%></td>
</tr>
<%
'rsCT.movenext
'loop
'set rsCT=nothing
%>
</table>-->


<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from ReimMilti where id="&id
rs.open sql,conn,1,1
if not rs.eof then
if rs("Stage")=4 or rs("Stage")=3 then
%>
<table  border="1" cellpadding="1" cellspacing="0" width="100%">
 <tr bgcolor="D7E8F8" bordercolor="#339999">
 <td>����</td><td>�������</td><td>��������</td> <td>��������</td>
 </tr>
<tr>
 <td><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
 <td><%=rs("MoneySum")&"Ԫ"%></td>
 <td><%=rs("BillCount")%></td>
 <td>
 <%
' response.Write("��Ʒ����"&rs("ProductDepartM")&"Ԫ&nbsp;")

 'response.Write("���̲���"& rs("EngineeringDepartM")&"Ԫ&nbsp;")

' response.Write( "������ѵ����"&rs("EduTrainDepartM")&"Ԫ&nbsp;")

' response.Write("ҵ��չ����"& rs("MarketDepartM")&"Ԫ&nbsp;")

' response.Write( "�ۺϹ�����"&rs("GeneManageDepartM")&"Ԫ&nbsp;")

 'response.Write( "�Ĵ����أ�"&rs("sichuanJDM")&"Ԫ")
  %>
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
      sqlItem="select * from ItemForMilti where Itemid=" &Id
      rsItem.open sqlItem,connItem,1,1
      %>
      <table  width="100%" border="1" cellpadding="0"  cellspacing="0"bordercolor="#999999">
      <!--<tr>
      <td>����</td>
      <td>
      <%
       'response.Write("��Ʒ����"&rs("ProductDepartM")&"Ԫ&nbsp;")
       'response.Write("���̲���"& rs("EngineeringDepartM")&"Ԫ&nbsp;")
       'response.Write( "������ѵ����"&rs("EduTrainDepartM")&"Ԫ&nbsp;")
       'response.Write("ҵ��չ����"& rs("MarketDepartM")&"Ԫ&nbsp;")
       'response.Write( "�ۺϹ�����"&rs("GeneManageDepartM")&"Ԫ&nbsp;")
       'response.Write( "�Ĵ����أ�"&rs("sichuanJDM")&"Ԫ")
       %>
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
      </tr>-->
      <tr>
      <td colspan="2">��������</td><td colspan="4"><%=rs("ReimDate")%></td>
      </tr>
      <tr>
      <td >��������</td><td >��Ŀ���</td><td >ժҪ</td><td >��ע</td><td >��������</td><td >���</td>
      </tr>
      <% do while not rsItem.eof %>
      <tr><td ><%=rsItem("occurDate")%></td><td ><%=rsItem("projectId")%></td><td ><%=rsItem("summary")%></td><td ><%=rsItem("remark")%></td><td ><%=rsItem("billCount")%></td><td ><%=rsItem("money")%></td></tr>
      <% 
      rsItem.movenext
      loop
	  set conn=nothing
	  set connItem=nothing
      %>
      <tr>
      <td>��Сд��</td><td colspan="5"><%=rs("moneySum")%></td>
      </tr>
      </table>
</tr>

<form action="editAgreeforMIL.asp" method="post" name="form">
<%if rs("Stage")=4 then %>
<tr>
<td>�������������</td>
<td colspan="3" align="left"><textarea name="notes" cols="60" rows="4" >&nbsp;</textarea></td>
</tr>
<%end if%>
<tr  align="center">
<td colspan="4">
<input type="hidden" name="id" value=<%=id%>>
<input type="submit" value="ͬ��" /><input type="button" value="��ͬ��" onclick="editnotagrformil()" />
</form>
</td>
</tr>
</table>
<%end if%>

<%if rs("Stage")=0 then%>
<table  border="1" cellpadding="1" cellspacing="0" width="100%">
 <tr bgcolor="D7E8F8" bordercolor="#339999">
 <td>����</td><td>�������</td><td>��������</td> <td>��������</td>
 </tr>
<tr>
 <td><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
 <td><%=rs("MoneySum")&"Ԫ"%></td>
 <td><%=rs("BillCount")%></td>
 <td>
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
      sqlItem="select * from ItemForMilti where Itemid=" &Id
      rsItem.open sqlItem,connItem,1,1
      %>
      <table  width="100%" border="1" cellpadding="0"  cellspacing="0"bordercolor="#999999">

      <tr>
      <td colspan="2">��������</td><td colspan="4"><%=rs("ReimDate")%></td>
      </tr>
      <tr>
      <td >��������</td><td >��Ŀ���</td><td >ժҪ</td><td >��ע</td><td >��������</td><td >���</td>
      </tr>
      <% do while not rsItem.eof %>
      <tr><td ><%=rsItem("occurDate")%></td><td ><%=rsItem("projectId")%></td><td ><%=rsItem("summary")%></td><td ><%=rsItem("remark")%></td><td ><%=rsItem("billCount")%></td><td ><%=rsItem("money")%></td></tr>
      <% 
      rsItem.movenext
      loop
	  set conn=nothing
	  set connItem=nothing
      %>
      <tr>
      <td>��Сд��</td><td colspan="5"><%=rs("moneySum")%></td>
      </tr>
      </table>
</tr>


<tr  align="center">
<td colspan="4">
<form action="editConfirmforMIL.asp" method="post" name="form5">
<input type="hidden" name="id" value="<%=id%>" /><input type="submit" value="�ύ" />
</form>
</td>
</td>
</tr>
</table>
</div>
<%end if%>


<%if rs("Stage")=5 or rs("Stage")=6 then%>
<table  border="1" cellpadding="1" cellspacing="0" width="100%">
 <tr bgcolor="D7E8F8" bordercolor="#339999">
 <td>����</td><td>�������</td><td>��������</td> <td>��������</td>
 </tr>
<tr>
 <td><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
 <td><%=rs("MoneySum")&"Ԫ"%></td>
 <td><%=rs("BillCount")%></td>
 <td>
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
      sqlItem="select * from ItemForMilti where Itemid=" &Id
      rsItem.open sqlItem,connItem,1,1
      %>
      <table  width="100%" border="1" cellpadding="0"  cellspacing="0"bordercolor="#999999">

      <tr>
      <td colspan="2">��������</td><td colspan="4"><%=rs("ReimDate")%></td>
      </tr>
      <tr>
      <td >��������</td><td >��Ŀ���</td><td >ժҪ</td><td >��ע</td><td >��������</td><td >���</td>
      </tr>
      <% do while not rsItem.eof %>
      <tr><td ><%=rsItem("occurDate")%></td><td ><%=rsItem("projectId")%></td><td ><%=rsItem("summary")%></td><td ><%=rsItem("remark")%></td><td ><%=rsItem("billCount")%></td><td ><%=rsItem("money")%></td></tr>
      <% 
      rsItem.movenext
      loop
	  set conn=nothing
	  set connItem=nothing
      %>
      <tr>
      <td>��Сд��</td><td colspan="5"><%=rs("moneySum")%></td>
      </tr>
      <tr>
      <td>��������������</td><td colspan="5">&nbsp;<%=rs("ManagerView")%></td>
      </tr>
      </table>
</tr>


<tr  align="center">
<td colspan="4">
<form name="form1">
<input type="hidden" name="id" value=<%=id%>><% if rs("Stage")=5 then%><input type="button" value="��ǩ��" onclick="qianziForMIL()"  /><%end if%><input type="button" value="����"  onclick="javascript:window.history.back();" />
<% if rs("Stage")=5 then%><input type="button" value="��ӡ"  onclick="printforMil();" /><%end if%>
</form>
</td>
</tr>
</table>
</div>
<%end if%>
<%if rs("Stage")=0 then%>
<table  border="1" cellpadding="1" cellspacing="0" width="100%">
 <tr bgcolor="D7E8F8" bordercolor="#339999">
 <td>����</td><td>�������</td><td>��������</td> <td>��������</td>
 </tr>
<tr>
 <td><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
 <td><%=rs("MoneySum")&"Ԫ"%></td>
 <td><%=rs("BillCount")%></td>
 <td>
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
     ' connItem.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathItem
	  set connItem=opendb("finance","conn","sql")
      set rsItem=server.CreateObject("adodb.recordset")
      sqlItem="select * from ItemForMilti where Itemid=" &Id
      rsItem.open sqlItem,connItem,1,1
      %>
      <table  width="100%" border="1" cellpadding="0"  cellspacing="0"bordercolor="#999999">

      <tr>
      <td colspan="2">��������</td><td colspan="4"><%=rs("ReimDate")%></td>
      </tr>
      <tr>
      <td >��������</td><td >��Ŀ���</td><td >ժҪ</td><td >��ע</td><td >��������</td><td >���</td>
      </tr>
      <% do while not rsItem.eof %>
      <tr><td ><%=rsItem("occurDate")%></td><td ><%=rsItem("projectId")%></td><td ><%=rsItem("summary")%></td><td ><%=rsItem("remark")%></td><td ><%=rsItem("billCount")%></td><td ><%=rsItem("money")%></td></tr>
      <% 
      rsItem.movenext
      loop
	  set conn=nothing
	  set connItem=nothing
      %>
      <tr>
      <td>��Сд��</td><td colspan="5"><%=rs("moneySum")%></td>
      </tr>
      </table>
</tr>
<tr  align="center">
<td colspan="4">
<form name="form0" action="editAgreeforMIL.asp" method="post"  >
<input type="hidden" name="id" value=<%=id%>><input type="submit" value="�ύ" /><input type="button" value="����"  onclick="javascript:window.history.back();" />
</form>
</td>
</tr>
</table>
</div>
<%end if%>

<%if rs("Stage")=8 then%>
<table  border="1" cellpadding="1" cellspacing="0" width="100%">
 <tr bgcolor="D7E8F8" bordercolor="#339999">
 <td>����</td><td>�������</td><td>��������</td> <td>��������</td>
 </tr>
<tr>
 <td><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
 <td><%=rs("MoneySum")&"Ԫ"%></td>
 <td><%=rs("BillCount")%></td>
 <td>
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
      sqlItem="select * from ItemForMilti where Itemid=" &Id
      rsItem.open sqlItem,connItem,1,1
      %>
      <table  width="100%" border="1" cellpadding="0"  cellspacing="0"bordercolor="#999999">

      <tr>
      <td colspan="2">��������</td><td colspan="4"><%=rs("ReimDate")%></td>
      </tr>
      <tr>
      <td >��������</td><td >��Ŀ���</td><td >ժҪ</td><td >��ע</td><td >��������</td><td >���</td>
      </tr>
      <% do while not rsItem.eof %>
      <tr><td ><%=rsItem("occurDate")%></td><td ><%=rsItem("projectId")%></td><td ><%=rsItem("summary")%></td><td ><%=rsItem("remark")%></td><td ><%=rsItem("billCount")%></td><td ><%=rsItem("money")%></td></tr>
      <% 
      rsItem.movenext
      loop
	  set conn=nothing
	  set connItem=nothing
      %>
      <tr>
      <td>��Сд��</td><td colspan="5"><%=rs("moneySum")%></td>
      </tr>
      <tr>
      <td>��������������</td><td colspan="5">&nbsp;<%=rs("ManagerView")%></td>
      </tr>
      </table>
</tr>



<tr  align="center">
<td colspan="4">
<form name="form4" action="deleteForMl.asp" method="post"  >
<input type="hidden" name="id" value=<%=id%>>
<input type="submit" value="ɾ��" /><input type="button" value="����"  onclick="javascript:window.history.back();" />
</form>
</td>
</tr>
</table>
</div>
<%end if%>

<%if rs("Stage")=11 then%>
<table  border="1" cellpadding="1" cellspacing="0" width="100%">
 <tr bgcolor="D7E8F8" bordercolor="#339999">
 <td>����</td><td>�������</td><td>��������</td> <td>��������</td>
 </tr>
<tr>
 <td><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
 <td><%=rs("MoneySum")&"Ԫ"%></td>
 <td><%=rs("BillCount")%></td>
 <td>
<%if oabusyuserdept="��Ʒ��" then 
response.Write("��Ʒ����"&rs("ProductDepartM")&"Ԫ&nbsp;")
end if %>
<%if oabusyuserdept="���̲�" then 
response.Write("���̲���"& rs("EngineeringDepartM")&"Ԫ&nbsp;")
end if %>
<%if oabusyuserdept="������ѵ��" then 
response.Write( "������ѵ����"&rs("EduTrainDepartM")&"Ԫ&nbsp;")
end if %>
<%if oabusyuserdept="ҵ��չ��" then 
response.Write("ҵ��չ����"& rs("MarketDepartM")&"Ԫ&nbsp;")
end if %>
<%if oabusyuserdept="�ۺϹ���" then 
response.Write( "�ۺϹ�����"&rs("GeneManageDepartM")&"Ԫ&nbsp;")
end if %>
<%if oabusyuserdept="�Ĵ�����" then 
response.Write( "�Ĵ����أ�"&rs("sichuanJDM")&"Ԫ")
end if %>
 </td>
</tr>
<tr>
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
      sqlItem="select * from ItemForMilti where Itemid=" &Id
      rsItem.open sqlItem,connItem,1,1
      %>
      <table  width="100%" border="1" cellpadding="0"  cellspacing="0"bordercolor="#999999">
      <tr>
      <td >���벿��</td>
      <td colspan="5">
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
      <tr>
      <td colspan="2">��������</td><td colspan="4"><%=rs("ReimDate")%></td>
      </tr>
      <tr>
      <td >��������</td><td >��Ŀ���</td><td >ժҪ</td><td >��ע</td><td >��������</td><td >���</td>
      </tr>
      <% do while not rsItem.eof %>
      <tr><td ><%=rsItem("occurDate")%></td><td ><%=rsItem("projectId")%></td><td ><%=rsItem("summary")%></td><td ><%=rsItem("remark")%></td><td ><%=rsItem("billCount")%></td><td ><%=rsItem("money")%></td></tr>
      <% 
      rsItem.movenext
      loop
	  set conn=nothing
	  set connItem=nothing
      %>
      <tr>
      <td>��Сд��</td><td colspan="5"><%=rs("moneySum")%></td>
      </tr>
      </table>
</tr>


<form action="editAgreeforMIL.asp" method="post" name="formM">
<tr>
<td>���Ÿ��������</td>
<td colspan="3" align="left"><input type="hidden" name="id" value=<%=id%>><textarea name="notes" cols="60" rows="4" >&nbsp;&nbsp;</textarea></td>
</tr>
<tr  align="center">
<td colspan="4">
<input type="submit" value="ͬ��" /><input type="button" value="����"  onclick="javascript:window.history.back();" />
</form>
</td>
</tr>
</table>
</div>
<%end if%>


<%end if%>
</div>
</body>
</html>
