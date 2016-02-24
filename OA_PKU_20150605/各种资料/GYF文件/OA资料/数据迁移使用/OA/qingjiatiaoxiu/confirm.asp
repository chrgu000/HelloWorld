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
function opendb1(DBPath,sessionname,dbsort)
    dim connn
    Set connn=Server.CreateObject("ADODB.Connection")
	set rs=server.createobject("adodb.recordset")
    DBPath1=server.mappath(DBPath)
    connn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
    set session(sessionname)=connn
    set opendb1=session(sessionname)
end function

    set conn=opendb("lmtof","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
    sql="select * from userinf where userdept='"&oabusyuserdept&"' and (levelCode='BMJL' or levelCode1='BMJL')"
    rs.open sql,conn,1,1
    deptleader=rs("username")
    set rs=nothing
    set conn=nothing
	
	set conn=opendb("lmtof","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
    sql="select * from userinf where levelCode='DSZ' and levelCode1='BMJL'"
    rs.open sql,conn,1,1
    manager=rs("name")
    set rs=nothing
    set conn=nothing
	time1=year(now())&"年"&month(now())&"月"&day(now())&"日"&hour(now())&"时"&minute(now())&"分"

 if request.QueryString("submit")="提交调休单" then
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
    bgTime=bgyear&bgmonth&bgday&bghour&bgmin
    edtime=edyear&edmonth&edday&edhour&edmin
    'response.Write(bgTime)
'    response.Write(edtime)
'    response.Write(content)
	    set connn=opendb1("请假调休.mdb","connn","accessdsn")
        'set rs=server.createobject("adodb.recordset")
        sql="select * from tone"
        rs.open sql,connn,1,3
        rs.addnew
		rs("name")=oabusyusername
		rs("dept")=oabusyuserdept
		rs("deptleader")=deptleader
		rs("manager")=manager
		rs("time")=time1
		rs("bgtime")=bgTime
		rs("edtime")=edtime
		rs("content")=content
		rs("wether")="N"
		rs("stage")=1
        rs.update
        rs.movenext
        set rs=nothing
        set connn=nothing
%>
		<script language="javascript">
		  alert("调休单提交完毕");
		  window.close();
		</script>
<%
 end if
 if request.QueryString("submit")="提交请假单" then
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
    beigintime=beiginyear&beiginmonth&beiginday&beiginhour&beiginmin
    endttime=endtyear&endtmonth&endtday&endthour&endtmin
    'response.Write(beiginT)
'    response.Write(endttime)
'    response.Write(shi)
'    response.Write(bin)
'    response.Write(content)
	    set connn=opendb1("请假调休.mdb","connn","accessdsn")
        'set rs=server.createobject("adodb.recordset")
        sql="select * from leave"
        rs.open sql,connn,1,3
        rs.addnew
		rs("name")=oabusyusername
		rs("dept")=oabusyuserdept
		rs("deptleader")=deptleader
		rs("manager")=manager
		rs("time")=time1
		rs("beigintime")=beigintime
		rs("endtime")=endttime
		rs("shi")=shi
		rs("bin")=bin
		rs("chan")=chan
		rs("nian")=nian
		rs("hun")=hun
		rs("sang")=sang
		rs("qin")=qin
		rs("other")=other
		rs("content")=content
		rs("wether")="N"
		rs("stage")=1
        rs.update
        rs.movenext
        set rs=nothing
        set connn=nothing
%> 
		<script language="javascript">
		   alert("调休单提交完毕");
		   window.close();
		</script>
<%
	end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>提交页面</title>
</head>

<body>
</body>
</html>
