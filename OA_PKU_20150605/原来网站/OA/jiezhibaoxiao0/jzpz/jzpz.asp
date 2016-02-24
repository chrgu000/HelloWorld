<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="../opendb.asp"-->
<head>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
levelCode1=request.cookies("oabusyuserlevelCode")
levelCode2=request.cookies("oabusyuserlevelCode")

'if oabusyusername="" then 
'	response.write("<script language=""javascript"">")
'	response.write("window.top.location.href='default.asp';")
'	response.write("</ script>")
'	response.end
'end if
'if levelCode1<>"CN" then 
'	response.write("<script language=""javascript"">")
'	response.write("window.top.location.href='default.asp';")
'	response.write("</ script>")
'	response.end
'end if
zy=request("zy")
	response.Write(zy) 
	response.Write("</br>")
zzkm=request("zzkm")
	response.Write(zzkm) 
	response.Write("</br>")
mxkm=request("mxkm")
	response.Write(mxkm) 
	response.Write("</br>")
jfje=request("jfje")
	response.Write(jfje) 
	response.Write("</br>")
dfje=request("dfje")
	response.Write(dfje) 
	response.Write("</br>")
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>记账凭证</title>
<%
'  saveflg=request("save")
'  if saveflg="save" && levelCode1="CN" then
'		set conn=opendb("finance","conn","accessdsn")
'		set rs=server.createobject("adodb.recordset")
'		sql="select * from jzpztable where id=NULL"
'		rs.open sql,conn,1,3
'		rs.addnew
'		
'			rs("zy1")=zy1
'			rs("zzkm1")=zzkm1
'			rs("mxkm1")=mxkm1
'			rs("jfje1")=jfje1
'			rs("dfje1")=dfje1
'			
'			rs("zy2")=zy2
'			rs("zzkm2")=zzkm2
'			rs("mxkm2")=mxkm2
'			rs("jfje2")=jfje2
'			rs("dfje2")=dfje2
'			
'			rs("zy3")=zy3
'			rs("zzkm3")=zzkm3
'			rs("mxkm3")=mxkm3
'			rs("jfje3")=jfje3
'			rs("dfje3")=dfje3
'			
'			rs("zy4")=zy4
'			rs("zzkm4")=zzkm4
'			rs("mxkm4")=mxkm4
'			rs("jfje4")=jfje4
'			rs("dfje4")=dfje4
'			
'			rs("zy5")=zy5
'			rs("zzkm5")=zzkm5
'			rs("mxkm5")=mxkm5
'			rs("jfje5")=jfje5
'			rs("dfje5")=dfje5
'			
'			rs("zy6")=zy6
'			rs("zzkm6")=zzkm6
'			rs("mxkm6")=mxkm6
'			rs("jfje6")=jfje6
'			rs("dfje6")=dfje6
'			
'		rx.update
'		
'  end if
'%>
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

<table border="1" cellpadding="1" cellspacing="1" bgcolor="#2d4865" bordercolor="#2d4865" width="60%">
   <form name="jzpz.asp">
   <th colspan="6">记账凭证</th>
   <tr align="center" bgcolor="#2d4865">
      <td>摘要</td>
	  <td>总账科目</td>
	  <td>明细科目</td>
	  <td>借方金额</td>
	  <td>贷方金额</td>
	  </tr>
   <%for i=0 to 5%>
   <tr align="center">
   	  <td><input type="text" name="zy"  size="16"/></td>
	  <td><input type="text" name="zzkm"  size="16"/></td>
	  <td><input type="text" name="mxkm"  size="16"/></td>
      <td><input type="text" name="jfje"  size="16"/></td>
	  <td><input type="text" name="dfje"  size="16"/></td>
	</tr>
	<%next%>
	<tr align="center"><td colspan="6"><input type="submit" name="save" value="保存" /></td></tr>
	</form>
</table>

</div>
</body>
</html>
