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
<title>������䵥</title>
</head>
<script language="javascript">
   function subn()
   {
    
//	var bn=document.f.name[1]
//	alert(bn.value);
	if  (document.f.danwei.value==""  ) 
	{
	alert("������Ҫ��д��λ����");
	return false;
	}
	
	if  (document.f.projectId.value==""  ) 
	{
	alert("������Ҫ��д��Ŀ����");
	return false;
	}

    if  (document.f.deptleader.value==""  ) 
	{
	alert("������Ҫ��д��Ŀ����������");
	return false;
	}

	if  (document.f.inpaydanwei.value==""  ) 
	{
	alert("����д���λ����");
	return false;
	}
	
	if  (document.f.money.value==0.00  ) 
	{
	alert("����д������");
	return false;
	}
	
	if  (document.f.feipeiM.value==0.00   ) 
	{
	alert("������Ҫ��д�����");
	return false;
	}
	
		
	var ff
    ff=confirm("����ȷ���Ƿ���д����ȷ�Ϻ��޷��޸ģ���");
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
    if (document.f.certificateNo.value=="����")
	{
		document.f.accrul.value=str*0.25;  //����
		document.f.taxes.value=str*0.12;   //˰��
	}
	if(document.f.certificateNo.value=="��λ")
	{
		document.f.accrul.value=str*0.25;
		document.f.taxes.value=str*0.055;

	}
	if(document.f.certificateNo.value=="����")
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
    ������䵥
  </th>
  <tr height="18">
    <td height="18">��λ</td>
    <td><input type="text" name="danwei" /></td>
    <td>��Ŀ����</td>
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
    <td>������</td>
    <td colspan="2"><input type="text" name="deptleader"  /></td>
  </tr>
  <tr height="18">
    <td height="18">���λ</td>
    <td><input type="text" name="inpaydanwei"  /></td>
    <td>�����</td>
    <td colspan="2"><input type="text"  name="money"  /></td>
    <td>�����</td>
    <td colspan="2"><input type="text" name="feipeiM"  /></td>
  </tr>
  <tr height="18">
    <td height="18">ƾ֤��</td>
    <td colspan="2"><input type="text" name="pzh"  /></td>
    <td colspan="2">��Ŀ���ڲ���</td>
    <td colspan="3"><input type="text"name="prodept"  /></td>
    <!--<td>����</td>
    <td><input type="text" /></td>
    <td>���Ѻ�</td>
    <td>��</td>-->
  </tr>
  <tr height="18">
    <td colspan="8" height="18">���ݻ������ƹ涨</td>
  </tr>
  <tr height="18">
    <td height="18">�Ͻ�ѧУ</td>
    <td colspan="4"><input type="text" size="60" name="jiaoxxcontent"/></td>
    <td colspan="3"><input type="text" size="20" name="jiaoxxM" /></td>
  </tr>
  <tr height="18">
    <td height="18">�Ͻ�Ժ��ϵ����</td>
    <td colspan="4"><input type="text" size="60" name="jiaoyxscontent"/></td>
    <td colspan="3"><input type="text" size="20" name="jiaoyxsM" /></td>
  </tr>
  <tr height="18">
    <td height="18">��ע</td>
    <td colspan="7"><textarea name="content"  rows="4" cols="60"/></textarea></td>
  </tr>
  <!--<tr height="18">
    <td height="18">��������</td>
    <td>��</td>
    <td>������ǩ��</td>
    <td>��</td>
    <td>��</td>
    <td>ʱ��</td>
    <td>��</td>
    <td>��</td>
  </tr>-->
</table>
<br />
<input type="button"  value="����"  onclick="subn()"/>
</form>
</center>
<br />
<br />
<div align="center"><a href="manageinpay.asp">�鿴������䵥</a></div>
</font>
</body>
</html>
