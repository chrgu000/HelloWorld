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
bgTime=bgyear&"��"&bgmonth&"��"&bgday&"��"&bghour&"ʱ"&bgmin&"��"
edtime=edyear&"��"&edmonth&"��"&edday&"��"&edhour&"ʱ"&edmin&"��"
'response.Write(bgTime)
'response.Write(edtime)
'response.Write(content)
if content="" then
  	response.write("<script language=""javascript"">")
	response.write("alert(""��ϸ˵��δ��д������д"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
end if
tt=datediff("h",bgTime,edtime)
if tt<1 then
  	response.write("<script language=""javascript"">")
	response.write("alert(""����������ò��ԣ���������д"");")
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
<title>�ޱ����ĵ�</title>
</head>
<body>
<div align="center">
<form method="get" action="confirm.asp" name="f2">
<table width="60%" border="1" bgcolor="#91C4D9">
<th colspan="2">���ݵ���д</th>
<tr>
<td>�����ڼ䣺</td>
<td>��<select name=bgyear size=1> 
<% for x=2009 to 2020 %><option value=<%response.Write(x)&"��"%><%=selected(Cint(x),Cint(bgyear))%>><%response.Write(x)&"��"%></option><% next %>
</select>  
<select name=bgmonth size=1>
<% for y=1 to 12 %><option value=<%response.Write(y)&"��"%><%=selected(Cint(y),Cint(bgmonth))%>><%response.Write(y)&"��"%></option><% next %>
</select>
<select name=bgday size=1>
<% for z=1 to 31 %><option value=<%response.Write(z)&"��"%><%=selected(Cint(z),Cint(bgday))%>><%response.Write(z)&"��"%></option><% next %>
</select>  
<select name=bghour size=1>
<% for m=8 to 17 %><option value=<%response.Write(m)&"ʱ"%><%=selected(Cint(m),Cint(bghour))%>><%response.Write(m)&"ʱ"%></option><% next %>
</select> 
<select name=bgmin size=1>
<% for n=0 to 59 %><option value=<%response.Write(n)&"��"%><%=selected(Cint(n),Cint(bgmin))%>><%response.Write(n)&"��"%></option><% next %>
</select>��
<select name=edyear size=1> 
<% for xx=2009 to 2020 %><option value=<%response.Write(xx)&"��"%><%=selected(Cint(xx),Cint(edyear))%>><%response.Write(xx)&"��"%></option><% next %>
</select>  
<select name=edmonth size=1>
<% for yy=1 to 12 %><option value=<%response.Write(yy)&"��"%><%=selected(Cint(yy),Cint(edmonth))%>><%response.Write(yy)&"��"%></option><% next %>
</select>
<select name=edday size=1>
<% for zz=1 to 31 %><option value=<%response.Write(zz)&"��"%><%=selected(Cint(zz),Cint(edday))%>><%response.Write(zz)&"��"%></option><% next %>
</select>  
<select name=edhour size=1>
<% for mm=8 to 17 %><option value=<%response.Write(mm)&"ʱ"%><%=selected(Cint(mm),Cint(edhour))%>><%response.Write(mm)&"ʱ"%></option><% next %>
</select> 
<select name=edmin size=1>
<% for nn=0 to 59 %><option value=<%response.Write(nn)&"��"%><%=selected(Cint(nn),Cint(edmin))%>><%response.Write(nn)&"��"%></option><% next %>
</select>
</td>
</tr>
<tr>
<td>����˵����</td>
<td><textarea rows="6" cols="90" name="content"><%=content%></textarea></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="submit" value="�ύ���ݵ�" /><input type="button" value="����" onclick="javascript:window.history.back();"/></td>
</tr>
</table>
</form>
</div>
</body>
</html>
