<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<%

	projectIdn=request.Form("projectId")
	set conn=opendb("GFProjectType","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select projectName from projectType_old where projectId='"&projectIdn&"'"
	rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
	projectnamen=rs("projectName")
	rs.movenext
	end if
	if rs.eof and rs.bof then
	response.Write("<script languange=javascrript>alert('项目数据库中没有该项目的名称');history.go(-1);</script>")
	response.end()
	end if
	set rs=nothing
	set conn=nothing
	'response.Write(request("projectId"))
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
<title>填写项目预算表单</title>
</head>
<script language="javascript">
   function confirmput()
   {
   var ff
    ff=confirm("请您确认是否填写无误？确认将无法修改！");
	if (ff==false)
	{
		return false;
	}
	if (ff==true)
	{
		document.f.submit();
	}
   }
</script>
<script language="javascript">
   function test(str)
   {
    document.f.accrul.value=str*0.25;
   	document.f.taxes.value=str*0.25;
	document.f.profitsacc.value=str*0.25;
	document.f.cballocated.value=str*0.25;
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
   db_bbs="GFProjectType.mdb"//定义数据库 
   alert("wode");
   var conn = new ActiveXObject("ADODB.Connection"); 
	conn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+db_bbs+""); 
	var rs = new ActiveXObject("ADODB.Recordset"); 
	var sql="select type from costtype"; //数据库中有authors表，name字段 
	alert("wode");
	rs.open(sql,conn); 
			  alert("wode");//取出第一个来 
	conn.close();  
   conn = null;  
   } 
   function clearTbl(){            
       if(table1.rows.length>1)
	   {
              table1.deleteRow(table1.rows.length-1);    
       }    
}
  </script>
<script languange="javascript">   
  function   addRow()   {   
  var   newCell;  
 // var  vth.innerHTML="<td colspan='2'>月份</td><td>1月</td><td>2月</td><td>3月</td><td>4月</td><td>5月</td><td>6月</td><td>7月</td><td>8月</td><td>9月</td><td>10月</td><td>11月</td><td>12月</td>"; 
//		  vth=document.all.table1.insertRow(0);   
  var   vTr=document.all.table1.insertRow(1);   
  for(var   i=1;   i<2;   i++)   { 
      vTd=vTr.insertCell();
	  vTd1=vTr.insertCell();
	  vTd2=vTr.insertCell();
	  vTd3=vTr.insertCell();
	  vTd4=vTr.insertCell();
	  vTd5=vTr.insertCell();
	  vTd6=vTr.insertCell();
	  vTd7=vTr.insertCell();
	  vTd8=vTr.insertCell();
	  vTd9=vTr.insertCell();
	  vTd10=vTr.insertCell();
	  vTd11=vTr.insertCell();
	  vTd12=vTr.insertCell();
	  vTd13=vTr.insertCell(); 
	 
      vTd.innerHTML="<select name='name'><%for i=0 to k-1%><option value=<%=projectid(i)%>><%=projectid(i)%><%flag=projectid(i)%></option><%next%><%'response.Write("<option value=diyi2>yiyige2</option>")%></select>"; 
	  vTd1.innerHTML="<select name='name'><%for i2=0 to k2-1%><option value=<%=content(i2)%>><%=content(i2)%>---<%=content2(i2)%></option><%next%></select>"; 
	  vTd2.innerHTML="<input type='text' name='name' size='6' value=1000.00 >";
	  vTd3.innerHTML="<input type='text' name='name' size='6' value=1000.00 >";
	  vTd4.innerHTML="<input type='text' name='name' size='6' value=1000.00 >";
	  vTd5.innerHTML="<input type='text' name='name' size='6' value=1000.00 >";
	  vTd6.innerHTML="<input type='text' name='name' size='6' value=1000.00 >";
	  vTd7.innerHTML="<input type='text' name='name' size='6' value=1000.00 >";
	  vTd8.innerHTML="<input type='text' name='name' size='6' value=1000.00 >";
	  vTd9.innerHTML="<input type='text' name='name' size='6' value=1000.00 >";
	  vTd10.innerHTML="<input type='text' name='name' size='6' value=1000.00 >";
	  vTd11.innerHTML="<input type='text' name='name' size='6' value=1000.00 >";
	  vTd12.innerHTML="<input type='text' name='name' size='6' value=1000.00 >";
	  vTd13.innerHTML="<input type='text' name='name' size='6' value=1000.00 >";  
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
<table cellspacing="0" cellpadding="0" border="1" width="100%" bordercolor="#000000">
  <tr >
    <td colspan="2" rowspan="2" height="36" width="220"><div align="center"><strong>项目预算分配表</strong></div></td>
    <td width="94">项目名称</td>
    <td width="57">项目编号</td>
    <td width="131">项目周期</td>
    <td width="42">总金额</td>
    <td width="113">计提管理费</td>
    <td width="113">税金</td>
    <td width="121">计提利润</td>
    <td width="121">可分配金额</td>
    <td width="121">第一次入款时间</td>
    <td width="121">第二次入款时间</td>
    <td width="121">第三次入款时间</td>
    <td width="121">第四次入款时间</td>
  </tr>
    <form action="confirmbuget.asp" method="post" name="f">
  <tr >
    <td><%=projectIdn%><input type="hidden" value="namePro" value="<%=projectnamen%>" /></td>
    <td><%=projectIdn%><input type="hidden"  name="idPro" value="<%=projectIdn%>" /></td>
    <td><input type="text"  name="pcycle" /></td>
    <td><input type="text"  name="summoney" onblur="test(this.value);" value="0.00"/></td>
    <td><input type="text"  name="accrul" value="0.00"/></td>
    <td><input type="text"  name="taxes" value="0.00"/></td>
    <td><input type="text"  name="profitsacc" value="0.00"/></td>
    <td><input type="text"  name="cballocated" value="0.00"/></td>
    <td><input type="text"  name="t1"/></td>
    <td><input type="text"  name="t2"/></td>
    <td><input type="text"  name="t3"/></td>
    <td><input type="text"  name="t4"/></td>
  </tr>

  <tr >
    <td colspan="14" >
		<TABLE id="table1" cellspacing="0" cellpadding="0" border=1 width="100%" bordercolor="#000000">
  <tr>
			<td colspan="2">月份</td>
			<td>1月</td>
    		<td>2月</td>
    		<td>3月</td>
    		<td>4月</td>
    		<td>5月</td>
    		<td>6月</td>
    		<td>7月</td>
    		<td>8月</td>
    		<td>9月</td>
    		<td>10月</td>
			<td>11月</td>
			<td>12月</td>
  </tr>

 <TR>
 <TD colspan="14"><span id="t" name="t"></span></TD>
</TR>
</TABLE> 
	</td>
  </tr>
</table>

<!--<select size=1 name="userdept" onChange="javascript:alert('特殊个');">
<option value="1" >测试的1</option>
<option value="2" >测试的2</option>-->
</select>
<input type="button" value="提交" onclick="confirmput();" /><input   type=button  value="增加一行"  onclick="addRow()"> <input   type=button  value="删除一行"  onclick="clearTbl()">
</form>
</div>
</body>
</html>
