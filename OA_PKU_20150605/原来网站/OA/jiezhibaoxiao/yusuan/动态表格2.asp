<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
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
	 
      vTd.innerHTML="<select name='name'><option value='diyi'>yiyige</option><option value='diyi'>dierge</option><option value='diyi'>disange</option></select>"; 
	  vTd1.innerHTML="<select name='name'><option value='diyi'>yiyige</option><option value='diyi'>dierge</option><option value='diyi'>disange</option></select>"; 
	  vTd2.innerHTML="<input type='text' name='name' size='4' >";
	  vTd3.innerHTML="<input type='text' name='name' size='4' >";
	  vTd4.innerHTML="<input type='text' name='name' size='4' >";
	  vTd5.innerHTML="<input type='text' name='name' size='4' >";
	  vTd6.innerHTML="<input type='text' name='name' size='4' >";
	  vTd7.innerHTML="<input type='text' name='name' size='4' >";
	  vTd8.innerHTML="<input type='text' name='name' size='4' >";
	  vTd9.innerHTML="<input type='text' name='name' size='4' >";
	  vTd10.innerHTML="<input type='text' name='name' size='4' >";
	  vTd11.innerHTML="<input type='text' name='name' size='4' >";
	  vTd12.innerHTML="<input type='text' name='name' size='4' >";
	  vTd13.innerHTML="<input type='text' name='name' size='4' >";  
  }   
  }   
    
  </script>    
  <TABLE id="table1" border=1>
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
  <input   type=button  value="增加"  onclick="addRow()"> <input   type=button  value="删除"  onclick="delRow()">
</body>
</html>
