
<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>
<body>
<%
id=request("id")
sub1=request("sub")
stage=request("stage")
if sub1="提交" then
	set conn=opendb("finance","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from reimlisttable_old where id="&id
	rs.open sql,conn,1,3
	 On Error Resume Next 
	 	if not rs.eof and not rs.bof then
			rs("stage")=Cint(stage)
			rs.update
			response.Write("<div align=center>修改完毕</div>")
			rs.movenext
	 	end if

	Set rs = nothing
	Set conn = nothing
end if
%>
<%
	set conn=opendb("finance","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	if sub1<>"提交" then
	sql="select id,claimant,remark,money,stage from reimlisttable_old where id>2700"
	end if
	if sub1="提交" then
	sql="select id,claimant,remark,money,stage from reimlisttable_old where id="&id
	end if
	rs.open sql,conn,1,1

'字段和
fieldCount = rs.Fields.Count

'输出字段和
Response.Write("<div align=center>总共有多少个字段" & fieldCount & "</div>")
%><div align=center>
<table cellspacing="0" cellpadding="0" border="1" bgcolor="D7E8F8" bordercolor="#339999" width="75%">
 <tr>
  <!--输出字段的名称-->
  <%
   For i = 0 to fieldCount - 1
    Response.Write("<th>" & rs.Fields(i).Name & "</th>")
   Next
  %>
  
  <!--输出表中字段的数据-->
  <%
   Do while not rs.Eof
     temp = "<tr>"
     '----循环遍历字段的值，而不是名字
     For n = 0 to fieldCount - 1 
      temp = temp & "<td width=25%   align=justify>&nbsp;" & rs.Fields(n).Value & "</td>"
     Next
     '----End
     Response.Write temp & "</tr>"
   rs.movenext
   Loop
  %>
 </tr>
</table>

<%
rs.close
Set rs = nothing
conn.close
Set conn = nothing
%>

<form action="shuchubiaoge.asp" method="post">
输入修改的id号<input type="text" name="id" /><input type="text" name="stage" /><input type="submit" name="sub" value="提交"/>
</form> 
</div>
</body>
</html>
