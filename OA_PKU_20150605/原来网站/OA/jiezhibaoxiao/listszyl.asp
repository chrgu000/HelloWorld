<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%       
'  Response.Buffer     =     True       
'  Response.ContentType     =     "application/vnd.ms-excel"       这个是用来生成excel表格的
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
monthtoN=request("monthto")
deptN=request("dept")

if (monthN=monthtoN or monthN>monthtoN) and (monthN<>"" and monthtoN<>"") then
  	response.write("<script language=""javascript"">")
	response.write("alert(""日期选择不对，请重新选择"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
end if

if request("submit")="应用1" then
pzh1=trim(request("pzh1"))
id=request("id1")
set conn=opendb("finance","conn","accessdsn")
sql="update reimlisttable set "
sql=sql & "pzh=" & sqlstr(pzh1) & " where id=" & id
conn.Execute sql

end if

if request("submit")="应用2" then
pzh2=trim(request("pzh2"))
id=request("id2")

set conn=opendb("finance","conn","accessdsn")
sql="update borrowlist set "
sql=sql & "pzh=" & sqlstr(pzh2) & " where id=" & id
conn.Execute sql


end if
if deptN="" then
   deptN="所有部门"
end if

if yearN="" then
      yearN=year(now())
	  if yearN=2010 then
		  		yearN=2011
		end if
	  monthN=month(now())
	  monthtoN=month(now())+1
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
<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="table1">
  <tr>
    <td height="21"><div align="center">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="2" height="25"><span class="style2"><img src="../images/main/l3.gif" width="2" height="25"></span></td>
            <td background="../images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="21"><div align="center"><span class="style2"><img src="../images/main/icon.gif" width="15" height="12"></span></div></td>
                  <td align="left"class="style7"><font size="-1">报销模块</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<form  name="form" action="listszyl.asp" method="post">
日期
<select name="year" size="1">
<%if yearN<>"所有" then%>
<%for y=2011 to 2019%>
<option value="<%response.Write(y)%>" <%=selected(CInt(yearN),CInt(y))%>><%response.Write(y)%></option>
<%next%>
<%end if%>
<option value="所有" <%=selected(yearN,"所有")%>>所有</option>
</select>
年
<select name="month" size="1">
<%if monthN<>"所有" then%>
<%for m=1 to 12%>
<option vlue="<%response.Write(m)%>" <%=selected(CInt(monthN),CInt(m))%>><%response.Write(m)%></option>
<%next%>
<%end if%>
<option value="所有"<%=selected(monthN,"所有")%>>所有</option>
</select>
月至
<select name="monthto" size="1">
<%if monthtoN<>"所有" then%>
<%for mn=1 to 12%>
<option vlue="<%response.Write(mn)%>" <%=selected(CInt(monthtoN),CInt(mn))%>><%response.Write(mn)%></option>
<%next%>
<%end if%>
<option value="所有"<%=selected(monthtoN,"所有")%>>所有</option>
</select>
月
<select name="dept" size="1">

<%
        set conn=opendb("GFProjectType","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select DISTINCT  dept  from projectType order by dept"
        rs.open sql,conn,1,1
        do while not rs.eof and not rs.bof %>
<option value="<%=rs("dept")%>" <%=selected(deptN,rs("dept"))%>><%=rs("dept")%></option>      
<%        
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
%>
<option value="所有部门" <%=selected(deptN,"所有部门")%>>所有部门</option>
</select>
<input type="submit" name="sub"  value="查询" />
</form>

<!------------------------------------------------------------------------------------------------------------------------------------------------------>
<%
set conn=opendb("finance","conn","accessdsn")
set rs=server.CreateObject("adodb.recordset")
if deptN="所有部门" or deptN="" then 
     if yearN="所有" then	 
	     sql="select * from reimlisttable where signtime between '2011-1-1' and '2020-12-31'"
		 stra="所有的收支记录"	     
	 end if
	 if yearN<>"所有"  then
	   if monthN="" or monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from reimlisttable where  signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年的记录" 	     
	   end if
	   if monthN<>"" and monthN<>"所有" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthtoN,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from reimlisttable where  signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月至"&monthtoN&"月的记录" 				
	   end if
	  end if
end if
  
if deptN<>"所有部门" then 
     if yearN="所有" then
	     sql="select * from reimlisttable where projectdeptcode="&"'"&getdeptcode(deptN)&"' and reimburseDate between '2011-1-1' and '2020-12-31'"
		 stra=deptN&"所有年的记录"  
	 end if
	 if yearN<>"所有" then
	   if monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from reimlisttable where projectdeptcode="&"'"&getdeptcode(deptN)&"' and signtime between '"&t1&"' and '"&t2&"'" 
		 stra=deptN&yearN&"年的记录"  
	   end if
	   if monthN<>"所有" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthtoN,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from reimlisttable where projectdeptcode="&"'"&getdeptcode(deptN)&"' and signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月至"&monthtoN&"月的记录"  
	   end if
	 end if
end if
  
if deptN="所有部门" then
     if yearN="所有" then
	   
	   	 sql="select * from reimlisttable where signtime between '2011-1-1' and '2020-12-31'"
		 stra="所有的收支记录"
	   
	 end if
end if
  if sql="" or sql="select * from reimlisttable where signtime between '2011-1-1' and '2020-12-31'" then
      sql=sql&" and (stage>6 and stage<10) order by signtime desc"
  else if  sql<>""  then 
     sql=sql&" and  (stage>6 and stage<10) order by signtime desc"
  end if
  end if
  %>
<%=stra%><%'=t1%><%'=t2%><br /><%'=sql%>

<table border="1" cellpadding="1" cellspacing="1" bgcolor="D7E8F8" width="98%">
<tr  bgcolor="D7E8F8" bordercolor="#339999">
<td><font color="#0d79b3" size="-1">序号</font></td>
<td><font color="#0d79b3" size="-1">凭证号</font></td>
<td><font color="#0d79b3" size="-1">日期</font></td>
<td><font color="#0d79b3" size="-1">项目编号</font></td>
<td><font color="#0d79b3" size="-1">报销账号</font></td>
<td><font color="#0d79b3" size="-1">摘要</font></td>
<td><font color="#0d79b3" size="-1">备注</font></td>
<td><font color="#0d79b3" size="-1">支出</font></td>
<td><font color="#0d79b3" size="-1">收入</font></td>
<td><font color="#0d79b3" size="-1">经办人</font></td>
<td><font color="#0d79b3" size="-1">部门</font></td>
<td><font color="#0d79b3" size="-1">余额</font></td>
<td><font color="#0d79b3" size="-1">银行支出</font></td>
<td><font color="#0d79b3" size="-1">银行收入</font></td>
<td><font color="#0d79b3" size="-1">现金支出</font></td>
<td><font color="#0d79b3" size="-1">现金收入</font></td>
</tr>
  <%
'response.write(sql&"<br>")
rs.open sql,conn,1,1
zhichu=0.00
do while not rs.eof and not rs.bof 
%>
<form  name="form" action="listszyl.asp" method="post">
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("id")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("pzh")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("reimburseDate")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("projectId")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("givecount")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("summary")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("remark")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("money")%></font></td>
<td><font color="#0d79b3" size="-1">0.00</td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("claimant")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=getdept(rs("projectdeptcode"))%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
</tr>
</form>
<%
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
	     sql="select * from borrowlist where signtime between '2011-1-1' and '2020-12-31'"
		 stra="所有的收支记录"	     
	 end if
	 if yearN<>"所有"  then
	   if monthN="" or monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from borrowlist where  signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年的记录" 	     
	   end if
	   if monthN<>"" and monthN<>"所有" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthtoN,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from borrowlist where  signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月至"&monthtoN&"的记录" 					
	   end if
	  end if
end if
  
if deptN<>"所有部门" then 
     if yearN="所有" then
	     sql="select * from borrowlist where projectdeptcode="&"'"&getdeptcode(deptN)&"' and signtime between '2011-1-1' and '2020-12-31'"
		 stra=deptN&"所有年的记录"  
	 end if
	 if yearN<>"所有" then
	   if monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from borrowlist where projectdeptcode="&"'"&getdeptcode(deptN)&"' and signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年的记录"  
	   end if
	   if monthN<>"所有" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthtoN,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from borrowlist where projectdeptcode="&"'"&getdeptcode(deptN)&"' and signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月至"&monthtoN&"的记录" 	 
	   end if
	 end if
end if
  
if deptN="所有部门" then
     if yearN="所有" then
	   
	   	 sql="select * from borrowlist where signtime between '2011-1-1' and '2020-12-31'" 
		 stra="所有的收支记录"
	   
	 end if
end if
  if sql="" or sql="select * from borrowlist where signtime between '2011-1-1' and '2020-12-31'"  then
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
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("id")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("pzh")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("date")%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("content")%></font></td>
<td> <font color="#0d79b3" size="-1">0.00</font></td>
<td><font color="#0d79b3" size="-1"><%=rs("money")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("borrower")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("dept")%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
</tr>
</form>
<%
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
		t2=DateSerial(yearN,monthtoN,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from proinM where  timewrite between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月至"&monthtoN&"的记录" 	 				
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
		t2=DateSerial(yearN,monthtoN,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from proinM where attendeeDept="&"'"&deptN&"' and timewrite between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月至"&monthtoN&"的记录"  
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
  %>
    <%
	'response.Write(sql)
rs.open sql,conn,1,1
do while not rs.eof and not rs.bof 
%>
<form  name="form" action="listlan.asp" method="post">
<tr>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("id")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("pzh")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("time")%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; <%=rs("projectId")%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("content")%></font></td>
<td> <font color="#0d79b3" size="-1">0.00</font></td>
<td><font color="#0d79b3" size="-1"><%=rs("money")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("jinbanren")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("prodept")%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
</tr>
</form>
<%
shouru=shouru+rs("money")
rs.movenext
loop
set rs=nothing
set conn=nothing
%>
<!---------------------------------------end end end------------------------------------------------------>
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
		t2=DateSerial(yearN,monthtoN,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from cnaction where  writetime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"年"&monthN&"月至"&monthtoN&"的记录" 				
	   end if
	  end if
end if
  
if deptN="所有部门" then
     if yearN="所有" then
	   
	   	 sql="select * from cnaction where writetime between '2011-1-1' and '2020-12-31'"
		 stra="所有的收支记录"
	   
	 end if
end if
  if sql="" or sql="select * from cnaction where writetime between '2011-1-1' and '2020-12-31'" then
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
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("id")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("pzh")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("writetime")%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("content")%></font></td>
<td><font color="#0d79b3" size="-1"><%=rs("outmoney")%></font></td>
<td><font color="#0d79b3" size="-1"><%=rs("inmoney")%></font></td>
<td><font color="#0d79b3" size="-1"> &nbsp;<%=rs("jinbanren")%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
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
<td><font color="#0d79b3" size="-1">总计</font></td>
<td><font color="#0d79b3" size="-1">&nbsp;</font></td>
<td><font color="#0d79b3" size="-1">&nbsp;</font></td>
<td><font color="#0d79b3" size="-1">&nbsp;</font></td>
<td><font color="#0d79b3" size="-1">&nbsp;</font></td>
<td><font color="#0d79b3" size="-1">&nbsp;</font></td>
<td><font color="#0d79b3" size="-1">&nbsp;</font></td>
<td><font color="#0d79b3" size="-1"><%=zhichu%></font></td>
<td><font color="#0d79b3" size="-1"><%=shouru%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp;</font></td>
<td><font color="#0d79b3" size="-1">&nbsp;</font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>

</tr>
</table>
 <a href="excel.asp?year=<%=YearN%>&month=<%=monthN%>&monthto=<%=monthtoN%>&dept=<%=deptN%>">生成此收支一览表</a>
  
</font>
</body>
</html>
