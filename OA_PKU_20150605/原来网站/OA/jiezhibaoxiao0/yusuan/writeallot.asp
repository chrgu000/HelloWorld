<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<!--#include file="opendb.asp"-->
<%

	certificateNo=request.Form("certificateNo")
	
    dim flag
    dim projectid
	dim num
	num=0
	set conn=opendb("CostType","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select DISTINCT type from costtype order by type"
	rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
	do while not rs.eof and not rs.bof 
	num=num+1
	rs.movenext
	loop
	end if
	set rs=nothing
	set conn=nothing
	'response.write(num)
	
	redim projectid(num-1)
	dim k
	k=0
	set conn=opendb("CostType","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select DISTINCT type from costtype order by type"
	rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
	do while not rs.eof and not rs.bof 
	projectid(k)=rs("type")
	k=k+1
	rs.movenext
	loop
	end if
	set rs=nothing
	set conn=nothing
	'for m=0 to k-1
'	response.Write(projectid(m))
'	next
    dim content
	dim content2
	dim num2
	num2=0
	set conn=opendb("CostType","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select  content from costtype order by type"
	rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
	do while not rs.eof and not rs.bof 
	num2=num2+1
	rs.movenext
	loop
	end if
	set rs=nothing
	set conn=nothing
	'response.write(num)
	
	redim content(num2-1)
	redim content2(num2-1)
	dim k2
	k2=0
	set conn=opendb("CostType","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select type, content from costtype order by type"
	rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
	do while not rs.eof and not rs.bof 
	content(k2)=rs("content")
	content2(k2)=rs("type")
	k2=k2+1
	rs.movenext
	loop
	end if
	set rs=nothing
	set conn=nothing
    %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��д��Ŀ���</title>
</head>
<script language="javascript">
   function confirmput()
   {
    
//	var bn=document.f.name[1]
//	alert(bn.value);
	if  (document.f.inpaytime.value==""  ) 
	{
	alert("����д���ʱ��");
	return false;
	}
	
	if  (document.f.summoney.value==0.00  ) 
	{
	alert("����д��Ŀ�ܽ��");
	return false;
	}
	
	if  (document.f.initProUnit.value==""  ) 
	{
	alert("������Ҫ��д���λ");
	return false;
	}
	if  (document.f.proforDept.value==""  ) 
	{
	alert("������Ҫ��д�е�����");
	return false;
	}
	if  (document.f.attendeeDept.value==""  ) 
	{
	alert("������Ҫ��д�μӲ���");
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
</script>
<script language="javascript">
   function test1(str)
   {
    if (document.f.certificateNo.value=="BD")
	{
		document.f.accrul.value=str*0.15;  //�������� 15%
		document.f.groundFee.value=str*0.2;   //��չ���� 20%
		document.f.taxes.value=str*0.12;  //˰��/���� ѧУ12% ��λ5.5%
	}
	if(document.f.certificateNo.value=="��λ")
	{
		document.f.accrul.value=str*0.15;
		document.f.groundFee.value=str*0.2;
		document.f.taxes.value=str*0.055;


	}
	if(document.f.certificateNo.value=="����")
	{
		document.f.accrul.value=str*0.15;
		document.f.groundFee.value=str*0.2;
		document.f.taxes.value=str*0.055;


	}
   }
</script>
<% 
sub test2() 
   MsgBox "dsagf"
end sub
%>
<% 
sub Lionking(str) 
str1="<option value=1>"&str&"</option><option value=2>"&str&"</option>"
response.Write(str1)
end sub
%>
 <script   language=javascript> 
 function conn(){ 
   
   var db_bbs 
   db_bbs="GFProjectType.mdb"//�������ݿ� 
   alert("wode");
   var conn = new ActiveXObject("ADODB.Connection"); 
	conn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+db_bbs+""); 
	var rs = new ActiveXObject("ADODB.Recordset"); 
	var sql="select type from costtype"; //���ݿ�����authors��name�ֶ� 
	alert("wode");
	rs.open(sql,conn); 
			  alert("wode");//ȡ����һ���� 
	conn.close();  
   conn = null;  
   } 
   function clearTbl(){            
       if(table1.rows.length>1)
	   {
              table1.deleteRow(table1.rows[1]);    
       }    
}
  </script>
<script languange="javascript">   
  function   addRow()   {   
    //alert(document.f.name.length);
//	alert(document.f.name[1].value);
//	if (document.f.name.length>3)
//	{
//	    var e=null;
//		var w=null;
//		for (var i=0;i<document.f.name.length;i+=3)
//		{
//		 e = f.name[i+1];
//		 w = f.name[i+4];
//	    if (e.value == w.value)
//		  {
//		     alert("����ȷ��һ����Ŀ�µġ���ϸ��Ŀ��û���ظ�");
//			 e=null;
//			 w=null;
//		     return false;
//		  }
//		}
//	 }
  //alert("����ע�ⲻҪ��ͬһ������Ŀ����ѡ����ͬ�ġ���ϸ��Ŀ��");
  var   newCell;  
 // var  vth.innerHTML="<td colspan='2'>�·�</td><td>1��</td><td>2��</td><td>3��</td><td>4��</td><td>5��</td><td>6��</td><td>7��</td><td>8��</td><td>9��</td><td>10��</td><td>11��</td><td>12��</td>"; 
//		  vth=document.all.table1.insertRow(0);   
  var   vTr=document.all.table1.insertRow(0);   
  for(var   i=1;   i<2;   i++)   { 
      vTd=vTr.insertCell();
	  vTd1=vTr.insertCell();
	  vTd2=vTr.insertCell();
	 
      vTd.innerHTML="<select name='name'><%for i=0 to k-1%><option value=<%=projectid(i)%>><%=projectid(i)%><%flag=projectid(i)%></option><%next%><%'response.Write("<option value=diyi2>yiyige2</option>")%></select>"; 
	  vTd1.innerHTML="<select name='name'><%for i2=0 to k2-1%><option value=<%=content(i2)%>><%=content(i2)%>---<%=content2(i2)%></option><%next%></select>"; 
	  vTd2.innerHTML="<input type='text' name='name'  value=0.00 >"; 
  }   
  }   
    
  </script> 
  
  <script language="vbscript">
    Sub Button1_OnClick
    End Sub
  </script>
<body>
<div align="center">
<div id="dd" align="center"><%=projectnamen%></div>
<form action="confirmallot.asp" method="post" name="f">
<font color="#0d79b3" size="-1">
<table cellspacing="0" cellpadding="0" border="1" width="90%" bgcolor="D7E8F8" bordercolor="#339999">
  <tr >
    <td>��Ŀ���</td><td colspan="3">
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
	<td>ƾ֤��</td><td>
	<select name="certificateNo">
	<option value="BD">BD</option>	
	<option value="��λ">��λ</option>	
	<option value="����">����</option>	
	</select>
	</td>
    <td>���ʱ��</td><td><input type="text"  name="inpaytime" /></td>   
 </tr>
 <tr>
 	<td>�ܽ��</td><td><input type="text"  name="summoney" onblur="test(this.value);" value="0.00"/></td>
    <td>���λ</td><td><input type="text"  name="initProUnit"/></td>
    <td>�е�����</td><td><input type="text"  name="proforDept" /></td>
    <td>�μӲ���</td><td><input type="text"  name="attendeeDept"/></td>
    <!--<td>��Ŀ����</td><td><input type="text"  name="proLeader"/></td>-->
  </tr>
  <tr>
    <td>˰��/����</td><td><input type="text"  name="taxes" value="0.00"/></td>
    <td>��������</td><td><input type="text"  name="accrul" value="0.00"/></td>
    <td>��չ����</td><td><input type="text"  name="groundFee" value="0.00"/></td>
    <td>Э����</td><td><input type="text"  name="collaborCosts" value="0.00"/></td>
  </tr>
  <tr >
    <td colspan="8" >
		<TABLE id="table" cellspacing="0" cellpadding="0" border=1 width="100%" bgcolor="D7E8F8" bordercolor="#339999">
  <tr>
			<td>��Ŀ</td>
    		<td>��ϸ��Ŀ</td>
    		<td>���</td>
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
</font>
</select> 

<input type="button" value="�ύ" onclick="confirmput();" /><input   type=button  value="����һ��"  onclick="addRow()"> <input   type=button  value="ɾ��һ��"  onclick="clearTbl()">
</form>
<font color="#FF0000" size="+1">*��ע�⣺������д��ϸ��Ŀ��ʱ���벻Ҫ�ظ�ѡ��*</font>
<br /><a href="manageallot.asp">�鿴��Ŀ���</a>
</div>
</body>
</html>
