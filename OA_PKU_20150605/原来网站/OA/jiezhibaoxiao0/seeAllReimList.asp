<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>需处理的处理报销单查看</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername=""  then 
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
<form  name="form" action="seeAllReimList.asp" method="post">

部门
<select name="dept" size="1">
<option vlue="所有部门"  <%=selected("所有部门",dept)%>>所有部门</option>
<option vlue="产品部"    <%=selected("产品部",dept)%>>产品部</option>
<option vlue="工程部"    <%=selected("工程部",dept)%>>工程部</option>
<option vlue="综合管理部" <%=selected("综合管理部",dept)%>>综合管理部</option>
<option vlue="业务发展部"     <%=selected("业务发展部",dept)%>>业务发展部</option>
<option vlue="教育培训部"     <%=selected("教育培训部",dept)%>>教育培训部</option>
<option vlue="四川基地"   <%=selected("四川基地",dept)%>>四川基地</option>
<option vlue="其他部门"      <%=selected("其他",dept)%>>其他部门</option>
</select>

日期
<select name="year1" size="1">
<option vlue="所有" <%=selected("所有",year1)%>>所有</option>
<%for i=2009 to 2019%>
<option vlue="<%response.Write(i)%>" <%=selected(i,year1)%>><%response.Write(i)%></option>
<%next%>
</select>
年
<select name="month1" size="1">
<option vlue="全年" ></option>
<%for j=1 to 12%>
<option vlue="<%response.Write(j)%>" <%=selected(j,month1)%>><%response.Write(j)%></option>
<%next%>
</select>
月
<input type="submit"  value="查询" />
</form>

<font color="#FF0000">
<%
'设置每页显示的条数
const MaxPerPage=20
if not isempty(request("page")) then
currentpage=cint(request("page"))
else
currentpage=1
end if

'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")

if deptN="所有部门" then 
     if yearN="所有" then
	   sql1="select * from reimbursementlist where (stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"')"
	   response.Write("所有的申请")
	 end if
	 if yearN<>"所有" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    sql1="select * from reimbursementlist where ((stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"'))  and date>=#"&t1&"# and date<#"&t2&"# and  finance="&"'"&oabusyname&"'"
		response.Write(deptN&yearN&"年的申请")
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    sql1="select * from reimbursementlist where ((stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"'))  and date>=#"&t1&"# and date<#"&t2&"# and  finance="&"'"&oabusyname&"'"
		response.Write(deptN&yearN&"年"&monthN&"月"&"的申请")
	   end if
	 end if
  end if
  
  if deptN<>"所有部门"  and deptN<>"" then 
     if yearN="所有" then
	   sql1="select * from reimbursementlist where  ((stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"'))  and dept="&"'"&deptN&"' and  finance="&"'"&oabusyname&"'"
	   response.Write(deptN&yearN&"年的申请")
	 end if
	 if yearN<>"所有" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    sql1="select * from reimbursementlist where ((stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"'))  and date>=#"&t1&"# and date<#"&t2&"# and dept="&"'"&deptN&"' and  finance="&"'"&oabusyname&"'"
		response.Write(deptN&yearN&"年的申请")
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    sql1="select * from reimbursementlist where ((stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"'))  and date>=#"&t1&"# and date<#"&t2&"# and dept="&"'"&deptN&"' and  finance="&"'"&oabusyname&"'"
		response.Write(deptN&yearN&"年"&monthN&"月"&"的申请")
	   end if
	 end if
  end if
  
  if deptN="" then
     if yearN="" then
	   if monthN="" then
	   sql1="select * from reimbursementlist where (stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"')"
	   end if
	 end if
  end if


'sql="select * from reimbursementlist where stage > 1 and  stage < 6"
rs.open sql1,conn,1,1
%>
</font>
</div>
<%
'set connItem=server.CreateObject("adodb.connection")
'pathItem=server.MapPath("finance.mdb")
'connItem.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathItem
set connItem=opendb("finance","conn","sql")
set rsItem=server.CreateObject("adodb.recordset")
sqlItem="select * from reimburseItem " 
rsItem.open sqlItem,connItem,1,1

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
    showpage totalput,MaxPerPage,"seeAllReimList.asp"
	showContent
	showpage totalput,MaxPerPage,"seeAllReimList.asp"
 else 
    if(currentpage-1)*MaxPerPage<totalPut then
	 rs.move (currentpage-1)*MaxPerPage
	 dim bookmark
	 bookmark=rs.bookmark
	 showpage totalput,MaxPerPage,"seeAllReimList.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeAllReimList.asp"
	else
	 currentpage=1
	 showpage totalput,MaxPerPage,"seeAllReimList.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeAllReimList.asp"
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
	   response.Write ("<a href="&filename&"?page="&(currentpage+1)&">")
	   response.Write ("下一页</a>&nbsp;<a href="&filename&"?page="&n&">尾页</a>")
	 end if
	 
	 response.Write "<font color='#000080'>&nbsp;页次：</font><strong><font color=red>"&currentPage&"</font><font color='#000080'>/"&n&"</strong>页</strong></font>"
	 response.Write "<font color='#000080'>&nbsp;共<b>"&totalnumber&"</b>条记录<b>&nbsp;"&maxperpage&"</b>条记录/页</font>"
end function
%>
<%
    moneySumCount=0
	billSumCount=0
sub showContent
dim i
i=0	
%>
<div align="center">
<table border="1" cellpadding="1" cellspacing="0">
<tr  bgcolor="D7E8F8" bordercolor="#339999"><td><font color="#0d79b3">报销人</font></td><td><font color="#0d79b3">部门</font></td><td><font color="#0d79b3">报销日期</font></td><td><font color="#0d79b3">报销总金额(元)</font></td><td><font color="#0d79b3">单据总数</font></td><td><font color="#0d79b3">报销进程</font></td><td>&nbsp;</td></tr>
<%do while not rs.eof %>
<tr><td><%=rs("claimant")%></td><td><%=rs("dept")%></td><td><%response.Write(formatdatetime(rs("reimburseDate"), 1))%></td><td><%=rs("moneySum")%><%moneySumCount=moneySumCount+rs("moneySum")%></td><td><%=rs("chittySum")%><%billSumCount=billSumCount+Cint(rs("chittySum"))%></td>
<td>
<%
'set connTS=server.CreateObject("adodb.connection")
'pathTS=server.MapPath("finance.mdb")
'connTS.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathTS
set connTS=opendb("finance","conn","sql")
set rsTS=server.CreateObject("adodb.recordset")
sqlTS="select * from stage where stage="&rs("stage")
rsTS.open sqlTS,connTS,1,1
%>
<%=rsTS("txt")%>
</td><td><a href=ViewReim.asp?id=<%=rs("id")%>>查看</a></td></tr>
<%
i=i+1
if i>=MaxPerPage then exit Do
 rs.movenext 
loop %>
<tr><td colspan="3">合计</td><td><%=moneySumCount%>元</td><td><%=billSumCount%>张</td><td></td><td></td></tr>
</table>
</div>
<% end sub %>
<br>
</font>
</body>
</html>
