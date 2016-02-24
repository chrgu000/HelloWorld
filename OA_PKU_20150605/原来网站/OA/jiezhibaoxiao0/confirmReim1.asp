<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
Tnow=year(now)&"年"&month(now)&"月"&day(now)&"日"
claimant=request("claimant")
    
		  'set conn=server.CreateObject("adodb.connection")
          'path=server.MapPath("..\db\lmtof.mdb")
          'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
		  set conn=opendb("lmtof","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from userinf where username='"&claimant&"'"
          rs.open sql,conn,1,1
          dept=rs("userdept")'报销人的部门
		  set rs=nothing
		  set conn=nothing
		    
occuryear=request("occuryear")
occurmonth=request("occurmonth")
occurday=request("occurday")
projectId=request("projectId")
          'set conn=server.CreateObject("adodb.connection")
          'path=server.MapPath("GFProjectType.mdb")
          'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
		  set conn=opendb("GFProjectType","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from projectType_old where projectId='"&projectId&"'"
          rs.open sql,conn,1,1
          givecount=rs("financeCount")
		  projectLeader=rs("principal1")
		  projectDept=rs("dept")
		  projecttype=rs("type")
		  set rs=nothing
		  set conn=nothing
summary=request("summary")
billCount=request("billCount")
money=request("money")
remark=request("remark")
occurDate=occuryear&"年"&occurmonth&"月"&occurday&"日"
  if billCount=0 then
  	response.write("<script language=""javascript"">")
	response.write("alert(""单据张数填写错误，请重新填写"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
  end if
  if money=0 then
  	response.write("<script language=""javascript"">")
	response.write("alert(""金额填写错误，请重新填写"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
  end if
 con= request("con")
 tem=request("tem")
          
%>

</head>

<body>
<%
if billCount<>0 and money<>0 then

'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimbursementlist "
rs.open sql,conn,1,3
rs.addnew
rs("type")=projecttype
rs("claimant")=oabusyusername'报销人或代理人
rs("dept")=dept '报销人的部门
rs("relclaimant")=claimant '真报销人
   'set conn1=server.CreateObject("adodb.connection")
   'path1=server.MapPath("../db/lmtof.mdb")
   'conn1.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path1
   set conn1=opendb("lmtof","conn","sql")
   set rs1=server.CreateObject("adodb.recordset") 
   sql1="select * from userinf where userdept="&"'"&oabusyuserdept&"'"&" and levelCode='BMJL'"
   rs1.open sql1,conn1,1,1
rs("deptleader")=rs1("username") '代理人的部门负责人
rs("date")=Tnow
rs("reimburseDate")=Tnow
rs("chittySum")=billCount
rs("moneySum")=money
rs("principal")=projectLeader
rs("principaldept")=projectDept
if con<>"" then
   if oabusyuserlevelCode="BMJL" then
   rs("stage")="2"
   end if
   if oabusyuserlevelCode="CWZG" then
     rs("stage")="3"
   end if
   if oabusyuserlevelCode="CW" then
     rs("stage")="3"
   end if
   if (oabusyuserlevelCode="ZSYG" or oabusyuserlevelCode="CN")  then
      rs("stage")="1"
    end if
end if
if tem<>"" then
   rs("stage")="0"
end if
rs.update 
tt=Cint(rs("id"))

'set cn=server.CreateObject("adodb.connection") 
'ph=server.MapPath("finance.mdb")
'cn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & ph
set cn=opendb("finance","conn","sql")
set rsI=server.CreateObject("adodb.recordset")
sqlI="select * from reimburseItem "
rsI.open sqlI,cn,1,3
rsI.addnew
rsI("Itemid")=tt
rsI("occurDate")="2009-11-9"
rsI("projectId")=projectId
rsI("givecount")=givecount
rsI("projectLeader")=projectLeader
rsI("projectDept")=projectDept
rsI("summary")=summary
rsI("remark")=remark
rsI("billCount")=billCount
rsI("money")=money
rsI.update
set rsI=nothing
set cn=nothing 
end if
response.Write(con)
response.Write(tem)
%>

<div align="center">
<form>
<input type="button" value="关闭" onclick="javascript:window.close();"
</form>
</form>
</body>
</html>
