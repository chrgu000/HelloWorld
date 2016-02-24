<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<form  name="form" action="baocun.asp">
  <table border="1" align="center" cellpadding="0" cellspacing="0" width="80%">
    <tr bgcolor="D7E8F8">
      <td><font color="#660033" size="+1"><strong>名称</strong></font></td>
      <td><font color="#660033" size="+1"><strong>出版社</strong></font></td>
      <td><font color="#660033" size="+1"><strong>备注</strong></font></td>
      <td><font color="#660033" size="+1"><strong>是否借出</strong></font></td>
    </tr>
    <tr bgcolor="D7E8F8" >
      <td><input type="text" name="name"  /></td>
      <td><input type="text" name="press"  /></td>
      <td width="50%"><input name="content"  size="80" /></td>
      <td><input type="text" name="wether"  /></td>
    </tr>
	<tr>
	<td colspan="4"><div align="center"><input type="submit" value="save"  /></div></td>
	</tr>
  </table>
</form>
</body>
</html>
