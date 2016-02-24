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
submit=request.QueryString("submit")
id=request.QueryString("id")
content=request.QueryString("note")
if submit="不同意调休单" then
    if content="" then
	response.write("<script language=""javascript"">")
	response.write("alert(""请填写审批意见"");")
	response.write("window.history.go(-1);")
	response.write("</script>")
	response.End()
	end if
    if content<>"" then
    set conn=opendb("请假调休.mdb","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
    sql="select * from tone where id="&id
    rs.open sql,conn,1,3
    rs("stage")=3
	if oabusyuserlevelCode="BMJL" then
	rs("deptnote")=content
	end if
	if oabusyuserlevelCode="DSZ" then
	rs("zhurennote")=content
	end if
	rs.update
    set rs=nothing
    set conn=nothing
	sql=""
	end if
	response.write("<script language=""javascript"">")
	response.write("alert(""处理完毕"");")
	response.write("window.close();")
	response.write("</script>")
end if
if submit="不同意请假单" then
    if content="" then
	response.write("<script language=""javascript"">")
	response.write("alert(""请填写审批意见"");")
	response.write("window.history.go(-1);")
	response.write("</script>")
	response.End()
	end if
    if content<>"" then
    set conn=opendb("请假调休.mdb","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
    sql="select * from leave where id="&id
    rs.open sql,conn,1,3
    rs("stage")=3
	if oabusyuserlevelCode="BMJL" then
	rs("deptnote")=content
	end if
	if oabusyuserlevelCode="DSZ" then
	rs("zhurennote")=content
	end if
	rs.update
    set rs=nothing
    set conn=nothing
	sql=""
	end if
	response.write("<script language=""javascript"">")
	response.write("alert(""处理完毕"");")
	response.write("window.close();")
	response.write("</script>")
end if
if submit="同意调休单" then
    set conn=opendb("请假调休.mdb","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
    sql="select * from tone where id="&id
    rs.open sql,conn,1,3
	stage=rs("stage")
	if oabusyuserlevelCode="BMJL" then
	   if datediff("d",rs("bgtime"),rs("edtime"))>2 then
	   rs("stage")=2
	   end if
	   if datediff("d",rs("bgtime"),rs("edtime"))<=2 then
	   rs("stage")=4
	   rs("wether")="Y"
	   end if
	rs("deptnote")=content
	end if
	if oabusyuserlevelCode="DSZ" then
	   rs("stage")=4
	   rs("wether")="Y"
	rs("zhurennote")=content
	end if
	rs.update
    set rs=nothing
    set conn=nothing
	sql=""
	response.write("<script language=""javascript"">")
	response.write("alert(""处理完毕"");")
	response.write("window.close();")
	response.write("</script>")
end if
if submit="同意请假单" then
    set conn=opendb("请假调休.mdb","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
    sql="select * from leave where id="&id
    rs.open sql,conn,1,3
	if oabusyuserlevelCode="BMJL" then
	   if datediff("d",rs("beigintime"),rs("endtime"))>2 then
	   rs("stage")=2
	   end if
	   if datediff("d",rs("beigintime"),rs("endtime"))<=2 then
	   rs("stage")=4
	   rs("wether")="Y"
	   end if
	rs("deptnote")=content
	end if
	if oabusyuserlevelCode="DSZ" then
	   rs("stage")=4
	   rs("wether")="Y"
	rs("zhurennote")=content
	end if
	rs.update
    set rs=nothing
    set conn=nothing
	sql=""
	response.write("<script language=""javascript"">")
	response.write("alert(""处理完毕"");")
	response.write("window.close();")
	response.write("</script>")
end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>结果</title>
</head>
<body>
</body>
</html>
