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
   deptN="���в���"
end if

if yearN="" then
      yearN=year(now())
	  monthN=month(now())
	  timeit=yearN&"��"
end if
if yearN<>"" then
   if yearN="����" then
      tinmeit="����ʱ��"
   end if
   if yearN<>"����" then
      if monthN="" or monthN="����" then
	     timeit=yearN&"��"
	  end if
	  if monthN<>"" and monthN<>"����" then
	     timeit=yearN&"��"&monthN&"��"
	  end if
	end if
end if
if yearN="����" and  monthN="����" then
    timeit="����ʱ��"
end if
'response.Write(yearN&"-"&monthN&"-"&deptN)



%>
<!--#include file="opendb.asp"-->
<% 
        dim projectId
		i=0
        set conn=opendb("GFProjectType","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
		if deptN="" or deptN="���в���" then
        sql="select *  from projectType"
		end if
		if deptN<>"" and deptN<>"���в���" then
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
        if deptN="" or deptN="���в���" then
        sql="select *  from projectType"
		end if
		if deptN<>"" and deptN<>"���в���" then
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
<title>һ��</title>
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
                  <td align="left"class="style7"><font size="-1">����ģ��</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<form  name="form" action="list.asp" method="post">
����
<select name="year" size="1">
<option value="����" <%=selected("����",yearN)%>>����</option>
<%for y=2009 to 2019%>
<option value="<%response.Write(y)%>" <%=selected(y,yearN)%>><%response.Write(y)%></option>
<%next%>
</select>
��
<select name="month" size="1">
<option value="����"<%=selected("����",monthN)%>>����</option>
<%for m=1 to 12%>
<option vlue="<%response.Write(m)%>" <%=selected(m,monthN)%>><%response.Write(m)%></option>
<%next%>
</select>
��
<select name="dept" size="1">
<option value="���в���" <%=selected("���в���",deptN)%>>���в���</option>
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
<input type="submit"  value="��ѯ" />
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
'����0�Ĳ���ʾ
if deptN="���в���" or deptN="" then 
     if yearN="����" then	 
	     sql="select * from reimlisttable" 
		 stra="���е���֧��¼"	     
	 end if
	 if yearN<>"����"  then
	   if monthN="" or monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from reimlisttable where  occurDate>=#"&t1&"# and occurDate<#"&t2&"#  "
		 stra=deptN&yearN&"��ļ�¼" 	     
	   end if
	   if monthN<>"" and monthN<>"����" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from reimlisttable where  occurDate>=#"&t1&"# and occurDate<#"&t2&"#" 
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼" 				
	   end if
	  end if
end if
  
if deptN<>"���в���" then 
     if yearN="����" then
	     sql="select * from reimlisttable where projectDept="&"'"&deptN&"'" 
		 stra=deptN&"������ļ�¼"  
	 end if
	 if yearN<>"����" then
	   if monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from reimlisttable where projectDept="&"'"&deptN&"' and occurDate>=#"&t1&"# and occurDate<#"&t2&"#" 
		 stra=deptN&yearN&"��ļ�¼"  
	   end if
	   if monthN<>"����" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from reimlisttable where projectDept="&"'"&deptN&"' and occurDate>=#"&t1&"# and occurDate<#"&t2&"# "
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼"  
	   end if
	 end if
end if
  
if deptN="���в���" then
     if yearN="����" then
	   
	   	 sql="select * from reimlisttable" 
		 stra="���е���֧��¼"
	   
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
outpay(x)=rs("money")+outpay(x)   '���⴦���޷���ֵ
rs.movenext
loop
set rs=nothing
set conn=nothing
next
%>
<%=stra%>

<table border="1" cellpadding="1" cellspacing="1" bgcolor="D7E8F8">
<tr  bgcolor="D7E8F8" bordercolor="#339999">
<td>���</td>
<td>����</td>
<td>��Ŀ���</td>
<td>�����˺�</td>
<td>ժҪ</td>
<td>��ע</td>
<td>֧��</td>
<td>����</td>
<td>������</td>
<td>����</td>
<td>���</td>
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
<td>�ܼ�</td>
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
