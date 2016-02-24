<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
oabusyuserlevelCode2=request.cookies("oabusyuserlevelCode2")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
function opendb(DBPath,sessionname,dbsort)
    dim conn
    Set conn=Server.CreateObject("ADODB.Connection")
    DBPath1=server.mappath(DBPath)
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
    set session(sessionname)=conn
    set opendb=session(sessionname)
end function
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
submit=request("submit")
yearN=request("year")
monthN=request("month")
if monthN="全年" then
	monthN=13
end if
 if yearN="" and monthN="" then
    yearN=year(now()) 
    monthN=month(now())
 end if
 timett=yearN&"年"&monthN&"月的"
 t1=DateSerial(yearN,monthN,1)
 t2=DateSerial(yearN,monthN+1,1)
 
 if monthN=13 then
 	timett=yearN&"年的"
	t1=DateSerial(yearN,1,1)
 	t2=DateSerial(yearN+1,1,1)
 end if
 
 'response.Write(t1)
 'response.Write(t2)
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>调休单和借支单查看</title>
</head>
<body>
<div align="center">
<% if submit="查看请假单" then%><!--请假单-->
<form  name="form" action="seethem.asp" method="post">
日期
<select name="year" size="1">
<%for y=2009 to 2019%>
<option value="<%response.Write(y)%>" <%=selected(Cint(y),Cint(yearN))%>><%response.Write(y)%></option>
<%next%>
</select>
年
<select name="month" size="1">
<%for m=1 to 13%>
<% if m<>13 then%>
<option value="<%response.Write(m)%>" <%=selected(Cint(m),Cint(monthN))%>><%response.Write(m)%></option>
<% end if%>
<% if m=13 then%>
<option value="<%response.Write(m)%>" <%=selected(Cint(m),Cint(monthN))%>>全年</option>
<%end if%>
<%next%>
</select>
月
<input type="submit" name="submit" value="查看请假单" />
</form>
<table width="60%" border="1" bgcolor="#91C4D9">
<th colspan="6"><%=timett%>请假单</th>
<tr><td>编号</td><td>姓名</td><td>部门</td><td>请假日期</td><td>状态</td><td>是否通过</td></tr>
<%
    set conn=opendb("请假调休.mdb","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	'sql="select * from leave where  wether='Y' and name='"&oabusyname&"' and time>=#"&t1&"# and time<#"&t2&"# "	
	sql="select * from leave where time>=#"&t1&"# and time<#"&t2&"#  order by wether desc"	 'wether='Y' and
    rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
    do while not rs.eof and not rs.bof
%>
<tr><td><a href="printl.asp?id=<%=rs("id")%>"><%=rs("id")%></a></td><td><%=rs("name")%></td><td><%=rs("dept")%></td><td><%=rs("beigintime")%>-----<%=rs("endtime")%></td>
<td>
<%
	set cn=opendb("请假调休.mdb","conn","accessdsn")
    set r=server.createobject("adodb.recordset")
	sq="select stageNote from stage where stage="&rs("stage")	
	r.open sq,cn,1,1
%>
<%=r("stageNote")%>
<% 
set r=nothing
set cn=nothing
%>
</td>
<td><%=rs("wether")%></td>
</tr>
<%
    rs.movenext
	loop
    end if
    set rs=nothing
    set conn=nothing
%>
</table>
<% end if%><!--请假单-->
<!---------------------------------------------------------------------请假单和调休单----------------------------------------------------------------------------------------------------------------------------->
<% if submit="查看调休单" then%> <!--调休单-->
<form  name="form" action="seethem.asp" method="post">
日期
<select name="year" size="1">
<%for yy=2009 to 2019%>
<option value="<%response.Write(yy)%>" <%=selected(Cint(yy),Cint(yearN))%>><%response.Write(yy)%></option>
<%next%>
</select>
年
<select name="month" size="1">
<%for mm=1 to 13%>
<% if mm<>13 then%>
<option value="<%response.Write(mm)%>" <%=selected(Cint(mm),Cint(monthN))%>><%response.Write(mm)%></option>
<%end if%>
<% if mm=13 then%>
<option value="<%response.Write(mm)%>" <%=selected(Cint(mm),Cint(monthN))%>>全年</option>
<% end if%>
<%next%>
</select>
月
<input type="submit" name="submit" value="查看调休单" />
</form>
<table width="60%" border="1" bgcolor="#91C4D9">
<th colspan="6"><%=timett%>调休单</th>
<tr><td>编号</td><td>姓名</td><td>部门</td><td>调休日期</td><td>状态</td><td>是否通过</td></tr>
<%
    set conn=opendb("请假调休.mdb","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	'sql="select * from tone where  wether='Y' and name='"&oabusyname&"' and time>=#"&t1&"# and time<#"&t2&"#"	
	sql="select * from tone where time >= #"&t1&"# and time < #"&t2&"# order by name " 	' wether='Y'
    rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
    do while not rs.eof and not rs.bof
%>
<tr><td><a href="printt.asp?id=<%=rs("id")%>"><%=rs("id")%></a></td><td><%=rs("name")%></td><td><%=rs("dept")%></td><td><%=rs("bgtime")%>-----<%=rs("edtime")%></td>
<td>
<%
	set cn=opendb("请假调休.mdb","conn","accessdsn")
    set r=server.createobject("adodb.recordset")
	sq="select stageNote from stage where stage="&rs("stage")	
	r.open sq,cn,1,1
%>
<%=r("stageNote")%>
<% 
set r=nothing
set cn=nothing
%>
</td>
<td><%=rs("wether")%></td>
</tr>
<%
    rs.movenext
	loop
    end if
    set rs=nothing
    set conn=nothing
%>
</table>
<% end if%> <!--调休单-->
</div>
</body>
</html>
