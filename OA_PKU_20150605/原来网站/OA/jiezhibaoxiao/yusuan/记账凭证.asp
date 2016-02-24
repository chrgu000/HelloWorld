<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>记账凭证</title>
</head>
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
.STYLE2 {color: #FF0000}
.STYLE3 {color: #1374B0}
td {font-size:12px;color:#333333;line-height:150%; height:auto}
tr {background-color:expression((this.sectionRowIndex%2==0)?"#ffffff":"#f4f4f4")}
-->
</style>
<body>
<div align="center">
<form name="f1">
<table border="1" cellpadding="1" cellspacing="1">
   <th colspan="27">记账凭证</th>
   <tr>
      <td rowspan="2">摘要</td>
	  <td  rowspan="2">总账科目</td>
	  <td  rowspan="2">明细科目</td>
	  <td  rowspan="2">记账</td>
	  <td colspan="10">借方金额</td>
	  <td  rowspan="2">记账</td>
	  <td colspan="11">贷方金额</td>
	  </tr>
   <tr>
      <td >千</td>
	  <td >百</td>
	  <td >十</td>
	  <td >万</td>
	  <td >千</td>
	  <td >百</td>
	  <td >十</td>
	  <td >元</td>
	  <td >角</td>
	  <td >分</td>
	  <td >千</td>
	  <td >百</td>
	  <td >十</td>
	  <td >万</td>
	  <td >千</td>
	  <td >百</td>
	  <td >十</td>
	  <td >元</td>
	  <td >角</td>
	  <td >分</td>
	  <td >T</td>
   </tr>
   <%for i=0 to 5%>
   <form>
   <tr>
      <td><input type="text" name=""  size="8"/></td>
	  <td><input type="text" name=""  size="8"/></td>
	  <td><input type="text" name=""  size="8"/></td>
	  <td><input type="text" name=""  size="8"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td><input type="text" name=""  size="1"/></td>
	  <td ><input type="submit" name="submit" value="保存" /></td>
	  </tr>
	  </form>
	<%next%>
  
</table>
<!--财务主管&nbsp;&nbsp;&nbsp;&nbsp;记账&nbsp;&nbsp;&nbsp;&nbsp;出纳&nbsp;&nbsp;&nbsp;&nbsp;审核&nbsp;&nbsp;&nbsp;&nbsp;制单-->
</form>
</div>
</body>
</html>
