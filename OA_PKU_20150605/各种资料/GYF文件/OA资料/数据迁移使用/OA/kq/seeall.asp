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
<title>查看到款分配表</title>
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
<form action="managebudget.asp" method="post" name="f">
<select name="year1" >
<option value="所有" <%=selected("所有",yearN)%>>所有</option>
   <% for i=2000 to 2020%>
   <option value="<%=i%>" <%=selected(i,yearN)%>><%=i%></option>
   <%next%>
</select>年
<select name="month1" >
   <option value="所有" <%=selected("所有",monthN)%>>所有</option>
   <% for j=1 to 12%>
   <option value="<%=j%>" <%=selected(j,yearN)%>><%=j%></option>
   <%next%>
</select>月
<!--<select name="num" >
   <option value="1" <%=selected(1,CInt(numN))%>>1</option>
   <option value="2" <%=selected(2,CInt(numN))%>>2</option>
   <option value="5" <%=selected(5,CInt(numN))%>>5</option>
   <option value="10" <%=selected(10,CInt(numN))%>>10</option>
   <option value="20" <%=selected(20,CInt(numN))%>>20</option>
   <option value="50" <%=selected(50,CInt(numN))%>>50</option>
  <option value="100" <%=selected(100,CInt(numN))%>>100</option>
</select>条/页-->
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
	set conn=opendb("yygy","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	if (yearN="" and monthN="") or yearN="所有" then
		sql="select * from monthkqtemp "
	end if
	
	if yearN<>"所有" and monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
		sql="select * from monthkqtemp where  time between '"&t1&"' and '"&t2&"'" 
	end if
	
	if yearN<>"所有" and monthN<>"所有" and yearN<>"" and monthN<>"" then
		t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		sql="select * from monthkqtemp where  time between '"&t1&"' and '"&t2&"'" 
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
    showpage totalput,MaxPerPage,"seeall.asp"
	showContent
	showpage totalput,MaxPerPage,"seeall.asp"
 else 
    if(currentpage-1)*MaxPerPage<totalPut then
	 rs.move (currentpage-1)*MaxPerPage
	 dim bookmark
	 bookmark=rs.bookmark
	 showpage totalput,MaxPerPage,"seeall.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeall.asp"
	else
	 currentpage=1
	 showpage totalput,MaxPerPage,"seeall.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeall.asp"
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
<table width="60%" border="1" cellspacing="0" cellpadding="0"  bgcolor="D7E8F8" bordercolor="#339999">
<th colspan="5" ><font color="#0d79b3" size="-1">查看考勤记录说明</font></th>
 <tr>
	  		<td><font color="#0d79b3" size="-1">姓名</font></td>
			<td><font color="#0d79b3" size="-1">记录</font></td>
			<td><font color="#0d79b3" size="-1">填写原因</font></td>
			<td><font color="#0d79b3" size="-1">调休请假计划</font></td>
	  </tr>
<%
	do while not rs.eof and not rs.bof 
  %>
  
  <tr>
    
	        <td><%=rs("name")%></td>
			<td><%=rs("record")%></td>
			<td>&nbsp;<%=rs("reason")%></td>
			<td>&nbsp;<%=rs("otherpan")%></td>

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
