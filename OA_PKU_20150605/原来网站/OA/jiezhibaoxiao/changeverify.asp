<!--#include file="opendb.asp"-->
<%
function changeverify(projectid,code,tolevel,rstype)
'�����Ŀ�������Ϣ��
	set connveri=opendb("GFProjectType","conn","sql")
	set rsveri=server.createobject("adodb.recordset")
	sqlveri= "select * from projectType where projectId='"&projectid&"'"
	rsveri.open sqlveri,connveri,1,1
	if not rsveri.eof and not rsveri.bof then
		tempdept=rsveri("dept")
		tempprincipal1=rsveri("principal1")
		tempprincipal2=rsveri("principal2")
		temptype=rsveri("type")	
		tempuserlevel="����Ŀ����"	
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
	  '�����Ŀ�������Ϣ��
	  
	  '��ò��ž������Ϣ��
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
	    tempdeptlevel="���ž���"
	    verify=verify&"--"&tempdept&":"&tempdeptlevel&":"&tempdeptleader
	  end if
	  set connveri=nothing
	  set rsveri=nothing
	  set sqlveri=nothing
	  'response.Write(verify)
	  '��ò��ž������Ϣ��
	  
	  '����۹ܲ�����쵼����Ϣ��
	  zgdept="�ۺϹ���"
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
	  tempzglevel="�۹ܲ�������"
	  if code="R" then
	  verify=verify&"--"&zgdept&":"&tempzglevel&":"&tempzgleader
	  end if
	  'response.Write(verify)
	  '����۹ܲ�����쵼����Ϣ��
	  
	  
	  '��ò������ܵ���Ϣ��
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
	  tempcwzglevel="��������"
	  verify=verify&"--"&tempcwzglevel&":"&cwzgleader
	  'response.Write(verify)
	  '��ò������ܵ���Ϣ��
	  
	  '��û��������˵ĵ���Ϣ��
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
	  tempdszlevel="����������"
	  verify=verify&"--"&tempbudept&":"&tempdszlevel&":"&dszleader
	  'response.Write(verify)
	  '��û��������˵ĵ���Ϣ��
	  
	  '��ò���ĵ���Ϣ��
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
	  tempcwlevel="����"
	  verify=verify&"--"&tempcwlevel&":"&cwleader
	  '��ò���ĵ���Ϣ��
	  
	  '��ó��ɵ���Ϣ��
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
	  tempcnlevel="����"
	  verify=verify&"--"&tempcnlevel&":"&cnleader
	  'response.Write(verify)
	  '��ó��ɵ���Ϣ��
	  getverify=verify
end function
%>