<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<!--#include file="getverifyR.asp"-->
<title>��������</title>
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

		  set conn=opendb("finance","conn","sql server")
          set rs=server.CreateObject("adodb.recordset")
          sql= "select * from reimlisttable where id= "&id
          rs.open sql,conn,1,1
          claimant=rs("claimant")'�������˵�����
		  dept=getdept(rs("claimantdeptcode"))'�������˵Ĳ���
		  reimburseDate=rs("reimburseDate")'��������д��ʱ��		  
		  relclaimant=rs("relclaimant")'�����˵�����
		  stage=rs("stage")
		  notes=rs("notes")
		  dealtype=rs("dealtype")
		  occurDate=rs("occurDate")'���鷢����ʱ��
		  projectId=rs("projectId")'��Ŀ���
		  givecount=rs("givecount")'��Ŀ�ʺ�--Ĭ��
		  summary=rs("summary")'ժҪ������
		  remark=rs("remark")'��ע˵��
		  billCount=rs("billCount")'��Ʊ������
		  money=rs("money")'��Ʊ�ϵĽ��
		  chkormn=rs("chkormn")
		  nowverify=rs("nowverify")
		  td=rs("id")
		  set rs=nothing
		  set conn=nothing
		  
		  projectLeader=getprojectprin(projectId)

		  set conn=opendb("lmtof","conn","sql server")
          set rs=server.CreateObject("adodb.recordset")
          sql= "select * from userinf where userdept="&"'"&dept&"'"&"and  (levelCode='BMJL' or levelCode1='BMJL' or levelCode2='BMJL')"
          rs.open sql,conn,1,1
		  do while not rs.eof and not rs.bof
			BMJLname=rs("username")&BMJLname
		  rs.movenext
		  loop
		  set rs=nothing
		  set conn=nothing		  
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
    
	window.open('editSubmitReim.asp?id='+document.form.Id.value+"&money="+document.form.money.value+"&remark="+document.form.remark.value+"&billCount="+document.form.billCount.value+"&summary="+document.form.summary.value,"_self");
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
    
	window.open('editAgreeReim.asp?id='+ document.form.Id.value+"&notes="+document.form.notes.value,"_self");
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
    
	window.open('editnotgivecount.asp?id='+ document.form.Id.value+"&notes="+document.form.notes.value,"_self");
}
</script> 
<script language="javascript">
function toprint()
{
    
	window.open('ViewReim.asp?id='+ document.form.Id.value,"_self");
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
<input type="hidden" name="Id" value="<%response.Write(request("id"))%>">
<table  width="100%" border=0  cellspacing="1" bgcolor="B0C8EA">
<tr height="10" bgcolor="D7E8F8">
	<td width="80"><font color="#0d79b3" size="-1">��������</font></td>
	<td ><font color="#0d79b3" size="-1"><%=claimant%></font></td>
	<td><font color="#0d79b3" size="-1">��д����</font></td>
	<td colspan="3"><font color="#0d79b3" size="-1"><%=reimburseDate %></font></td>
</tr>
<tr height="10"  bgcolor="D7E8F8" >
	<td width="80"><font color="#0d79b3" size="-1">������</font></td>
	<td ><font color="#0d79b3" size="-1"><input type="hidden" name="relclaimant" value="<%=relclaimant%>"><%=relclaimant%></font></td>
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
	<td colspan="5"><font color="#0d79b3" size="-1"><%=projectId%></font></td> 
</tr>
<tr bgcolor="D7E8F8">
<%if dealtype="AA" or dealtype="BB" then%>
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
<%end if%>   
 
<%if dealtype="CC" then%>
	<td colspan="2"><font color="#0d79b3" size="-1">���ʽ</font><input type="hidden" name="billCount" value="0"><input type="hidden" name="summary" value="0"></td>
    <td colspan="2">
      <font color="#0d79b3" size="-1">
      		<%
				if trim(chkormn)="chk" then 
					response.Write("���л��") 
				end if
				if trim(chkormn)="mn" then 
					response.Write("�ֽ𻹿�") 
				end if
			%>
      </font>
    </td>
<%end if%>

	<td><font color="#0d79b3" size="-1">���</font></td>
	<td><font color="#0d79b3" size="-1">
	<%if (stage<>10 and stage<>0) or (( stage=10 or stage=0 ) and reimburseDate < CDate("2009-9-7"))then%>
    <%=money%>
    <%end if%>
    <%if ( stage=10 or stage=0 ) and reimburseDate > CDate("2009-9-7") then %>
    <input type=text name="money" value="<%=money%>">
    <%end if%>
    </font></td>
</tr>
<tr bgcolor="D7E8F8">
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
<tr bgcolor="D7E8F8">
	<td><font color="#0d79b3" size="-1">�����ʺ�</font></td>
	<td colspan="5" bgcolor="D7E8F8"><font color="#0d79b3" size="-1">
	<%if oabusyuserlevelCode="CW" and stage=5 then %>
<select name="givecount">
		 <%

		  set conn=opendb("GFProjectType","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          'sql="select  financeCount,projectName from projectType  order by financeCount"
		  sql="select  financeCount,projectName from projectType where financeCount is not null and financeCount<>''  order by financeCount"
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
<%if oabusyuserlevelCode="CW" and stage<>5  then

		  set conn=opendb("GFProjectType","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select  financeCount,projectName from projectType where projectId='"&projectId&"'"
          rs.open sql,conn,1,1
		  if not rs.eof and not rs.bof then
		  projectName=rs("projectName")
		  end if
		  set rs=nothing
		  set conn=nothing
        response.Write(givecount)
end if
%>
<%if oabusyuserlevelCode<>"CW"  then

		  set conn=opendb("GFProjectType","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select  financeCount,projectName from projectType where projectId='"&projectId&"'"
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
<%if getstagetf("1;2;3;4;6;13",stage)=1 then %>
<tr bgcolor="D7E8F8">
	<td>��ע</td><td colspan="5" bgcolor="D7E8F8"><textarea cols="60" maxize=80 name="notes"></textarea></td>
</tr>
<%end if%>
<%if getstagetf("5;8;9;10;15",stage)=1 then %>
<tr bgcolor="D7E8F8">
<td>��ע</td>
<td colspan="5">
	<%
    notenew=replace(notes,"####","<br>")
    %>
    <%=notenew%>
</td>
</tr>
<%end if%>
<tr bgcolor="D7E8F8">
<td colspan="6" bgcolor="D7E8F8">
<input type=hidden name="td" value="<%=td%>">
<div align="center">
<input type="button" value="����" onclick="javascript:window.history.back();"/>
<% if claimant=oabusyusername and (stage=10 or stage=0) then %>
<input type="button" value="�ύ" onclick="editSubmit()" />
<input type="button" value="�޸�" onclick="editChangeReim()" />
<input type="button" value="ɾ��" onclick="editdelete()" />
<% end if%>
<% 'if ((claimant<>oabusyname and (stage<7 or stage>10) and stage>0 and stage<>6)  or (claimant=oabusyname and oabusyname=BMJLname and (stage>0 and stage<4) or stage>10) or ((oabusyuserlevelCode="DSZ" or oabusyuserlevelCode="CWZG" ) AND claimant=oabusyname and stage>0 and stage<>10)) and oabusyuserlevelCode<>"CW" then '----�޸����һ�����Ű���������ž������� ���ݳ��� �����Ϊ�޸ĺ����%>
<!--�޸���2013��12��19�� ��Ϊ�µ���֯�ṹ�п��ܰ��������Ŀ��������BMJLname�п��ܰ���������ƣ�����instr�������Ƚϵ�ǰ�û����Ƿ��ǲ��ž���-->
<% 
'if ((claimant<>oabusyname and (getstagetf("1;2;3;4;5;13",stage)=1))  or (claimant=oabusyname and instr(BMJLname,oabusyname)>0 and (getstagetf("1;2;3;13",stage)=1) or ((oabusyuserlevelCode="DSZ"  or oabusyuserlevelCode="CWZG" ) AND claimant=oabusyname and (getstagetf("1;2;3;4;5;7;8;9;13",stage)=1))) or (claimant=oabusyname and instr(nowverify,oabusyname)>0 and oabusyuserlevelCode="ZSYG")) and oabusyuserlevelCode<>"CW"  then
'�ⲿ����ԭ����
'�����ⲿ�ֽ�and oabusyuserlevelCode<>"CW" ȥ����
if ((claimant<>oabusyname and (getstagetf("1;2;3;4;5;13",stage)=1))  or (claimant=oabusyname and instr(BMJLname,oabusyname)>0 and (getstagetf("1;2;3;13",stage)=1) or ((oabusyuserlevelCode1="DSZ" or oabusyuserlevelCode="CWZG" ) AND claimant=oabusyname and (getstagetf("1;2;3;4;5;7;8;9;13",stage)=1))) or (claimant=oabusyname and instr(nowverify,oabusyname)>0 and oabusyuserlevelCode="ZSYG")) and oabusyuserlevelCode<>"CW"   then %> 
<input  type="button" value="ͬ��" onclick="editAgree()"  />
<input type="button" value="��ͬ��" onclick="editNotAgree()" />
<%end if%>
<%if stage=7 then %>
<input type="button" value="��ǩ��" onclick="SignatureReim()" />
	<% if dealtype="BB" then%>
	<input type="button" value="����" onclick="balance_borr()" />
    <%end if%>
<input type="button" value="����" onclick="BackReim()" />
<%end if%>
<%
if oabusyuserlevelCode="CW"  and stage=5 then %>
<input type="button" value="�ʺ��޸�" onclick="Givecount()" />
<%end if%>
<%if stage=7 and oabusyuserlevelCode="CN" then %>
<input type="button" value="ȥ����ӡ" and  onclick="toprint()" />
<%end if%>
<%
if (oabusyuserlevelCode="CWZG" or oabusyuserlevelCode1="CWZG") and  stage=6 then %>
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
