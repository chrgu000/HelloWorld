<!--#include file="opendb.asp"-->
<%
function changeverify(projectid,code,tolevel,rstype)
'获得项目经理的信息‘
	set connveri=opendb("GFProjectType","conn","sql")
	set rsveri=server.createobject("adodb.recordset")
	sqlveri= "select * from projectType where projectId='"&projectid&"'"
	rsveri.open sqlveri,connveri,1,1
	if not rsveri.eof and not rsveri.bof then
		tempdept=rsveri("dept")
		tempprincipal1=rsveri("principal1")
		tempprincipal2=rsveri("principal2")
		temptype=rsveri("type")	
		tempuserlevel="本项目经理"	
	set connveri=nothing
	set rsveri=nothing
	set sqlveri=nothing
	end if
		
	set connveri=opendb("lmtof","conn","sql")
	set rsveri=server.createobject("adodb.recordset")
	sqlveri= "select userlevel from userinf where username='"&tempprincipal1&"' and forbid='no'"
	rsveri.open sqlveri,connveri,1,1
	if not rsveri.eof and not rsveri.bof then
		tempuserlevel1=rsveri("userlevel")
	set connveri=nothing
	set rsveri=nothing
	set sqlveri=nothing
	end if
	
	if not isnull(tempprincipal2) then
	  set connveri=opendb("lmtof","conn","sql")
	  set rsveri=server.createobject("adodb.recordset")
	  sqlveri= "select userlevel from userinf where username='"&tempprincipal2&"'  and forbid='no'"
	  rsveri.open sqlveri,connveri,1,1
	  if not rsveri.eof and not rsveri.bof then
		  tempuserlevel2=rsveri("userlevel")
	  set connveri=nothing
	  set rsveri=nothing
	  set sqlveri=nothing
	  end if
	end if
	  if  isnull(tempprincipal2) then
		  verify=tempdept&":"&tempuserlevel&":"&tempprincipal1
	  end if
	  if not isnull(tempprincipal2) then
		  verify=tempdept&":"&tempuserlevel&":"&tempprincipal1&";"&tempdept&":"&tempuserlevel&":"&tempprincipal2
	  end if
	  '获得项目经理的信息‘
	  
	  '获得部门经理的信息‘
	  set connveri=opendb("lmtof","conn","sql")
	  set rsveri=server.createobject("adodb.recordset")
	  sqlveri= "select username from userinf where userdept='"&tempdept&"' and levelcode='BMJL' and forbid='no'"
	  rsveri.open sqlveri,connveri,1,1
	  if not rsveri.eof  and not rsveri.bof then
		do while not rsveri.eof 
		  tempdeptleader=tempdeptleader&rsveri("username")&"|"
		rsveri.movenext
		loop
		tempdeptleader=left(tempdeptleader,len(tempdeptleader)-1)
	    tempdeptlevel="部门经理"
	    verify=verify&"--"&tempdept&":"&tempdeptlevel&":"&tempdeptleader
	  end if
	  set connveri=nothing
	  set rsveri=nothing
	  set sqlveri=nothing
	  'response.Write(verify)
	  '获得部门经理的信息‘
	  
	  '获得综管部最高领导的信息‘
	  zgdept="综合管理部"
	  set connveri=opendb("lmtof","conn","sql")
	  set rsveri=server.createobject("adodb.recordset")
	  sqlveri= "select username from userinf where userdept='"&zgdept&"' and levelcode='DSZ' and forbid='no'"
	  rsveri.open sqlveri,connveri,1,1
	  if not rsveri.eof  and not rsveri.bof then
		do while not rsveri.eof 
		  tempzgleader=tempzgleader&rsveri("username")&"|"
		rsveri.movenext
		loop
	  end if
	  set connveri=nothing
	  set rsveri=nothing
	  set sqlveri=nothing
	  tempzgleader=left(tempzgleader,len(tempzgleader)-1)
	  tempzglevel="综管部负责人"
	  if code="R" then
	  verify=verify&"--"&zgdept&":"&tempzglevel&":"&tempzgleader
	  end if
	  'response.Write(verify)
	  '获得综管部最高领导的信息‘
	  
	  
	  '获得财务主管的信息‘
	  set connveri=opendb("lmtof","conn","sql")
	  set rsveri=server.createobject("adodb.recordset")
	  sqlveri= "select username from userinf  where (levelcode='CWZG' or levelcode1='CWZG') and forbid='no'"
	  rsveri.open sqlveri,connveri,1,1
	  do while not rsveri.eof 
	  	cwzgleader=cwzgleader&rsveri("username")&"|"
	  rsveri.movenext
	  loop
	  set connveri=nothing
	  set rsveri=nothing
	  set sqlveri=nothing
	  cwzgleader=left(cwzgleader,len(cwzgleader)-1)
	  tempcwzglevel="财务主管"
	  verify=verify&"--"&tempcwzglevel&":"&cwzgleader
	  'response.Write(verify)
	  '获得财务主管的信息‘
	  
	  '获得机构负责人的的信息‘
	  set connveri=opendb("lmtof","conn","sql")
	  set rsveri=server.createobject("adodb.recordset")
	  sqlveri= "select dept from dept where bucode=(select bucode from dept where dept='"&tempdept&"')  and code='B'"
	  rsveri.open sqlveri,connveri,1,1
	  if not rsveri.eof  and not rsveri.bof  then
	  	tempbudept=rsveri("dept")
	  end if
	  set rsveri=nothing
	  set sqlveri=nothing
	  set connveri=nothing
	  set connveri=opendb("lmtof","conn","sql")
	  set rsveri=server.createobject("adodb.recordset")
	  if tempbudept<>"" then 
	  sqlveri= "select username from userinf  where levelcode='DSZ' and forbid='no' and userdept='"&tempbudept&"'"
	  rsveri.open sqlveri,connveri,1,1
	  do while not rsveri.eof 
	  	dszleader=dszleader&rsveri("username")&"|"
	  rsveri.movenext
	  loop
	  end if
	  set rsveri=nothing
	  set sqlveri=nothing
	  set connveri=nothing
	  dszleader=left(dszleader,len(dszleader)-1)
	  tempdszlevel="机构负责人"
	  verify=verify&"--"&tempbudept&":"&tempdszlevel&":"&dszleader
	  'response.Write(verify)
	  '获得机构负责人的的信息‘
	  
	  '获得财务的的信息‘
	  set connveri=opendb("lmtof","conn","sql")
	  set rsveri=server.createobject("adodb.recordset")
	  if tempbudept<>"" then 
	  sqlveri= "select username from userinf  where levelcode='CW' and forbid='no' "
	  rsveri.open sqlveri,connveri,1,1
	  do while not rsveri.eof 
	  	cwleader=cwleader&rsveri("username")&"|"
	  rsveri.movenext
	  loop
	  end if
	  set rsveri=nothing
	  set sqlveri=nothing
	  set connveri=nothing
	  cwleader=left(cwleader,len(cwleader)-1)
	  tempcwlevel="财务"
	  verify=verify&"--"&tempcwlevel&":"&cwleader
	  '获得财务的的信息‘
	  
	  '获得出纳的信息‘
	  set connveri=opendb("lmtof","conn","sql")
	  set rsveri=server.createobject("adodb.recordset")
	  if tempbudept<>"" then 
	  sqlveri= "select username from userinf  where levelcode='CN' and forbid='no' "
	  rsveri.open sqlveri,connveri,1,1
	  do while not rsveri.eof 
	  	cnleader=cnleader&rsveri("username")&"|"
	  rsveri.movenext
	  loop
	  end if
	  set rsveri=nothing
	  set sqlveri=nothing
	  set connveri=nothing
	  cnleader=left(cnleader,len(cnleader)-1)
	  tempcnlevel="出纳"
	  verify=verify&"--"&tempcnlevel&":"&cnleader
	  'response.Write(verify)
	  '获得出纳的信息‘
	  getverify=verify
end function
%>