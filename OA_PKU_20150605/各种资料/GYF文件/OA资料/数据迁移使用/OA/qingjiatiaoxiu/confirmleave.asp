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
beiginyear=request.QueryString("beiginyear")
beiginmonth=request.QueryString("beiginmonth")
beiginday=request.QueryString("beiginday")
beiginhour=request.QueryString("beiginhour")
beiginmin=request.QueryString("beiginmin")
endtyear=request.QueryString("endyear")
endtmonth=request.QueryString("endmonth")
endtday=request.QueryString("endday")
endthour=request.QueryString("endhour")
endtmin=request.QueryString("endmin")
shi=request.QueryString("shi")
bin=request.QueryString("bin")
chan=request.QueryString("chan")
nian=request.QueryString("nian")
hun=request.QueryString("hun")
sang=request.QueryString("sang")
qin=request.QueryString("qin")
other=request.QueryString("other")
content=request.QueryString("content")
beiginT=beiginyear&"��"&beiginmonth&"��"&beiginday&"��"&beiginhour&"ʱ"&beiginmin&"��"
endttime=endtyear&"��"&endtmonth&"��"&endtday&"��"&endthour&"ʱ"&endtmin&"��"
'response.Write(beiginT)
'response.Write(endttime)
'response.Write(shi)
'response.Write(bin)
'response.Write(content)
if content="" then
  	response.write("<script language=""javascript"">")
	response.write("alert(""��ϸ˵��δ��д������д"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
end if
if (shi="" and bin="" and chan="" and nian="" and hun="" and sang="" and qin="" and other="") then
  	response.write("<script language=""javascript"">")
	response.write("alert(""�������δ��д������д"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
end if
tt=datediff("h",beiginT,endttime)
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
<form method="get" action="confirm.asp" name="f1">
<table width="60%" border="1" bgcolor="#91C4D9">
<th colspan="2">��ٵ���д</th>
<tr>
<td>����ڼ䣺</td>
<td>��<select name=beiginyear size=1> 
<% for i=2009 to 2020 %><option value=<%response.Write(i)&"��"%><%=selected(Cint(i),Cint(beiginyear))%>><%response.Write(i)&"��"%></option><% next %>
</select>  
<select name=beiginmonth size=1>
<% for j=1 to 12 %><option value=<%response.Write(j)&"��"%><%=selected(CInt(j),CInt(beiginmonth))%>><%response.Write(j)&"��"%></option><% next %>
</select>
<select name=beiginday size=1>
<% for k=1 to 31 %><option value=<%response.Write(k)&"��"%><%=selected(Cint(k),Cint(beiginday))%>><%response.Write(k)&"��"%></option><% next %>
</select>  
<select name=beiginhour size=1>
<% for a=8 to 17 %><option value=<%response.Write(a)&"ʱ"%><%=selected(Cint(a),Cint(beiginhour))%>><%response.Write(a)&"ʱ"%></option><% next %>
</select> 
<select name=beiginmin size=1>
<% for b=0 to 59 %><option value=<%response.Write(b)&"��"%><%=selected(Cint(b),Cint(beiginmin))%>><%response.Write(b)&"��"%></option><% next %>
</select>��
<select name=endyear size=1> 
<% for ii=2009 to 2020 %><option value=<%response.Write(ii)&"��"%><%=selected(Cint(ii),Cint(endtyear))%>><%response.Write(ii)&"��"%></option><% next %>
</select>  
<select name=endmonth size=1>
<% for jj=1 to 12 %><option value=<%response.Write(jj)&"��"%><%=selected(Cint(jj),Cint(endtmonth))%>><%response.Write(jj)&"��"%></option><% next %>
</select>
<select name=endday size=1>
<% for kk=1 to 31 %><option value=<%response.Write(kk)&"��"%><%=selected(Cint(kk),Cint(endtday))%>><%response.Write(kk)&"��"%></option><% next %>
</select>  
<select name=endhour size=1>
<% for aa=8 to 17 %><option value=<%response.Write(aa)&"ʱ"%><%=selected(Cint(aa),Cint(endthour))%>><%response.Write(aa)&"ʱ"%></option><% next %>
</select> 
<select name=endmin size=1>
<% for bb=0 to 59 %><option value=<%response.Write(bb)&"��"%><%=selected(Cint(bb),Cint(endtmin))%>><%response.Write(bb)&"��"%></option><% next %>
</select>
</td>
</tr>
<tr>
<td>�������:</td>
<td>
<input type="checkbox" name="shi" value="yes" <%=checked(shi,"yes")%>>�¼�
<input type="checkbox" name="bin" value="yes" <%=checked(bin,"yes")%>>����
<input type="checkbox" name="chan" value="yes" <%=checked(chan,"yes")%>>����
<input type="checkbox" name="nian" value="yes" <%=checked(nian,"yes")%>>��н���ݼ�
<input type="checkbox" name="hun" value="yes" <%=checked(hun,"yes")%>>���
<input type="checkbox" name="sang" value="yes" <%=checked(sang,"yes")%>>ɥ��
<input type="checkbox" name="qin" value="yes" <%=checked(qin,"yes")%>>̽�׼�
<input type="checkbox" name="other" value="yes" <%=checked(other,"yes")%>>����
</td>
</tr>
<tr>
<td>��ϸ˵����</td>
<td><textarea rows="6" cols="90" name="content"><%=content%></textarea></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="submit" value="�ύ��ٵ�" /><input type="button" value="����" onclick="javascript:window.history.back();"/></td>
</tr>
</table>
</form>
</div>
</body>
</html>
