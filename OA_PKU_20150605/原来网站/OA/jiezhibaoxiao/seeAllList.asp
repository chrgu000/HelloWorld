<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>seeAll</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
yearN=request.Form("year1")
monthN=request.Form("month1")
deptN=request.Form("dept")

function selected(req,reqvalue)
if req=reqvalue then
selected=" selected"
else
selected=""
end if
end function
%>
</head>

<body>
<font size="-1">
<!--#include file="../asp/checked.asp"-->
<div align="center">
<form  name="form" action="seeAllList.asp" method="post">
部门
<select name="dept" size="1">
<option vlue="所有部门"  <%=selected("所有部门",dept)%>>所有部门</option>
<option vlue="产品部"    <%=selected("产品部",dept)%>>产品部</option>
<option vlue="工程部"    <%=selected("工程部",dept)%>>工程部</option>
<option vlue="综合管理部" <%=selected("综合管理部",dept)%>>综合管理部</option>
<option vlue="业务发展部"     <%=selected("业务发展部",dept)%>>业务发展部</option>
<option vlue="教育培训部"     <%=selected("教育培训部",dept)%>>教育培训部</option>
<option vlue="四川基地"   <%=selected("四川基地",dept)%>>四川基地</option>
<option vlue="研发部"      <%=selected("研发部",dept)%>>研发部</option>
<option vlue="时空信息技术培训部"      <%=selected("时空信息技术培训部",dept)%>>时空信息技术培训部</option>
</select>
日期
<select name="year1" size="1">
<option vlue="所有" <%=selected("所有",year1)%>>所有
<%for i=2009 to 2019%>
<option vlue="<%response.Write(i)%>" <%=selected(i,year1)%>><%response.Write(i)%></option>
<%next%>
</select>
年
<select name="month1" size="1">
<option vlue="全年" >
<%for j=1 to 12%>
<option vlue="<%response.Write(j)%>" <%=selected(j,month1)%>><%response.Write(j)%></option>
<%next%>
</select>
月
<input type="submit"  value="查询" />
</form>
</div>
<div align="center">
<form name="form1">
<font color="#FF0000">
<%
'设置每页显示的条数
const MaxPerPage=20
if not isempty(request("page")) then
currentpage=cint(request("page"))
else
currentpage=1
end if

'打开数据库
'set cnborr=server.CreateObject("ADODB.Connection")
'DBPath1=server.mappath("finance.mdb")
'cnborr.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
  if deptN="所有部门" then 
     if yearN="所有" then
	   sql1="select * from borrowlist where stage>1 and stage<8 and finance="&"'"&oabusyusername&"'"
	   response.Write("所有的申请")
	 end if
	 if yearN<>"所有" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    sql1="select * from borrowlist where stage>1 and stage<8 and date>=#"&t1&"# and date<#"&t2&"# and finance="&"'"& oabusyusername&"'"
		response.Write(deptN&yearN&"年的申请")
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    sql1="select * from borrowlist where stage>1 and stage<8 and date>=#"&t1&"# and date<#"&t2&"# and finance="&"'"& oabusyusername&"'"
		response.Write(deptN&yearN&"年"&monthN&"月"&"的申请")
	   end if
	 end if
  end if
  
  if deptN<>"所有部门"  and deptN<>"" then 
     if yearN="所有" then
	   sql1="select * from borrowlist where stage>1 and stage<8 and dept="&"'"&deptN&"' and finance="&"'"&oabusyusername&"'"
	   response.Write(deptN&yearN&"年的申请")
	 end if
	 if yearN<>"所有" and yearN<>"" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    sql1="select * from borrowlist where stage>1 and stage<8 and date>=#"&t1&"# and date<#"&t2&"# and dept="&"'"&deptN&"' and finance="&"'"&oabusyusername&"'"
		response.Write(deptN&yearN&"年的申请")
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    sql1="select * from borrowlist where stage>1 and stage<8 and date>=#"&t1&"# and date<#"&t2&"# and dept="&"'"&deptN&"' and finance="&"'"&oabusyusername&"'"
		response.Write(deptN&yearN&"年"&monthN&"月"&"的申请")
	   end if
	 end if
  end if
  
  if deptN="" then
     if yearN="" then
	   if monthN="" then
	   sql1="select * from borrowlist where stage>1 and stage<8 and finance="&"'"&oabusyusername&"'"
	   end if
	 end if
  end if
 %>	   
</font>	
<%
rsborr.open sql1,cnborr,1,1

totalPut=rsborr.recordcount
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
    showpage totalput,MaxPerPage,"seeAllList.asp"
	showContent
	showpage totalput,MaxPerPage,"seeAllList.asp"
 else 
    if(currentpage-1)*MaxPerPage<totalPut then
	 rsborr.move (currentpage-1)*MaxPerPage
	 dim bookmark
	 bookmark=rsborr.bookmark
	 showpage totalput,MaxPerPage,"seeAllList.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeAllList.asp"
	else
	 currentpage=1
	 showpage totalput,MaxPerPage,"seeAllList.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeAllList.asp"
	end if
	rsborr.close
end if
set rsborr=nothing
cnborr.close
set cnborr=nothing
%>
</div>

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
	   response.Write ("<a href="&filename&"?page="&(currentpage+1)&">")
	   response.Write ("下一页</a>&nbsp;<a href="&filename&"?page="&n&">尾页</a>")
	 end if
	 
	 response.Write "<font color='#000080'>&nbsp;页次：</font><strong><font color=red>"&currentPage&"</font><font color='#000080'>/"&n&"</strong>页</strong></font>"
	 response.Write "<font color='#000080'>&nbsp;共<b>"&totalnumber&"</b>条记录<b>&nbsp;"&maxperpage&"</b>条记录/页</font>"
end function
%>

<%
    moneySum=0
	billSum=0
	sub showContent
	dim i
	i=0
	
	%>

<div align=center>  <form name="form1" ><table border=1  cellpadding=0 cellspacing=0 >
<tr  bgcolor="D7E8F8" bordercolor="#339999"><td ><font color="#0d79b3">申请人</font></td><td><font color="#0d79b3">部门</font></td><td ><font color="#0d79b3">部门负责人</font></td><td align=center><font color="#0d79b3">借款日期</font></td><td align=center><font color="#0d79b3">还款日期</font></td><td align=center><font color="#0d79b3">金额(元)</font></td><td><font color="#0d79b3">状态</font></td><td align=center>&nbsp;&nbsp;</td></tr>
<%
do while not rsborr.eof  
 %>

  <input type="hidden"  name="id" value="<%=rsborr("id")%>"/>
  <tr><td align=center><%=rsborr("borrower")%></td>
  <td align=center><%=rsborr("dept")%></td>
  <% 
	
	'set conn=server.CreateObject("ADODB.Connection")
    'DBPath=server.mappath("../db/lmtof.mdb")
    'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath
	set conn=opendb("lmtof","conn","sql")
    set rs=server.CreateObject("adodb.recordset")
    sql="select * from userinf where userdept='"&rsborr("dept")&"' and userlevel='部门经理'"
    rs.open sql,conn,1,1
%>
	<td align=center>
	<%=rs("username")%>
	
	</td>
	<td align=center><%response.Write(formatdatetime(rsborr("borrowTime"), 1))%></td>
	<td align=center><%response.Write(formatdatetime(rsborr("repayTime"), 1))%></td>
	<td align=center><%=rsborr("money")%><%moneySum=moneySum+rsborr("money")%></td>
	<% 
	'set conn2=server.CreateObject("ADODB.Connection")
    'DBPath2=server.mappath("finance.mdb")
    'conn2.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath2
	set conn2=opendb("finance","conn","sql")
    set rs2=server.CreateObject("adodb.recordset")
    sql2="select * from stage where stage="&rsborr("stage")
    rs2.open sql2,conn2,1,1
    %>
	<td align=center><%=rs2("txt")%></td>
	<td align=center>
  <a href=viewBorr.asp?id=<%response.Write(rsborr("id"))%>>查看</a>
  </td></tr>
  
<%
i=i+1
if i>=MaxPerPage then exit Do
rsborr.movenext
loop
%>
<tr><td colspan="5">合计<td><%=moneySum%>元</td><td></td><td></td></tr>
</table></from></div>
<% end sub %>
<%
function getsql(deptN,yearN,monthN)
  if deptN="所有部门" then 
     if yearN="所有" then
	   response.Write("select * from borrowlist where stage>1 and stage<6")
	 end if
	 if yearN<>"所有" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    response.Write("select * from borrowlist where stage>1 and stage<6 and date>"&t1&"and date<"&t2)
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    response.Write("select * from borrowlist where stage>1 and stage<6 and date>"&t1&"and date<"&t2)
	   end if
	 end if
  end if
  
  if deptN<>"所有部门" then 
     if yearN="所有" then
	   response.Write("select * from borrowlist where stage>1 and stage<6 and dept="&deptN)
	 end if
	 if yearN<>"所有" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    response.Write("select * from borrowlist where stage>1 and stage<6 and date>"&t1&"and date<"&t2&"and dept="&deptN)
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    response.Write("select * from borrowlist where stage>1 and stage<6 and date>"&t1&"and date<"&t2&"and dept="&deptN)
	   end if
	 end if
  end if
 end function
%>
</form>
</font>
</body>
</html>
