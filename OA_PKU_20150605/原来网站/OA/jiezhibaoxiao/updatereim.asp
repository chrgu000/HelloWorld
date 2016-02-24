<!--#include file="opendb.asp"-->
<!--#include file="getverifyR.asp"-->
<%
function updaterrelcd(iid)
	set connveri=opendb("finance","conn","sql")
	set rsveri=server.createobject("adodb.recordset")
	sqlveri= "select * from [reimlisttable] where id="&iid
	rsveri.open sqlveri,connveri,1,1
	if not rsveri.eof and not rsveri.bof then
		temprelclaimant=rsveri("relclaimant")
		updaterrelcd=getuserdeptcode(temprelclaimant)	
	set connveri=nothing
	set rsveri=nothing
	set sqlveri=nothing
	end if
end function

function updatecd(iid)
	set connveri=opendb("finance","conn","sql")
	set rsveri=server.createobject("adodb.recordset")
	sqlveri= "select * from [reimlisttable] where id="&iid
	rsveri.open sqlveri,connveri,1,1
	if not rsveri.eof and not rsveri.bof then
		tempclaimant=rsveri("claimant")
		updatecd=getuserdeptcode(tempclaimant)	
	set connveri=nothing
	set rsveri=nothing
	set sqlveri=nothing
	end if
end function

function updatepdc(iid)  
	set connveri=opendb("finance","conn","sql")
	set rsveri=server.createobject("adodb.recordset")
	sqlveri= "select * from [reimlisttable] where id="&iid
	rsveri.open sqlveri,connveri,1,1
	if not rsveri.eof and not rsveri.bof then
		tempprojectid=rsveri("projectId")
		updatepdc=getprojectdeptcode(tempprojectid)	
	set connveri=nothing
	set rsveri=nothing
	set sqlveri=nothing
	end if
	
end function

function updatenotes(iid)
	set connveri=opendb("finance","conn","sql")
	set rsveri=server.createobject("adodb.recordset")
	sqlveri= "select * from [reimlisttable] where id="&iid
	rsveri.open sqlveri,connveri,1,1
if not rsveri.eof and not rsveri.bof then
		tempstage=rsveri("stage")
		tempprincipalNotes=rsveri("principalNotes")
		tempdeptNotes=rsveri("deptNotes")
		tempfinancialNotes=rsveri("financialNotes")
		tempgManagerNotes=rsveri("gManagerNotes")
		updatenotes=""
		if 	(tempprincipalNotes is not NULL) and  (tempprincipalNotes <> "") and (tempprincipalNotes <> "undefined") then
			updatenotes=tempprincipalNotes
		end if
		
		if 	(tempdeptNotes is not NULL) and  (tempdeptNotes <> "") and (tempdeptNotes <> "undefined") then
			updatenotes=updatenotes&tempdeptNotes
		end if
		
		if 	(tempfinancialNotes is not NULL) and  (tempfinancialNotes <> "") and (tempfinancialNotes <> "undefined") then
			updatenotes=updatenotes&tempfinancialNotes
		end if
		
		if 	(tempgManagerNotes is not NULL) and  (tempgManagerNotes <> "") and (tempgManagerNotes <> "undefined") then
			updatenotes=updatenotes&tempgManagerNotes
		end if	
	set connveri=nothing
	set rsveri=nothing
	set sqlveri=nothing
end if
end function


function updateverify(iid)
	set connveri=opendb("finance","conn","sql")
	set rsveri=server.createobject("adodb.recordset")
	sqlveri= "select * from [reimlisttable] where id="&iid
	rsveri.open sqlveri,connveri,1,1
	if not rsveri.eof and not rsveri.bof then
		tempclaimant=rsveri("claimant")
		temprelclaimant=rsveri("relclaimant")
		tempprojectid=rsveri("projectId")
		tempstage=rsveri("stage")	
		verify=getverifyR(tempprojectid,"R","AA")
	set connveri=nothing
	set rsveri=nothing
	set sqlveri=nothing
	end if
end function

''''------------------------------------------------------------------------------
function getdept(reqvalue)
	  set conntemp=opendb("lmtof","conn","sql")
	  set rstemp=server.createobject("adodb.recordset")
	  sqltemp= "select dept from dept where deptcode='"&reqvalue&"'"
	  rstemp.open sqltemp,conntemp,1,1
	  getdept=rstemp("dept")
	  set conntemp=nothing
	  set rstemp=nothing
	  set sqltemp=nothing
end function

function getdeptcode(reqvalue)
	  set conntemp=opendb("lmtof","conn","sql")
	  set rstemp=server.createobject("adodb.recordset")
	  sqltemp= "select deptcode from dept where dept='"&reqvalue&"'"
	  rstemp.open sqltemp,conntemp,1,1
	  getdeptcode=rstemp("deptcode")
	  set conntemp=nothing
	  set rstemp=nothing
	  set sqltemp=nothing
end function

function getuserdeptcode(reqvalue)
	  set conntemp=opendb("lmtof","conn","sql")
	  set rstemp=server.createobject("adodb.recordset")
	  sqltemp= "select deptcode from dept where dept=(select userdept from userinf where username='"&reqvalue&"')"
	  rstemp.open sqltemp,conntemp,1,1
	  getuserdeptcode=rstemp("deptcode")
	  set conntemp=nothing
	  set rstemp=nothing
	  set sqltemp=nothing
end function

function getprojectprin(reqvalue)
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

function getprojectdeptcode(reqvalue)
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

function getprojectjie(projectid)
	  set conntemp=opendb("GFProjectType","conn","sql")
	  set rstemp=server.createobject("adodb.recordset")
	  sqltemp= "select jieti from projectType where projectId='"&projectid&"'" 
	  rstemp.open sqltemp,conntemp,1,1
	  getprojectjie=rstemp("jieti")
	  set conntemp=nothing
	  set rstemp=nothing
	  set sqltemp=nothing
end function
%>