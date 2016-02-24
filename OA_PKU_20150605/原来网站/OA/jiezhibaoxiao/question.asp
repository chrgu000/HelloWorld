<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='../default.asp';")
	response.write("</script>")
	response.end
end if
%>
<%
       name1=request.Form("name")
	   note=request.Form("note")
	   advise=request.Form("advise")
	   time1=year(now())&"年"&month(now())&"月"&day(now())&"日"
	   submit=request.Form("submit")
	   'response.Write(submit)
	   if note="" and submit="提交" then
%>
  <script language="javascript">
      alert("问题的标题为空，请重新填写");
	  window.location.href="question.asp";
  </script>
<%
	   end if
	   if note<>"" and submit="提交" then
       'set conn=server.CreateObject("adodb.connection")
          ' path=server.MapPath("note.mdb")
          ' conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
		  set conn=opendb("note","conn","sql")
       set rs=server.createobject("adodb.recordset")
          sql="select * from question"
       rs.open sql,conn,1,3
        rs.addnew
		rs("name")=name1
		rs("time")=time1
		rs("note")=note
		rs("advise")=advise
		rs.update
		rs.movenext
       set conn=nothing
       set rs=nothing
	   response.Write("<div align=center>提交完成<br><a href='question.asp' target='_self'>返回</a></div>")
	   end if
	   
	   if submit="删除全部" then
       set conn=opendb("note","conn","accessdsn")
       set rs=server.createobject("adodb.recordset")
       sql="select * from question"
       rs.open sql,conn,1,3
        do while not rs.eof and not rs.bof
		 rs.delete 
		 rs.update
		rs.movenext
		loop
       set conn=nothing
       set rs=nothing
	    response.Write("<div align=center>删除全部完成<br><a href='question.asp' target='_self'>返回</a></div>")
	   end if
	
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>问题收集</title>
</head> 
<style type="text/css">
<!--
body {
	background-color: #335e91;
}
.style2 {color: #2d4865}
.style3 {color: #334d66}
.style4 {color: #2e4869}
-->

img { 
display:block; 
width:800px; 
height:450px; 
padding-bottom:5px; 
background:url(beijing.jpg) no-repeat left bottom; 
} 
</style>
<body background="beijing.jpg">
<div  align="center">
<form action="question.asp" method="post" name="form">
<% if submit="" then%>
<div align="center">给赵师军发送问题及建议</div>
<br /><br /><br /><br />
<table bgcolor="#99CCCC">
<tr>
<input type="hidden" name="name" value="<%=oabusyusername%>" />
<td>问题描述：</td>
<td>
<input name="note" type="text" value="" size="80" />
</td>
</tr>
<tr>
<td>
建议方法：
</td>
<td>
<textarea name="advise" cols="79" rows="5"></textarea> 
</td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit"  name="submit" value="提交"/><input type="reset" value="重置" /><%if oabusyusername="赵师军" then %><input type="submit" name="submit" value="查询"/><%end if%>
</td>
</tr>
</table>
<%end if %>
<%if submit="查询"  then
       set conn=opendb("note","conn","accessdsn")
       set rs=server.createobject("adodb.recordset")
       sql="select * from question order by id"
       rs.open sql,conn,1,1
	    if rs.eof and rs.bof then
		response.Write("没有记录")
		end if
	if not rs.bof and not rs.eof then
%>
<table bgcolor="#99CCCC" border="1" cellspacing="1" cellpadding="1" width="80%" >
<tr>
<td>编号</td>
<td>时间</td>
<td>建议人</td>
<td>问题描述</td>
<td>建议方法</td>
</tr>
<%do while not rs.eof and not rs.bof %>
<tr>
<td><%=rs("id")%></td>
<td><%=rs("time")%></td>
<td><%=rs("name")%></td>
<td><%=rs("note")%></td>
<td><%=rs("advise")&"&nbsp;"%></td>
</tr>
<%
rs.movenext
loop
%>
<%
       set conn=nothing
       set rs=nothing
%>
</table>
<input type="submit" name="submit" value="删除全部" />
<% end if%>
<a href="question.asp" target="_self">返回</a>
<%end if%>
</form>
</div>
</body>
</html>
