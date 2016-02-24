<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<!--#include file="getverifyR.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>提交单据</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
oabusyuserdepttemp=oabusyuserdept


''求该部门的部门经理是否有 add by junnor @2013.9.7
set conn=opendb("lmtof","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from userinf where userdept='"&oabusyuserdept&"' and (levelCode1='BMJL' OR levelCode='DSZ' or  levelCode='BMJL') and forbid='no' "
rs.open sql,conn,1,1
if rs.eof or rs.bof then
oabusyuserdept=getdeptbuname(getbucode(oabusyuserdepttemp))'报销人的部门领导人
end if
set rs=nothing
set conn=nothing
''add by junnor @2013.9.7

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
          sql="select * from userinf where userdept='"&oabusyuserdept&"' and (levelCode1='BMJL' OR levelCode='DSZ' or levelCode1='DSZ' or  levelCode='BMJL') and forbid='no' "
		  'response.Write(sql)
          rs.open sql,conn,1,1
          deptleader=rs("name")'报销人的部门领导人
		  set rs=nothing
		  set conn=nothing
		    
		  occuryear=request("occuryear")
		  occurmonth=request("occurmonth")
		  occurday=request("occurday")
		  projectId=request("projectId")
		  dealtype=request("dealtype")

		  set conn=opendb("GFProjectType","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from projectType where projectId='"&projectId&"'"
          rs.open sql,conn,1,1
          givecount=rs("financeCount")
		  projectLeader=rs("principal1")
		  projectDept=rs("dept")
		  set rs=nothing
		  set conn=nothing
		  summary=request("summary")
		  billCount=request("billCount")
		  money=request("money")
		  remark=request("remark")
		  occurDate=occuryear&occurmonth&occurday
		  chkormn=request("chkormn")
		  
''求该部门的部门经理是否有 add by junnor @2013.9.7
projectDepttemp=projectDept
set conn=opendb("lmtof","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from userinf where userdept='"&projectDept&"' and (levelCode1='BMJL' OR levelCode='DSZ' or  levelCode='BMJL') and forbid='no' "
rs.open sql,conn,1,1
if rs.eof or rs.bof then
projectDept=getdeptbuname(getbucode(projectDepttemp))'报销人的部门领导人
end if
set rs=nothing
set conn=nothing		  
''add by junnor @2013.9.7

		  set conn=opendb("lmtof","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from userinf where userdept='"&projectDept&"'  and (levelCode1='BMJL' OR  levelCode='BMJL' or levelCode='DSZ' or levelCode1='DSZ' )"
		  'response.Write(sql)
          rs.open sql,conn,1,1
          principaldeptLeader=rs("name")'项目所在的部门经理
		  set rs=nothing
		  set conn=nothing
		  
		  
		  
  if billCount=0  and (dealtype="AA" or dealtype="BB") then
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
   set conn=opendb("finance","conn","sql")
   set rs=server.CreateObject("adodb.recordset")
   if dealtype="AA"  then
     sql="select * from reimlisttable where projectId='"&projectId&"' and dealtype='"&dealtype&"' and money="&money&" and claimant='"&oabusyusername &"' and relclaimant='"&claimant&"' and summary='"&summary&"' and remark='一般报销:"&remark&"' and billCount="&billCount
   end if
   if dealtype="BB" then
     sql="select * from reimlisttable where projectId='"&projectId&"' and dealtype='"&dealtype&"' and money="&money&" and claimant='"&oabusyusername &"' and relclaimant='"&claimant&"' and summary='"&summary&"' and remark='报销冲账:"&remark&"' and billCount="&billCount
   end if
   if dealtype="CC" then
     sql="select * from reimlisttable where projectId='"&projectId&"' and dealtype='"&dealtype&"' and money="&money&" and claimant='"&oabusyusername &"' and relclaimant='"&claimant&"' and summary='"&summary&"' and remark='项目还款:"&remark&"' and chkormn='"&chkormn&"'"
   end if
   chongfu="FLASE"
          rs.open sql,conn,1,1
		  if not rs.bof and not rs.eof then
		  response.write("<script language=""javascript"">")
		  response.write("alert(""请勿重复提交"");")
	      response.write("window.close();")
	      response.write("</script>") 
		  chongfu="TRUE"
		  end if
	set rs=nothing
	set conn=nothing
 con= request("con")
 tem=request("tem")
 verify=getverifyR(projectId,"R",dealtype)          
%>

</head>

<body>
<%
if chongfu<>"TRUE" then
	if ((dealtype="AA" or dealtype="BB") and billCount<>0 and money<>0) or (dealtype="CC" and money<>0)  then
	set conn=opendb("finance","conn","sql")
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from reimlisttable where id is NULL"
	rs.open sql,conn,1,3
	'rs.movelast
	rs.addnew
		rs("projectId")=projectId             '项目号
		rs("money")=money 	'金额 
		rs("claimant")=oabusyusername              '代办人，即写报销单的人
		rs("claimantdeptcode")=getdeptcode(oabusyuserdept)                 '代办人的部门,即写报销单的单位 默认就是报销人      
		rs("relclaimant")=claimant           '实际报销人 这个是因为有可以代谢报销单的功能而增加的字段
		rs("relclaimantdeptcode")=getuserdeptcode(claimant)
		rs("summary")=summary 					'摘要
		if dealtype="AA" then
		rs("remark")="一般报销:"&remark                '备注
		end if
		if dealtype="BB" then
		rs("remark")="报销冲账:"&remark                '备注
		end if   
		if dealtype="CC" then
		rs("remark")="项目还款:"&remark                '备注
		end if        
		rs("reimburseDate")=Tnow         '报销日期，写报销单的日期
		rs("occurDate")=occurDate             '报销条目发生的日
		
		if dealtype="AA" or dealtype="BB" then
		rs("billCount")=billCount             '发票张数
		end if
		rs("givecount")=givecount             '项目帐号
		
		mystr=split(verify,"--")
		haveverify=""
		nowverify=mystr(0)
		willverify=right(verify,len(verify)-(len(mystr(0))+2))
		getstage=split(mystr(0),":")
		stage=getstage(0)
		
		'rs("notes")=
		'rs("signtime")=
		rs("dealtype")= dealtype                 '报销的类型 AA BB CC
		rs("projectdeptcode")=getprojectdeptcode(projectId)
		if dealtype="CC" then
			rs("chkormn")=chkormn
		end if
		'rs("pzh")=
		if con<>"" then
		   rs("haveverify")=haveverify
		   rs("nowverify")=nowverify
		   rs("willverify")=willverify
		   rs("stage")=stage
		end if
		if tem<>"" then
		   rs("stage")=0
		   rs("haveverify")=""
		   rs("nowverify")=""
		   rs("willverify")=verify
		end if
	rs.update
	end if
end if
 %>
<div align="center">
<form>
<input type="button" value="关闭" onclick="javascript:window.close();" />
</form>
</form>
</body>
</html>
