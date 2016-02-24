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
kk=request("deptarrMoney")
   'response.Write(kk&"<br>")
   deptM=split(kk,",")
   n= UBound(deptM)
   sum=0.00
   for i=0 to n
   sum=sum+CDbl(deptM(i))
   'response.Write(CDbl(deptM(i))&"&nbsp;")
   next
   response.Write(sum)
   if CDbl(sum)<>CDbl(money) then
    response.write("<script language=""javascript"">")
	response.write("alert(""各部门金额之和与总金额不匹配"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
	response.end()
   end if
   
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
sql="select * from ReimMilti "
rs.open sql,conn,1,3
if chittySum<>0 and money <>0 and CDbl(sum)=CDbl(money) then
rs.addnew
rs("Reimfinance")=oabusyusername

'rs("deptleader")
rs("ReimDate")=Tnow
'rs("reimburseDate")
'rs("chittySum")
rs("BillCount")=chittySum
rs("MoneySum")=money
rs("stage")="11"

 
   deptM=split(kk,",")
   n= UBound(deptM)
   sum=0
   for i=0 to n
    if i=0 then 
	rs("MarketDepartM")=deptM(i)
	end if
	if i=1 then
	rs("ProductDepartM")=deptM(i)
	end if
	if i=2 then
	rs("EngineeringDepartM")=deptM(i)
	end if 
	if i=3 then
	rs("GeneManageDepartM")=deptM(i)
	end if
	if i=4 then
	rs("EduTrainDepartM")=deptM(i)
	end if
	if i=5 then
	rs("otherDeptM")=deptM(i)
	end if 
	if i=6 then 
	rs("sichuanJDM")=deptM(i)
	end if
	if i=7 then 
	rs("YanFDepartM")=deptM(i)
	end if
	if i=8 then 
	rs("SDepartM")=deptM(i)
	end if
  ' response.Write(Cint(deptM(i))&"&nbsp;")
   next
 
 rs("MarketDepartAg")="No"
 rs("ProductDepartAg")="No"
 rs("EngineeringDepartAg")="No"
 rs("GeneManageDepartAg")="No"
 rs("EduTrainDepartAg")="No"
 rs("otherDeptAg")="No"
 rs("sichuanJDAg")="No"
 rs("YanFDepartAg")="No"
 rs("SDepartAg")="No"
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
      for m=0 to 5
      if m=4 then 
	    if str1(j*6+m)="" then
		  	response.write("<script language=""javascript"">")
	        response.write("alert(""金额填写错误，请重新填写"");")
	        response.write("window.history.go(-1);")
	        response.write("</script>") 
        else if str1(j*6+m)<> "" then
           bill=bill+trim(str1(j*6+m))
		   end if
		end if
      end if
         if m=5 then 
		   if str1(j*6+m)="" then
		  	response.write("<script language=""javascript"">")
	        response.write("alert(""金额填写错误，请重新填写"");")
	        response.write("window.history.go(-1);")
	        response.write("</script>") 
		  else if str1(j*6+m)<>"" then
           moneySum=moneySum+trim(str1(j*6+m))
		   end if
		  end if
      end if
      next
    next
for j=0 to t-1
'set cn=server.CreateObject("adodb.connection")
'path1=server.MapPath("finance.mdb")
'cn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path1
set cn=opendb("finance","conn","sql")
set rs1=server.CreateObject("adodb.recordset")
sql1="select * from ItemForMilti "
rs1.open sql1,cn,1,3
if chittySum<>0 and money <>0  then
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
  end if
  if m=5 then 
  rs1("money")=trim(str1(j*6+m))
  end if

next
rs1.update
end if
end if
next
%>
<div align="center">
<form>
<input type="button" value="关闭" onclick="javascript:window.close();"
</form>
</form>
</body>
</html>
