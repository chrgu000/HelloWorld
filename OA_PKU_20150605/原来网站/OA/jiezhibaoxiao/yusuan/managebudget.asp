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
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>查看项目预算</title>
</head>

<body>
<%
yearN=request.Form("year1")
monthN=request.Form("month1")
if yearN="" then yearN=year(now())
if monthN="" then monthN=month(now())
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
<form action="managebudget.asp" method="post" name="f">
<select name="year1" >
   <% for i=2010 to 2020%>
   <option value="<%=i%>" <%=selected(i,Cint(yearN))%>><%=i%></option>
   <%next%>
   <option value="99" <%=selected("99",Cint(yearN))%>>所有</option>
</select>年
<select name="month1" >
   
   <% for j=1 to 12%>
   <option value="<%=j%>" <%=selected(j,Cint(monthN))%>><%=j%></option>
   <%next%>
   <option value="99" <%=selected("99",Cint(monthN))%>>所有</option>
</select>月
<input type="submit" value="查询" />
</form>


<%
'设置每页显示的条数
 const MaxPerPage = 50
if not isempty(request("page")) then
currentpage=cint(request("page"))
else
currentpage=1
end if
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	if (yearN="" and monthN="") or yearN="所有" then
		sql="select * from accProj "
		str="所有的决算表"
	end if
	
	if yearN<>"99" and monthN="99" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
		sql="select * from accProj where  timewrite between '"&t1&"' and '"&t2&"'" 
		str=t1&"----"&t2&"之间的决算表"
	end if
	
	if yearN<>"99" and monthN<>"99" and yearN<>"" and monthN<>"" then
		t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		sql="select * from accProj where  timewrite between '"&t1&"' and '"&t2&"'" 
		str=t1&"----"&t2&"之间的决算表"
	end if
	
	if yearN="99" then
	    t1=DateSerial(2010,1,1)
		t2=DateSerial(2020,1,1)
		sql="select * from accProj where  timewrite between '"&t1&"' and '"&t2&"'" 
		str=t1&"----"&t2&"之间的决算表"
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
'设置数据库中显示的个数
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
'显示该页信息
 if currentpage=1 then
    showpage totalput,MaxPerPage,"managebudget.asp"
	showContent
	showpage totalput,MaxPerPage,"managebudget.asp"
 else 
    if(currentpage-1)*MaxPerPage<totalPut then
	 rs.move (currentpage-1)*MaxPerPage
	 dim bookmark
	 bookmark=rs.bookmark
	 showpage totalput,MaxPerPage,"managebudget.asp"
	 showContent
	 showpage totalput,MaxPerPage,"managebudget.asp"
	else
	 currentpage=1
	 showpage totalput,MaxPerPage,"managebudget.asp"
	 showContent
	 showpage totalput,MaxPerPage,"managebudget.asp"
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
	'根据目前的页数位置来设置各个链接
	if currentpage<2 then
	   response.Write "<font color='#000080'>首页  上一页</font>&nbsp;"
	else
	   response.Write "<a href="&filename&"?page=1>首页</a>&nbsp;"
	   response.Write "<a href="&filename&"?page="&currentpage-1&">上一页</a>&nbsp;"
	end if
	
	if n-currentPage<1 then
	   response.Write "<font color='#000080'>下一页 尾页</font>"
	else 
	   response.Cookies("sqlt")=sql
	   response.Cookies("stra")=stra
	   'response.Write ("<a href="&filename&"?page="&(currentpage+1)&">")
	   response.Write ("<a href="&filename&"?page="&(currentpage+1)&">")
	   response.Write ("下一页</a>&nbsp;<a href="&filename&"?page="&n&">尾页</a>")
	 end if
	 
	 response.Write "<font color='#000080'>&nbsp;页次：</font><strong><font color=red>"&currentPage&"</font><font color='#000080'>/"&n&"</strong>页</strong></font>"
	 response.Write "<font color='#000080'>&nbsp;共<b>"&totalnumber&"</b>条记录<b>&nbsp;"&maxperpage&"</b>条记录/页</font>"
end function
%>
<%
sub showContent
dim gg
gg=0	
%>
<table width="88%"  border=0  cellspacing="1" bgcolor="B0C8EA">
<th colspan="6" bgcolor="D7E8F8"><font color="#0d79b3" size="-1">查看项目预算决算表格</font></th>
<tr bgcolor="D7E8F8"> 
  <td><font color="#0d79b3" size="-1">项目编号</font></td>
  <td><font color="#0d79b3" size="-1">增加时间</font></td>
  <td><font color="#0d79b3" size="-1">项目周期</font></td>
  <td><font color="#0d79b3" size="-1">项目负责人</font></td>
  <td><font color="#0d79b3" size="-1">凭证号</font></td>
  <td><font color="#0d79b3" size="-1">状态</font></td>
</tr>
<%
	do while not rs.eof and not rs.bof 
  %>
  
  <tr bgcolor="D7E8F8"> 
    
	<td><A href=editbudget.asp?projectid=<%=server.URLEncode(rs("projectid"))%>><%=rs("projectid")%></A></td>
	<td>&nbsp;<%=rs("timewrite")%></td>
	<td>&nbsp;<%=rs("pcycle")%></td>
	<td>&nbsp;<%=rs("proLeader")%></td>
	<td>&nbsp;<%=rs("certificateNo")%></td>
	<td>&nbsp;
	<%
	set cn=opendb("symx","conn","accessdsn")
	set r=server.createobject("adodb.recordset")
	sq="select * from stage where stage="&rs("stage")
	r.open sq,cn,1,1
	if not r.bof and not r.eof then
	response.Write(r("txt"))
	end if
	set cn=nothing
	set r=nothing
	%></td>
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
