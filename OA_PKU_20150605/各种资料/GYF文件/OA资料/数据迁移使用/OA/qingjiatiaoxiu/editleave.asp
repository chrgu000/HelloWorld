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
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑调休||请假单页面</title>
</head>
<body>
<div align="center">
<%
    'set conn=opendb("../db/lmtof.mdb","conn","accessdsn")
'    set rs=server.createobject("adodb.recordset")
'    sql="select * from userinf where name='"&oabusyname&"' and userdept='"&oabusyuserdept&"' "
'    rs.open sql,conn,1,1
'    deptleader=rs("username")
'    set rs=nothing
'    set conn=nothing
%>
<table width="60%" border="1" bgcolor="#91C4D9">
<form>
<th colspan="5">您正在申请的请假单或调休单</th>
<tr><td>编号</td><td>姓名</td><td>部门</td><td>日期</td><td>状态</td></tr>
<%
    set conn=opendb("请假调休.mdb","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
    sql="select * from tone where name='"&oabusyname&"' and wether='N' and stage < 4"
    rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
    do while not rs.eof and not rs.bof
%>
<tr><td><a href="edit2tone.asp?id=<%=rs("id")%>"><%=rs("id")%></a></td><td><%=rs("name")%></td><td><%=rs("dept")%></td><td><%=rs("time")%></td>
<td><%
	set cn=opendb("请假调休.mdb","conn","accessdsn")
    set r=server.createobject("adodb.recordset")
    sl="select * from stage where stage="&rs("stage")
    r.open sl,cn,1,1
	if not rs.eof and not rs.bof then
	response.write(r("stageNote"))
	end if%></td>
</tr>
<%  
    rs.movenext
	loop
    end if
    set rs=nothing
    set conn=nothing
	sql=""
%>
<%
    set conn=opendb("请假调休.mdb","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
    sql="select * from leave where name='"&oabusyname&"' and wether='N' and stage < 4"
    rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
    do while not rs.eof and not rs.bof
%>
<tr><td><a href="edit2leave.asp?id=<%=rs("id")%>"><%=rs("id")%></a></td><td><%=rs("name")%></td><td><%=rs("dept")%></td><td><%=rs("time")%></td></tr>
<%
    rs.movenext
	loop
    end if
    set rs=nothing
    set conn=nothing
	sql=""
%>
</form>
</table>
<br /><br /><br /><br /><br /><br />
<!--------------------------------------------------------------------------------------------------------------------------------------------------->
<% if oabusyuserlevelCode<>"ZSYG" then%>
<table width="60%" border="1" bgcolor="#91C4D9">
<form>
<th colspan="4">您需要处理的请假单或调休单</th>
<tr><td>编号</td><td>姓名</td><td>部门</td><td>日期</td></tr>
<%
    set conn=opendb("请假调休.mdb","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	if oabusyuserlevelCode="DSZ"  then
    sql="select * from tone where  wether='N'  and (stage=2  or stage=1)"
	end if
	if (oabusyuserlevelCode="BMJL") then
    sql="select * from tone where  wether='N' and deptleader='"&oabusyname&"' and stage=1"	
	end if
	if oabusyuserlevelCode<>"DSZ" and oabusyuserlevelCode<>"BMJL" then
    sql="select * from tone where  wether='N' and deptleader='"&oabusyname&"' and stage=5"
	end if
	
    rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
    do while not rs.eof and not rs.bof
%>
<tr><td><a href="edit2tone.asp?id=<%=rs("id")%>"><%=rs("id")%></a></td><td><%=rs("name")%></td><td><%=rs("dept")%></td><td><%=rs("time")%></td></tr>
<%  
    rs.movenext
	loop
    end if
    set rs=nothing
    set conn=nothing
	sql=""
%>
<%
    set conn=opendb("请假调休.mdb","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
	if oabusyuserlevelCode="DSZ" and  oabusyuserlevelCode1="BMJL" then
	sql="select * from leave where  wether='N' and  (stage=2  or stage=1)"
	end if
	if (oabusyuserlevelCode="BMJL") then
	sql="select * from leave where  wether='N' and deptleader='"&oabusyname&"' and stage=1"
	end if
	if oabusyuserlevelCode<>"DSZ" and oabusyuserlevelCode<>"BMJL" then
	sql="select * from leave where  wether='N' and deptleader='"&oabusyname&"' and stage=5"
	end if
    rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
    do while not rs.eof and not rs.bof
%>
<tr><td><a href="edit2leave.asp?id=<%=rs("id")%>"><%=rs("id")%></a></td><td><%=rs("name")%></td><td><%=rs("dept")%></td><td><%=rs("time")%></td></tr>
<%
    rs.movenext
	loop
    end if
    set rs=nothing
    set conn=nothing
	sql=""
%>
</form>
</table>
<%end if%>
<form name="f3" method="post" action="seethem.asp">
<input type="submit" name="submit" value="查看请假单" /><input type="submit" name="submit" value="查看调休单" />
 </form>
</div>
</body>
</html>
