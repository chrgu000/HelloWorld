<!--#include file="opendb.asp"-->
<%
function getverifyR(projectid,code,dealtype)
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
		  verify="1:"&tempdept&":"&tempuserlevel&":"&tempprincipal1
	  end if
	  if not isnull(tempprincipal2) then
		  verify="1:"&tempdept&":"&tempuserlevel&":"&tempprincipal1&";"&tempdept&":"&tempuserlevel&":"&tempprincipal2
	  end if
	  '获得项目经理的信息‘
	  
	  '获得部门经理的信息‘
	  set connveri=opendb("lmtof","conn","sql")
	  set rsveri=server.createobject("adodb.recordset")
	  sqlveri= "select username from userinf where userdept='"&tempdept&"' and levelcode='BMJL'  and forbid='no'"
	  'response.write(sqlveri)
	  rsveri.open sqlveri,connveri,1,1
	  if not rsveri.eof  and not rsveri.bof then
		do while not rsveri.eof 
		  tempdeptleader=tempdeptleader&rsveri("username")&"|"
		rsveri.movenext
		loop
		if tempdeptleader<> "" then
	    tempdeptleader=left(tempdeptleader,len(tempdeptleader)-1)
	    tempdeptlevel="部门经理"
	    verify=verify&"--"&"2:"&tempdept&":"&tempdeptlevel&":"&tempdeptleader
	    end if
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
	  sqlveri= "select username from userinf where userdept='"&zgdept&"' and (levelcode='BMJL' or levelcode1='BMJL') and forbid='no'"
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
	  if code="R" and temptype="A" then
	  verify=verify&"--"&"13:"&zgdept&":"&tempzglevel&":"&tempzgleader
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
	  verify=verify&"--"&"3:"&tempcwzglevel&":"&cwzgleader
	  'response.Write(verify)
	  '获得财务主管的信息‘

if dealtype="AA" then	  
	  '获得机构负责人的的信息‘
	  set connveri=opendb("lmtof","conn","sql")
	  set rsveri=server.createobject("adodb.recordset")
	  sqlveri= "select dept,deptcode from dept where bucode=(select bucode from dept where dept='"&tempdept&"')  and code='B'"
	  'response.write(sqlveri)
	  rsveri.open sqlveri,connveri,1,1
	  if not rsveri.eof  and not rsveri.bof  then
	  	tempbudept=rsveri("dept")
		tempbudeptcode=rsveri("deptcode")
	  end if
	  set rsveri=nothing
	  set sqlveri=nothing
	  set connveri=nothing
	  set connveri=opendb("lmtof","conn","sql")
	  set rsveri=server.createobject("adodb.recordset")
	  if tempbudept<>"" then 
	  'sqlveri= "select username from userinf  where (levelcode='DSZ' or levelcode1='DSZ') and forbid='no' and userdept='"&tempbudept&"'"
	  sqlveri= "select username from userinf  where (levelcode='DSZ' or levelcode1='DSZ') and forbid='no' and charindex('"&tempbudeptcode&"',deptarea)>0"
	  'response.Write(sqlveri)
	  rsveri.open sqlveri,connveri,1,1
	  do while not rsveri.eof 
	  	dszleader=dszleader&rsveri("username")&"|"
	  rsveri.movenext
	  loop
	  end if
	  set rsveri=nothing
	  set sqlveri=nothing
	  set connveri=nothing
	  'response.Write(dszleader)
	  dszleader=left(dszleader,len(dszleader)-1)
	  tempdszlevel="机构负责人"
	  verify=verify&"--"&"4:"&tempbudept&":"&tempdszlevel&":"&dszleader
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
	  '获得财务的的信息‘
	  if code="R" then
	    verify=verify&"--"&"5:"&tempcwlevel&":"&cwleader
	  	verify=verify&"--"&"6:"&tempcwzglevel&":"&cwzgleader
	  end if
	  
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
	  verify=verify&"--"&"7:"&tempcnlevel&":"&cnleader
	  'response.Write(verify)
	  '获得出纳的信息‘
end if
	  getverifyR=verify
end function


function getdept(reqvalue) 'reqvalue表示部门编号比如FZG
	  set conntemp=opendb("lmtof","conn","sql")
	  set rstemp=server.createobject("adodb.recordset")
	  sqltemp= "select dept from dept where deptcode='"&reqvalue&"'"
	  rstemp.open sqltemp,conntemp,1,1
	  getdept=rstemp("dept")
	  set conntemp=nothing
	  set rstemp=nothing
	  set sqltemp=nothing
end function

function getdeptcode(reqvalue) 'reqvalue表示部门比如综合管理部
	  set conntemp=opendb("lmtof","conn","sql")
	  set rstemp=server.createobject("adodb.recordset")
	  sqltemp= "select deptcode from dept where dept='"&reqvalue&"'"
	  rstemp.open sqltemp,conntemp,1,1
	  getdeptcode=rstemp("deptcode")
	  set conntemp=nothing
	  set rstemp=nothing
	  set sqltemp=nothing
end function

'''\\\add by junnor @ 2014.9.7
function getbucode(reqvalue) 'reqvalue表示部门比如综合管理部,这样的部门
	  set conntemp=opendb("lmtof","conn","sql")
	  set rstemp=server.createobject("adodb.recordset")
	  sqltemp= "select bucode from dept where dept='"&reqvalue&"'"
	  rstemp.open sqltemp,conntemp,1,1
	  getbucode=rstemp("bucode")
	  set conntemp=nothing
	  set rstemp=nothing
	  set sqltemp=nothing
end function

function getdeptbuname(reqvalue) 'reqvalue表示部门比如综合管理部 | 获得本部门所在BU的名称
	  set conntemp=opendb("lmtof","conn","sql")
	  set rstemp=server.createobject("adodb.recordset")
	  sqltemp= "select dept from dept where deptcode='"&reqvalue&"'"
	  rstemp.open sqltemp,conntemp,1,1
	  getdeptbuname=rstemp("dept")
	  set conntemp=nothing
	  set rstemp=nothing
	  set sqltemp=nothing
end function
'''add by junnor @ 2014.9.7 ///

function getuserdeptcode(reqvalue) 'reqvalue表示用户名称
	  set conntemp=opendb("lmtof","conn","sql")
	  set rstemp=server.createobject("adodb.recordset")
	  sqltemp= "select deptcode from dept where dept=(select userdept from userinf where username='"&reqvalue&"')"
	  rstemp.open sqltemp,conntemp,1,1
	  getuserdeptcode=rstemp("deptcode")
	  set conntemp=nothing
	  set rstemp=nothing
	  set sqltemp=nothing
end function

function getprojectprin(reqvalue) 'reqvalue表示项目id
	  set conntemp=opendb("GFProjectType","conn","sql")
	  set rstemp=server.createobject("adodb.recordset")
	  sqltemp= "select principal1,principal2 from projectType where projectId='"&reqvalue&"'" 
	  rstemp.open sqltemp,conntemp,1,1
	  projectprin=rstemp("principal1")&"|"&rstemp("principal2")
	  getprojectprin=left(projectprin,len(projectprin)-1)
	  set conntemp=nothing
	  set rstemp=nothing
	  set sqltemp=nothing
end function

function getprojectdeptcode(reqvalue) 'reqvalue表示项目id
	  set conntemp=opendb("GFProjectType","conn","sql")
	  set rstemp=server.createobject("adodb.recordset")
	  sqltemp= "select dept from projectType where projectId='"&reqvalue&"'" 
	  rstemp.open sqltemp,conntemp,1,1
	  projectdept=rstemp("dept")
	  set conntemp=nothing
	  set rstemp=nothing
	  set sqltemp=nothing
	  
	  set connveri=opendb("lmtof","conn","sql")
	  set rsveri=server.createobject("adodb.recordset")
	  sqlveri= "select deptcode from dept where dept ='"&projectdept&"'"
	  rsveri.open sqlveri,connveri,1,1
	  if not rsveri.eof and not rsveri.bof then
	  tempdeptcode=rsveri("deptcode")
	  getprojectdeptcode=tempdeptcode
	  set connveri=nothing
	  set rsveri=nothing
	  set sqlveri=nothing
	end if
end function
%>