<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>�ޱ����ĵ�</title>
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
id=request("id")
function selected(req,reqvalue)
if req=reqvalue then
selected=" selected"
else
selected=""
end if
end function
		   ' changed by zhaoshijun at 2010-2-24 for updating database
		   set conn=opendb("finance","conn","sql server")
		  ' changed by zhaoshijun at 2010-2-24 for updating database
          set rs=server.CreateObject("adodb.recordset")
          sql= "select * from reimlisttable_old where id= "&id
          rs.open sql,conn,1,1
          claimant=rs("claimant")'�������˵�����
		  dept=rs("dept")'�������˵Ĳ���
		  deptleader=rs("deptleader")'�������˵Ĳ��Ÿ�����
		  reimburseDate=rs("reimburseDate")'��������д��ʱ��		  
		  relclaimant=rs("relclaimant")'�����˵�����
		  stage=rs("stage")
		  deptNotes=rs("deptNotes")
		  financialNotes=rs("financialNotes")
		  gManagerNotes=rs("gManagerNotes")
		  typep=rs("type")
		  occurDate=rs("occurDate")'���鷢����ʱ��
		  projectId=rs("projectId")'��Ŀ���
		  givecount=rs("givecount")'��Ŀ�ʺ�--Ĭ��
		  projectLeader=rs("principal")'��Ŀ������
		  projectDept=rs("projectDept")'��Ŀ���������ڵĲ���----��Ŀ�Ĳ���
		  summary=rs("summary")'ժҪ������
		  remark=rs("remark")'��ע˵��
		  billCount=rs("billCount")'��Ʊ������
		  money=rs("money")'��Ʊ�ϵĽ��
		  td=rs("id")
		  set rs=nothing
		  set conn=nothing
		  
		  'changed by zhaoshijun at 2010-2-24 for updating database
		  set conn=opendb("lmtof","conn","sql server")
          set rs=server.CreateObject("adodb.recordset")
          sql= "select * from userinf where userdept="&"'"&dept&"'"&"and  (levelCode='BMJL' or levelCode1='BMJL' or levelCode2='BMJL')"
          rs.open sql,conn,1,1
		  do while not rs.eof and not rs.bof
          	'BMJLname=rs("username") '�޸�ʱ��20131219
									 '��Ϊ֮ǰ����֯�ܹ���ÿ������ֻ��һ�����ž��������ڵ���֯�ܹ��п��ܰ���������ž������Ա���BMJLname����
									 '&���ӵķ�ʽ��ÿ������Ľ�����ӵ��ַ�����
			BMJLname=rs("username")&BMJLname
		  rs.movenext
		  loop
		  set rs=nothing
		  set conn=nothing		  
		  
		  'set conn=server.CreateObject("adodb.connection")
'          path=server.MapPath("finance.mdb")
'          conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
'          set rs=server.CreateObject("adodb.recordset")
'          sql="select * from reimburseItem where Itemid="&id
'          rs.open sql,conn,1,1
'          occurDate=rs("occurDate")'���鷢����ʱ��
'		  projectId=rs("projectId")'��Ŀ���
'		  givecount=rs("givecount")'��Ŀ�ʺ�--Ĭ��
'		  projectLeader=rs("projectLeader")'��Ŀ������
'		  projectDept=rs("projectDept")'��Ŀ���������ڵĲ���----��Ŀ�Ĳ���
'		  summary=rs("summary")'ժҪ������
'		  remark=rs("remark")'��ע˵��
'		  billCount=rs("billCount")'��Ʊ������
'		  money=rs("money")'��Ʊ�ϵĽ��
'		  td=rs("id")
'		  set rs=nothing
'		  set conn=nothing
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
    
	window.open('editChangeReim.asp?remark='+ document.form.remark.value+"&money="+document.form.money.value+"&billCount="+document.form.billCount.value+"&id="+document.form.td.value+"&bid="+document.form.Id.value+"&summary="+document.form.summary.value,"_self");
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
    
	window.open('editSubmitReim.asp?id='+document.form.Id.value+"&money="+document.form.money.value+"&remark="+document.form.remark.value+"&billCount="+document.form.billCount.value+"&type="+document.form.type.value+"&summary="+document.form.summary.value,"_self");
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
<script language="javascript">
function balance_borr()
{
    
	window.open('balance_borr.asp?id='+ document.form.Id.value,"_self");
}
</script>
<script language="javascript">
function BackReim()
{
    
	window.open('BackReim.asp?id='+ document.form.Id.value,"_self");
}
</script>
<script language="javascript">
function Givecount()
{
    
	window.open('givecount.asp?id='+ document.form.Id.value+"&givecount="+document.form.givecount.value,"_self");
}
</script>
<script language="javascript">
function editgivecount()
{
    
	window.open('editgivecount.asp?id='+ document.form.Id.value,"_self");
}
</script>  
<script language="javascript">
function editnotgivecount()
{
    
	window.open('editnotgivecount.asp?id='+ document.form.Id.value,"_self");
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
                  <td align="left"class="style7"><font size="-1">����ģ��</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<form name="form" >
<input type="hidden" name="Id" value="<%response.Write(request("id"))%>"> <input type="hidden" name="type" value="<%=typep%>">
<table  width="100%" border="1"  cellpadding="0" cellspacing="0" bgcolor="D7E8F8"  bordercolor="#999999">
<tr height="10"  bgcolor="D7E8F8" >
<td width="80"><font color="#0d79b3" size="-1">��������</font></td>
<td ><font color="#0d79b3" size="-1">
<%=claimant%>
</font></td>
<td><font color="#0d79b3" size="-1">��д����</font></td>
<td colspan="3"><font color="#0d79b3" size="-1">
<%=reimburseDate %>
</font></td>
</tr>
<tr height="10"  bgcolor="D7E8F8" >
<td width="80"><font color="#0d79b3" size="-1">������</font></td>
<td ><font color="#0d79b3" size="-1">
<input type="hidden" name="relclaimant" value="<%=relclaimant%>">
<%=relclaimant%>
</font></td>
<td><font color="#0d79b3" size="-1">��������</font></td>
<td><font color="#0d79b3" size="-1">
<%if (reimburseDate < CDate("2009-9-7"))then%> 
<%=reimburseDate%>
<%end if%>
<%if (reimburseDate > CDate("2009-9-7"))then%> 
<%=occurDate%>
<%end if%>
</font></td>
<td><font color="#0d79b3" size="-1">��Ŀ������</font></td>
<td><font color="#0d79b3" size="-1"><%=projectLeader%></font></td>
</tr>
<tr height="10"  bgcolor="D7E8F8" >
<td width="80"><font color="#0d79b3" size="-1">��Ŀ���</font></td>
<td colspan="5"><font color="#0d79b3" size="-1">
<%=projectId%>
</font></td> 
</tr>
<tr>
<td><font color="#0d79b3" size="-1">ժҪ</font></td>
<td><font color="#0d79b3" size="-1">
<%if (stage<>10 and stage<>0) or (( stage=10 or stage=0 ) and reimburseDate < CDate("2009-9-7"))then%> 
<%=summary%>
<%end if%>
<%if ( stage=10 or stage=0 ) and reimburseDate > CDate("2009-9-7") then %>
<select name="summary">
		 <%

		set conn=opendb("CostType","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from costtype  "
          rs.open sql,conn,1,1
		  
		  %>
		    <%do  while not rs.eof  %>
			     <option value=<%=rs("content")%> <%=selected(rs("content"),summary)%>><%=rs("id")%><%=rs("content")%></option>
			<%
		     rs.movenext'������Ҫ���� summary���ĸ�ֵ
		     loop
		     set rs=nothing
			 set conn=nothing
		    %>
	   </select>
<%end if%>
</font></td>
<td><font color="#0d79b3" size="-1">��Ʊ����</font></td>
<td><font color="#0d79b3" size="-1">
<%if (stage<>10 and stage<>0) or (( stage=10 or stage=0 ) and reimburseDate < CDate("2009-9-7"))then%> 
<%=billCount%>
<%end if%>
<%if ( stage=10 or stage=0 ) and reimburseDate > CDate("2009-9-7") then %>
<input type=text name="billCount" value="<%=billCount%>">
<%end if%>
</font></td>
<td><font color="#0d79b3" size="-1">��Ʊ���</font></td>
<td><font color="#0d79b3" size="-1">
<%if (stage<>10 and stage<>0) or (( stage=10 or stage=0 ) and reimburseDate < CDate("2009-9-7"))then%>
<%=money%>
<%end if%>
<%if ( stage=10 or stage=0 ) and reimburseDate > CDate("2009-9-7") then %>
<input type=text name="money" value="<%=money%>">
<%end if%>
</font></td>
</tr>
<tr>
<td><font color="#0d79b3" size="-1">��ע</font></td>
<td colspan="5"><font color="#0d79b3" size="-1">
<%if (stage<>10 and stage<>0) or (( stage=10 or stage=0 ) and reimburseDate < CDate("2009-9-7"))then%> 
<%=remark%>&nbsp;
<%end if%>
<%if ( stage=10 or stage=0 ) and reimburseDate > CDate("2009-9-7") then %>
<textarea name="remark" cols=120 rows="4"  ><%=remark%></textarea>
<%end if%>
</font></td>
</tr>
<tr>
<td><font color="#0d79b3" size="-1">�����ʺ�</font></td>
<td colspan="5"><font color="#0d79b3" size="-1">
<%if oabusyuserlevelCode="CW" then %>
<select name="givecount">
		 <%

		  set conn=opendb("GFProjectType","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select  financeCount,projectName from projectType_old order by financeCount"
          rs.open sql,conn,1,1
		  
		  %>
		    <%do  while not rs.eof  %>
			     <option value=<%=rs("financeCount")%> <%=selected(rs("financeCount"),givecount)%>><%=rs("financeCount")&"|"%><%=rs("projectName")%></option>
			<%
		     rs.movenext'������Ҫ���� summary���ĸ�ֵ
		     loop
		     set rs=nothing
			 set conn=nothing
		    %>
	   </select>
<%end if%>
<%if oabusyuserlevelCode="CWZG" or oabusyuserlevelCode="DSZ" or oabusyuserlevelCode="CN"  then

		  set conn=opendb("GFProjectType","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select  financeCount,projectName from projectType_old where projectId='"&projectId&"'"
          rs.open sql,conn,1,1
		  if not rs.eof and not rs.bof then
		  projectName=rs("projectName")
		  end if
		  set rs=nothing
		  set conn=nothing
        response.Write(givecount)
end if
%>
</font></td>
</tr>
<tr>
<% if oabusyuserlevelCode="BMJL" and (stage>0 and stage<8) or stage>10 then %>
<td>��ע</td><td colspan="5"><textarea cols="60" maxize=80 name="notes"></textarea></td>
</tr>
<%end if%>
<tr>
<% if  oabusyuserlevelCode="CWZG" and stage<>8 and stage>0 then %>
<td>��ע</td><td colspan="5"><textarea cols="60" maxize=80 name="notes"></textarea></td>
</tr>
<%end if%>
<tr>
<% if  oabusyuserlevelCode="DSZ" AND stage>0 and stage<>10 then %>
<td>��ע</td><td colspan="5"><textarea cols="60" maxize=80 name="notes"></textarea></td>
</tr>
<%end if%>
<tr>

<!--<td><font color="#0d79b3" size="-1">���ž�����ע</font></td><td colspan="5"><font color="#0d79b3" size="-1"><%=deptNotes&"&nbsp;"%></font></td>
</tr>
<tr>
<td><font color="#0d79b3" size="-1">����������ע</font></td><td colspan="5"><font color="#0d79b3" size="-1"><%=financialNotes&"&nbsp;"%></font></td>
</tr>
<tr>
<td><font color="#0d79b3" size="-1">�ܾ�����ע</font></td><td colspan="5"><font color="#0d79b3" size="-1"><%=gManagerNotes&"&nbsp;"%></font></td>-->

<% if deptNotes<>"" then%>
<tr>
<td>���ž�����ע</td><td colspan="5"><%=deptNotes&"&nbsp;"%></td>
</tr>
<%end if%>
<% if financialNotes<>"" then%>
<tr>
<td>����������ע</td><td colspan="5"><%=financialNotes&"&nbsp;"%></td>
</tr>
<%end if%>
<% if gManagerNotes<>"" then%>
<tr>
<td>�ܾ�����ע</td><td colspan="5"><%=gManagerNotes&"&nbsp;"%></td>
</tr>
<%end if%>
<tr>
<td colspan="6">
<input type=hidden name="td" value="<%=td%>">
<div align="center">
<input type="button" value="����" onclick="javascript:window.history.back();"/>
<% if claimant=oabusyusername and (stage=10 or stage=0) then %>
<input type="button" value="�ύ" onclick="editSubmit()" /><input type="button" value="�޸�" onclick="editChangeReim()" />
<input type="button" value="ɾ��" onclick="editdelete()" />
<% end if%>
<% 'if ((claimant<>oabusyname and (stage<7 or stage>10) and stage>0 and stage<>6)  or (claimant=oabusyname and oabusyname=BMJLname and (stage>0 and stage<4) or stage>10) or ((oabusyuserlevelCode="DSZ" or oabusyuserlevelCode="CWZG" ) AND claimant=oabusyname and stage>0 and stage<>10)) and oabusyuserlevelCode<>"CW" then '----�޸����һ�����Ű���������ž������� ���ݳ��� �����Ϊ�޸ĺ����%>
<!--�޸���2013��12��19�� ��Ϊ�µ���֯�ṹ�п��ܰ��������Ŀ��������BMJLname�п��ܰ���������ƣ�����instr�������Ƚϵ�ǰ�û����Ƿ��ǲ��ž���-->
<% 
if ((claimant<>oabusyname and (stage<7 or stage>10) and stage>0 and stage<>6)  or (claimant=oabusyname and instr(BMJLname,oabusyname)>0 and (stage>0 and stage<4) or stage>10) or ((oabusyuserlevelCode="DSZ" or oabusyuserlevelCode="CWZG" ) AND claimant=oabusyname and stage>0 and stage<>10)) and oabusyuserlevelCode<>"CW" then %>
<input  type="button" value="ͬ��" onclick="editAgree()"  />
<input type="button" value="��ͬ��" onclick="editNotAgree()" />
<%end if%>
<%if stage=7 then %>
<input type="button" value="��ǩ��" onclick="SignatureReim()" />
<input type="button" value="����" onclick="balance_borr()" />
<input type="button" value="����" onclick="BackReim()" />
<%end if%>
<%if oabusyuserlevelCode="CW" then %>
<input type="button" value="�ʺ��޸�" onclick="Givecount()" />
<%end if%>
<%if oabusyuserlevelCode="CWZG" and stage=6 then %>
<input type="button" value="ͬ���޸�" onclick="editgivecount()" />
<input type="button" value="��ͬ���޸�" onclick="editnotgivecount()" />
<%end if%>
</div>
</td>
</tr>
</table>
</form>

</div>
</font>
</body>
</html>
