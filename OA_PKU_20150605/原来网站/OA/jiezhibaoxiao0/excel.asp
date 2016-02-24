<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%       
  Response.Buffer     =     True       
  'Response.ContentType     =     "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  Response.ContentType     =     "application/vnd.ms-excel"      
  %>
<!--#include file="opendb.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
code=oabusyuserlevelCode
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
function selected(req,reqvalue)
if req=reqvalue  then
selected=" selected"
else
selected=""
end if
end function
function sqlstr(data)
sqlstr="'" & replace(data,"'","''") & "'"
end function
yearN=request("year")
monthN=request("month")
deptN=request("dept")

if deptN="" then
   deptN="所有部门"
end if

if yearN="" then
      yearN=year(now())
	  if yearN=2010 then
		  		yearN=2011
		end if
	  monthN=month(now())
	  timeit=yearN&"年"
end if
if yearN<>"" then
   if yearN="所有" then
      tinmeit="所有时间"
   end if
   if yearN<>"所有" then
      if monthN="" or monthN="所有" then
	     timeit=yearN&"年"
	  end if
	  if monthN<>"" and monthN<>"所有" then
	     timeit=yearN&"年"&monthN&"月"
	  end if
	end if
end if
if yearN="所有" and  monthN="所有" then
    timeit="所有时间"
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>一览</title>
</head>
<body>
<div align="center">

<!------------------------------------------------------------------------------------------------------------------------------------------------------>
<%
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
if deptN="所有部门" or deptN="" then 
     if yearN="所有" then	 
	     sql="select * from reimlisttable_old where signtime between '2011-1-1' and '2020-12-31'" 
		 stra="所有的收支记录"	     
	 end if
	 if yearN<>"所有"  then
	   if monthN="" or monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from reimlisttable_old where  signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年的记录" 	     
	   end if
	   if monthN<>"" and monthN<>"所有" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from reimlisttable_old where  signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月的记录" 				
	   end if
	  end if
end if
  
if deptN<>"所有部门" then 
     if yearN="所有" then
	     sql="select * from reimlisttable_old where projectDept="&"'"&deptN&"' and reimburseDate between '2011-1-1' and '2020-12-31'" 
		 stra=deptN&"所有年的记录"  
	 end if
	 if yearN<>"所有" then
	   if monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from reimlisttable_old where projectDept="&"'"&deptN&"' and signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年的记录"  
	   end if
	   if monthN<>"所有" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from reimlisttable_old where projectDept="&"'"&deptN&"' and signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月的记录"  
	   end if
	 end if
end if
  
if deptN="所有部门" then
     if yearN="所有" then
	   
	   	 sql="select * from reimlisttable_old where signtime between '2011-1-1' and '2020-12-31'" 
		 stra="所有的收支记录"
	   
	 end if
end if
  if sql="" or sql="select * from reimlisttable_old where signtime between '2011-1-1' and '2020-12-31'" then
      sql=sql&" and (stage>6 and stage<10) order by signtime desc"
  else if  sql<>""  then 
     sql=sql&" and  (stage>6 and stage<10) order by signtime desc"
  end if
  end if
  %>
<table border="1" cellpadding="1" cellspacing="1" bgcolor="D7E8F8" width="95%">
<tr  bgcolor="D7E8F8" bordercolor="#339999">
<td>序号</td>
<td>凭证号</td>
<td>日期</td>
<td>项目编号</td>
<td>报销账号</td>
<td>摘要</td>
<td>备注</td>
<td>支出</td>
<td>收入</td>
<td>经办人</td>
<td>部门</td>
<td>余额</td>
<td>银行支出</td>
<td>银行收入</td>
<td>现金支出</td>
<td>现金收入</td>
</tr>
  <%
rs.open sql,conn,1,1
zhichu=0
do while not rs.eof and not rs.bof 
%>
<form  name="form" action="listszyl.asp" method="post">
<td>    <%=rs("id")%></td>
<td>    <%=rs("pzh")%></td>
<td>    <%=rs("reimburseDate")%></td>
<td>    <%=rs("projectId")%></td>
<td>    <%=rs("givecount")%></td>
<td>    <%=rs("summary")%></td>
<td>    <%=rs("remark")%></td>
<td>    <%=rs("money")%></td>
<td>0.00</td>
<td>    <%=rs("claimant")%></td>
<td>    <%=rs("projectDept")%></td>
<td>    </td>
<td>    </td>
<td>    </td>
<td>    </td>
<td>    </td>
</tr>
</form>
<%
'zhichu=zhichu+rs("money")
zhichu=zhichu + cdbl(rs("money"))
rs.movenext
loop
set rs=nothing
set conn=nothing
%>

<%
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
if deptN="所有部门" or deptN="" then 
     if yearN="所有" then	 
	     sql="select * from borrowlist_old where signtime between '2011-1-1' and '2020-12-31'" 
		 stra="所有的收支记录"	     
	 end if
	 if yearN<>"所有"  then
	   if monthN="" or monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from borrowlist_old where  signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年的记录" 	     
	   end if
	   if monthN<>"" and monthN<>"所有" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from borrowlist_old where  signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月的记录" 				
	   end if
	  end if
end if
  
if deptN<>"所有部门" then 
     if yearN="所有" then
	     sql="select * from borrowlist_old where dept="&"'"&deptN&"' and signtime between '2011-1-1' and '2020-12-31'" 
		 stra=deptN&"所有年的记录"  
	 end if
	 if yearN<>"所有" then
	   if monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from borrowlist_old where dept="&"'"&deptN&"' and signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年的记录"  
	   end if
	   if monthN<>"所有" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from borrowlist_old where dept="&"'"&deptN&"' and signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月的记录"  
	   end if
	 end if
end if
  
if deptN="所有部门" then
     if yearN="所有" then
	   
	   	 sql="select * from borrowlist_old where signtime between '2011-1-1' and '2020-12-31'"
		 stra="所有的收支记录"
	   
	 end if
end if
  if sql="" or sql="select * from borrowlist_old where signtime>=2011-1-1"  then
      sql=sql&" and (stage>6 and stage<10) order by signtime desc"
  else if  sql<>""  then 
     sql=sql&" and  (stage>6 and stage<10) order by signtime desc"
  end if
  end if
  %>
    <%
rs.open sql,conn,1,1
shouru=0
do while not rs.eof and not rs.bof 
%>
<form  name="form" action="listszyl.asp" method="post">
<tr>
<td>    <%=rs("id")%></td>
<td>    <%=rs("pzh")%></td>
<td>    <%=rs("date")%></td>
<td>    </td>
<td>    </td>
<td>    </td>
<td>    <%=rs("content")%></td>
<td> 0.00</td>
<td><%=rs("money")%></td>
<td>    <%=rs("borrower")%></td>
<td>    <%=rs("dept")%></td>
<td>    </td>
<td>    </td>
<td>    </td>
<td>    </td>
<td>    </td>
</tr>
</form>
<%
'shouru=shouru+rs("money")
shouru=shouru+ cdbl(rs("money"))
rs.movenext
loop
set rs=nothing
set conn=nothing

%>
<!---------------------------------------显示入款分配的内容---------------------------------------------->
<%
set conn=opendb("symx","conn","sql")
set rs=server.CreateObject("adodb.recordset")
'等于0的不显示

if deptN="所有部门" or deptN="" then 
     if yearN="所有" then	 
	     sql="select * from proinM where timewrite between '2011-1-1' and '2020-12-31'"
		 stra="所有的收支记录"	     
	 end if
	 if yearN<>"所有"  then
	   if monthN="" or monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from proinM where  timewrite between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年的记录" 	     
	   end if
	   if monthN<>"" and monthN<>"所有" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from proinM where  timewrite between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月的记录" 				
	   end if
	  end if
end if
  
if deptN<>"所有部门" then 
     if yearN="所有" then
	     sql="select * from proinM where attendeeDept="&"'"&deptN&"' and timewrite between '2011-1-1' and '2020-12-31'" 
		 stra=deptN&"所有年的记录"  
	 end if
	 if yearN<>"所有" then
	   if monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from proinM where attendeeDept="&"'"&deptN&"' and timewrite between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年的记录"  
	   end if
	   if monthN<>"所有" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from proinM where attendeeDept="&"'"&deptN&"' and timewrite between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月的记录"  
	   end if
	 end if
end if
  
if deptN="所有部门" then
     if yearN="所有" then
	   
	   	 sql="select * from proinM where timewrite between '2011-1-1' and '2020-12-31'"
		 stra="所有的收支记录"
	   
	 end if
end if
  if sql="" or sql="select * from proinM where timewrite between '2011-1-1' and '2020-12-31'"  then
      sql=sql&"  order by timewrite desc"
  else if  sql<>""  then 
     sql=sql&"  order by timewrite desc"
  end if
  end if
  response.write(sql&"<br>")
  %>
    <%
rs.open sql,conn,1,1
do while not rs.eof and not rs.bof 
%>
<form  name="form" action="listlan.asp" method="post">
<tr>
<td>    <%=rs("id")%></td>
<td>    <%=rs("pzh")%></td>
<td>    <%=rs("time")%></td>
<td>    <%=rs("projectId")%></td>
<td>    </td>
<td>    </td>
<td>    <%=rs("content")%></td>
<td> 0.00</td>
<td><%=rs("money")%></td>
<td>    <%=rs("jinbanren")%></td>
<td>    <%=rs("prodept")%></td>
<td>    </td>
<td>    </td>
<td>    </td>
<td>    </td>
<td>    </td>
</tr>
</form>
<%
shouru=shouru+rs("money")
rs.movenext
loop
set rs=nothing
set conn=nothing
%>
<!---------------------------------------显示收支---------------------------------------------->
<%
 if deptN="所有部门" or deptN="" then 
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
if deptN="所有部门" or deptN="" then 
     if yearN="所有" then	 
	     sql="select * from cnaction where writetime between '2011-1-1' and '2020-12-31'"
		 stra="所有的收支记录"	     
	 end if
	 if yearN<>"所有"  then
	   if monthN="" or monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from cnaction where  writetime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年的记录" 	     
	   end if
	   if monthN<>"" and monthN<>"所有" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from cnaction where  writetime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月的记录" 				
	   end if
	  end if
end if
  
if deptN="所有部门" then
     if yearN="所有" then
	   
	   	 sql="select * from cnaction where writetime between '2011-1-1' and '2020-12-31'" 
		 stra="所有的收支记录"
	   
	 end if
end if
  if sql="" or sql="select * from cnaction where writetime between '2011-1-1' and '2020-12-31'"  then
      sql=sql&"  order by writetime desc"
  else if  sql<>""  then 
     sql=sql&"  order by writetime desc"
  end if
  end if
  %>
    <%
rs.open sql,conn,1,1
do while not rs.eof and not rs.bof 
%>
<form  name="form" action="listlan.asp" method="post">
<tr>
<td>    <%=rs("id")%></td>
<td>    <%=rs("pzh")%></td>
<td>    <%=rs("writetime")%></td>
<td>    </td>
<td>    </td>
<td>    </td>
<td>    <%=rs("content")%></td>
<td><%=rs("outmoney")%></td>
<td><%=rs("inmoney")%></td>
<td>    <%=rs("jinbanren")%></td>
<td>    </td>
<td>    </td>
<td>    </td>
<td>    </td>
<td>    </td>
<td>    </td>
</tr>
</form>
<%
zhichu=zhichu+rs("outmoney")
shouru=shouru+rs("inmoney")
rs.movenext
loop
set rs=nothing
set conn=nothing
end if
%>
<!---------------------------------------end end end------------------------------------------------------>
  <tr>
<td>总计</td>
<td>   </td>
<td>   </td>
<td>   </td>
<td>   </td>
<td>   </td>
<td>   </td>
<td><%=zhichu%></td>
<td><%=shouru%></td>
<td>   </td>
<td>   </td>
<td>    </td>
<td>    </td>
<td>    </td>
<td>    </td>
<td>    </td>
</tr>
</table>
   
</font>
</body>
</html>

