<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����||||��ٵ���д</title>
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
<option value="���">���</option> 
<option value="����">����</option> 
</select>
<input type="submit" name="sub" value="ȷ��" />
</form>
<br />
<br />
<%if subname="���" then%>
<form method="get" action="confirmleave.asp" name="f1">
<table width="60%" border="1" bgcolor="#91C4D9">
<th colspan="2">��ٵ���д</th>
<tr>
<td>����ڼ䣺</td>
<td>��<select name=beiginyear size=1> 
<% for i=2009 to 2020 %><option value=<%response.Write(i)%><%=selected(i,year(now()))%>><%response.Write(i)&"��"%></option><% next %>
</select>  
<select name=beiginmonth size=1>
<% for j=1 to 12 %><option value=<%response.Write(j)%><%=selected(j,month(now()))%>><%response.Write(j)&"��"%></option><% next %>
</select>
<select name=beiginday size=1>
<% for k=1 to 31 %><option value=<%response.Write(k)%><%=selected(k,day(now()))%>><%response.Write(k)&"��"%></option><% next %>
</select>  
<select name=beiginhour size=1>
<% for a=8 to 17 %><option value=<%response.Write(a)%><%=selected(a,hour(now()))%>><%response.Write(a)&"ʱ"%></option><% next %>
</select> 
<select name=beiginmin size=1>
<% for b=0 to 59 %><option value=<%response.Write(b)%><%=selected(b,minute(now()))%>><%response.Write(b)&"��"%></option><% next %>
</select>��
<select name=endyear size=1> 
<% for ii=2009 to 2020 %><option value=<%response.Write(ii)%><%=selected(ii,year(now()))%>><%response.Write(ii)&"��"%></option><% next %>
</select>  
<select name=endmonth size=1>
<% for jj=1 to 12 %><option value=<%response.Write(jj)%><%=selected(jj,month(now()))%>><%response.Write(jj)&"��"%></option><% next %>
</select>
<select name=endday size=1>
<% for kk=1 to 31 %><option value=<%response.Write(kk)%><%=selected(kk,day(now()))%>><%response.Write(kk)&"��"%></option><% next %>
</select>  
<select name=endhour size=1>
<% for aa=8 to 17 %><option value=<%response.Write(aa)%><%=selected(aa,hour(now()))%>><%response.Write(aa)&"ʱ"%></option><% next %>
</select> 
<select name=endmin size=1>
<% for bb=0 to 59 %><option value=<%response.Write(bb)%><%=selected(bb,minute(now()))%>><%response.Write(bb)&"��"%></option><% next %>
</select>
</td>
</tr>
<tr>
<td>�������:</td>
<td>
<input type="checkbox" name="shi" value="yes">�¼�
<input type="checkbox" name="bin" value="yes">����
<input type="checkbox" name="chan" value="yes">����
<input type="checkbox" name="nian" value="yes">��н���ݼ�
<input type="checkbox" name="hun" value="yes">���
<input type="checkbox" name="sang" value="yes">ɥ��
<input type="checkbox" name="qin" value="yes">̽�׼�
<input type="checkbox" name="other" value="yes">����
</td>
</tr>
<tr>
<td>��ϸ˵����</td>
<td><textarea rows="6" cols="90" name="content"></textarea></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="leave" value="�ύ" /><input type="reset"  value="����"/></td>
</tr>
</table>
</form>
<%end if%>
<%if subname="����" then%>
<form method="get" action="confirmtone.asp" name="f2">
<table width="60%" border="1" bgcolor="#91C4D9">
<th colspan="2">���ݵ���д</th>
<tr>
<td>�����ڼ䣺</td>
<td>��<select name=bgyear size=1> 
<% for x=2009 to 2020 %><option value=<%response.Write(x)%><%=selected(x,year(now()))%>><%response.Write(x)&"��"%></option><% next %>
</select>  
<select name=bgmonth size=1>
<% for y=1 to 12 %><option value=<%response.Write(y)%><%=selected(y,month(now()))%>><%response.Write(y)&"��"%></option><% next %>
</select>
<select name=bgday size=1>
<% for z=1 to 31 %><option value=<%response.Write(z)%><%=selected(z,day(now()))%>><%response.Write(z)&"��"%></option><% next %>
</select>  
<select name=bghour size=1>
<% for m=8 to 17 %><option value=<%response.Write(m)%><%=selected(m,hour(now()))%>><%response.Write(m)&"ʱ"%></option><% next %>
</select> 
<select name=bgmin size=1>
<% for n=0 to 59 %><option value=<%response.Write(n)%><%=selected(n,minute(now()))%>><%response.Write(n)&"��"%></option><% next %>
</select>��
<select name=edyear size=1> 
<% for xx=2009 to 2020 %><option value=<%response.Write(xx)%><%=selected(xx,year(now()))%>><%response.Write(xx)&"��"%></option><% next %>
</select>  
<select name=edmonth size=1>
<% for yy=1 to 12 %><option value=<%response.Write(yy)%><%=selected(yy,month(now()))%>><%response.Write(yy)&"��"%></option><% next %>
</select>
<select name=edday size=1>
<% for zz=1 to 31 %><option value=<%response.Write(zz)%><%=selected(zz,day(now()))%>><%response.Write(zz)&"��"%></option><% next %>
</select>  
<select name=edhour size=1>
<% for mm=8 to 17 %><option value=<%response.Write(mm)%><%=selected(mm,hour(now()))%>><%response.Write(mm)&"ʱ"%></option><% next %>
</select> 
<select name=edmin size=1>
<% for nn=0 to 59 %><option value=<%response.Write(nn)%><%=selected(nn,minute(now()))%>><%response.Write(nn)&"��"%></option><% next %>
</select>
</td>
</tr>
<tr>
<td>����˵����</td>
<td><textarea rows="6" cols="90" name="content"></textarea></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="tone" value="�ύ" /><input type="reset"  value="����"/></td>
</tr>
</table>
</form>
<%end if%>
</div>
</body>
</html>
