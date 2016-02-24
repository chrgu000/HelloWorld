<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>记账凭证汇总表</title>
</head>

<body>
<div align="center">
<form name="f2">
<table border="1"  cellpadding="0" cellspacing="0">
  <th colspan="24">记账凭证汇总表</th>
  <tr>
    <td colspan="24" align="right">年月日字第号</td>
  </tr>
  <tr>
    <td colspan="11">借方金额</td>
    <td colspan="2">会计科目</td>
    <td colspan="11">贷方金额</td>
	</tr>
  <tr>
    <td>亿</td>
    <td>千</td>
    <td>百</td>
    <td>十</td>
    <td>万</td>
    <td>千</td>
    <td>百</td>
    <td>十</td>
    <td>元</td>
    <td>角</td>
    <td>分</td>
    <td colspan="2">&nbsp;&nbsp;</td>
    <td>亿</td>
    <td>千</td>
    <td>百</td>
    <td>十</td>
    <td>万</td>
    <td>千</td>
    <td>百</td>
    <td>十</td>
    <td>元</td>
    <td>角</td>
    <td>分</td>
	<td>T</td>
	</tr>
	<%for i=0 to 29%>
	<form>
  <tr>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td colspan="2"><input type="text" name="" size="8" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
    <td><input type="text" name="" size="1" /></td>
	<td><input type="submit" name="submit" value="保存" /></td>
	</tr>
	</form>
	<%next%>
  
</table>
<!--单位负责人：财会负责人：复核：制表：-->
</form>
</div>
</body>
</html>
