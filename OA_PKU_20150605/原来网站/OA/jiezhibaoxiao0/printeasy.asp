<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<!--#include file="tobig.asp"-->
<title>打印还款凭证</title>
<%
	num=request("num")
	set conn=opendb("finance","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from borrowlist_old where id="&CInt(request("id"))
	rs.open sql,conn,1,1
	if num=1 then 
	flagtime=rs("fretime")
	flagmoney=rs("frefound")
	end if
	if num=2 then 
	flagtime=rs("sretime")
	flagmoney=rs("srefound")
	end if
	if num=3 then 
	flagtime=rs("tretime")
	flagmoney=rs("trefound")
	end if
%>
</head>
<body>
<div align="center">
<br /><br /><br /><br /><br />
<table bordercolor="#000000" cellpadding="0" cellspacing="0" width="75%" border="1" >
	<tr bordercolor="#339999">
		<td colspan="2"><%=year(flagtime)%>年<%=month(flagtime)%>月<%=day(flagtime)%>日</td>
	</tr>
	<tr bordercolor="#339999">
		<td>今收到 </td>
		<td><%=rs("borrower")%></td>
	</tr>
	<tr bordercolor="#339999">
		<td>交来：</td>
		<td>抵充借支单<%=request("id")%>号——<%=rs("content")%></td>
	</tr>
	<tr bordercolor="#339999">
		<td>人民币(大写)：</td>
		<td><%=rmb(cdbl(flagmoney))%></td>
	</tr>
	<tr bordercolor="#339999">
		<td>&nbsp;</td>
		<td>￥ <%=flagmoney%>元</td>
	</tr>
	<tr bordercolor="#339999">
		<td>收款人：</td>
		<td>交款人：</td>
	</tr>
</table>
</div>
</body>
<script language="javascript">
if (confirm('请单击“确定”按钮开始打印，单击“取消”按钮不打印！'))
{
	window.print();
}
</script>
</html>
