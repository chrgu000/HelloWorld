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
beiginT=beiginyear&"年"&beiginmonth&"月"&beiginday&"日"&beiginhour&"时"&beiginmin&"分"
endttime=endtyear&"年"&endtmonth&"月"&endtday&"日"&endthour&"时"&endtmin&"分"
'response.Write(beiginT)
'response.Write(endttime)
'response.Write(shi)
'response.Write(bin)
'response.Write(content)
if content="" then
  	response.write("<script language=""javascript"">")
	response.write("alert(""详细说明未填写，请填写"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
end if
if (shi="" and bin="" and chan="" and nian="" and hun="" and sang="" and qin="" and other="") then
  	response.write("<script language=""javascript"">")
	response.write("alert(""请假事由未填写，请填写"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
end if
tt=datediff("h",beiginT,endttime)
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
<form method="get" action="confirm.asp" name="f1">
<table width="60%" border="1" bgcolor="#91C4D9">
<th colspan="2">请假单填写</th>
<tr>
<td>请假期间：</td>
<td>自<select name=beiginyear size=1> 
<% for i=2009 to 2020 %><option value=<%response.Write(i)&"年"%><%=selected(Cint(i),Cint(beiginyear))%>><%response.Write(i)&"年"%></option><% next %>
</select>  
<select name=beiginmonth size=1>
<% for j=1 to 12 %><option value=<%response.Write(j)&"月"%><%=selected(CInt(j),CInt(beiginmonth))%>><%response.Write(j)&"月"%></option><% next %>
</select>
<select name=beiginday size=1>
<% for k=1 to 31 %><option value=<%response.Write(k)&"日"%><%=selected(Cint(k),Cint(beiginday))%>><%response.Write(k)&"日"%></option><% next %>
</select>  
<select name=beiginhour size=1>
<% for a=8 to 17 %><option value=<%response.Write(a)&"时"%><%=selected(Cint(a),Cint(beiginhour))%>><%response.Write(a)&"时"%></option><% next %>
</select> 
<select name=beiginmin size=1>
<% for b=0 to 59 %><option value=<%response.Write(b)&"分"%><%=selected(Cint(b),Cint(beiginmin))%>><%response.Write(b)&"分"%></option><% next %>
</select>至
<select name=endyear size=1> 
<% for ii=2009 to 2020 %><option value=<%response.Write(ii)&"年"%><%=selected(Cint(ii),Cint(endtyear))%>><%response.Write(ii)&"年"%></option><% next %>
</select>  
<select name=endmonth size=1>
<% for jj=1 to 12 %><option value=<%response.Write(jj)&"月"%><%=selected(Cint(jj),Cint(endtmonth))%>><%response.Write(jj)&"月"%></option><% next %>
</select>
<select name=endday size=1>
<% for kk=1 to 31 %><option value=<%response.Write(kk)&"日"%><%=selected(Cint(kk),Cint(endtday))%>><%response.Write(kk)&"日"%></option><% next %>
</select>  
<select name=endhour size=1>
<% for aa=8 to 17 %><option value=<%response.Write(aa)&"时"%><%=selected(Cint(aa),Cint(endthour))%>><%response.Write(aa)&"时"%></option><% next %>
</select> 
<select name=endmin size=1>
<% for bb=0 to 59 %><option value=<%response.Write(bb)&"分"%><%=selected(Cint(bb),Cint(endtmin))%>><%response.Write(bb)&"分"%></option><% next %>
</select>
</td>
</tr>
<tr>
<td>请假事由:</td>
<td>
<input type="checkbox" name="shi" value="yes" <%=checked(shi,"yes")%>>事假
<input type="checkbox" name="bin" value="yes" <%=checked(bin,"yes")%>>病假
<input type="checkbox" name="chan" value="yes" <%=checked(chan,"yes")%>>产假
<input type="checkbox" name="nian" value="yes" <%=checked(nian,"yes")%>>带薪年休假
<input type="checkbox" name="hun" value="yes" <%=checked(hun,"yes")%>>婚假
<input type="checkbox" name="sang" value="yes" <%=checked(sang,"yes")%>>丧假
<input type="checkbox" name="qin" value="yes" <%=checked(qin,"yes")%>>探亲假
<input type="checkbox" name="other" value="yes" <%=checked(other,"yes")%>>其他
</td>
</tr>
<tr>
<td>详细说明：</td>
<td><textarea rows="6" cols="90" name="content"><%=content%></textarea></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="submit" value="提交请假单" /><input type="button" value="返回" onclick="javascript:window.history.back();"/></td>
</tr>
</table>
</form>
</div>
</body>
</html>
