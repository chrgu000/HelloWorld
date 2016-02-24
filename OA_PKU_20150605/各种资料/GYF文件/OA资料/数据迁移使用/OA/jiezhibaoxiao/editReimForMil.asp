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
                  <td align="left"class="style7"><font size="-1">报销模块</font></td>
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
<td>编号</td>
<td>类别</td>
<td>详细说明</td>
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
 <td>日期</td><td>报销金额</td><td>单据张数</td> <td>报销部门</td>
 </tr>
<tr>
 <td><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
 <td><%=rs("MoneySum")&"元"%></td>
 <td><%=rs("BillCount")%></td>
 <td>
 <%
' response.Write("产品部："&rs("ProductDepartM")&"元&nbsp;")

 'response.Write("工程部："& rs("EngineeringDepartM")&"元&nbsp;")

' response.Write( "教育培训部："&rs("EduTrainDepartM")&"元&nbsp;")

' response.Write("业务发展部："& rs("MarketDepartM")&"元&nbsp;")

' response.Write( "综合管理部："&rs("GeneManageDepartM")&"元&nbsp;")

 'response.Write( "四川基地："&rs("sichuanJDM")&"元")
  %>
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
      <td>部门</td>
      <td>
      <%
       'response.Write("产品部："&rs("ProductDepartM")&"元&nbsp;")
       'response.Write("工程部："& rs("EngineeringDepartM")&"元&nbsp;")
       'response.Write( "教育培训部："&rs("EduTrainDepartM")&"元&nbsp;")
       'response.Write("业务发展部："& rs("MarketDepartM")&"元&nbsp;")
       'response.Write( "综合管理部："&rs("GeneManageDepartM")&"元&nbsp;")
       'response.Write( "四川基地："&rs("sichuanJDM")&"元")
       %>
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
      </tr>-->
      <tr>
      <td colspan="2">报销日期</td><td colspan="4"><%=rs("ReimDate")%></td>
      </tr>
      <tr>
      <td >发生日期</td><td >项目编号</td><td >摘要</td><td >备注</td><td >单据张数</td><td >金额</td>
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
      <td>金额（小写）</td><td colspan="5"><%=rs("moneySum")%></td>
      </tr>
      </table>
</tr>

<form action="editAgreeforMIL.asp" method="post" name="form">
<%if rs("Stage")=4 then %>
<tr>
<td>机构负责人意见</td>
<td colspan="3" align="left"><textarea name="notes" cols="60" rows="4" >&nbsp;</textarea></td>
</tr>
<%end if%>
<tr  align="center">
<td colspan="4">
<input type="hidden" name="id" value=<%=id%>>
<input type="submit" value="同意" /><input type="button" value="不同意" onclick="editnotagrformil()" />
</form>
</td>
</tr>
</table>
<%end if%>

<%if rs("Stage")=0 then%>
<table  border="1" cellpadding="1" cellspacing="0" width="100%">
 <tr bgcolor="D7E8F8" bordercolor="#339999">
 <td>日期</td><td>报销金额</td><td>单据张数</td> <td>报销部门</td>
 </tr>
<tr>
 <td><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
 <td><%=rs("MoneySum")&"元"%></td>
 <td><%=rs("BillCount")%></td>
 <td>
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
      <td colspan="2">报销日期</td><td colspan="4"><%=rs("ReimDate")%></td>
      </tr>
      <tr>
      <td >发生日期</td><td >项目编号</td><td >摘要</td><td >备注</td><td >单据张数</td><td >金额</td>
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
      <td>金额（小写）</td><td colspan="5"><%=rs("moneySum")%></td>
      </tr>
      </table>
</tr>


<tr  align="center">
<td colspan="4">
<form action="editConfirmforMIL.asp" method="post" name="form5">
<input type="hidden" name="id" value="<%=id%>" /><input type="submit" value="提交" />
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
 <td>日期</td><td>报销金额</td><td>单据张数</td> <td>报销部门</td>
 </tr>
<tr>
 <td><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
 <td><%=rs("MoneySum")&"元"%></td>
 <td><%=rs("BillCount")%></td>
 <td>
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
      <td colspan="2">报销日期</td><td colspan="4"><%=rs("ReimDate")%></td>
      </tr>
      <tr>
      <td >发生日期</td><td >项目编号</td><td >摘要</td><td >备注</td><td >单据张数</td><td >金额</td>
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
      <td>金额（小写）</td><td colspan="5"><%=rs("moneySum")%></td>
      </tr>
      <tr>
      <td>机构负责人审批</td><td colspan="5">&nbsp;<%=rs("ManagerView")%></td>
      </tr>
      </table>
</tr>


<tr  align="center">
<td colspan="4">
<form name="form1">
<input type="hidden" name="id" value=<%=id%>><% if rs("Stage")=5 then%><input type="button" value="已签字" onclick="qianziForMIL()"  /><%end if%><input type="button" value="返回"  onclick="javascript:window.history.back();" />
<% if rs("Stage")=5 then%><input type="button" value="打印"  onclick="printforMil();" /><%end if%>
</form>
</td>
</tr>
</table>
</div>
<%end if%>
<%if rs("Stage")=0 then%>
<table  border="1" cellpadding="1" cellspacing="0" width="100%">
 <tr bgcolor="D7E8F8" bordercolor="#339999">
 <td>日期</td><td>报销金额</td><td>单据张数</td> <td>报销部门</td>
 </tr>
<tr>
 <td><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
 <td><%=rs("MoneySum")&"元"%></td>
 <td><%=rs("BillCount")%></td>
 <td>
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
      <td colspan="2">报销日期</td><td colspan="4"><%=rs("ReimDate")%></td>
      </tr>
      <tr>
      <td >发生日期</td><td >项目编号</td><td >摘要</td><td >备注</td><td >单据张数</td><td >金额</td>
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
      <td>金额（小写）</td><td colspan="5"><%=rs("moneySum")%></td>
      </tr>
      </table>
</tr>
<tr  align="center">
<td colspan="4">
<form name="form0" action="editAgreeforMIL.asp" method="post"  >
<input type="hidden" name="id" value=<%=id%>><input type="submit" value="提交" /><input type="button" value="返回"  onclick="javascript:window.history.back();" />
</form>
</td>
</tr>
</table>
</div>
<%end if%>

<%if rs("Stage")=8 then%>
<table  border="1" cellpadding="1" cellspacing="0" width="100%">
 <tr bgcolor="D7E8F8" bordercolor="#339999">
 <td>日期</td><td>报销金额</td><td>单据张数</td> <td>报销部门</td>
 </tr>
<tr>
 <td><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
 <td><%=rs("MoneySum")&"元"%></td>
 <td><%=rs("BillCount")%></td>
 <td>
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
      <td colspan="2">报销日期</td><td colspan="4"><%=rs("ReimDate")%></td>
      </tr>
      <tr>
      <td >发生日期</td><td >项目编号</td><td >摘要</td><td >备注</td><td >单据张数</td><td >金额</td>
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
      <td>金额（小写）</td><td colspan="5"><%=rs("moneySum")%></td>
      </tr>
      <tr>
      <td>机构负责人审批</td><td colspan="5">&nbsp;<%=rs("ManagerView")%></td>
      </tr>
      </table>
</tr>



<tr  align="center">
<td colspan="4">
<form name="form4" action="deleteForMl.asp" method="post"  >
<input type="hidden" name="id" value=<%=id%>>
<input type="submit" value="删除" /><input type="button" value="返回"  onclick="javascript:window.history.back();" />
</form>
</td>
</tr>
</table>
</div>
<%end if%>

<%if rs("Stage")=11 then%>
<table  border="1" cellpadding="1" cellspacing="0" width="100%">
 <tr bgcolor="D7E8F8" bordercolor="#339999">
 <td>日期</td><td>报销金额</td><td>单据张数</td> <td>报销部门</td>
 </tr>
<tr>
 <td><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
 <td><%=rs("MoneySum")&"元"%></td>
 <td><%=rs("BillCount")%></td>
 <td>
<%if oabusyuserdept="产品部" then 
response.Write("产品部："&rs("ProductDepartM")&"元&nbsp;")
end if %>
<%if oabusyuserdept="工程部" then 
response.Write("工程部："& rs("EngineeringDepartM")&"元&nbsp;")
end if %>
<%if oabusyuserdept="教育培训部" then 
response.Write( "教育培训部："&rs("EduTrainDepartM")&"元&nbsp;")
end if %>
<%if oabusyuserdept="业务发展部" then 
response.Write("业务发展部："& rs("MarketDepartM")&"元&nbsp;")
end if %>
<%if oabusyuserdept="综合管理部" then 
response.Write( "综合管理部："&rs("GeneManageDepartM")&"元&nbsp;")
end if %>
<%if oabusyuserdept="四川基地" then 
response.Write( "四川基地："&rs("sichuanJDM")&"元")
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
      <td >参与部门</td>
      <td colspan="5">
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
      <tr>
      <td colspan="2">报销日期</td><td colspan="4"><%=rs("ReimDate")%></td>
      </tr>
      <tr>
      <td >发生日期</td><td >项目编号</td><td >摘要</td><td >备注</td><td >单据张数</td><td >金额</td>
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
      <td>金额（小写）</td><td colspan="5"><%=rs("moneySum")%></td>
      </tr>
      </table>
</tr>


<form action="editAgreeforMIL.asp" method="post" name="formM">
<tr>
<td>部门负责人意见</td>
<td colspan="3" align="left"><input type="hidden" name="id" value=<%=id%>><textarea name="notes" cols="60" rows="4" >&nbsp;&nbsp;</textarea></td>
</tr>
<tr  align="center">
<td colspan="4">
<input type="submit" value="同意" /><input type="button" value="返回"  onclick="javascript:window.history.back();" />
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
