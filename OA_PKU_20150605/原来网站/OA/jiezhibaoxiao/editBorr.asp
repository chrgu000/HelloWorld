<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>查看页面</title>
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
Id=request("id")
'response.Write(Id)


function selected(req,reqvalue)
if req=reqvalue then
selected=" selected"
else
selected=""
end if
end function

function getdept(reqvalue) 'reqvalue表示部门编号比如FZG
	  set conntemp=opendb("lmtof","conn","sql")
	  set rstemp=server.createobject("adodb.recordset")
	  sqltemp= "select dept from dept where deptcode='"&reqvalue&"'"
	  rstemp.open sqltemp,conntemp,1,1
	  getdept=rstemp("dept")
	  set conntemp=nothing
	  set rstemp=nothing
	  set sqltemp=nothing
end function

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
function editChange()
{
    
	window.open('editChange.asp?borrowTime='+document.form.borrowTime.value+"&money="+document.form.money.value+"&content="+document.form.content.value+"&id="+document.form.Id.value+"&repayTime="+document.form.repayTime.value+'&projectid='+document.form.projectid.value,"_self");
}
</script>

<script language="javascript">
function editdelete()
{
    
	window.open('editDelete.asp?id='+ document.form.Id.value,"_self");
}
</script>
<script language="javascript">
function editSubmit()
{
    
	window.open('editSubmit.asp?borrowTime='+ document.form.borrowTime.value+"&money="+document.form.money.value+"&content="+document.form.content.value+"&id="+document.form.Id.value+"&repayTime="+document.form.repayTime.value+'&projectid='+document.form.projectid.value,"_self");
}
</script>
<script language="javascript">
function editAgree()
{
    
	window.open('editAgree.asp?id='+ document.form.Id.value+"&notes="+document.form.notes.value,"_self");
}
</script>
<script language="javascript">
function editNotAgree()
{
    
	window.open('editNotAgree.asp?id='+ document.form.Id.value+"&notes="+document.form.notes.value,"_self");
}
</script>
<script language="javascript">
function SignatureBorr()
{
    
	window.open('SignatureBorr.asp?id='+ document.form.Id.value,"_self");
}
function UnPayBorr()
{
    
	window.open('UnPayBorr.asp?id='+ document.form.Id.value,"_self");
}
function ClearBorr()
{
    
	window.open('ClearBorr.asp?id='+ document.form.Id.value,"_self");
}
</script>
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
                  <td align="left"class="style7"><font size="-1">借支模块</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<%
if oabusyuserlevelCode="ZSYG" then 
stage1=0
end if
if oabusyuserlevelCode="BMJL" then 
stage1=1
end if
if oabusyuserlevelCode="CW" then 
stage1=2
end if
if oabusyuserlevelCode="DSZ" then 
stage1=3
end if
if oabusyuserlevelCode="CWZG" then 
stage1=2
end if
if oabusyuserlevelCode="CN" then 
stage1=2
end if

set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
sql= "select * from borrowlist where id= "&ID
rs.open sql,conn,1,1
if not rs.eof then
%>
<form name="form" >
<table border="1"  cellpadding="0" cellspacing="0" bgcolor="D7E8F8" width="90%">
<%
set conn2=opendb("lmtof","conn","sql")
set rs2=server.createobject("adodb.recordset")
sql2= "select * from userinf where userdept="&"'"&getdept(rs("borrowerdeptcode"))&"' and  (levelCode='BMJL' or levelCode1='BMJL' or levelCode='DSZ')"
rs2.open sql2,conn2,1,1
if not rs2.eof then
%>
<input type="hidden" name="Id" value="<%response.Write(request("id"))%>"> <tr  bgcolor="D7E8F8" ><td>申请人</td><td><input type="hidden" name="borrower" value="<%=rs("borrower")%>"><%response.Write(rs("borrower"))%></td><td>部门</td><td>
<input type="hidden" name="userdept" value="<%=rs2("userdept")%>" /><% response.Write(rs2("userdept")) %>
<%
end if
%></td>
<td colspan="3">部门负责人</td>
<td>
<input type="hidden" name="leader" value="<%=rs2("username")%>" />
<%response.Write(rs2("username"))%>
</td>

</tr>
<tr  bgcolor="D7E8F8" >
<td colspan="2">借款日期</td><td colspan="2"><input type="hidden" name="borrowTime" value="<%response.Write(formatdatetime(rs("borrowTime"), 1))%>" /><%response.Write(formatdatetime(rs("borrowTime"), 1)) %></td>
<td colspan="2">还款日期</td><td colspan="2"><input type="hidden" name="repayTime" value="<%response.Write(formatdatetime(rs("repayTime"), 1))%>" /><%response.Write(formatdatetime(rs("repayTime"), 1)) %></td>
</tr>
<tr  bgcolor="D7E8F8" >
<td>金额(元)</td><td colspan="7" align="center"><% if rs("borrower")=oabusyusername and (rs("stage")=0 or rs("stage")=10) then %><input type="text" name="money" value="<%=rs("money")%>" />元<%else response.Write(rs("money")) end if%></td>
</tr>
<tr  bgcolor="D7E8F8" >
</tr>
  <tr  bgcolor="D7E8F8" >
  <td>借支项目</td>
  <td colspan="7" align="center" >
  	<% if rs("borrower")=oabusyusername and (rs("stage")=0 or rs("stage")=10) then %>
  		<select name="projectid" size="1">
  		<%
		   set conn3=opendb("GFProjectType","conn","sql")
		   set rs3=server.CreateObject("adodb.recordset")
		   sql3= "select projectId,dept,projectName from projectType order by dept"
		   rs3.open sql3,conn3,1,1
		   do while not rs3.eof 
		 %>
         <option value="<%=rs3("projectId")%>"  <%=selected(rs3("projectId"),rs("projectId"))%>><%=rs3("dept")%>--<%=rs3("projectName")%></option>
         <%
		   rs3.movenext
		   loop
		   set conn3=nothing
		   set rs3=nothing
		   set sql3=nothing
		%>
        </select>
     <%else %>
     <input type="hidden" name="projectid" value="<%=rs("projectId")%>" />
     <%
	 	set conn3=opendb("GFProjectType","conn","sql")
		set rs3=server.CreateObject("adodb.recordset")
		sql3= "select projectId,dept,projectName from projectType where projectId='"&rs("projectId")&"'"
		rs3.open sql3,conn3,1,1
		if not rs.eof and not rs.bof then
		response.Write(rs3("dept")&"--"&rs3("projectName"))
		set conn3=nothing
		set rs3=nothing
		set sql3=nothing
		end if
		
	 
	 end if%>
  </td>
  </tr>
<td>事由</td><td colspan="7" align="center" ><% if rs("borrower")=oabusyusername and (rs("stage")=0 or rs("stage")=10) then %><textarea name="content" cols="60" rows="2"/>
<%=rs("content")%></textarea><%else response.Write("&nbsp;&nbsp;"&rs("content")) end if%></td>
</tr>
<%
dim flag
flag=0
set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
sqlborr="select * from borrowlist where nowverify like '%"&oabusyusername&"%'"
rsborr.open sqlborr,cnborr,1,1
if not rsborr.eof and not rsborr.bof then
	flag=2
end if
set cnborr=nothing
set rsborr=nothing
set sqlborr=nothing
%>
<%if flag=2 and (rs("stage")>0 and rs("stage")<7) then %>
    <tr>
	<td>批注</td>
	<td colspan="7">
    	<textarea cols="60" maxize=80 name="notes"></textarea>
     </td>
</tr>
<%end if%>
<%if flag=0 and rs("stage")=10 then %>
    <tr>
	<td>批注</td>
	<td colspan="7">
<%
notenew=replace(rs("notes"),"####","<br>")
%>
<%=notenew%>
     </td>
</tr>
<%end if%>
<tr >
<td colspan="9">
<div align="center">
<input type="button" value="返回" onclick="javascript:window.history.back();" />
<% if rs("borrower")=oabusyusername  and (rs("stage")=0 or rs("stage")=10)  then %>
<input type="button" value="修改" onclick="editChange()" />
<input type="button" value="提交" onclick="editSubmit()" />
<input type="button" value="删除" onclick="editdelete()" />
<% end if%>
<%
%>
<% if flag=2 and (rs("stage")>0 and rs("stage")<7 and rs("stage")<>10) then %>
<input  type="button" value="同意" onclick="editAgree()"  />
<input type="button" value="不同意" onclick="editNotAgree()" />
<%end if%>
<%if rs("stage")=7  then %><input type="button" value="已领款" onclick="SignatureBorr()" /><%end if%>
<%if rs("stage")=7  then %><!--<input type="button" value="未付款" onclick="UnPayBorr()" />--><%end if%>
</div>
</td>
</tr>
<%
rs.movenext
set conn=nothing
set rs=nothing
end if
%>
</table>
</form>
<%
set rs2=nothing
set conn2=nothing
%>
</div>
</font>
</body>
</html>
