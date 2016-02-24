<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>到款分配单</title>
</head>
<script language="javascript">
   function subn()
   {
    
//	var bn=document.f.name[1]
//	alert(bn.value);
	if  (document.f.danwei.value==""  ) 
	{
	alert("您必须要填写单位名称");
	return false;
	}
	
	if  (document.f.projectId.value==""  ) 
	{
	alert("您必须要填写项目名称");
	return false;
	}

    if  (document.f.deptleader.value==""  ) 
	{
	alert("您必须要填写项目负责人名称");
	return false;
	}

	if  (document.f.inpaydanwei.value==""  ) 
	{
	alert("请填写付款单位名称");
	return false;
	}
	
	if  (document.f.money.value==0.00  ) 
	{
	alert("请填写到款金额");
	return false;
	}
	
	if  (document.f.feipeiM.value==0.00   ) 
	{
	alert("您必须要填写分配额");
	return false;
	}
	
		
	var ff
    ff=confirm("请您确认是否填写无误？确认后无法修改！！");
	if (ff==false)
	{
		return false;
	}
	if (ff==true)
	{
		document.f.submit();
		//return false;
	}
	
   }
   function test(str)
   {
    if (document.f.certificateNo.value=="北大")
	{
		document.f.accrul.value=str*0.25;  //管理
		document.f.taxes.value=str*0.12;   //税金
	}
	if(document.f.certificateNo.value=="方位")
	{
		document.f.accrul.value=str*0.25;
		document.f.taxes.value=str*0.055;

	}
	if(document.f.certificateNo.value=="奥赛")
	{
		document.f.accrul.value=str*0.25;
		document.f.taxes.value=str*0.05;

	}
   }
</script>
<body>
<font color="#0d79b3" size="-1">
<center>
<form name="f" action="confirminpay.asp" method="post">
<table cellspacing="0" cellpadding="0" bgcolor="D7E8F8" bordercolor="#339999" border="1" width="60%">
  <col width="113" />
  <col width="72" span="7" />
  <th colspan="8">
    到款分配单
  </th>
  <tr height="18">
    <td height="18">单位</td>
    <td><input type="text" name="danwei" /></td>
    <td>项目名称</td>
    <td colspan="2">
	<!--<input type="text" name="projectname"/>-->
	
	<select name="projectId">
	<%set conn=opendb("GFProjectType","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	sql="select projectName,projectId from projectType "
	rs.open sql,conn,1,1
	do while not rs.eof and not rs.bof 
	%>
	<option value="<%=rs("projectId")%>"><%=rs("projectName")%>---<%=rs("projectId")%></option>
	<%	
	rs.movenext
	loop
	set rs=nothing
	set conn=nothing
	%>
	</select>
	</td>
    <td>负责人</td>
    <td colspan="2"><input type="text" name="deptleader"  /></td>
  </tr>
  <tr height="18">
    <td height="18">付款单位</td>
    <td><input type="text" name="inpaydanwei"  /></td>
    <td>到款额</td>
    <td colspan="2"><input type="text"  name="money"  /></td>
    <td>分配额</td>
    <td colspan="2"><input type="text" name="feipeiM"  /></td>
  </tr>
  <tr height="18">
    <td height="18">凭证号</td>
    <td colspan="2"><input type="text" name="pzh"  /></td>
    <td colspan="2">项目所在部门</td>
    <td colspan="3"><input type="text"name="prodept"  /></td>
    <!--<td>开户</td>
    <td><input type="text" /></td>
    <td>经费号</td>
    <td>　</td>-->
  </tr>
  <tr height="18">
    <td colspan="8" height="18">根据机构名称规定</td>
  </tr>
  <tr height="18">
    <td height="18">上缴学校</td>
    <td colspan="4"><input type="text" size="60" name="jiaoxxcontent"/></td>
    <td colspan="3"><input type="text" size="20" name="jiaoxxM" /></td>
  </tr>
  <tr height="18">
    <td height="18">上缴院、系、所</td>
    <td colspan="4"><input type="text" size="60" name="jiaoyxscontent"/></td>
    <td colspan="3"><input type="text" size="20" name="jiaoyxsM" /></td>
  </tr>
  <tr height="18">
    <td height="18">备注</td>
    <td colspan="7"><textarea name="content"  rows="4" cols="60"/></textarea></td>
  </tr>
  <!--<tr height="18">
    <td height="18">机构盖章</td>
    <td>　</td>
    <td>负责人签字</td>
    <td>　</td>
    <td>　</td>
    <td>时间</td>
    <td>　</td>
    <td>　</td>
  </tr>-->
</table>
<br />
<input type="button"  value="保存"  onclick="subn()"/>
</form>
</center>
<br />
<br />
<div align="center"><a href="manageinpay.asp">查看到款分配单</a></div>
</font>
</body>
</html>
