<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>创建新的混合报销</title>
<%
'oabusyname=request.cookies("oabusyname")
'oabusyusername=request.cookies("oabusyusername")
'oabusyuserdept=request.cookies("oabusyuserdept")
'oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
function selected(req,reqvalue)
if req=reqvalue then
selected=" selected"
else
selected=""
end if
end function
Tnow=year(now)&"年"&month(now)&"月"&day(now)&"日"
%>
</head>
<body>
<div align="center">


<!--<table>
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td>编号</td>
<td>类别</td>
<td>详细说明</td>
</tr>-->
<%
'set connCT=opendb("CostType","conn","sql")
'set rsCT=server.CreateObject("adodb.recordset")
'sqlCT="select * from costtype "
'rsCT.open sqlCT,connCT,1,1
%>
<%'do  while not rsCT.eof  %>
<!--<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><%'=rsCT("id")%></td>
<td><%'=rsCT("type")%></td>
<td><%'=rsCT("content")%></td>
</tr>-->
<%
'rsCT.movenext
'loop
'set rsCT=nothing
%>
<!--</table>-->





<form name="form" method="post" action="preReimInseeForML.asp">
<table width="96%">
  <tr bgcolor="D7E8F8" bordercolor="#339999">
     <td><font color="#0d79b3" size="-1">发生日期</font></td>
     <td><font color="#0d79b3" size="-1">项目编号</font></td>
     <td ><font color="#0d79b3" size="-1">摘要</font></td>
     <td><font color="#0d79b3" size="-1">备注</font><font color="red" size="-1">字数在30内</font></td>
     <td><font color="#0d79b3" size="-1">单据张数</font></td>
     <td><font color="#0d79b3" size="-1">金额</font></td>
</tr>
<%for g=1 to 1%>
<tr bgcolor="D7E8F8" bordercolor="#339999">
	     <!--<input type="hidden" name=content value=<%=g%> />-->
     <td>
	     <select name=content size=1> 
	     <% for i=2009 to 2020 %><option value=<%response.Write(i)&"年"%><%=selected(i,content)%>><%response.Write(i)&"年"%></option><% next %>
		 </select>
	     <select name=content size=1>
		 <% for j=1 to 12 %><option value=<%response.Write(j)&"月"%><%=selected(i,content)%>><%response.Write(j)&"月"%></option><% next %>
		 </select>
		 <select name=content size=1>
		 <% for k=1 to 31 %><option value=<%response.Write(k)&"日"%><%=selected(i,content)%>><%response.Write(k)&"日"%></option><% next %>
		 </select>
	 </td>
	 <td>
	     <%
		   set conn=opendb("GFProjectType","conn","sql")
           set rs=server.CreateObject("adodb.recordset")
           sql="select * from projectType where dept="&"'"&oabusyuserdept&"'"
           rs.open sql,conn,1,1
         %>
	     <select name=content size=1>
		    <%do  while not rs.eof  %>
			    <option value=<%=rs("projectId")%> <%=selected(rs("projectId"),content)%>><%=rs("projectId")%><%=rs("projectName")%></option>
			<%
		        rs.movenext
		        loop
		        set rs=nothing
		     %>
			    <option>------------------------</option>
		<%
		  set conn=opendb("GFProjectType","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from projectType where dept<>"&"'"&oabusyuserdept&"'"
          rs.open sql,conn,1,1
       %>
	        <%do  while not rs.eof  %>
			     <option value=<%=rs("projectId")%> <%=selected(rs("projectId"),content)%>><%=rs("projectId")%><%=rs("projectName")%></option>
			<%
		     rs.movenext
		     loop
		     set rs=nothing
		    %>
	   </select>
	 </td>
	 <td>
	     <select name=content ><option value=活动费>1 活动费<option value=办公用品费 >2 办公用品费 <option value=本市运杂费>3 本市运杂费<option value=差旅费>4 差旅费<option value=邮费>5 邮费<option value=通讯费>6 通讯费<option value=宣传费>7 宣传费<option value=耗材费>8 耗材费<option value=其他费用>9 其他<option value=工资>10 工资<option value=劳务费>11 劳务费</select>
	 </td>
	 <td>
	      <textarea name="content" cols=20 rows="4" size=11 value="&nbsp;" >&nbsp;&nbsp;</textarea>
	 </td>
	 <td>
	     <input type=text name="content1" size=4 value=0 />
	 </td>
	 <td>
	     <input type=text name="content1" size=6 value=0 />
	 </td>
</tr>
<%next%>
</table>
<input type="submit" value="确认"/>

</form>
</div>
</body>
</html>
