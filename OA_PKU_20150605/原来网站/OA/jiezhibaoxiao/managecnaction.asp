<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>��֧��¼�鿴</title>
</head>

<body>
<%
yearN=request.Form("year1")
monthN=request.Form("month1")
numN=request.Form("num")
if numN="" or numN=0 then
numN=100
'response.Write(numN)
end if

function selected(req,reqvalue)
if req=reqvalue  then
selected=" selected"
else
selected=""
end if
end function
%>
<div align="center">
<form action="managecnaction.asp" method="post" name="f">
<select name="year1" >
<option value="����" <%=selected("����",yearN)%>>����</option>
   <% for i=2000 to 2020%>
   <option value="<%=i%>" <%=selected(i,yearN)%>><%=i%></option>
   <%next%>
</select>��
<select name="month1" >
   <option value="����" <%=selected("����",monthN)%>>����</option>
   <% for j=1 to 12%>
   <option value="<%=j%>" <%=selected(j,yearN)%>><%=j%></option>
   <%next%>
</select>��
<!--<select name="num" >
   <option value="1" <%=selected(1,CInt(numN))%>>1</option>
   <option value="2" <%=selected(2,CInt(numN))%>>2</option>
   <option value="5" <%=selected(5,CInt(numN))%>>5</option>
   <option value="10" <%=selected(10,CInt(numN))%>>10</option>
   <option value="20" <%=selected(20,CInt(numN))%>>20</option>
   <option value="50" <%=selected(50,CInt(numN))%>>50</option>
  <option value="100" <%=selected(100,CInt(numN))%>>100</option>
</select>��/ҳ-->
<input type="submit" value="��ѯ" />
</form>


<%
'����ÿҳ��ʾ������
 const MaxPerPage = 50
if not isempty(request("page")) then
currentpage=cint(request("page"))
else
currentpage=1
end if
	set conn=opendb("finance","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	if (yearN="" and monthN="") or yearN="����" then
		sql="select * from cnaction "
		str="���е���֧��¼"
	end if
	
	if yearN<>"����" and monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
		sql="select * from cnaction where  writetime>=#"&t1&"# and writetime<#"&t2&"# "
		str=t1&"----"&t2&"֮�����֧��¼"
	end if
	
	if yearN<>"����" and monthN<>"����" and yearN<>"" and monthN<>"" then
		t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		sql="select * from cnaction where  writetime>=#"&t1&"# and writetime<#"&t2&"# "
		str=t1&"----"&t2&"֮�����֧��¼"
	end if
	
	rs.open sql,conn,1,1
	response.Write("<div align=center>"&str&"</div>")
	
	  if currentpage>1 then
	  sql=request.Cookies("sqlt")
	  strb=request.Cookies("stra")
	  end if
	  'response.Write(sql)
	  if strb<>"" then
	  stra=strb
	  end if
%>
<%
totalPut=rs.recordcount
'response.Write(totalPut)
'�������ݿ�����ʾ�ĸ���
 if currentpage<1 then
     currentpage=1
 end if
 
 if (currentpage-1)*MaxPerPage>totalPut then
    if(totalPut mod MaxPerPage)=0 then
	   currentpage=totalPut\MaxPerPage
	else 
	   currentpage=totalPut\MaxPerPage+1
	end if
 end if
'��ʾ��ҳ��Ϣ
 if currentpage=1 then
    showpage totalput,MaxPerPage,"managecation.asp"
	showContent
	showpage totalput,MaxPerPage,"managecation.asp"
 else 
    if(currentpage-1)*MaxPerPage<totalPut then
	 rs.move (currentpage-1)*MaxPerPage
	 dim bookmark
	 bookmark=rs.bookmark
	 showpage totalput,MaxPerPage,"managecation.asp"
	 showContent
	 showpage totalput,MaxPerPage,"managecation.asp"
	else
	 currentpage=1
	 showpage totalput,MaxPerPage,"managecation.asp"
	 showContent
	 showpage totalput,MaxPerPage,"managecation.asp"
	end if
	rs.close
end if
%>	
<%
function showpage(totalnumber,maxperpage,filename)
dim n
    if totalnumber mod maxperpage = 0 then
	   n = totalnumber\maxperpage
	else
	   n=totalnumber\maxperpage+1
	end if
	response.Write("<p align='center'>&nbsp;")
	'����Ŀǰ��ҳ��λ�������ø�������
	if currentpage<2 then
	   response.Write "<font color='#000080'>��ҳ  ��һҳ</font>&nbsp;"
	else
	   response.Write "<a href="&filename&"?page=1>��ҳ</a>&nbsp;"
	   response.Write "<a href="&filename&"?page="&currentpage-1&">��һҳ</a>&nbsp;"
	end if
	
	if n-currentPage<1 then
	   response.Write "<font color='#000080'>��һҳ βҳ</font>"
	else 
	   response.Cookies("sqlt")=sql
	   response.Cookies("stra")=stra
	   'response.Write ("<a href="&filename&"?page="&(currentpage+1)&">")
	   response.Write ("<a href="&filename&"?page="&(currentpage+1)&">")
	   response.Write ("��һҳ</a>&nbsp;<a href="&filename&"?page="&n&">βҳ</a>")
	 end if
	 
	 response.Write "<font color='#000080'>&nbsp;ҳ�Σ�</font><strong><font color=red>"&currentPage&"</font><font color='#000080'>/"&n&"</strong>ҳ</strong></font>"
	 response.Write "<font color='#000080'>&nbsp;��<b>"&totalnumber&"</b>����¼<b>&nbsp;"&maxperpage&"</b>����¼/ҳ</font>"
end function
%>
<%
sub showContent
dim gg
gg=0	
%>
<table border=0  cellspacing="1" bgcolor="B0C8EA" width="88%">
<th colspan="5" bgcolor="D7E8F8" ><font color="#0d79b3" size="-1">�鿴���С��ֽ���֧��¼</font></th>
<tr bgcolor="D7E8F8"> 
  <td><font color="#0d79b3" size="-1">���</font></td>
  <td><font color="#0d79b3" size="-1">����ʱ��</font></td>
  <td><font color="#0d79b3" size="-1">������</font></td>
  <td><font color="#0d79b3" size="-1">ƾ֤��</font></td>
</tr>
<%
	do while not rs.eof and not rs.bof 
  %>
  
  <tr>
    
	<td><A href=seeaction.asp?id=<%=server.URLEncode(rs("id"))%>><%=rs("id")%></A></td>
	<td>&nbsp;<%=rs("writetime")%></td>
	<td>&nbsp;<%=rs("jinbanren")%></td>
	<td>&nbsp;<%=rs("pzh")%></td>
  </tr>
  <%
  gg=gg+1
  if gg>=MaxPerPage then exit Do
  rs.movenext 
  loop
  %>
</table>
<% end sub %>
</div>
</body>
</html>
