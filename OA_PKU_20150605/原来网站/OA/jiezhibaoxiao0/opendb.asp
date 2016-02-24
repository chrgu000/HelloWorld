
<%
function opendb(DBname,sessionname,dbsort)
dim conn 
Dim StrServer,StrUid,StrSaPwd,StrDbName
StrServer="(local)" '数据库服务器名
StrUid="sa" '您的登录帐号
StrSaPwd="sa@JUNSHI123" '您的登录密码
StrDbName=DBname'您的数据库名称

Dim StrDSN '数据库连接字符串
Dim Rs '命令字符串 
StrDSN="driver={SQL server};server="&StrServer&";uid="&StrUid&";pwd="&StrSaPwd&";database="&StrDbName
'建立和数据库master的连接
set conn = Server.CreateObject("ADODB.Connection") 
ON ERROR RESUME NEXT
conn.Open StrDSN

set session(sessionname)=conn
'end if
set opendb=session(sessionname)
end function


sub create_userlist()
	set conn=opendb("lmtof","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select distinct * from dept_old"
	rs.open sql,conn,1,1
	dept=""
	if not rs.eof and not rs.bof then
		do while not rs.eof and not rs.bof 
	   		dept= dept&  ","  &rs("dept") 
			rs.movenext
		loop
		dept=Right(dept,len(dept)-1)
	end if
	deptlist =split(dept,",")
	response.Cookies("dept")=dept
	n=Ubound(deptlist)
	for i=0 to n
	  sql="select distinct * from userinf where userdept='" & deptlist(i) & "'"
	  set rs=server.createobject("adodb.recordset")
	  rs.open sql,conn,1,1
	  if not rs.eof and not rs.bof then
	     do while not rs.eof and not rs.bof
		     user=user & "," & rs("name") 
		     rs.movenext
		 loop
		 user=right(user,len(user)-1)
		 response.Cookies(deptlist(i))=user
	  end if
	next
end sub
function generate_deptlist()
   dept_select="<select name='dept' size='1'>"
   dept=request.Cookies("dept")
   deptlist =split(dept,",")
   n =ubound(deptlist)
   for i=0 to n
      dept_select=dept_select & "<option vlue='" & deptlist(i) & "'> " & deptlist(i) & "</option>"
   next
   dept_select=dept_select &"</select>"
   generate_deptlist=dept_select
end function


function selected(req,reqvalue)
if req=reqvalue then
selected=req & " selected"
else
selected=req
end if
end function


function generate_summarylist(selected_summary,containall)
         s="<select name='summaryID'>"
		 if(containall) then
		   s=s&"<option value='所有'>所有</option>"
		 end if
	     set connn=opendb("CostType","conn","sql")
          set rsn=server.CreateObject("adodb.recordset")
          sqln="select DISTINCT type from costtype "
          rsn.open sqln,connn,1,1
		  do  while not rsn.eof  
				 s=s&"<optgroup label=" & cstr(rsn("type")) &">"
				 set conn=opendb("CostType","conn","sql")
				 set rs=server.CreateObject("adodb.recordset")
				 sql="select * from costtype where type='"&rsn("type")&"'"
				 rs.open sql,conn,1,1
				 do  while not rs.eof
                                 
				 s=s&"<option value=" & cstr(rs("id")) & selected(cstr(rs("id")),selected_summary) & ">" & cstr(rs("id")) & cstr(rs("content")) & "</option>"
				 rs.movenext
				 loop
				 set rs=nothing
				 set conn=nothing
				 s=s&"</optgroup>"
			     rsn.movenext
		  loop
		  set rsn=nothing
		  set connn=nothing
		  s=s&"</select>"
		  generate_summarylist=s
end function

function generate_projectlist(selected_project,containall)
           s="<select name=projectId size=1>"
		   if(containall) then
		   s=s&"<option value='所有'>所有</option>"
		 end if
		   set conn=opendb("GFProjectType","conn","sql")
		   set rsn=server.CreateObject("adodb.recordset")
		   sql="select * from projectType_old order by dept"
		   rsn.open sql,conn,1,1
		   previousdept=""
		   do while not rsn.eof
		      if(previousdept<>cstr(rsn("dept"))) then
			    if(previousdept<>"") then
					s=s & "</optgroup>"
				end if
		        s=s & "<optgroup label=" & cstr(rsn("dept")) &">"
				previousdept=cstr(rsn("dept"))
			  end if
			  s=s& "<option value=" & cstr(rsn("projectId")) & selected(cstr(rsn("projectId")),selected_project) & ">" & cstr(rsn("projectId")) & cstr(rsn("projectName")) & "</option>"
		     rsn.movenext
		 loop
		 set rsn=nothing
		 set conn=nothing
		 s=s&"</optgroup></select>"
		 generate_projectlist=s
end function

function generate_givecountlist(selected_count,containall)
           s="<select name=givecountID size=1>"
		   if(containall) then
		   s=s&"<option value='所有'>所有</option>"
		 end if
		   set conn=opendb("Finance","conn","sql")
		   set rsn=server.CreateObject("adodb.recordset")
		   sql="select * from givecount_list"
		   rsn.open sql,conn,1,1
		   do while not rsn.eof
		     s=s& "<option value=" & cstr(rsn("givecount")) & selected(cstr(rsn("givecount")),selected_count) & ">" & cstr(rsn("givecount")) & "</option>"
		     rsn.movenext
		   loop
		   set rsn=nothing
		   set conn=nothing
		   s=s&"</select>"
		   generate_givecountlist=s
end function
%>