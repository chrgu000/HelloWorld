<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<base target="_self">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����������ҳ��</title>
<%
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
Response.AddHeader "Pragma", "No-Cache"

oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
oabusyuserlevelCode2=request.cookies("oabusyuserlevelCode2")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if

%>
<script language="javascript" >
function newReim()
{
window.open("newReim.asp","_blank");
}
</script>
<script language="javascript" >
function manageReimList()
{
window.open("manageReimlist.asp","_blank");
}
</script>

<script language="javascript" >
function seeAllReimListforM()
{
window.open("seeAllReimListforM.asp","_blank");
}
</script>


<script language="javascript" >
function seeAllReimList()
{
window.open("seeAllReimList.asp","_blank");
}
</script>

<script language="javascript" >
function seeManageReimList()
{
window.open("seeManageReimList.asp","_blank");
}
</script>

<script language="javascript" >
function seeManageReimListforM()
{
window.open("seeManageReimListforM.asp","_blank");
}
</script>

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

<body>
<font size="-1">
<div align="center">
<table width="583"  border="0" cellspacing="0" cellpadding="0">
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
<%
'response.Write("��������ǣ�"&oabusyusername)
set conn=opendb("lmtof","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username = " & "'"& oabusyusername & "'"
rs.open sql,conn,1,1
if not rs.eof then
uStatus=rs("levelCode")
u2Status=rs("levelCode1")
end if
%>



<!--��ʾ���û�Ϊ���Ÿ�����ʱ������-->
<%if uStatus="BMJL" or u2Status="BMJL" then %>
<hr>
</form>
<font color="#330033" size="-1">����������Ҫ��������룺</font>
<form id="form1" name="form22" method="post">
<table border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999"><td><font color="#0d79b3" size="-1">���</font></td><td><font color="#0d79b3" size="-1">������</font></td><td><font color="#0d79b3" size="-1">��������</font></td><td><font color="#0d79b3" size="-1">���(Ԫ)</font></td><td><font color="#0d79b3" size="-1">״̬</font></td></tr>
<%
set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
if oabusyuserdept<>"�ۺϹ���" then
 '�����Ƿ���Ŀ�ɱ��Լ���д�ġ�������д�ĺͱ��˻ص�����ɣ�Ȼ������Ŀ�ɱ� �Լ�����Ŀ����ĵ�������Ŀ����������ɣ���Ŀ�ɱ�����Ŀ���������Լ����ύ�Ļ�δ�ύ�������
  sqlborr="select * from reimlisttable where (type='A' and projectDept = "& "'" & oabusyuserdept & "' and (stage=1  or stage=2)) or (type='B'and ((projectDept = "& "'" & oabusyuserdept & "' and  stage =2 ) or(dept = "& "'" & oabusyuserdept & "' and (stage=1 or (claimant="&"'"&oabusyusername&"' and stage=0) ))))"
 end if
if oabusyuserdept="�ۺϹ���" then
 sqlborr="select * from reimlisttable where stage=13 or (type='A' and projectDept = "& "'" & oabusyuserdept & "'" & "and (stage =1  or stage=2 )) or (type='B' and projectDept = "& "'" & oabusyuserdept & "'" & "and stage =2 ) or (type='B' and principal = "& "'" & oabusyusername & "'" & "and (stage =1 or stage =0) )"
 '�����Ƿ���Ŀ�ɱ��Լ���д�ġ�������д�ĺͱ��˻صģ�Ȼ������Ŀ�ɱ� �Լ�����Ŀ����ĵ�������Ŀ�����ˣ���Ŀ�ɱ�����Ŀ���������Լ����ύ�Ļ�δ�ύ��
 end if
rsborr.open sqlborr,cnborr,1,1
do while not rsborr.eof %>

<tr bordercolor="#339999"><td><a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a></td>
<td><!--<a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("claimant"))%></a>--><%response.Write(rsborr("claimant"))%></td><td><%response.Write(formatdatetime(rsborr("reimburseDate"), 1))%></td><td><%response.Write(rsborr("money"))%></td>

<td>
<%
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql")
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt"))
%>
</td>
</tr>
<%
rsborr.movenext
loop
set cnborr=nothing
%>
</table>


</form>
<%end if%>
<!--��ʾ���û�Ϊ��������ʱ������-->
<%if uStatus="CWZG" then %>
<font color="#330033" size="-1">����������Ҫ��������룺</font>
<form id="form1" name="form32" method="post" >
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><font color="#0d79b3" size="-1">���</font></td>
<td><font color="#0d79b3" size="-1">������</font></td>
<td><font color="#0d79b3" size="-1">��������</font></td>
<td><font color="#0d79b3" size="-1">���(Ԫ)</font></td>
<td><font color="#0d79b3" size="-1">״̬</font></td></tr>
<%
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
'set cnborr=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnborr.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set  cnborr=opendb("finance","conn","sql")
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
set rsborr=server.CreateObject("adodb.recordset")
sqlborr="select * from reimlisttable where stage=3 or (stage=6 and ch<>'') or (type='A' and dept = "& "'" & oabusyuserdept & "' and stage =1 or (claimant="&"'"&oabusyusername&"' and stage=0 ))"
rsborr.open sqlborr,cnborr,1,1
j=0
do while not rsborr.eof %>

<tr bordercolor="#339999">
<td><a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a></td>
<td><!--<a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("claimant"))%></a>--><%response.Write(rsborr("claimant"))%></td>
<td><%response.Write(formatdatetime(rsborr("reimburseDate"), 1))%></td>
<td><%response.Write(rsborr("money"))%></td>
<td>
<%
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql")
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt"))
%>
</td>
</tr>
<%
rsborr.movenext
loop%>
</table>
</form>
<%end if%>


<!--��ʾ���û�Ϊ����ʱ������-->
<%if uStatus="CN" then %>
<font color="#330033" size="-1">����������Ҫ��������룺</font>
<form id="form1" name="form32" method="post" >
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><font color="#0d79b3" size="-1">���</font></td>
<td><font color="#0d79b3" size="-1">������</font></td>
<td><font color="#0d79b3" size="-1">��������</font></td>
<td><font color="#0d79b3" size="-1">���(Ԫ)</font></td>
<td><font color="#0d79b3" size="-1">״̬</font></td></tr>
<%
set cnborr=opendb("finance","conn","accessdsn")
set rsborr=server.createobject("adodb.recordset")
'change by zhaoshijun at 2010-2-24 for change database to sql server 2005
'set cnborr=server.CreateObject("adodb.connection")  
'path=server.MapPath("finance.mdb")
'cnborr.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
'set rsborr=server.CreateObject("adodb.recordset")
'change by zhaoshijun at 2010-2-24 for change database to sql server 2005

sqlborr="select * from reimlisttable where stage =7 or (type='A' and dept = "& "'" & oabusyuserdept & "'" & "and ((claimant="&"'"&oabusyusername&"' and stage=0)))"
'sqlborr="select * from reimlisttable where  (type='A' and dept = "& "'" & oabusyuserdept & "'" & "and ((claimant="&"'"&oabusyusername&"' and stage=0)))"
rsborr.open sqlborr,cnborr,1,1
j=0
do while not rsborr.eof %>

<tr bordercolor="#339999">
<td><a href=editReim.asp?id=<%response.Write(rsborr("id"))%> ><%response.Write(rsborr("id"))%></a></td>
<td><!--<a href=editReim.asp?id=<%response.Write(rsborr("id"))%> ><%response.Write(rsborr("claimant"))%></a>--><%response.Write(rsborr("claimant"))%></td>
<td><%response.Write(formatdatetime(rsborr("reimburseDate"), 1))%></td>
<td><%response.Write(rsborr("money"))%></td>
<td>
<%
' change by zhaoshijun at 2010-2-24 for changing database to sql server 2005
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
'set rsSt=server.CreateObject("adodb.recordset")
' change by zhaoshijun at 2010-2-24 for changing database to sql server 2005
set cnSt=opendb("finance","conn","sql server")
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt"))
%>
</td>
</tr>
<%
rsborr.movenext
loop%>
</table>
</form>
<%end if%>

<!--��ʾ���û�Ϊ����������ʱ������-->
<%if uStatus="DSZ" or uStatus="CW" then %>
<font color="#330033" size="-1">����������Ҫ��������룺</font>
<form id="form1" name="form4" method="post">
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><font color="#0d79b3" size="-1">���</font></td>
<td><font color="#0d79b3" size="-1">������</font></td>
<td><font color="#0d79b3" size="-1">��������</font></td>
<td><font color="#0d79b3" size="-1">���(Ԫ)</font></td>
<td><font color="#0d79b3" size="-1">״̬</font></td></tr>
<%
'changged by zhaoshijun with qq:515447782 at 2010-2-24 for update database
'set cnborr=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnborr.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnborr=opendb("finance","conn","sql server")
'changged by zhaoshijun with qq:515447782 at 2010-2-24 for update database
set rsborr=server.CreateObject("adodb.recordset")
if uStatus="DSZ" and  oabusyuserlevelCode1<>"BMJL" then
sqlborr="select * from reimlisttable where stage=4 "
end if
if uStatus="DSZ" and oabusyuserlevelCode1="BMJL" then
sqlborr="select * from reimlisttable where (stage =4 and relclaimant<>'������' ) or (type='A' and (projectDept = '��Ʒ��' or projectDept = '���̲�') and (stage=1  or stage=2)) or (type='B'and (((projectDept = '��Ʒ��' or projectDept = '���̲�') and  stage =2 ) or((projectDept = '��Ʒ��' or projectDept = '���̲�') and (stage=1 or (claimant="&"'"&oabusyusername&"' and stage=0))))) "
'2010 ��2��1�� ������ʦ�Ĺ����޸Ļ��� zhaoshijun
'sqlborr="select * from reimlisttable where (stage =4  ) or (type='A' and (projectDept = '��Ʒ��' or projectDept = '���̲�') and (stage=1  or stage=2)) or (type='B'and (((projectDept = '��Ʒ��' or projectDept = '���̲�') and  stage =2 ) or((projectDept = '��Ʒ��' or projectDept = '���̲�') and (stage=1 or (claimant="&"'"&oabusyusername&"' and stage=0))))) "
end if
if uStatus="DSZ" and oabusyusername="������"  then
sqlborr="select * from reimlisttable where stage =4 and relclaimant='������'"
end if
if uStatus="CW" then
'sqlborr="select * from reimlisttable where (stage=8 or stage=9 or stage=5) and ch='N'" '�����2010-12-24֮ǰʹ�õ����
sqlborr="select * from reimlisttable where stage=5 and ch='N'" '�����2010-12-24֮��ʹ�õ����
'˵����������2010��1��ĩ��2010��12��24�� �ڼ� ������������ ��������--->��Ŀ����---->���ž���(�ۺϹ�������)---->��������---->�ܾ������³���---->����---->�������--->
' ��������ȷ��----->���  �� ���� �ڼ���������ԭ�򣬲��ܼ�ʱ���ˣ�֮ǰ�޸�sql���ǰ�����ֺܶ�δ���������������� �����ݿ��д��ںܶ� ch״̬Ϊ N������
'���޸ĵ�sql��� ֻ���� ��������--->��Ŀ����---->���ž���(�ۺϹ�������)---->��������---->�ܾ������³���---��������ˡ������ݣ�֮��������� ����������ȷ��---������--����ɡ�
end if
rsborr.open sqlborr,cnborr,1,1
do while not rsborr.eof %>

<tr bordercolor="#339999">
<td><a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a></td>
<td><!--<a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("claimant"))%></a>--><%response.Write(rsborr("claimant"))%></td>
<td><%response.Write(formatdatetime(rsborr("reimburseDate"), 1))%></td>
<td><%response.Write(rsborr("money"))%></td>
<td>
<%
'changged by zhaoshijun with qq:515447782 at 2010-2-24 for update database
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql server")
'changged by zhaoshijun with qq:515447782 at 2010-2-24 for update database
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt"))
%>
</td>
</tr>
<%
rsborr.movenext
loop%>
</table>
</form>
<%end if%>

<% if (uStatus<> "DSZ") or (uStatus="DSZ" and oabusyuserlevelCode1<>"")  then %>
<!--��ʾ���û�Ϊ��ͨ�û�ʱ������-->
<font color="#330033" size="-1">����������Ҫע��ĵ����룺</font>
<form id="form1" name="form1" method="post">
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><font color="#0d79b3" size="-1">���</font></td>
<td><font color="#0d79b3" size="-1">������</font></td>
<td><font color="#0d79b3" size="-1">��������</font></td>
<td><font color="#0d79b3" size="-1">���(Ԫ)</font></td><!--<td><font color="#0d79b3" size="-1">����</font></td>-->
<td><font color="#0d79b3" size="-1">״̬</font></td></tr>
<%
'changed by zhaoshijun at 2010-2-24 for changing access data to sql server 2005 
'set cnborr=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnborr.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path 
'set rsborr=server.CreateObject("adodb.recordset")
set cnborr=opendb("finance","conn","sql server")
set rsborr=server.CreateObject("adodb.recordset")
'changed by zhaoshijun at 2010-2-24 for changing access data to sql server 2005 

'(type='A' claimant = "& "'" & oabusyusername & "' and (stage = 8 or stage = 5)) or (type='B' principal = "& "'" & oabusyusername & "' and (stage = 8 or stage = 5))
sqlborr="select * from reimlisttable  where (type='A'and  claimant = "& "'" & oabusyusername & "' and (stage = 10 or stage = 7)) or (type='B'and claimant = "& "'" & oabusyusername & "' and (stage = 10 or stage = 7))  or (claimant="&"'"&oabusyusername&"' and stage=0) or (stage=1 and principal= "& "'" & oabusyusername & "')"
rsborr.open sqlborr,cnborr,1,1
i=0
do while not rsborr.eof %>

<tr bordercolor="#339999">
<td>
<%if rsborr("stage")<>7 then%><a href=editReim.asp?id=<%response.Write(rsborr("id"))%>><%response.Write(rsborr("id"))%></a><%end if%>
<%if rsborr("stage")=7 then%><%response.Write(rsborr("id"))%></a><%end if%>
</td>
<td><%response.Write(rsborr("claimant"))%></td>
<td><%response.Write(formatdatetime(rsborr("reimburseDate"), 1))%></td>
<td><%response.Write(rsborr("money"))%></td><!--<td><%'response.Write(rsborr("finance"))%></td>-->
<td>
<%
'changed by zhaoshijun at 2010-2-24 foe changing access data to sql server 2005
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
'set rsSt=server.CreateObject("adodb.recordset")
set cnSt=opendb("finance","conn","sql server 2005")
set rsSt=server.CreateObject("adodb.recordset")
'changed by zhaoshijun at 2010-2-24 foe changing access data to sql server 2005
sqlS="select * from stage where stage="&rsborr("stage")
rsSt.open sqlS,cnSt,1,1
response.Write(rsSt("txt"))
%>
</td></tr>
<%
rsborr.movenext
loop
set rsSt=nothing  'add at 2010-2-24  by zhaoshijun 
set cnSt=nothing  'add at 2010-2-24  by zhaoshijun 
%>
</table>
</form>
<%end if%>
<!------------------------------------------------------------------------------------------------------------------------------------------>
<%
 if ( uStatus="DSZ"  or  uStatus="CN"  or  uStatus="CW" or uStatus="CWZG") then
   ' changed by zhaoshjun with qq:515447782 at 2010-2-24 for changing access da to sql server 
   'set connf=server.CreateObject("adodb.connection")
'   dpathf=server.Mappath("finance.mdb")
'   connf.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpathf
'   set rsf=server.CreateObject("adodb.recordset")
	set connf=opendb("finance","conn","sql server")
	set rsf=server.CreateObject("adodb.recordset")
   ' changed by zhaoshjun with qq:515447782 at 2010-2-24 for changing access da to sql server 
   if uStatus="CWZG" then
   sqlf="select * from ReimMilti where Stage = 3  "
   end if
   if uStatus="DSZ" then
   sqlf="select * from ReimMilti where Stage = 4 "
   end if
   if uStatus="CN" then
   sqlf="select * from ReimMilti where Stage =7 or Stage =10"
   end if
   if uStatus="CW" then
   sqlf="select * from ReimMilti where Stage=8 or  Stage =9"
   end if
   rsf.open sqlf,connf,1,1 
   if not rsf.eof or not rsf.bof then
%>
<div align="center">
<br><font color="#330033" size="-1">����������Ҫ����ಿ�ű�������</font>
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999"><td><font color="#0d79b3" size="-1">���</font></td><td><font color="#0d79b3" size="-1">��������</font></td><td><font color="#0d79b3" size="-1">���(Ԫ)</font></td><!--<td><font color="#0d79b3" size="-1">����</font></td>--><td><font color="#0d79b3" size="-1">״̬</font></td></tr>
<%do while not rsf.eof %>
<tr>
<td>
<a href="editReimForMil.asp?id=<%=rsf("id")%>" target="_self"><%=rsf("id")%></a>
</td>
<td><%response.Write(formatdatetime(rsf("ReimDate"), 1))%></td>
<td><%=rsf("MoneySum")%></td>
<td>
<%
' changed by zhaoshijun with qq:515447782 at 2010-2-24 for updating datdabase
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql server")
' changed by zhaoshijun with qq:515447782 at 2010-2-24 for updating datdabase
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsf("Stage")
rsSt.open sqlS,cnSt,1,1
if rsf("Stage")=4 then
%>
<font  color="#6600FF"><%response.Write(rsSt("txt"))%></font>
<% 
end if
if rsf("Stage")<>4 then
response.Write(rsSt("txt"))
end if
%>
</td>
</tr>
<%
rsf.movenext
loop
%>
</table>
</div>
<%
end if
end if
%>
<!------------------------------------------------------------------------------------------------------------------------------------------>

<%
 if uStatus="BMJL"  then
   ' changed by zhaoshijun at 2010-2-24
   'set connfm=server.CreateObject("adodb.connection")
'   dpathfm=server.Mappath("finance.mdb")
'   connfm.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpathfm
	set connfm=opendb("finance","conn","sql")
    ' changed by zhaoshijun at 2010-2-24
   set rsfm=server.CreateObject("adodb.recordset")
   if oabusyuserdept="��Ʒ��" then
   sqlfm="select * from ReimMilti where Stage = 11 and ProductDepartM > 0 and ProductDepartAg='No' "
   end if
   if oabusyuserdept="���̲�" then
   sqlfm="select * from ReimMilti where Stage = 11 and EngineeringDepartM > 0 and EngineeringDepartAg='No'  "
   end if
   if oabusyuserdept="������ѵ��" then
   sqlfm="select * from ReimMilti where Stage = 11 and EduTrainDepartM > 0 and EduTrainDepartAg='No'  "
   end if
   if oabusyuserdept="ҵ��չ��" then
   'sqlfm="select * from ReimMilti where Stage = 1 and MarketDepartM > 0 and MarketDepartAg='No' "
   sqlfm="select * from ReimMilti where Stage = 11 and MarketDepartM > 0 and MarketDepartAg='No'"
   end if
   if oabusyuserdept="�ۺϹ���" then
   sqlfm="select * from ReimMilti where Stage = 11 and GeneManageDepartM > 0 and GeneManageDepartAg='No' "
   end if
   if oabusyuserdept="�Ĵ�����" then
   sqlfm="select * from ReimMilti where Stage = 11 and sichuanJDM > 0   and sichuanJDAg='No' "
   end if
   if oabusyuserdept="�з���" then
   sqlfm="select * from ReimMilti where Stage = 11 and YanFDepartM > 0   and YanFDepartAg='No' "
   end if
   if oabusyuserdept="ʱ����Ϣ������ѵ��" then
   sqlfm="select * from ReimMilti where Stage = 11 and SDepartM > 0   and SDepartAg='No' "
   end if
   
   rsfm.open sqlfm,connfm,1,1 
   if not rsfm.eof or not rsfm.bof then
%>
<div align="center">
<br><font color="#330033" size="-1">����������Ҫ����Ķಿ�ű�������</font>
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999"><td><font color="#0d79b3" size="-1">���</font></td><td><font color="#0d79b3" size="-1">����</font></td><td><font color="#0d79b3" size="-1">���(Ԫ)</font></td><td><font color="#0d79b3" size="-1">����</font></td><td><font color="#0d79b3" size="-1">״̬</font></td></tr>
<%do while not rsfm.eof %>
<tr>
<td>
<a href="editReimForMil.asp?id=<%=rsfm("id")%>" target="_self"><%=rsfm("id")%></a>
</td>
<td><%response.Write(formatdatetime(rsfm("ReimDate"), 1))%></td>
<td><%=rsfm("MoneySum")%></td>
<td>
<%if oabusyuserdept="��Ʒ��" then 
response.Write("��Ʒ����"&rsfm("ProductDepartM")&"Ԫ&nbsp;")
end if %>
<%if oabusyuserdept="���̲�" then 
response.Write("���̲���"& rsfm("EngineeringDepartM")&"Ԫ&nbsp;")
end if %>
<%if oabusyuserdept="������ѵ��" then 
response.Write( "������ѵ����"&rsfm("EduTrainDepartM")&"Ԫ&nbsp;")
end if %>
<%if oabusyuserdept="ҵ��չ��" then 
response.Write("ҵ��չ����"& rsfm("MarketDepartM")&"Ԫ&nbsp;")
end if %>
<%if oabusyuserdept="�ۺϹ���" then 
response.Write( "�ۺϹ�����"&rsfm("GeneManageDepartM")&"Ԫ&nbsp;")
end if %>
<%if oabusyuserdept="�Ĵ�����" then 
response.Write( "�Ĵ����أ�"&rsfm("sichuanJDM")&"Ԫ")
end if %>
<%if oabusyuserdept="�з���" then 
response.Write( "�з�����"&rsfm("YanFDepartM")&"Ԫ")
end if %>
<%if oabusyuserdept="ʱ����Ϣ������ѵ��" then 
response.Write( "ʱ����Ϣ������ѵ����"&rsfm("SDepartM")&"Ԫ")
end if %>
</td>
<td>
<%
'changed by zhaoshijun at 2010-2-24
'set cnStm=server.CreateObject("adodb.connection")
'pathm=server.MapPath("finance.mdb")
'cnStm.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathm
set cnStm=opendb("finance","conn","sql server")
'changed by zhaoshijun at 2010-2-24
set rsStm=server.CreateObject("adodb.recordset")
sqlSm="select * from stage where stage="&rsfm("Stage")
rsStm.open sqlSm,cnStm,1,1
if rsfm("Stage")=9 then
%>
<font  color="#6600FF"><%response.Write(rsStm("txt"))%></font>
<% 
end if
if rsfm("Stage")<>9 then
response.Write(rsStm("txt"))
end if
%>
</td>
</tr>
<%
rsfm.movenext
loop
%>
</table>
</div>
<%
end if
end if
%>



<!------------------------------------------------------------------------------------------------------------------------------------------>
<form  id="form4" name="form4" >
<% if uStatus<>"DSZ"  then %>
<input type="button"  value="�½�������" onclick="newReim()">
<% end if %>
<% if uStatus="DSZ" and  oabusyuserlevelCode1="BMJL"  then %>
<input type="button"  value="�½�������" onclick="newReim()">
<% end if %>
<input type="button" value="�鿴������" onclick="manageReimList()" />
<!-----------------------------------------------����ɾ��----------------------------------------------->
<% if uStatus="CWZG" or uStatus="CW" or uStatus="CN" then %>
<!--<input type="button" value="�鿴���б�����" onclick="seeAllReimList()" />-->
<input type="button" value="�鿴��ϱ�����" onclick="seeAllReimListforM()" />
<% end if %>
<% if oabusyuserlevel<>"" and uStatus<>"ZSYG" and uStatus<>"CW" and uStatus<>"CN" and uStatus<>"CWZG" then 
%>
<!--<input type="button" value="��ͳ��" onclick="seeManageReimList()" />-->
<input type="button" value="�ಿ�ű���ͳ��" onclick="seeManageReimListforM()" />
<% end if %>
<!-----------------------------------------------����ɾ��----------------------------------------------->
</form>
</div>
</font>
</body>
</html>
