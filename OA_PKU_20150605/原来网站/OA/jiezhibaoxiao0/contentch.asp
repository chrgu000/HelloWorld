<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
	response.end()
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改remark</title>
</head>
<body>
<%
id=request("id")
sub1=request("sub")
content=request("content")
if sub1="提交" then
if id="" or content="" then
	response.write("<script language=""javascript"">")
	response.write("alert('请输入ID或备注');history.go(-1);")
	response.write("</script>")
	response.end()
end if
	set conn=opendb("finance","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from reimlisttable_old where id="&id
	rs.open sql,conn,1,3
	 On Error Resume Next 
	 	if not rs.eof and not rs.bof then
			rs("remark")=content
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
	sql="select id,claimant,remark,money,stage from reimlisttable_old where id>10000"
	end if
	if sub1="提交" then
	sql="select id,claimant,remark,money,stage from reimlisttable_old where id="&id
	end if
	rs.open sql,conn,1,1

'字段和
fieldCount = rs.Fields.Count

'输出字段和
'Response.Write("<div align=center>总共有多少个字段" & fieldCount & "</div>")
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

<form action="contentch.asp" method="post">
输入修改的id号<input type="text" name="id" size="4"/><br />
输入备注<textarea name="content"  cols="50" rows="4"/></textarea>
<br /><input type="submit" name="sub" value="提交"/>
</form> 
</div>
</body>
</html>
