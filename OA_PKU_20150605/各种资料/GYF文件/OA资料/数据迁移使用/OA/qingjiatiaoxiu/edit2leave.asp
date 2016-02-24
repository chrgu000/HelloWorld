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
id=request.QueryString("id")
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
<%
    set conn=opendb("请假调休.mdb","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
    sql="select * from leave where id="&id
    rs.open sql,conn,1,1
    name1=rs("name")
	dept=rs("dept")
	time1=rs("time")
	beigintime=rs("beigintime")
	endtime=rs("endtime")
	shi=rs("shi")
	bin=rs("bin")
	chan=rs("chan")
	nian=rs("nian")
	hun=rs("hun")
	sang=rs("sang")
	qin=rs("qin")
	other=rs("other")
	wether=rs("wether")
	content=rs("content")
    set rs=nothing
    set conn=nothing
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>处理请假单</title>
</head>
<body>
<div align="center">
<form name="f1" action="editresult.asp" method="get">
<table width="60%" border="1" bgcolor="#91C4D9">
<th colspan="6">请假单</th>
<tr>
<td>姓名</td>
<td><%=name1%></td>
<td>部门</td>
<td><%=dept%></td>
<td>时间</td>
<td><%=time1%></td>
</tr>
<tr>
<td>请假期间：</td>
<td colspan="5">自<%=beigintime%>至<%=endtime%></td>
</tr>
<tr>
<td>请假事由:</td>
<td colspan="5">
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
<td colspan="5"><%=content%></td>
</tr>
<%if oabusyuserlevelCode="DSZ" or oabusyuserlevelCode="BMJL" then%>
<% if wether="N" then%>
<tr>
<td>审批意见</td>
<td colspan="5"><textarea rows="6" cols="90" name="note"></textarea></td>
</tr>
<tr>
<td colspan="6"><input type="hidden" name="id" value="<%=id%>" /><input type="submit" name="submit" value="同意请假单" /><input type="submit"  name="submit" value="不同意请假单"/></td>
</tr>
<% end if%>
<% end if%>
</table>
<input type="button" value="返回" onclick="javascript:window.history.back();"/>
</form>
</div>
</body>
</html>
