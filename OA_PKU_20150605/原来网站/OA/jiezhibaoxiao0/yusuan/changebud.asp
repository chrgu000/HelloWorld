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
<title>编辑审核预算表</title>
</head>
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
              table1.deleteRow(table1.rows[1]);    
       }    
}
  </script>
<script languange="javascript">   
  function   addRow()   {   
  //alert("请您注意不要再同一个科目中选择相同的详细科目");
  var   newCell;  
 // var  vth.innerHTML="<td colspan='2'>月份</td><td>1月</td><td>2月</td><td>3月</td><td>4月</td><td>5月</td><td>6月</td><td>7月</td><td>8月</td><td>9月</td><td>10月</td><td>11月</td><td>12月</td>"; 
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
    <td>项目名称</td><td><%=projectname%></td>
    <td>项目编号</td><td><input type="text"  name="projectid" value="<%=projectid%>" /></td>
    <td>项目周期</td><td><input type="text"  name="pcycle"  value="<%=pcycle%>"/></td>
    <td>总金额</td><td><input type="text"  name="summoney" onblur="test(this.value);"  value="<%=summoney%>"/></td>
 </tr>
 <tr>
    <td>立项单位</td><td><input type="text"  name="initProUnit"  value="<%=initProUnit%>"/></td>
    <td>承担部门</td><td><input type="text"  name="proforDept"  value="<%=proforDept%>"/></td>
    <td>参加部门</td><td><input type="text"  name="attendeeDept"  value="<%=attendeeDept%>"/></td>
    <td>项目经理</td><td><input type="text"  name="proLeader"  value="<%=proLeader%>"/></td>
  </tr>
  <tr>
    <td>税金/管理</td><td><input type="text"  name="taxes" value="<%=taxes%>"/></td>
    <td>管理服务费</td><td><input type="text"  name="accrul" value="<%=accrul%>"/></td>
    <td>发展基金</td><td><input type="text"  name="groundFee" value="<%=groundFee%>"/></td>
    <td>协作费</td><td><input type="text"  name="collaborCosts" value="<%=collaborCosts%>"/></td>
  </tr>
  <tr>
    <td colspan="3">凭证号</td><td colspan="5"><select name="certificateNo"><option value="方位" <%=selected("方位",certificateNo)%>>方位</option><option value="奥赛" <%=selected("奥赛",certificateNo)%>>奥赛</option><option value="BD" <%=selected("BD",certificateNo)%>>BD</option></select></td>
  </tr>
   <tr >
    <td colspan="8" >
		<TABLE id="table" cellspacing="0" cellpadding="0" border=1 width="100%" bordercolor="#339999">
  <tr>
			<td>科目</td>
    		<td>详细科目</td>
    		<td>金额</td>
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
<!--<div align="center"><font size="+1" color="red">是否将本预算表保存为决算表？？如果是请点击“确定”，不是请点击“关闭”</font><hr></div>-->
<input type="submit" name="submit" value="提交" /><input type="submit" name="submit" value="关闭" /><input   type=button  value="增加一行"  onclick="addRow()"> <input   type=button  value="删除一行"  onclick="clearTbl()">
<!--<input type="submit" value="确定" /><input type="submit" value="关闭" />-->
</form>
</div>
</body>
</html>
