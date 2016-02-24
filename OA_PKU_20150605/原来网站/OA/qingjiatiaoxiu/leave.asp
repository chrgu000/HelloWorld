<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>调休||||请假单填写</title>
</head>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
code=oabusyuserlevelCode
if oabusyusername=""  then 
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
subname=request("type")
'response.Write(subname)
%>
<body>
<div align="center">
<form method="post" name="form" action="leave.asp">
<select name="type">
<option value="请假">请假</option> 
<option value="调休">调休</option> 
</select>
<input type="submit" name="sub" value="确认" />
</form>
<br />
<br />
<%if subname="请假" then%>
<form method="get" action="confirmleave.asp" name="f1">
<table width="60%" border="1" bgcolor="#91C4D9">
<th colspan="2">请假单填写</th>
<tr>
<td>请假期间：</td>
<td>自<select name=beiginyear size=1> 
<% for i=2009 to 2020 %><option value=<%response.Write(i)%><%=selected(i,year(now()))%>><%response.Write(i)&"年"%></option><% next %>
</select>  
<select name=beiginmonth size=1>
<% for j=1 to 12 %><option value=<%response.Write(j)%><%=selected(j,month(now()))%>><%response.Write(j)&"月"%></option><% next %>
</select>
<select name=beiginday size=1>
<% for k=1 to 31 %><option value=<%response.Write(k)%><%=selected(k,day(now()))%>><%response.Write(k)&"日"%></option><% next %>
</select>  
<select name=beiginhour size=1>
<% for a=8 to 17 %><option value=<%response.Write(a)%><%=selected(a,hour(now()))%>><%response.Write(a)&"时"%></option><% next %>
</select> 
<select name=beiginmin size=1>
<% for b=0 to 59 %><option value=<%response.Write(b)%><%=selected(b,minute(now()))%>><%response.Write(b)&"分"%></option><% next %>
</select>至
<select name=endyear size=1> 
<% for ii=2009 to 2020 %><option value=<%response.Write(ii)%><%=selected(ii,year(now()))%>><%response.Write(ii)&"年"%></option><% next %>
</select>  
<select name=endmonth size=1>
<% for jj=1 to 12 %><option value=<%response.Write(jj)%><%=selected(jj,month(now()))%>><%response.Write(jj)&"月"%></option><% next %>
</select>
<select name=endday size=1>
<% for kk=1 to 31 %><option value=<%response.Write(kk)%><%=selected(kk,day(now()))%>><%response.Write(kk)&"日"%></option><% next %>
</select>  
<select name=endhour size=1>
<% for aa=8 to 17 %><option value=<%response.Write(aa)%><%=selected(aa,hour(now()))%>><%response.Write(aa)&"时"%></option><% next %>
</select> 
<select name=endmin size=1>
<% for bb=0 to 59 %><option value=<%response.Write(bb)%><%=selected(bb,minute(now()))%>><%response.Write(bb)&"分"%></option><% next %>
</select>
</td>
</tr>
<tr>
<td>请假事由:</td>
<td>
<input type="checkbox" name="shi" value="yes">事假
<input type="checkbox" name="bin" value="yes">病假
<input type="checkbox" name="chan" value="yes">产假
<input type="checkbox" name="nian" value="yes">带薪年休假
<input type="checkbox" name="hun" value="yes">婚假
<input type="checkbox" name="sang" value="yes">丧假
<input type="checkbox" name="qin" value="yes">探亲假
<input type="checkbox" name="other" value="yes">其他
</td>
</tr>
<tr>
<td>详细说明：</td>
<td><textarea rows="6" cols="90" name="content"></textarea></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="leave" value="提交" /><input type="reset"  value="重置"/></td>
</tr>
</table>
</form>
<%end if%>
<%if subname="调休" then%>
<form method="get" action="confirmtone.asp" name="f2">
<table width="60%" border="1" bgcolor="#91C4D9">
<th colspan="2">调休单填写</th>
<tr>
<td>调休期间：</td>
<td>自<select name=bgyear size=1> 
<% for x=2009 to 2020 %><option value=<%response.Write(x)%><%=selected(x,year(now()))%>><%response.Write(x)&"年"%></option><% next %>
</select>  
<select name=bgmonth size=1>
<% for y=1 to 12 %><option value=<%response.Write(y)%><%=selected(y,month(now()))%>><%response.Write(y)&"月"%></option><% next %>
</select>
<select name=bgday size=1>
<% for z=1 to 31 %><option value=<%response.Write(z)%><%=selected(z,day(now()))%>><%response.Write(z)&"日"%></option><% next %>
</select>  
<select name=bghour size=1>
<% for m=8 to 17 %><option value=<%response.Write(m)%><%=selected(m,hour(now()))%>><%response.Write(m)&"时"%></option><% next %>
</select> 
<select name=bgmin size=1>
<% for n=0 to 59 %><option value=<%response.Write(n)%><%=selected(n,minute(now()))%>><%response.Write(n)&"分"%></option><% next %>
</select>至
<select name=edyear size=1> 
<% for xx=2009 to 2020 %><option value=<%response.Write(xx)%><%=selected(xx,year(now()))%>><%response.Write(xx)&"年"%></option><% next %>
</select>  
<select name=edmonth size=1>
<% for yy=1 to 12 %><option value=<%response.Write(yy)%><%=selected(yy,month(now()))%>><%response.Write(yy)&"月"%></option><% next %>
</select>
<select name=edday size=1>
<% for zz=1 to 31 %><option value=<%response.Write(zz)%><%=selected(zz,day(now()))%>><%response.Write(zz)&"日"%></option><% next %>
</select>  
<select name=edhour size=1>
<% for mm=8 to 17 %><option value=<%response.Write(mm)%><%=selected(mm,hour(now()))%>><%response.Write(mm)&"时"%></option><% next %>
</select> 
<select name=edmin size=1>
<% for nn=0 to 59 %><option value=<%response.Write(nn)%><%=selected(nn,minute(now()))%>><%response.Write(nn)&"分"%></option><% next %>
</select>
</td>
</tr>
<tr>
<td>事由说明：</td>
<td><textarea rows="6" cols="90" name="content"></textarea></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="tone" value="提交" /><input type="reset"  value="重置"/></td>
</tr>
</table>
</form>
<%end if%>
</div>
</body>
</html>
