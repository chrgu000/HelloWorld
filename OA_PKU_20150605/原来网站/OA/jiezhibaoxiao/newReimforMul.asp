<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>�����µĻ�ϱ���</title>
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
Tnow=year(now)&"��"&month(now)&"��"&day(now)&"��"
%>
</head>
<body>
<div align="center">


<!--<table>
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td>���</td>
<td>���</td>
<td>��ϸ˵��</td>
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
     <td><font color="#0d79b3" size="-1">��������</font></td>
     <td><font color="#0d79b3" size="-1">��Ŀ���</font></td>
     <td ><font color="#0d79b3" size="-1">ժҪ</font></td>
     <td><font color="#0d79b3" size="-1">��ע</font><font color="red" size="-1">������30��</font></td>
     <td><font color="#0d79b3" size="-1">��������</font></td>
     <td><font color="#0d79b3" size="-1">���</font></td>
</tr>
<%for g=1 to 1%>
<tr bgcolor="D7E8F8" bordercolor="#339999">
	     <!--<input type="hidden" name=content value=<%=g%> />-->
     <td>
	     <select name=content size=1> 
	     <% for i=2009 to 2020 %><option value=<%response.Write(i)&"��"%><%=selected(i,content)%>><%response.Write(i)&"��"%></option><% next %>
		 </select>
	     <select name=content size=1>
		 <% for j=1 to 12 %><option value=<%response.Write(j)&"��"%><%=selected(i,content)%>><%response.Write(j)&"��"%></option><% next %>
		 </select>
		 <select name=content size=1>
		 <% for k=1 to 31 %><option value=<%response.Write(k)&"��"%><%=selected(i,content)%>><%response.Write(k)&"��"%></option><% next %>
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
	     <select name=content ><option value=���>1 ���<option value=�칫��Ʒ�� >2 �칫��Ʒ�� <option value=�������ӷ�>3 �������ӷ�<option value=���÷�>4 ���÷�<option value=�ʷ�>5 �ʷ�<option value=ͨѶ��>6 ͨѶ��<option value=������>7 ������<option value=�Ĳķ�>8 �Ĳķ�<option value=��������>9 ����<option value=����>10 ����<option value=�����>11 �����</select>
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
<input type="submit" value="ȷ��"/>

</form>
</div>
</body>
</html>
