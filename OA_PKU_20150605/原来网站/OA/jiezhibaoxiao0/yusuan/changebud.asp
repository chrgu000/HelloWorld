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

projectid=request("projectid")

if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
  <%
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from accProj where projectid='"&projectid&"'"
	rs.open sql,conn,1,1
		pcycle=rs("pcycle")
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
	function selected(req,reqvalue)
	if req=reqvalue  then
	selected=" selected"
	else
	selected=""
	end if
	end function
	
'---------------------------------------------------------------------------------------------------------------	
	dim projectidarr
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
	
	redim projectidarr(num-1)
	dim k
	k=0
	set conn=opendb("CostType","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select DISTINCT type from costtype order by type"
	rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
	do while not rs.eof and not rs.bof 
	projectidarr(k)=rs("type")
	k=k+1
	rs.movenext
	loop
	end if
	set rs=nothing
	set conn=nothing


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
<title>�༭���Ԥ���</title>
</head>
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
  //alert("����ע�ⲻҪ��ͬһ����Ŀ��ѡ����ͬ����ϸ��Ŀ");
  var   newCell;  
 // var  vth.innerHTML="<td colspan='2'>�·�</td><td>1��</td><td>2��</td><td>3��</td><td>4��</td><td>5��</td><td>6��</td><td>7��</td><td>8��</td><td>9��</td><td>10��</td><td>11��</td><td>12��</td>"; 
//		  vth=document.all.table1.insertRow(0);   
  var   vTr=document.all.table1.insertRow(0);   
  for(var   i=1;   i<2;   i++)   { 
      vTd=vTr.insertCell();
	  vTd1=vTr.insertCell();
	  vTd2=vTr.insertCell();
	 
      vTd.innerHTML="<select name='name'><%for i=0 to k-1%><option value=<%=projectidarr(i)%>><%=projectidarr(i)%><%flag=projectidarr(i)%></option><%next%><%'response.Write("<option value=diyi2>yiyige2</option>")%></select>"; 
	  vTd1.innerHTML="<select name='name'><%for i2=0 to k2-1%><option value=<%=content(i2)%>><%=content(i2)%>---<%=content2(i2)%></option><%next%></select>"; 
	  vTd2.innerHTML="<input type='text' name='name'  value=0.00 >"; 
  }   
  }   
    
  </script> 
<body>
<div align="center">
<form name="xx" action="confirmbuget.asp" method="post">
<table border="1" cellspacing="0" cellpadding="0" bgcolor="D7E8F8" bordercolor="#339999">
  <tr >
    <td>��Ŀ����</td><td><%=projectname%></td>
    <td>��Ŀ���</td><td><input type="text"  name="projectid" value="<%=projectid%>" /></td>
    <td>��Ŀ����</td><td><input type="text"  name="pcycle"  value="<%=pcycle%>"/></td>
    <td>�ܽ��</td><td><input type="text"  name="summoney" onblur="test(this.value);"  value="<%=summoney%>"/></td>
 </tr>
 <tr>
    <td>���λ</td><td><input type="text"  name="initProUnit"  value="<%=initProUnit%>"/></td>
    <td>�е�����</td><td><input type="text"  name="proforDept"  value="<%=proforDept%>"/></td>
    <td>�μӲ���</td><td><input type="text"  name="attendeeDept"  value="<%=attendeeDept%>"/></td>
    <td>��Ŀ����</td><td><input type="text"  name="proLeader"  value="<%=proLeader%>"/></td>
  </tr>
  <tr>
    <td>˰��/����</td><td><input type="text"  name="taxes" value="<%=taxes%>"/></td>
    <td>��������</td><td><input type="text"  name="accrul" value="<%=accrul%>"/></td>
    <td>��չ����</td><td><input type="text"  name="groundFee" value="<%=groundFee%>"/></td>
    <td>Э����</td><td><input type="text"  name="collaborCosts" value="<%=collaborCosts%>"/></td>
  </tr>
  <tr>
    <td colspan="3">ƾ֤��</td><td colspan="5"><select name="certificateNo"><option value="��λ" <%=selected("��λ",certificateNo)%>>��λ</option><option value="����" <%=selected("����",certificateNo)%>>����</option><option value="BD" <%=selected("BD",certificateNo)%>>BD</option></select></td>
  </tr>
   <tr >
    <td colspan="8" >
		<TABLE id="table" cellspacing="0" cellpadding="0" border=1 width="100%" bordercolor="#339999">
  <tr>
			<td>��Ŀ</td>
    		<td>��ϸ��Ŀ</td>
    		<td>���</td>
  </tr>
  <TABLE id="table1" cellspacing="0" cellpadding="0" border=1 width="100%" bordercolor="#339999">
   <%
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from submoney where projectId='"&projectid&"'"
	rs.open sql,conn,1,1
	do while not rs.eof and not rs.bof 
%>
  <TR>
   <TD><input type="text"  name="name" value="<%=rs("msub")%>"/></TD><TD><input type="text"  name="name" value="<%=rs("sub")%>"/></TD><TD><input type="text"  name="name" value="<%=rs("money")%>"/></TD>
  </TR>
<%
	rs.movenext
	loop
	set rs=nothing
	set conn=nothing
  %>
  <tr>
 <TD colspan="8"><span id="t" name="t"></span></TD></tr>
</TABLE> 
	</td>
</table>
<!--<div align="center"><font size="+1" color="red">�Ƿ񽫱�Ԥ�����Ϊ������������������ȷ�����������������رա�</font><hr></div>-->
<input type="submit" name="submit" value="�ύ" /><input type="submit" name="submit" value="�ر�" /><input   type=button  value="����һ��"  onclick="addRow()"> <input   type=button  value="ɾ��һ��"  onclick="clearTbl()">
<!--<input type="submit" value="ȷ��" /><input type="submit" value="�ر�" />-->
</form>
</div>
</body>
</html>
