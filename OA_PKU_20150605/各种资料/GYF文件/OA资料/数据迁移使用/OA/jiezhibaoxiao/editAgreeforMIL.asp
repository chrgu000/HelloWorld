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
id=request("id")
notes=request("notes")
'response.Write(id)
'response.Write(notes)
%>
<%
'set conn=server.CreateObject("adodb.connection")
'dpath=server.Mappath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpath
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from ReimMilti where  id = " &id 
rs.open sql,conn,1,3
if oabusyuserlevelCode="DSZ" then 
rs("Stage")=5
rs("ManagerView")=notes
rs("ManagerAgrTime")=year(now)&"年"&month(now)&"月"&day(now)&"日"
rs.update
end if
if oabusyuserlevelCode="CWZG" then 
rs("Stage")=4
rs.update
end if
if oabusyuserlevelCode="BMJL" then
   flagnum=0
   flagnum=rs("flagnum")
   if oabusyuserdept="产品部" then 
      rs("ProductDepartAg")="是"
	  flagnum=flagnum+rs("ProductDepartM")
	  rs("flagnum")=flagnum
   end if
   if oabusyuserdept="工程部" then 
      rs("EngineeringDepartAg")="是"
	  flagnum=flagnum+rs("EngineeringDepartM")
	  rs("flagnum")=flagnum
   end if
   if oabusyuserdept="教育培训部" then 
      rs("EduTrainDepartAg")="是"
	  flagnum=flagnum+rs("EduTrainDepartM")
	  rs("flagnum")=flagnum
   end if
   if oabusyuserdept="业务发展部" then 
      rs("MarketDepartAg")="是"
	  flagnum=flagnum+rs("MarketDepartM")
	  rs("flagnum")=flagnum
   end if
   if oabusyuserdept="综合管理部" then 
      rs("GeneManageDepartAg")="是"
	  flagnum=flagnum+rs("GeneManageDepartM")
	  rs("flagnum")=flagnum
   end if
   if oabusyuserdept="四川基地" then 
      rs("sichuanJDAg")="是"
	  flagnum=flagnum+rs("sichuanJDM")
	  rs("flagnum")=flagnum
   end if
   if oabusyuserdept="其他部门" then 
      rs("otherDeptAg")="是"
	  flagnum=flagnum+rs("otherDeptM")
	  rs("flagnum")=flagnum
   end if
   if oabusyuserdept="研发部" then 
      rs("YanFDepartAg")="是"
	  flagnum=flagnum+rs("YanFDepartM")
	  rs("flagnum")=flagnum
   end if
   if oabusyuserdept="时空信息技术培训部" then 
      rs("SDepartAg")="是"
	  flagnum=flagnum+rs("SDepartM")
	  rs("flagnum")=flagnum
   end if
   
   flag=0
   flag1=0
   flag2=0
   flag3=0
   flag4=0
   flag5=0
   flag6=0
   
   if ProductDepartM<>0 and rs("ProductDepartAg")="是" then
      flag1=1
	  'flagnum=flagnum+rs("ProductDepartM")
   end if
   if EngineeringDepartM<>0 and rs("EngineeringDepartAg")="是" then
      flag2=1
	  'flagnum=flagnum+rs("EngineeringDepartM")
   end if
   if EduTrainDepartM<>0 and rs("EduTrainDepartAg")="是" then
      flag3=1
	  'flagnum=flagnum+rs("EduTrainDepartM")
   end if 
   if MarketDepartM<>0 and rs("MarketDepartAg")="是" then
      flag4=1
	 ' flagnum=flagnum+rs("MarketDepartM")
   end if
   if GeneManageDepartM<>0 and rs("GeneManageDepartAg")="是" then
      flag5=1
	  'flagnum=flagnum+rs("GeneManageDepartM")
   end if
   if sichuanJDM<>0 and rs("sichuanJDAg")="是" then
      flag5=1
	  'flagnum=flagnum+rs("sichuanJDM")
   end if
   if otherDeptM<>0 and  rs("otherDeptAg")="是" then
      flag5=1
	  'flagnum=flagnum+rs("otherDeptM")
   end if
   flag=flag1+flag2+flag3+flag4+flag5+flag6
   'if flag=6 then
   '   rs("Stage")=9
   'end if
   'if flag<6 then
    '  rs("Stage")=1
   'end if
   if flagnum=rs("MoneySum") then
      rs("Stage")=3
   end if
   if flagnum<>rs("MoneySum") then
      rs("Stage")=11
   end if
rs.update
end if
	response.write("<script language=""javascript"">")
	response.write("window.location.href='mainReim.asp';")
	response.write("</script>")
%>
</head>
<body>
<div align="center">
<form action="mainReim.asp" method="post">
<input type="submit" value="关闭" />
</form>
</div>
</body>
</html>
