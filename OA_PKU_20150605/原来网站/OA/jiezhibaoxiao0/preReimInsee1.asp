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
'content=content+","+content1
'session("content")=content
'response.Write(session("content"))
money=request("money")
str1=split(content,",")
n= UBound(str1) 

k= round((n+1) / 8)
for z=0 to k-1
for y=0 to 5

 if y=4 then 
  if not IsNumeric(str1(z*8+y+2)) then
    mst="单据张数不为数字！"
	showmsg(mst)
  end if
  if IsNumeric(str1(z*8+y+2)) then
    if str1(z*8+y+2)=" " then 
	msg="单据张数不能为空"
	showmsg(msg)
	end if
    if str1(z*8+y+2)<>"" then
	billC=billC+trim((str1(z*8+y+2)))
    end if
  end if
 end if 
 
 
 if y=5 then
    if not IsNumeric(str1(z*8+y+2)) then
     mst="金额数不为数字！"
	 showmsg(mst)
	
    end if
	if IsNumeric(str1(z*8+y+2)) then
    if str1(z*8+y+2)=" " then 
	msg="金额数不能为空"
	showmsg(msg)
	
	end if 
	if str1(z*8+y+2)<>"" then
       moneyT=moneyT+trim((str1(z*8+y+2)))
	end if
	end if
 end if 
%>
<%
next
response.Write("</tr>")
next
%>
<%
if content1="" then
	response.write("<script language=""javascript"">")
	response.write("window.alert('数据不可以为空');window.history.go(-1);")
	response.write("</script>")
	end if

function showmsg(msg)
   response.write "<SCRIPT language=javascript>"
   response.write "alert('"&msg&"');window.history.go(-1);"
   response.write "</script>"
end function

'response.Write("session是："&session("content"))
'response.Write("完毕")
%>
</head>
<script language="javascript">
function InStore()
{
	window.open('confirmReim.asp?content='+document.form.content.value+'&money='+document.form.moneyTotal.value+'&chittySum='
+document.form.billTotal.value+'&finance='+document.form.finance.value,"_self");
}
</script>
<script language="javascript">
function tempInStore()
{
	window.open('tempInstoreReim.asp?money='+document.form.money.value+'&chittySum='+document.form.chittySum.value+'&finance='+document.form.finance.value,"_self");
}
</script>

<body>
<div align="center">
<form name="form" action="confirmReim.asp">
<table width="100%"   cellpadding="0" cellspacing="0" border="1"> 
<tr><th colspan="6">报销单</th></tr>
<tr><td>报销人</td><td colspan="2"><input type="text" name="claimant" value="<%response.Write(oabusyusername)%>"></td><td>部门</td><td colspan="2"><input type="text" name="dept" value="<%response.Write(oabusyuserdept)%>"></td></tr>
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
	   sql="select * from userinf where userlevel='财务'"
	   set rs=server.CreateObject("adodb.recordset")
	   rs.open sql,conn,1,1
	   do while not rs.eof 
	%>
	<option value="<%=rs("username")%>"    <%=selected(rs("username"),finance)%>><%=rs("username")%></option>
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

t= round((n+1) / 8)
billC1=0
moneyT1=0
for j=0 to t-1
response.Write("<tr>")
for m=0 to 6
%>
<td>
<%if m=0 then%>
<input type="text" name="content" value="<%=trim((str1(j*8+m)))&trim((str1(j*8+m+1)))&trim((str1(j*8+m+2)))%>" />
<%end if%>
<%if m>0 and m<6 then%>
<input type="text" name="content" value="<%=trim((str1(j*8+m+2)))%>" />
<%end if%>
<%
  if m=4 then 
   if not IsNumeric(str1(j*8+m+2)) then
     mst="单据张数不为数字！"
 	showmsg(mst)
   end if
   if IsNumeric(str1(j*8+m+2)) then
     if str1(j*8+m+2)=" " then 
 	msg="单据张数不能为空"
 	showmsg(msg)
 	end if
     if str1(j*8+m+2)<>"" then
 	billC1=billC1+trim((str1(j*8+m+2)))
     end if
   'end if
  end if 
  
 
  if m=5 then
      mst="金额数不为数字！"
 	 showmsg(mst)
     end if
 	if IsNumeric(str1(j*8+m+3)) then
     if str1(j*8+m+3)=" " then 
     msg="金额数不能为空"
 	showmsg(msg)
	
 	end if 
 	 if str1(j*8+m+3)<>"" then
        moneyT1=moneyT1+trim((str1(j*8+m+3)))
 	end if
 	end if
  end if 
%>
</td>
<%
next
response.Write("</tr>")
next
%>
</tr>
<tr><td colspan="4">合计</td><td ><input type="text" name="chittySum" value="<%response.Write(billC1)%>" /></td><td><input type="text" name="money" value="<%response.Write(moneyT1)%>"/></td>
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
<form  name="form2">
<input type="button" value="暂存" onclick="tempInStore()" />
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
