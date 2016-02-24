<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
Id=request("id")
'response.Write(Id)
%>

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
<script language="javascript">
function editChangeReim()  
{
    
	window.open('editChangeReim.asp?remark='+ document.form.remark.value+"&money="+document.form.money.value+"&billCount="+document.form.billCount.value+"&id="+document.form.td.value+"&bid="+document.form.Id.value,"_self");
}
</script>

<script language="javascript">
function editdelete()
{
    
	window.open('editDeleteReim.asp?id='+ document.form.Id.value,"_self");
}
</script>
<script language="javascript">
function editSubmit()
{
    
	window.open('editSubmitReim.asp?id='+document.form.Id.value+"&money="+document.form.money.value+"&remark="+document.form.remark.value+"&billCount="+document.form.billCount.value+"&type="+document.form.type.value,"_self");
}
</script> 
<script language="javascript">
function editAgreeP()
{
    
	window.open('editAgreeReim.asp?id='+ document.form.Id.value,"_self");
}
</script>
<script language="javascript">
function editAgree()
{
    
	window.open('editAgreeReim.asp?id='+ document.form.Id.value+"&notes="+document.form.notes.value+"&type="+document.form.type.value,"_self");
}
</script>
<script language="javascript">
function editNotAgreeP()
{
    
	window.open('editNotAgreeReim.asp?id='+ document.form.Id.value,"_self");
}
</script>
<script language="javascript">
function editNotAgree()
{
    
	window.open('editNotAgreeReim.asp?id='+ document.form.Id.value+"&notes="+document.form.notes.value,"_self");
}
</script>
<script language="javascript">
function SignatureReim()
{
    
	window.open('SignatureReim.asp?id='+ document.form.Id.value,"_self");
}
</script>
  <SCRIPT   LANGUAGE="JavaScript">   
  <!--   
  function   addline()
  {   
        var   newRow   =   TB.insertRow();   
        var   newCell;
 
        for(var   i=0;   i<9;   i++)   
		{   
              newCell   =   newRow.insertCell(i);   
              newCell.innerHTML="<%response.Write("<input type=text name=content size=11 />")%>";  
			  if (i>6)
			  {
			    newCell.innerHTML=""; 
			  } 
        }   
  }    
  function   delline()  
  {   
        TB.deleteRow();   
  }   
  //-->   
  </SCRIPT>
<body>
<font size="-1">
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
<%
'set conn=server.CreateObject("adodb.connection")
'DBPath1=server.mappath("finance.mdb")
'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
sql= "select * from reimbursementlist where id= "&Id
rs.open sql,conn,1,1
if not rs.eof then
%>
<form name="form" >

<table  width="100%" border="1"  cellpadding="0" cellspacing="0" bgcolor="D7E8F8"  bordercolor="#999999">
<tr height="10"  bgcolor="D7E8F8" >
<%
'set conn2=server.CreateObject("adodb.connection")
'DBPath1=server.mappath("../db/lmtof.mdb")
'conn2.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set conn2=opendb("lmtof","conn","sql")
set rs2=server.createobject("adodb.recordset")
 sql2= "select * from userinf where userdept="&"'"&rs("dept")&"'"&"and  levelCode='BMJL'"
rs2.open sql2,conn2,1,1
if not rs2.eof then
%>
<input type="hidden" name="Id" value="<%response.Write(request("id"))%>"> <input type="hidden" name="type" value="<%response.Write(rs("type"))%>">
<td width="65">报销人</td><td width="202">
<input type="hidden" name="borrower" value="<%=rs("claimant")%>"><% response.Write(rs("claimant")) %></td>
<td width="26">部门</td>
<td width="233">
<input type="hidden" name="userdept" value="<%=rs("principaldept")%>" /><% response.Write(rs("principaldept")) %>
<%
end if
%></td>
<td colspan="3">项目负责人</td>
<td width="216">
<input type="hidden" name="leader" value="<%=rs("principal")%>" />
<% response.Write(rs("principal")) %>
</td>
</tr>
<tr height="10"  bgcolor="D7E8F8" >
<td colspan="2">报销日期</td>
<td colspan="2"><input type="hidden" name="reimburseDate" value="<%response.Write(formatdatetime(rs("reimburseDate"), 1))%>" /><% response.Write(rs("reimburseDate")) %></td>
</tr>
<tr  bgcolor="D7E8F8" bordercolor="#339999">
<table width="100%" id="TB" width="100%" border="1" cellpadding="0" cellspacing="0" bgcolor="D7E8F8" >
<tr  bgcolor="D7E8F8" >
<td>发生日期</td><td>项目编号</td><td>摘要</td><td>备注</td><td>单据张数</td><td>金额(元)</td></tr>
<%
'set connItem=server.CreateObject("adodb.connection")
'pathItem=server.mappath("finance.mdb")
'connItem.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathItem
set connItem=opendb("finance","conn","sql")
set rsItem=server.CreateObject("adodb.recordset")
sqlItem="select * from reimburseItem where Itemid="&Id
rsItem.open sqlItem,connItem,1,1
do  until rsItem.eof  
%>
<tr>
<%if  (rs("stage")<>8 and rs("stage")<>0) or (( rs("stage")=8 or rs("stage")=0 ) and rs("reimburseDate") < CDate("2009-9-7"))then %> 
<td><%response.Write(rsItem("occurDate"))%></td>
<td><%=rsItem("projectId")%></td>
<td><%=rsItem("summary")%></td>
<td><%=rsItem("remark")%><%response.Write("&nbsp;")%></td>
<td><%=rsItem("billCount")%></td>
<td><%=rsItem("money")%></td>
<%end if%>

<%if ( rs("stage")=8 or rs("stage")=0 ) and rs("reimburseDate") > CDate("2009-9-7")   then %>
<td><%response.Write(formatdatetime(rsItem("occurDate"), 1))%></td>
<td><%=rsItem("projectId")%></td>
<td><%=rsItem("summary")%></td>

<td><input type=text name="remark" value="<%=rsItem("remark")%>"></td>
<td><input type=text name="billCount" value="<%=rsItem("billCount")%>"></td>
<td><input type=text name="money" value="<%=rsItem("money")%>"></td>
<input type=hidden name="td" value="<%=rsItem("id")%>">
<%end if%>
</tr>
<%
rsItem.movenext
loop

%>
</table>
</tr>
<!----------------------------------------------------------------------------------------------------->
<tr>
<table width="100%"  width="100%" border="1" cellpadding="0" cellspacing="0" bgcolor="D7E8F8" bordercolor="#999999" >
<tr>
<td>金额(元)</td><td colspan="7" align="center"><input type="hidden" name="moneySum" value="<%=rs("moneySum")%>" /><% response.Write(rs("moneySum"))%>元</td>
</tr>
<tr>
<% if oabusyuserlevelCode="BMJL" and rs("stage")>0 and rs("stage")<6 or rs("stage")>8 then %>
<td>批注</td><td colspan="7"><textarea cols="60" maxize=80 name="notes"></textarea></td>
</tr>
<%end if%>
<tr>
<% if  oabusyuserlevelCode="CWZG" and rs("stage")<>6 and rs("stage")>0 then %>
<td>批注</td><td colspan="7"><textarea cols="60" maxize=80 name="notes"></textarea></td>
</tr>
<%end if%>
<tr>
<% if  oabusyuserlevelCode="DSZ" then %>
<td>批注</td><td colspan="7"><textarea cols="60" maxize=80 name="notes"></textarea></td>
</tr>
<%end if%>
<tr>
<% if rs("stage")=7 or rs("stage")=6 or rs("stage")=8 then%>
<td>部门批注</td><td colspan="7"><%=rs("deptNotes")&"&nbsp;"%></td>
</tr>
<tr>
<td>财务批注</td><td colspan="7"><%=rs("financialNotes")&"&nbsp;"%></td>
</tr>
<tr>
<td>机构负责人批注</td><td colspan="7"><%=rs("gManagerNotes")&"&nbsp;"%></td>
</tr>
<% end if%>
<tr >
</tr>
</table>
<div align="center">
<input type="button" value="返回" onclick="javascript:window.history.back();"/>
<% if rs("claimant")=oabusyusername and (rs("stage")=8 or rs("stage")=0) then %>
<!--<input type="button" value="修改" onclick="editChangeReim()" />-->
<input type="button" value="提交" onclick="editSubmit()" /><input type="button" value="修改" onclick="editChangeReim()" />
<input type="button" value="删除" onclick="editdelete()" />
<!--<input   type="button"   name="delLine"   value="删除一行"   onclick="delline()">
<input   type="button"   name="addLine"   value="增加一行"   onclick="addline()">-->
<% end if%>
<% if (rs("claimant")<>oabusyusername and (rs("stage")<5 or rs("stage")>8) and rs("stage")>0)  or (rs("claimant")=oabusyusername and oabusyusername=rs2("username") and rs("stage")>0 and rs("stage")<>8)  then %>
<%'if rs("principaldept")="综合管理部" and oabusyuserdept="综合管理部" then%>
<!--<input  type="button" value="同意" onclick="editAgreeP()"  />-->
<%'end if%>
<%'if (rs("principaldept")<>"综合管理部") or (rs("principaldept")="综合管理部" and oabusyuserdept<>"综合管理部") then%>
<input  type="button" value="同意" onclick="editAgree()"  />

<%'if (rs("principaldept")<>"综合管理部")  or (rs("principaldept")="综合管理部" and oabusyuserdept<>"综合管理部")  then%>
<input type="button" value="不同意" onclick="editNotAgree()" />

<%'if rs("principaldept")="综合管理部" and oabusyuserdept="综合管理部" then%>
<!--<input type="button" value="不同意" onclick="editNotAgreeP()" />-->

<%end if%>
<%if rs("stage")=5 then %>
<input type="button" value="已签字" onclick="SignatureReim()" />
 <!--<br /><br /><br /><br />
<input type="button" value="删除" onclick="editdelete()" />-->
<%end if%>
</div>
</tr>
<%
rs.movenext
end if
%>
</table>
</tr>
</table>
</form>

</div>
</font>
</body>
</html>