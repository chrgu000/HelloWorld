<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"--><head>
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
%>
<%

code=request.cookies("oabusyuserlevelCode")
code1=request.cookies("oabusyuserlevelCode1")
id=request.QueryString("id")
projectid=request("projectid")
'response.Write(projectid)
%>
  <%
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from proinM where id="&id
	rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
		summoney=rs("summoney")
		initProUnit=rs("initProUnit")
		proforDept=rs("proforDept")
		attendeeDept=rs("attendeeDept")
		proLeader=rs("proLeader")
		certificateNo=rs("certificateNo")
		accrul=rs("accrul")
		taxes=rs("taxes")
		groundFee=rs("groundFee")
		collaborCosts=rs("collaborCosts")
		timewrite=rs("timewrite")
		stage=rs("stage")
		inpaytime=rs("inpaytime")
	end if
	if rs.eof or rs.bof then 
	response.write("<script language=""javascript"">")
	response.write("alert('error!#332');history.go(-1);")
	response.write("</script>")
	response.end
	end if
	set rs=nothing
	set conn=nothing
	
	set conn=opendb("GFProjectType","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select projectName from projectType_old where projectId='"&projectid&"'"
	rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
	projectname=rs("projectName")
	rs.movenext
	end if
	set rs=nothing
	set conn=nothing
	flag=0
	if (code="BMJL" and (stage=1 or stage=0)) or  (code="CWZG" and (stage=1 or stage=0)) OR (code="DSZ" and (stage=3 or (stage=1 or stage=0))) then
	flag=1
	end if
  %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改到款分配</title>
</head>

<body>
<div align="center">
<form name="xx" action="editsaveallot.asp" method="post">
<font color="#0d79b3" size="-1">
<table border="1" cellspacing="0" cellpadding="0" bgcolor="D7E8F8" bordercolor="#339999" width="75%">
  <tr>
    <td>项目名称</td><td><%=projectname%></td>
    <td>项目编号</td><td><%=projectid%></td>
    <td>入款时间</td><td><%=inpaytime%></td>
    <td>总金额</td><td><%=summoney%></td>
   </tr>
    <td>立项单位</td><td><%=initProUnit%></td>
    <td>承担部门</td><td><%=proforDept%></td>
    <td>参加部门</td><td><%=attendeeDept%></td>
    <td>项目经理</td><td><%=proLeader%></td>
  </tr>
    <td>税金/管理</td><td><%=taxes%></td>
    <td>管理服务费</td><td><%=accrul%></td>
    <td>发展基金</td><td><%=groundFee%></td>
    <td>协作费</td><td><%=collaborCosts%></td>
  </tr>
  <tr>
	<td colspan="2">凭证号</td><td colspan="6"><%=certificateNo%></td>
  </tr>
  <tr >
    <td colspan="8" >
		<TABLE id="table1" cellspacing="0" cellpadding="0" border=1 width="100%" bgcolor="D7E8F8" bordercolor="#339999">
  <tr>
			<td>科目</td>
    		<td>详细科目</td>
    		<td>金额</td>
  </tr>
   <%
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from subProin where proinMid='"&id&"'"
	rs.open sql,conn,1,1
	do while not rs.eof and not rs.bof 
%>
  <TR>
   <TD><%=rs("msub")%></TD><TD><%=rs("sub")%></TD><TD><%=rs("money")%></TD>
  </TR>
<%
	rs.movenext
	loop
	set rs=nothing
	set conn=nothing
  %>
 
</TABLE> 
	</td>
  </tr>
</table>

<table cellspacing="0" cellpadding="0" border="1" width="75%" bgcolor="D7E8F8" bordercolor="#339999">
  <tr >
    <td>项目编号</td><td colspan="5">
	<select name="projectid">
	<%
	set conn=opendb("GFProjectType","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select projectId, projectName from projectType_old order by projectId"
	rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
	do while not rs.eof and not rs.bof 
	%>
	<option value="<%=rs("projectId")%>"><%=rs("projectId")%>--<%=rs("projectName")%></option>
	<%
	rs.movenext
	loop
	end if
	set rs=nothing
	set conn=nothing
	%>
	</select>
	</td>
    <td>入款时间</td><td><input type="text"  name="inpaytime" /></td>   
 </tr>
 <tr>
 	<td>总金额</td><td><input type="text"  name="summoney" onblur="test(this.value);" value="0.00"/></td>
    <td>立项单位</td><td><input type="text"  name="initProUnit"/></td>
    <td>承担部门</td><td><input type="text"  name="proforDept" /></td>
    <td>参加部门</td><td><input type="text"  name="attendeeDept"/></td>
    <!--<td>项目经理</td><td><input type="text"  name="proLeader"/></td>-->
  </tr>
  <tr>
    <td>税金/管理</td><td><input type="text"  name="taxes" value="0.00"/></td>
    <td>管理服务费</td><td><input type="text"  name="accrul" value="0.00"/></td>
    <td>发展基金</td><td><input type="text"  name="groundFee" value="0.00"/></td>
    <td>协作费</td><td><input type="text"  name="collaborCosts" value="0.00"/></td>
  </tr>
  <tr >
    <td colspan="8" >
		<TABLE id="table" cellspacing="0" cellpadding="0" border=1 width="100%" bgcolor="D7E8F8" bordercolor="#339999">
  <tr>
			<td>科目</td>
    		<td>详细科目</td>
    		<td>金额</td>
  </tr>
      </TABLE>
	  <TABLE id="table1" cellspacing="0" cellpadding="0" border=1 width="100%" bgcolor="D7E8F8" bordercolor="#339999">
 <TR>
 <TD colspan="8"><span id="t" name="t"></span></TD>
</TR>
</TABLE> 
	</td>
  </tr>
</table>
<input type="submit" name="sub" value="保存" />&nbsp;&nbsp;<input type="button" value="关闭" onclick="javascript:window.close();" />
</div>
</body>
</html>
