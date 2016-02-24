<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="opendb.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
content=request("content")
money=request("money")
chittySum=request("chittySum")
finance=request("finance")
  if chittySum=0 then
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

%>

</head>

<body>
<%
'response.Write("<hr>")
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimbursementlist "
rs.open sql,conn,1,3
rs.addnew
rs("claimant")=oabusyusername
rs("dept")=oabusyuserdept

'set conn1=server.CreateObject("adodb.connection")
'path1=server.MapPath("../db/lmtof.mdb")
'conn1.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path1
set conn1=opendb("lmtof","conn","sql")
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from userinf where userdept="&"'"&oabusyuserdept&"'"&" and levelCode='BMJL'"
rs1.open sql1,conn1,1,1
if chittySum<>0 and money <>0 then
  rs("deptleader")=rs1("username")
rs("date")=Tnow
rs("reimburseDate")=Tnow
'rs("reimburseDate")
'rs("chittySum")
rs("chittySum")=chittySum
rs("moneySum")=money
rs("finance")=finance
if oabusyuserlevelCode="BMJL" then
rs("stage")="0"
end if
if oabusyuserlevelCode="CW" then
  if money > 600 then
  rs("stage")="0"
  end if
  if money <= 600 then
  rs("stage")="0"
  end if
end if

if (oabusyuserlevelCode="ZSYG" or oabusyuserlevelCode="SYYG")  then
rs("stage")="0"
end if
rs.update
end if

tt=rs("id")
%>
<%
str1=split(content,",")
n= UBound(str1)
t= round((n+1) / 6)
moneySum=0
bill=0
    for j=0 to t-1
      
      if m=4 then 
	    if str1(j*6+4)="" then
		  	response.write("<script language=""javascript"">")
	        response.write("alert(""单据填写错误，请重新填写"");")
	        response.write("window.history.go(-1);")
	        response.write("</script>") 
        else if str1(j*6+4)<> "" then
           bill=bill+trim(str1(j*6+m))
		   end if
		end if
      end if
         if m=5 then 
		   if str1(j*6+5)="" then
		  	response.write("<script language=""javascript"">")
	        response.write("alert(""金额填写错误，请重新填写"");")
	        response.write("window.history.go(-1);")
	        response.write("</script>") 
		  else if str1(j*6+5)<>"" then
           moneySum=moneySum+trim(str1(j*6+5))
		   end if
		  end if
      end if
      
    next
for j=0 to t-1
 set cn=server.CreateObject("adodb.connection")
 path2=server.MapPath("finance.mdb")
 set rs1=server.CreateObject("adodb.recordset")
 sql1="select * from reimburseItem "
 rs1.open sql1,conn,1,3
 if chittySum<>0 and money <>0 then
  if trim(str1(j*6+4))<>0 and  trim(str1(j*6+5))<>0 then
  rs1.addnew
  for m=0 to 5
    rs1("Itemid")=tt
  
    if m=0 then 
     rs1("occurDate")=trim(str1(j*6+m))
    end if
    if m=1 then 
     rs1("projectId")=trim(str1(j*6+m))
    end if
    if m=2 then 
     rs1("summary")=trim(str1(j*6+m))
    end if
    if m=3 then 
     rs1("remark")=trim(str1(j*6+m))
    end if
    if m=4 then 
     rs1("billCount")=trim(str1(j*6+m))
     'bill=bill+trim(str1(j*6+m))
    end if
    if m=5 then 
     rs1("money")=trim(str1(j*6+m))
     'moneySum=moneySum+trim(str1(j*6+m))
    end if

   next
  rs1.update
 end if
 end if
next
'response.Write( "单据"&bill &"<hr>")
'response.Write( moneySum )
%>
<div align="center">
<form>
<input type="button" value="关闭" onclick="javascript:window.close();" />
</form>
</form>
</body>
</html>
