<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../asp/checked.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>填写借支</title>
<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("alert(""对不起，您已经过期，请重新登录！"");")
	response.write("window.close();")
	response.write("</script>")
	response.end
end if

%>
<%
myyear=year(now())
mymonth=month(now())
myday=day(now())
'response.Write(now())

set conn=opendb("lmtof","conn","sql")
set rs=server.createobject("adodb.recordset")

function selected(req,reqvalue)
if req=reqvalue then
selected=" selected"
else
selected=""
end if
end function
%>
<script language="javascript">
function check()
{
	
	if(document.form1.borrowdateY.value.length<1 || document.form1.borrowdateM.value.length<1 || document.form1.borrowdateD.value.length<1)
	{
		window.alert("借款时间不能为空");
		window.location.reload(true);
		return true;
	}
	if(document.form1.backdateY.value.length<1 || document.form1.backdateM.value.length<1 || document.form1.backdateD.value.length<1)
	{
		window.alert("还款时间不能为空");
		window.location.reload(true);
		return true;
	}
	if(document.form1.moneyS.value.length<1)
	{
		window.alert("金额不能为空");
		document.form1.moneyS.focus();
		window.location.reload(true);
		return true;
	}
}
</script>
</head>
<body>
<SCRIPT   LANGUAGE="JavaScript">   
  document.onkeydown   =   function()   {   
  if(event.keyCode==116)   {   
  event.keyCode=0;   
  event.returnValue   =   false;   
  }   
  }   
  document.oncontextmenu   =   function()   {event.returnValue   =   false;}   
  </SCRIPT>
  <%
  dim flag
  flag=0
  if (year(now()) mod 4)=0 and (year(now()) mod 100)<>0 and (month(now())+1)=2 then
  flag=1
  end if
  if (year(now()) mod 400)=0 and (year(now()) mod 100)=0 and (month(now())+1)=2 then
  flag=1
  end if
  if (month(now())+1)<>2 then
  flag=5
  end if
  %> 
<div align="center">
<div align="center">项目费用借支申请单</div>
<form  name="form1" method="post" action="preInsee.asp" >
<font size="2">
<table width="95%"  height="264" cellpadding="0" cellspacing="0" border="1" align="center">
  <tr>
    <td colspan="10" align="center" valign="middle"><div align="center"><span class="STYLE1">项目费用借支申请单</span></div></td>
  </tr>
  <tr>
  		<td width="13%">选择项目</td>
        <td  height="20">
	<select name="projectid" size="1">
	<%
	  set conn=opendb("GFProjectType","conn","sql")
	  set rs=server.CreateObject("adodb.recordset")
	  sql="select * from projectType where jieti='NO'  order by dept "
	  rs.open sql,conn,1,1
	  do while not rs.eof 
	%>
	<option value="<%=rs("projectId")%>"  <%=selected(rs("projectId"),projectid)%>><%=rs("dept")%>--<%=rs("projectName")%></option>
	<% 
	rs.movenext
	loop
	%>
	</select></td>
    <td width="13%" height="20" colspan="2">金额(小写)</td>
    <td height="20"><input type="text" name="moneyS" />元
        <font color="#FF0000">*</font></td> 
  </tr>
  <tr>
    <td width="13%">借款日期</td>
    <td colspan="2" >
	<select name="borrowdateY" size="1">
	<% for i=2009 to 2020 %>
	<option value="<%=i%>" <%=selected(i,myyear)%>><%=i%>年</option>
	<% next %>
	</select>
	<select name="borrowdateM" size="1">  
	<% for i=1 to 12 %>
	<option value="<%=i%>" <%=selected(i,mymonth)%>><%=i%>月</option>
	<% next %>
	</select>
	 <select name="borrowdateD" size="1">  
	<% for i=1 to 31 %>
	<option value="<%=i%>" <%=selected(i,myday)%>><%=i%>日</option>
	<% next %>
	</select>
	   <font color="#FF0000">*</font> </td>  
    <td width="27%">预计冲款日期</td>
    <td colspan="2" width="25%" >
	 <select name="backdateY" size="1">
	<% for i=2009 to 2020 %>
	<option value="<%=i%>" <%=selected(i,myyear)%>><%=i%>年</option>
	<% next %>
	</select>
	<select name="backdateM" size="1">  
	<% for i=1 to 12 %>
	<option value="<%=i%>" <%=selected(i,mymonth+1)%>><%=i%>月</option>
	<% next %>
	</select>
	 <select name="backdateD" size="1">  
	<% for i=1 to 31 %>
	<option value="<%=i%>" <%=selected(i,myday)%>><%=i%>日</option>
	<% next %>
	</select> <font color="#FF0000">*</font></td>  
  </tr>
  <tr>
    <td  width="13%" height="122"><%response.Write("&nbsp;&nbsp;")%>
      事
      <%response.Write("&nbsp;&nbsp;&nbsp;&nbsp;")%>
      由
      <%response.Write("&nbsp;&nbsp;")%></td>
    <td colspan="8"><textarea name="content" cols="80" rows="6"></textarea></td>
  </tr>
</table>
<input type="hidden" name="time1" value="<%response.Write(now()) %>">
 <div align="center"><input type="submit" value=" 确定" onclick="check()"/></div>
</form>
</div>
</body>
</html>
