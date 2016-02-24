<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
yearN=request("year")
monthN=request("month")
deptN=request("dept")
 'response.Write(deptN)
if deptN="" then
   deptN="所有部门"
end if

if yearN="" then
      yearN=year(now())
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
'response.Write(yearN&"-"&monthN&"-"&deptN)



%>
<!--#include file="opendb.asp"-->
<% 
        dim projectId
		i=0
        set conn=opendb("GFProjectType","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
		if deptN="" or deptN="所有部门" then
        sql="select *  from projectType"
		end if
		if deptN<>"" and deptN<>"所有部门" then
		sql="select *  from projectType where dept='"&deptN&"'"
		end if
        rs.open sql,conn,1,1
        do while not rs.eof and not rs.bof
		i=i+1   
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
		
		
		redim projectId(i-1)
		ii=0
		set conn=opendb("GFProjectType","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        if deptN="" or deptN="所有部门" then
        sql="select *  from projectType"
		end if
		if deptN<>"" and deptN<>"所有部门" then
		sql="select *  from projectType where dept='"&deptN&"'"
		end if
        rs.open sql,conn,1,1
        do while not rs.eof and not rs.bof
		projectId(ii)=rs("projectId")
		ii=ii+1
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
		
				
		dim financeCount
		j=0
        set conn=opendb("GFProjectType","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select DISTINCT financeCount from projectType where financeCount<>'' order by financeCount"
        rs.open sql,conn,1,1
        do while not rs.eof and not rs.bof
		j=j+1   
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
		
		redim financeCount(j-1)
		jj=0
		set conn=opendb("GFProjectType","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select DISTINCT financeCount from projectType where financeCount<>'' order by financeCount"
        rs.open sql,conn,1,1
        do while not rs.eof and not rs.bof		 
		financeCount(jj)=rs("financeCount")
		jj=jj+1
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
		
		
		dim projectName
		k=0
        set conn=opendb("GFProjectType","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select *  from projectType"
        rs.open sql,conn,1,1
        do while not rs.eof and not rs.bof
		k=k+1   
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
		
		redim projectName(k-1)
		kk=0
		set conn=opendb("GFProjectType","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select *  from projectType"
        rs.open sql,conn,1,1
        do while not rs.eof and not rs.bof
		projectName(kk)=rs("projectName")
		kk=kk+1
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>一览</title>
</head>
<body>
<div align="center">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
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
<form  name="form" action="list.asp" method="post">
日期
<select name="year" size="1">
<option value="所有" <%=selected("所有",yearN)%>>所有</option>
<%for y=2009 to 2019%>
<option value="<%response.Write(y)%>" <%=selected(y,yearN)%>><%response.Write(y)%></option>
<%next%>
</select>
年
<select name="month" size="1">
<option value="所有"<%=selected("所有",monthN)%>>所有</option>
<%for m=1 to 12%>
<option vlue="<%response.Write(m)%>" <%=selected(m,monthN)%>><%response.Write(m)%></option>
<%next%>
</select>
月
<select name="dept" size="1">
<option value="所有部门" <%=selected("所有部门",deptN)%>>所有部门</option>
<%
        set conn=opendb("GFProjectType","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select DISTINCT  dept  from projectType order by dept"
        rs.open sql,conn,1,1
        do while not rs.eof and not rs.bof %>
<option value="<%=rs("dept")%>" <%=selected(rs("dept"),deptN)%>><%=rs("dept")%></option>      
<%        
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
%>
</select>
<input type="submit"  value="查询" />
</form>

<!------------------------------------------------------------------------------------------------------------------------------------------------------>
<%
dim    outpay
redim  outpay(i-1)

 response.write(t)
 for x=0 to i-1
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
'等于0的不显示
if deptN="所有部门" or deptN="" then 
     if yearN="所有" then	 
	     sql="select * from reimlisttable" 
		 stra="所有的收支记录"	     
	 end if
	 if yearN<>"所有"  then
	   if monthN="" or monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from reimlisttable where  occurDate>=#"&t1&"# and occurDate<#"&t2&"#  "
		 stra=deptN&yearN&"年的记录" 	     
	   end if
	   if monthN<>"" and monthN<>"所有" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from reimlisttable where  occurDate>=#"&t1&"# and occurDate<#"&t2&"#" 
		 stra=deptN&yearN&"年"&monthN&"月的记录" 				
	   end if
	  end if
end if
  
if deptN<>"所有部门" then 
     if yearN="所有" then
	     sql="select * from reimlisttable where projectDept="&"'"&deptN&"'" 
		 stra=deptN&"所有年的记录"  
	 end if
	 if yearN<>"所有" then
	   if monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from reimlisttable where projectDept="&"'"&deptN&"' and occurDate>=#"&t1&"# and occurDate<#"&t2&"#" 
		 stra=deptN&yearN&"年的记录"  
	   end if
	   if monthN<>"所有" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from reimlisttable where projectDept="&"'"&deptN&"' and occurDate>=#"&t1&"# and occurDate<#"&t2&"# "
		 stra=deptN&yearN&"年"&monthN&"月的记录"  
	   end if
	 end if
end if
  
if deptN="所有部门" then
     if yearN="所有" then
	   
	   	 sql="select * from reimlisttable" 
		 stra="所有的收支记录"
	   
	 end if
end if
  if sql="" or sql="select * from reimlisttable" then
      sql=sql&" where projectId='"&projectId(x)&"' and (stage>6 and stage<10)"
  else if  sql<>""  then 
     sql=sql&" and projectId='"&projectId(x)&"'  and (stage>6 and stage<10)"
  end if
  end if
  'response.write(sql&"<br>")
 
rs.open sql,conn,1,1
do while not rs.eof and not rs.bof 
outpay(x)=rs("money")+outpay(x)   '问题处在无法赋值
rs.movenext
loop
set rs=nothing
set conn=nothing
next
%>
<%=stra%>

<table border="1" cellpadding="1" cellspacing="1" bgcolor="D7E8F8">
<tr  bgcolor="D7E8F8" bordercolor="#339999">
<td>序号</td>
<td>日期</td>
<td>项目编号</td>
<td>报销账号</td>
<td>摘要</td>
<td>备注</td>
<td>支出</td>
<td>收入</td>
<td>经办人</td>
<td>部门</td>
<td>金额</td>
</tr>
<%
all=0
for ff=0 to i-1%>
<tr>
<td><%=(ff+1)%></td>
<td><%=timeit%></td>
<td><a href=listwithproject.asp?projectid=<%=projectId(ff)%> target="_blank"><%=projectId(ff)%></a></td>
<td>
<%      set conn=opendb("GFProjectType","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select financeCount from projectType where projectId='"&projectId(ff)&"'"
        rs.open sql,conn,1,1
        do while not rs.eof and not rs.bof
%>
<a href=listwithcount.asp?Count=<%=rs("financeCount")%> target="_blank"><%=rs("financeCount")%></a>
<%
		  'response.Write(rs("financeCount"))
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
%>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>
<%
if outpay(ff)="" then
response.Write("0")
end if
if outpay(ff)<>"" then
response.Write(outpay(ff))
end if
%>
</td>
<td>&nbsp;</td>
<td>
<%      set conn=opendb("lmtof","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select username from userinf where levelCode='CN'"
        rs.open sql,conn,1,1
        do while not rs.eof and not rs.bof
		  response.Write(rs("username"))
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
%>
</td>
<td>
<%      set conn=opendb("GFProjectType","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select dept from projectType where projectId='"&projectId(ff)&"'"
        rs.open sql,conn,1,1
        do while not rs.eof and not rs.bof
		  response.Write(rs("dept"))
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
%>
</td>
<td>
<%if outpay(ff)=0 then
response.Write("0")
end if
if outpay(ff)<>0 then
response.Write(outpay(ff))
end if
all=all+outpay(ff)
%></td>
</tr>
<%
next
%>
<tr>
<td>总计</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><%=all%></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><%=all%></td>
</tr>
</table>
</font>
</body>
</html>
