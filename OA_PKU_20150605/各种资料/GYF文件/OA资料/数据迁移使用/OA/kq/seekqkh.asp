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
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='../default.asp';")
	response.write("</script>")
	response.end
end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>�鿴���ڿ���</title>
</head>

<body>
<%
yearN=request.Form("year1")
monthN=request.Form("month1")
numN=request.Form("num")
if yearN="" then yearN=year(now())
if monthN="" then monthN=month(now())
if numN="" or numN=0 then
numN=100
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
<form action="seekqkh.asp" method="post" name="f">
<select name="year1" >
   <% for i=2010 to 2020%>
   <option value="<%=i%>" <%=selected(i,Cint(yearN))%>><%=i%></option>
   <%next%>
   <option value="99" <%=selected(99,Cint(yearN))%>>����</option>
</select>��
<select name="month1" >
   
   <% for j=1 to 12%>
   <option value="<%=j%>" <%=selected(j,Cint(monthN))%>><%=j%></option>
   <%next%>
   <option value="99" <%=selected(99,Cint(monthN))%>>����</option>
</select>��
<input type="submit" value="��ѯ" />
</form>


<%
'����ÿҳ��ʾ������
 const MaxPerPage = 10
if not isempty(request("page")) then
currentpage=cint(request("page"))
else
currentpage=1
end if
	set conn=opendb("yygy","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	if (yearN="" and monthN="") or yearN="99" then
		sql="select * from monthkq "
	end if
	
	if yearN<>"99" and monthN="99" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
		sql="select * from monthkq where time between '"&t1&"' and '"&t2&"'" 
	end if
	
	if yearN<>"99" and monthN<>"99" and yearN<>"" and monthN<>"" then
		t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		sql="select * from monthkq where  time between '"&t1&"' and '"&t2&"'" 
	end if
	On Error Resume Next
	rs.open sql,conn,1,1
	response.Write("<div align=center>"&str&"</div>")
	
	  if currentpage>1 then
	  sql=request.Cookies("sqlt")
	  strb=request.Cookies("stra")
	  end if
	  if strb<>"" then
	  stra=strb
	  end if
%>
<%
totalPut=rs.recordcount
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
    showpage totalput,MaxPerPage,"seekqkh.asp"
	showContent
	showpage totalput,MaxPerPage,"seekqkh.asp"
 else 
    if(currentpage-1)*MaxPerPage<totalPut then
	 rs.move (currentpage-1)*MaxPerPage
	 dim bookmark
	 bookmark=rs.bookmark
	 showpage totalput,MaxPerPage,"seekqkh.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seekqkh.asp"
	else
	 currentpage=1
	 showpage totalput,MaxPerPage,"seekqkh.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seekqkh.asp"
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
<table width="95%" border="1" cellspacing="0" cellpadding="0"  bgcolor="D7E8F8" bordercolor="#339999">
<th colspan="5" ><font color="#0d79b3" size="-1">�鿴���ڼ�¼˵��</font></th>
 <tr>
	  		<td><font color="#0d79b3" size="-1">����</font></td>
			<td><font color="#0d79b3" size="-1">��¼</font></td>
			<td><font color="#0d79b3" size="-1">��дԭ��</font></td>
			<td><font color="#0d79b3" size="-1">�������</font></td>
	  </tr>
<%
	do while not rs.eof and not rs.bof 
  %>
  
  <tr>
    
	        <td><%=rs("name")%></td>
			<td><%=rs("record")%></td>
			<td>&nbsp;<%=rs("reason")%></td>
			<td>&nbsp;<%=rs("deptview")%></td>

  </tr>
  <%
  gg=gg+1
  if gg>=MaxPerPage then exit Do
  rs.movenext 
  loop
  if rs.eof and rs.bof then
  response.Write("<tr><td colspan=5>��������</td></tr>")
  end if
  %>
</table>
<% end sub %>
</div>
</body>
</html>
