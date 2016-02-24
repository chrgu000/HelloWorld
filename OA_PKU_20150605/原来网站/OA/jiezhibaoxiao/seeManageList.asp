<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
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
'response.Write("部门是："&oabusyuserdept)
%>
<style type="text/css">
<!--
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
.style8 {color: #2b486a}
-->
</style>
</head>

<body>

<font size="-1">
<div align="center">
<table width="583"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="21"><div align="center">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="2" height="25"><span class="style2"><img src="../images/main/l3.gif" width="2" height="25"></span></td>
            <td background="../images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="21"><div align="center"><span class="style2"><img src="../images/main/icon.gif" width="15" height="12"></span></div></td>
                  <td align="left"class="style7"><font size="-1">借支模块</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<form name="form" action="seeManageList.asp" method="post">
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
<font color="#FF0000">
<%

'设置每页显示的条数
const MaxPerPage=20
if not isempty(request("page")) then
currentpage=cint(request("page"))
else
currentpage=1
end if

'set cnborr=server.CreateObject("ADODB.Connection")
'DBPath1=server.mappath("finance.mdb")
'cnborr.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
if oabusyuserlevelCode="bmjl" then
     if yearN="所有" then
	   if monthN="" then
	   sql1="select * from borrowlist where stage>1 and stage<6 and dept="&"'"&oabusyuserdept&"'"
	   end if
	   if monthN<>"" then
	   sql1="select * from borrowlist where stage>1 and stage<6 and dept="&"'"&oabusyuserdept&"'"
	   end if
	   response.Write("所有的申请")
	 end if
	 if yearN<>"所有" and yearN<>"" then
	    if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    sql1="select * from borrowlist where stage>1 and stage<6 and date>=#"&t1&"# and date<#"&t2&"#"&" and dept="&"'"&oabusyuserdept&"'"
		response.Write(yearN&"年的申请")
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    sql1="select * from borrowlist where stage>1 and stage<6 and date>=#"&t1&"# and date<#"&t2&"#"&" and dept="&"'"&oabusyuserdept&"'"
		response.Write(yearN&"年"&monthN&"月"&"的申请")
	   end if
	 end if
	
	 if yearN="" then
	   if monthN="" then
	   sql1="select * from borrowlist where stage>1 and stage<6 "&"and dept="&"'"&oabusyuserdept&"'"
	   end if
	 end if 
'sql1="select * from borrowlist where stage=2 and dept="&"'"&oabusyuserdept&"'"

end if


if oabusyuserlevelCode="DSZ" or oabusyuserlevelCode="CN" or oabusyuserlevelCode="CW" then
     if yearN="所有" then
	   if monthN="" then
	   sql1="select * from borrowlist where stage>3 and stage<9  "
	   end if
	   if monthN<>"" then
	   sql1="select * from borrowlist where stage>3 and stage<9  "
	   end if
	   response.Write("所有的申请")
	 end if
	 if yearN<>"所有" and yearN<>"" then
	    if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    sql1="select * from borrowlist where stage>3 and stage<9 and date>=#"&t1&"# and date<#"&t2&"#  "
		response.Write(yearN&"年的申请")
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    sql1="select * from borrowlist where stage>3 and stage<9 and date>=#"&t1&"# and date<#"&t2&"# "
		response.Write(yearN&"年"&monthN&"月"&"的申请")
	   end if
	 end if
	
	 if yearN="" then
	   if monthN="" then
	   sql1="select * from borrowlist where stage>3 and stage<9  "
	   end if
	 end if 
end if
rsborr.open sql1,cnborr,1,1
%>
</font>
<%
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
    showpage totalput,MaxPerPage,"seeManageList.asp"
	showContent
	showpage totalput,MaxPerPage,"seeManageList.asp"
 else 
    if(currentpage-1)*MaxPerPage<totalPut then
	 rsborr.move (currentpage-1)*MaxPerPage
	 dim bookmark
	 bookmark=rsborr.bookmark
	 showpage totalput,MaxPerPage,"seeManageList.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeManageList.asp"
	else
	 currentpage=1
	 showpage totalput,MaxPerPage,"seeManageList.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeManageList.asp"
	end if
	rsborr.close
end if
set rsborr=nothing
cnborr.close
set cnborr=nothing
%>
</div>
</font>

</body>
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
	sub showContent
	dim i
	i=0
	
	%>

<div align=center>  <form name="form1" ><table border=1 bordercolor=black cellpadding=1 cellspacing=0 >
<table   border="1" cellpadding="1" cellspacing="0">
<tr bgcolor="D7E8F8"><td ><font color="#0d79b3">申请人</font></td><td><font color="#0d79b3">部门</font></td><td ><font color="#0d79b3">部门负责人</font></td>
<td><font color="#0d79b3">申请时间</font></td>
<!--<td align=center><font color="#0d79b3">借款日期</tfont></td><td align=center><font color="#0d79b3">还款日期</font></td>-->
<td align=center><font color="#0d79b3">金额(元)</font></td>
<td><font color="#0d79b3">状态</font></td></tr>
<%
moneySum=0
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
	'if rsborr("dept")<>"综合管理部" then
    sql="select * from userinf where userdept='"&rsborr("dept")&"' and levelCode='BMJL'"
	'else
	' sql="select * from userinf where userdept='"&rsborr("dept")&"'"
	'end if
    rs.open sql,conn,1,1
%>
	<td align=center>	
	<%=rs("username")%>
	</td>
	<td align=center><%response.Write(formatdatetime(rsborr("date"),1))%></td>
	<!--<td align=center><%=rsborr("borrowTime")%></td>
	<td align=center><%=rsborr("repayTime")%></td>-->
	<td align=center><%=rsborr("money")%><%moneySum=moneySum+rsborr("money")%></td>
	<% 
	set conn2=server.CreateObject("ADODB.Connection")
    DBPath2=server.mappath("finance.mdb")
    conn2.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath2
    set rs2=server.CreateObject("adodb.recordset")
    sql2="select * from stage where stage="&rsborr("stage")
    rs2.open sql2,conn2,1,1
    %>
	<td align=center><%=rs2("txt")%></td>
	<td align=center>
  <a href=viewBorr.asp?id=<%response.Write(rsborr("id"))%> target="_blank">查看</a>
  </td></tr>
<%
i=i+1
if i>=MaxPerPage then exit Do
rsborr.movenext
loop
%>
<tr><td colspan="4">合计<td colspan="2"><%=moneySum%>元</td></td></tr>
</table></from></div>
<% end sub %>
</html>
