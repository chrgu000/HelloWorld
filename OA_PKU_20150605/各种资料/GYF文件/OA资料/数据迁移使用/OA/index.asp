<html>
<head>
<title>CSNC登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet" type="text/css">
<%
ip=request.ServerVariables("REMOTE_ADDR") 
response.Redirect("../csnc/cn_index.asp")
'response.Write(ip)%>
</head>
<body>
<FORM name="loginform" action="../csnc/cn_indexT.asp"  method="post" >
<br><br>
<center>
    <table width="310" border="0" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC">
      <tr> 
        <td height="30" colspan="2" align="center">&nbsp;</td>
    </tr>
    <tr bgcolor="#efefef"> 
      <td width="40%" height="30" align="right">用户名：</td>
      <td width="60%" bgcolor="#EFEFEF">
	  <input name="name" id="name" size=12 maxlength="20"></td>
    </tr>
    <tr> 
      <td width="40%" height="30" align="right" bgcolor="#CCCCCC">密&nbsp; 码：</td>
      <td>
	  <input name="password" type="password" id="pwd" size=12 maxlength="20">
	  </td>
    </tr>
    <tr bgcolor="#EFEFEF"> 
      <td colspan="2" align="center">
        <div align="right">
          <input name="Submit" type="submit" value="登陆网站">
        </div></td>
    </tr>
    <tr bgcolor="#EFEFEF">
      <td colspan="2" align="center"><div align="center"><font color="#FF0000"><%=ms%></font></div></td>
    </tr>
  </table>
  <div align="center"><font color="#0000FF">访问OA系统的IP已改变，请参看彭宁发送的邮件通知</font></div>

</center>
</form>
</body>
</html>
