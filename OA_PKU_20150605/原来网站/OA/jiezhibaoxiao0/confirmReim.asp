<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
'response.Write(oabusyname&oabusyusername&oabusyuserdept&oabusyuserlevel&oabusyuserlevelCode)
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
		  Tnow=year(now)&"年"&month(now)&"月"&day(now)&"日"
		  claimant=request("claimant")
		  set conn=opendb("lmtof","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from userinf where username='"&claimant&"'"
          rs.open sql,conn,1,1
          dept=rs("userdept")'报销人的部门
		  set rs=nothing
		  set conn=nothing

		  set conn=opendb("lmtof","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from userinf where userdept='"&oabusyuserdept&"' and (levelCode1='BMJL' OR  levelCode='BMJL') and forbid='no' "
          rs.open sql,conn,1,1
          deptleader=rs("name")'报销人的部门
		  set rs=nothing
		  set conn=nothing
		    
		  occuryear=request("occuryear")
		  occurmonth=request("occurmonth")
		  occurday=request("occurday")
		  projectId=request("projectId")

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
		  occurDate=occuryear&occurmonth&occurday
		  

		  set conn=opendb("lmtof","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from userinf where userdept='"&projectDept&"'  and (levelCode1='BMJL' OR  levelCode='BMJL')"
          rs.open sql,conn,1,1
          principaldeptLeader=rs("name")'项目所在的部门经理
		  set rs=nothing
		  set conn=nothing
		  
		  
		  
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

set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable_old where id is NULL"
rs.open sql,conn,1,3
'rs.movelast
rs.addnew
    rs("type")= projecttype                 '报销的类型
	rs("claimant")=oabusyusername              '代办人，即写报销单的人
	rs("dept")=oabusyuserdept                  '代办人的部门,即写报销单的单位 默认就是报销人
	rs("deptleader")= deptleader           '代办人的部门经理，即填写报销单人的部门经理，默认就是报销人的部门经理
	rs("relclaimant")=claimant           '实际报销人 这个是因为有可以代谢报销单的功能而增加的字段
	rs("principal")=projectLeader             '项目负责人
	rs("projectDept")=projectDept           '项目所在部门
	rs("principaldeptLeader")=principaldeptLeader   '项目所在部门经理
	'rs("finance")=               '财务
	rs("projectId")=projectId             '项目号
	rs("givecount")=givecount             '项目帐号
	rs("summary")=summary               '摘要
	rs("remark")=remark                '备注
	rs("billCount")=billCount             '发票张数
	rs("money")=money                 '金额
	rs("occurDate")=occurDate             '报销条目发生的日期
	rs("reimburseDate")=Tnow         '报销日期，写报销单的日期
	'rs("stage")=                 '阶段
	'rs("principalNotes")=        '项目负责人批注
	'rs("deptNotes")=             '部门经理批注
	'rs("financialNotes")=        '财务主管批注
	'rs("gManagerNotes")=         '总经理批注
	'rs("principalApprovalTime")= '项目负责人通过时间
	'rs("deptApprovalTime")=      '部门审批通过时间
	'rs("financialApprovalTime")= '财务主管审批通过时间
	'rs("gManagerApprovalTime")=  '总经理审批通过时间
	'rs("principalDissentTime")=  '项目负责人不通过时间
	'rs("deptDissentTime")=       '部门审批不通过时间
	'rs("financialDissentTime")=  '财务主管审批不通过时间
	'rs("gManagerDissentTime")=   '总经理审批不通过时间
	rs("ch")="N"                    '是否已经修改过帐号
if con<>"" then
   'if oabusyuserlevelCode="BMJL" then
'   rs("stage")="2"
'   end if
  ' if oabusyuserlevelCode="CWZG" then
'     rs("stage")="3"
'   end if
'   if oabusyuserlevelCode="CW" then
'     rs("stage")="3"
'   end if
   'if (oabusyuserlevelCode="ZSYG" or oabusyuserlevelCode="CN" or oabusyuserlevelCode="BMJL" or oabusyuserlevelCode="CW" or oabusyuserlevelCode="CWZG")  then
      rs("stage")="1"
    'end if
	'2010年2月1日 将陈老师的功能调回原来状态
   if claimant="陈秀万" then
    rs("stage")="4" 
   end if
end if
if tem<>"" then
   rs("stage")="0"
end if
rs.update 
end if
'-----------------------------------------add by zhaoshijun at 2010-2-28
set conn=opendb("symx","conn","sql server")
set rs=server.CreateObject("adodb.recordset")
sql= "select * from accProj where projectid="&"'"&projectId&"'"
rs.open sql,conn,1,1
if not rs.eof and not rs.bof then
num=rs("bala")-money
else
num=10
end if
set rs=nothing
set conn=nothing
 if num<0 then response.Write("<script language=javascript>alert('您报销的项目中金额不足，在报销过程中将标红显示')</script>")
 %>
<div align="center">
<form>
<input type="button" value="关闭" onclick="javascript:window.close();" />
</form>
</form>
</body>
</html>
