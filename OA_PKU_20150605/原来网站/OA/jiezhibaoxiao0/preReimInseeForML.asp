<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	end if
Tnow=year(now)&"年"&month(now)&"月"&day(now)&"日"
content=request("content")
content1=request("content1")
strn=split(content1,",")
Sn= UBound(strn)
'response.Write(session("content"))
money=request("money")
 
 function showmsg(msg)
   response.write "<SCRIPT language=javascript>"
   response.write "alert('"&msg&"');window.history.go(-1);"
   response.write "</script>"
end function

%>
</head>
<body>
<div align="center">
<form name="form" action="confirmReimForMil.asp" method="post">
<table width="100%"   cellpadding="0" cellspacing="0" border="1"> 
<tr><th colspan="6">报销单</th></tr>
<!--<tr><td>报销人</td><td colspan="2"><input type="text" name="claimant" value="<%response.Write(oabusyusername)%>"></td><td>部门</td><td colspan="2"><input type="text" name="dept" value="<%response.Write(oabusyuserdept)%>"></td></tr>-->
<tr><td>分配部门金额</td><td colspan="5">
<!--<input type="checkbox" name="deptarr" value="产品部">产品部
<input type="checkbox" name="deptarr" value="工程部">工程部
<input type="checkbox" name="deptarr" value="教育培训部">教育培训部
<input type="checkbox" name="deptarr" value="业务发展部">业务发展部
<input type="checkbox" name="deptarr" value="综合管理部">综合管理部
<input type="checkbox" name="deptarr" value="四川基地">四川基地-->
<%	   
       'set conn=server.CreateObject("adodb.connection")
	   'path=server.mappath("../db/lmtof.mdb")
	   'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
	   set conn=opendb("lmtof","conn","sql")
	   sql="select * from dept_old "
	   set rs=server.CreateObject("adodb.recordset")
	   rs.open sql,conn,1,1
	   do while not rs.eof    
%>
<%=rs("dept")%><input type="text" name="deptarrMoney" size="6" value=0>
<%
rs.movenext
loop
%>
</td></tr>
<tr><td colspan="2">报销日期</td><td colspan="2"><input type="text" name="date" value="<%response.Write(Tnow)%>"></td>
<td colspan="1">财务人员</td>
<td>
    <select name="finance" size="1">
	<%
	function selected(req,reqvalue)
    if req=reqvalue then
    selected=" selected"
    else
    selected=""
    end if
    end function
	
	   'set conn=server.CreateObject("adodb.connection")
	   'path=server.mappath("../db/lmtof.mdb")
	   'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
	   set conn=opendb("lmtof","conn","sql")
	   sql="select * from userinf where userlevel like '财务主管' "
	   set rs=server.CreateObject("adodb.recordset")
	   rs.open sql,conn,1,1
	   do while not rs.eof 
	%>
	<option value="<%=rs("name")%>"    <%=selected(rs("name"),finance)%>><%=rs("name")%></option>
	<% 
	rs.movenext
	loop
	%>
	</select>
</td>

</tr>
<tr>
<table  width="100%"  cellpadding="0" cellspacing="0" border="1">
<tr><td>发生日期</td><td>项目编号</td><td>摘要</td><td>备注</td><td>单据张数</td><td>金额(元)</td></tr>

<%
str1=split(content,",")
str2=split(content1,",")
n= UBound(str1)
t= round((n+1) / 6)

billC1=0
moneyT1=0

for j=0 to t-1
response.Write("<tr>")
for m=0 to 5
%>
<td>
<%if m=0 then%>
<input type="text" name="content" value="<%=trim((str1(j*6+m)))&trim((str1(j*6+m+1)))&trim((str1(j*6+m+2)))%>" />
<%end if%>
<%if m>0 and m<4 then%>
<input type="text" name="content" value="<%=trim((str1(j*6+m+2)))%>" />
<%end if%>


<%if m=4 then%>
<input type="text" name="content" value="<%=trim((str2(j*2)))%>" />
<%
   if not IsNumeric(str2(j*2)) then
     mst="单据张数不为数字！"
 	'showmsg(mst)
   end if
   if IsNumeric(str2(j*2)) then
     if str2(j*2)=" " then 
 	msg="单据张数不能为空"
 	'showmsg(msg)
 	end if
     if str2(j*2)<>"" then
 	 billC1=billC1+trim((str2(j*2)))
     end if
	end if
  
 'billC1=billC1+trim((str2(j*2)))
end if
%>
<%if m=5 then%>
<input type="text" name="content" value="<%=trim((str2(j*2+1)))%>" />
<%
  if not IsNumeric(str2(j*2+1)) then
     mst="单据张数不为数字！"
 	'showmsg(mst)
   end if
   if IsNumeric(str2(j*2+1)) then
     if str2(j*2+1)=" " then 
 	msg="单据张数不能为空"
 	'showmsg(msg)
 	end if
     if str2(j*2+1)<>"" then
 	 moneyT1=moneyT1+trim((str2(j*2+1)))
     end if
	end if

   'moneyT1=moneyT1+trim((str2(j*2+1)))
end if
%>
</td>
<%
next
response.Write("</tr>")
next
%>
</tr>
<tr><td colspan="4">合计</td><td ><input type="text" name="chittySum" value="<%=billC1%>" /></td><td><input type="text" name="money" value="<%=moneyT1%>"/></td>
</tr>
</table>
</table>
<input type="submit" value="确认提交"  />
</form>
<table>
<tr>
<td>
</td>
<td>
<form  name="form2" action="tempInstoreReimForMil.asp">

<%
for j=0 to t-1
'response.Write("<br >")
for m=0 to 5
billC2=0
moneyT2=0
if m=0 then
%>
<input type="hidden" name="content" value="<%=trim((str1(j*6+m)))&trim((str1(j*6+m+1)))&trim((str1(j*6+m+2)))%>" />
<%end if%>
<%if m>0 and m<4 then%>
<input type="hidden" name="content" value="<%=trim((str1(j*6+m+2)))%>" />
<%end if%>
<%if m=4 then%>
<input type="hidden" name="content" value="<%=trim((str2(j*2)))%>" />
<%
   if not IsNumeric(str2(j*2)) then
     mst="单据张数不为数字！"
 	'showmsg(mst)
   end if
   if IsNumeric(str2(j*2)) then
     if str2(j*2)=" " then 
 	msg="单据张数不能为空"
 	'showmsg(msg)
 	end if
     if str2(j*2)<>"" then
 	 billC2=billC2+trim((str2(j*2)))
     end if
	end if
  
 'billC1=billC1+trim((str2(j*2)))
end if
%>
<%if m=5 then%>
<input type="hidden" name="content" value="<%=trim((str2(j*2+1)))%>" />
<%
  if not IsNumeric(str2(j*2+1)) then
     mst="单据张数不为数字！"
 	'showmsg(mst)
   end if
   if IsNumeric(str2(j*2+1)) then
     if str2(j*2+1)=" " then 
 	msg="单据张数不能为空"
 	'showmsg(msg)
 	 end if
     if str2(j*2+1)<>"" then
 	 moneyT2=moneyT2+trim((str2(j*2+1)))
     end if
   end if

   'moneyT1=moneyT1+trim((str2(j*2+1)))
end if
%>
<%
next
next
%>
<input type="hidden" name="chittySum" value="<%=billC1%>" />
<input type="hidden" name="money" value="<%=moneyT1%>"/>
<%	   'set connTe=server.CreateObject("adodb.connection")
	   'pathTe=server.mappath("../db/lmtof.mdb")
	   'connTe.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathTe
	   set connTe=opendb("lmtof","conn","sql")
	   sqlTe="select * from userinf where userlevel='财务'"
	   set rsTe=server.CreateObject("adodb.recordset")
	   rsTe.open sqlTe,connTe,1,1
	   if not rsTe.eof then
	   %>
	   <input type="hidden" name="finance" value="<%=rsTe("username")%>"/>
	   <%end if%>
<!--<input type="submit" value="暂存" />-->
</form>
</td>
<td>
<form action="mainReim.asp" name="form3">
<input type="button" value="关闭" onclick="javascript:window.close();"/>
</form>
</td>
</form>
</tr>
</table>
<!--<a href=javascript:history.back()>Go back</a>-->
</div>
</body>
</html>
