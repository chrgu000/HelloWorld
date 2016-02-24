<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="../asp/opendb.asp"-->
<head>
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
bgyear=request.QueryString("bgyear")
bgmonth=request.QueryString("bgmonth")
bgday=request.QueryString("bgday")
bghour=request.QueryString("bghour")
bgmin=request.QueryString("bgmin")
edyear=request.QueryString("edyear")
edmonth=request.QueryString("edmonth")
edday=request.QueryString("edday")
edhour=request.QueryString("edhour")
edmin=request.QueryString("edmin")
content=request.QueryString("content")
bgTime=bgyear&"年"&bgmonth&"月"&bgday&"日"&bghour&"时"&bgmin&"分"
edtime=edyear&"年"&edmonth&"月"&edday&"日"&edhour&"时"&edmin&"分"
'response.Write(bgTime)
'response.Write(edtime)
'response.Write(content)
if content="" then
  	response.write("<script language=""javascript"">")
	response.write("alert(""详细说明未填写，请填写"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
end if
tt=datediff("h",bgTime,edtime)
if tt<1 then
  	response.write("<script language=""javascript"">")
	response.write("alert(""请假期限设置不对，请重新填写"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
end if
%>
<%
function selected(req,reqvalue)
if req=reqvalue then
selected=" selected"
else
selected=""
end if
end function
function checked(req,reqvalue)
if req=reqvalue then
checked=" checked"
else
checked=""
end if
end function
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>
<body>
<div align="center">
<form method="get" action="confirm.asp" name="f2">
<table width="60%" border="1" bgcolor="#91C4D9">
<th colspan="2">调休单填写</th>
<tr>
<td>调休期间：</td>
<td>自<select name=bgyear size=1> 
<% for x=2009 to 2020 %><option value=<%response.Write(x)&"年"%><%=selected(Cint(x),Cint(bgyear))%>><%response.Write(x)&"年"%></option><% next %>
</select>  
<select name=bgmonth size=1>
<% for y=1 to 12 %><option value=<%response.Write(y)&"月"%><%=selected(Cint(y),Cint(bgmonth))%>><%response.Write(y)&"月"%></option><% next %>
</select>
<select name=bgday size=1>
<% for z=1 to 31 %><option value=<%response.Write(z)&"日"%><%=selected(Cint(z),Cint(bgday))%>><%response.Write(z)&"日"%></option><% next %>
</select>  
<select name=bghour size=1>
<% for m=8 to 17 %><option value=<%response.Write(m)&"时"%><%=selected(Cint(m),Cint(bghour))%>><%response.Write(m)&"时"%></option><% next %>
</select> 
<select name=bgmin size=1>
<% for n=0 to 59 %><option value=<%response.Write(n)&"分"%><%=selected(Cint(n),Cint(bgmin))%>><%response.Write(n)&"分"%></option><% next %>
</select>至
<select name=edyear size=1> 
<% for xx=2009 to 2020 %><option value=<%response.Write(xx)&"年"%><%=selected(Cint(xx),Cint(edyear))%>><%response.Write(xx)&"年"%></option><% next %>
</select>  
<select name=edmonth size=1>
<% for yy=1 to 12 %><option value=<%response.Write(yy)&"月"%><%=selected(Cint(yy),Cint(edmonth))%>><%response.Write(yy)&"月"%></option><% next %>
</select>
<select name=edday size=1>
<% for zz=1 to 31 %><option value=<%response.Write(zz)&"日"%><%=selected(Cint(zz),Cint(edday))%>><%response.Write(zz)&"日"%></option><% next %>
</select>  
<select name=edhour size=1>
<% for mm=8 to 17 %><option value=<%response.Write(mm)&"时"%><%=selected(Cint(mm),Cint(edhour))%>><%response.Write(mm)&"时"%></option><% next %>
</select> 
<select name=edmin size=1>
<% for nn=0 to 59 %><option value=<%response.Write(nn)&"分"%><%=selected(Cint(nn),Cint(edmin))%>><%response.Write(nn)&"分"%></option><% next %>
</select>
</td>
</tr>
<tr>
<td>事由说明：</td>
<td><textarea rows="6" cols="90" name="content"><%=content%></textarea></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="submit" value="提交调休单" /><input type="button" value="返回" onclick="javascript:window.history.back();"/></td>
</tr>
</table>
</form>
</div>
</body>
</html>
