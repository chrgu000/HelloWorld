<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%       
  Response.Buffer     =     True       
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
'



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

'if timeit="����ʱ��" then response.Write("���Գɹ�")

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>һ��</title>
</head>
<body>
<div align="center">

<!------------------------------------------------------------------------------------------------------------------------------------------------------>
<%
set conn=server.CreateObject("adodb.connection")
path=server.MapPath("finance.mdb")
conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set rs=server.CreateObject("adodb.recordset")
'����0�Ĳ���ʾ

if deptN="���в���" or deptN="" then 
     if yearN="����" then	 
	     sql="select * from reimlisttable where signtime>=#2010-1-1#" 
		 stra="���е���֧��¼"	     
	 end if
	 if yearN<>"����"  then
	   if monthN="" or monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from reimlisttable where  signtime>=#"&t1&"# and signtime<#"&t2&"# "
		 stra=deptN&yearN&"��ļ�¼" 	     
	   end if
	   if monthN<>"" and monthN<>"����" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from reimlisttable where  signtime>=#"&t1&"# and signtime<#"&t2&"#" 
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼" 				
	   end if
	  end if
end if
  
if deptN<>"���в���" then 
     if yearN="����" then
	     sql="select * from reimlisttable where projectDept="&"'"&deptN&"' and reimburseDate>=#2010-1-1# " 
		 stra=deptN&"������ļ�¼"  
	 end if
	 if yearN<>"����" then
	   if monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from reimlisttable where projectDept="&"'"&deptN&"' and signtime>=#"&t1&"# and signtime<#"&t2&"#" 
		 stra=deptN&yearN&"��ļ�¼"  
	   end if
	   if monthN<>"����" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from reimlisttable where projectDept="&"'"&deptN&"' and signtime>=#"&t1&"# and signtime<#"&t2&"# "
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼"  
	   end if
	 end if
end if
  
if deptN="���в���" then
     if yearN="����" then
	   
	   	 sql="select * from reimlisttable where signtime>=#2010-1-1#" 
		 stra="���е���֧��¼"
	   
	 end if
end if
  if sql="" or sql="select * from reimlisttable where signtime>=#2010-1-1#" then
      sql=sql&" and (stage>6 and stage<10) order by signtime desc"
  else if  sql<>""  then 
     sql=sql&" and  (stage>6 and stage<10) order by signtime desc"
  end if
  end if
  'response.write(sql&"<br>")
  'sql="select * from reimlisttable where  reimburseDate>=#"&t1&"# and reimburseDate<#"&t2&"#  order by projectId"

  %>
<table border="1" cellpadding="1" cellspacing="1" bgcolor="D7E8F8" width="95%">
<tr  bgcolor="D7E8F8" bordercolor="#339999">
<td>���</td>
<td>ƾ֤��</td>
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
<td>����֧��</td>
<td>��������</td>
<td>�ֽ�֧��</td>
<td>�ֽ�����</td>
</tr>
  <%
rs.open sql,conn,1,1
baoxiao=0
do while not rs.eof and not rs.bof 
%>
<form  name="form" action="listszyl.asp" method="post">
<td> &nbsp;<%=rs("id")%></td>
<td> &nbsp;<%=rs("pzh")%></td>
<td> &nbsp;<%=rs("reimburseDate")%></td>
<td> &nbsp;<%=rs("projectId")%></td>
<td> &nbsp;<%=rs("givecount")%></td>
<td> &nbsp;<%=rs("summary")%></td>
<td> &nbsp;<%=rs("remark")%></td>
<td> &nbsp;<%=rs("money")%></td>
<td>0.00</td>
<td> &nbsp;<%=rs("claimant")%></td>
<td> &nbsp;<%=rs("projectDept")%></td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
</tr>
</form>
<%
baoxiao=baoxiao+rs("money")
rs.movenext
loop
set rs=nothing
set conn=nothing
%>

<%
set conn=server.CreateObject("adodb.connection")
path=server.MapPath("finance.mdb")
conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set rs=server.CreateObject("adodb.recordset")
'����0�Ĳ���ʾ

if deptN="���в���" or deptN="" then 
     if yearN="����" then	 
	     sql="select * from borrowlist where signtime>=#2010-1-1#" 
		 stra="���е���֧��¼"	     
	 end if
	 if yearN<>"����"  then
	   if monthN="" or monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from borrowlist where  signtime>=#"&t1&"# and signtime<#"&t2&"# "
		 stra=deptN&yearN&"��ļ�¼" 	     
	   end if
	   if monthN<>"" and monthN<>"����" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from borrowlist where  signtime>=#"&t1&"# and signtime<#"&t2&"#" 
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼" 				
	   end if
	  end if
end if
  
if deptN<>"���в���" then 
     if yearN="����" then
	     sql="select * from borrowlist where dept="&"'"&deptN&"' and signtime>=#2010-1-1#" 
		 stra=deptN&"������ļ�¼"  
	 end if
	 if yearN<>"����" then
	   if monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from borrowlist where dept="&"'"&deptN&"' and signtime>=#"&t1&"# and signtime<#"&t2&"#" 
		 stra=deptN&yearN&"��ļ�¼"  
	   end if
	   if monthN<>"����" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from borrowlist where dept="&"'"&deptN&"' and signtime>=#"&t1&"# and signtime<#"&t2&"# "
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼"  
	   end if
	 end if
end if
  
if deptN="���в���" then
     if yearN="����" then
	   
	   	 sql="select * from borrowlist where signtime>=#2010-1-1#" 
		 stra="���е���֧��¼"
	   
	 end if
end if
  if sql="" or sql="select * from borrowlist where signtime>=#2010-1-1#"  then
      sql=sql&" and (stage>6 and stage<10) order by signtime desc"
  else if  sql<>""  then 
     sql=sql&" and  (stage>6 and stage<10) order by signtime desc"
  end if
  end if
  'response.write(sql&"<br>")
  'sql="select * from reimlisttable where  reimburseDate>=#"&t1&"# and reimburseDate<#"&t2&"#  order by projectId"
  %>
    <%
rs.open sql,conn,1,1
jiezhi=0
do while not rs.eof and not rs.bof 
%>
<form  name="form" action="listszyl.asp" method="post">
<tr>
<td> &nbsp;<%=rs("id")%></td>
<td> &nbsp;<%=rs("pzh")%></td>
<td> &nbsp;<%=rs("date")%></td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td> &nbsp;<%=rs("content")%></td>
<td> 0.00</td>
<td><%=rs("money")%></td>
<td> &nbsp;<%=rs("borrower")%></td>
<td> &nbsp;<%=rs("dept")%></td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
</tr>
</form>
<%
jiezhi=jiezhi+rs("money")
rs.movenext
loop
set rs=nothing
set conn=nothing

%>
<!---------------------------------------��ʾ�����������---------------------------------------------->
<%
set conn=server.CreateObject("adodb.connection")
path=server.MapPath("yusuan\symx.mdb")
conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set rs=server.CreateObject("adodb.recordset")
'����0�Ĳ���ʾ

if deptN="���в���" or deptN="" then 
     if yearN="����" then	 
	     sql="select * from proinM where time>=#2010-1-1#" 
		 stra="���е���֧��¼"	     
	 end if
	 if yearN<>"����"  then
	   if monthN="" or monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from proinM where  time>=#"&t1&"# and time<#"&t2&"# "
		 stra=deptN&yearN&"��ļ�¼" 	     
	   end if
	   if monthN<>"" and monthN<>"����" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from proinM where  time>=#"&t1&"# and time<#"&t2&"#" 
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼" 				
	   end if
	  end if
end if
  
if deptN<>"���в���" then 
     if yearN="����" then
	     sql="select * from proinM where dept="&"'"&deptN&"' and time>=#2010-1-1#" 
		 stra=deptN&"������ļ�¼"  
	 end if
	 if yearN<>"����" then
	   if monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from proinM where dept="&"'"&deptN&"' and time>=#"&t1&"# and time<#"&t2&"#" 
		 stra=deptN&yearN&"��ļ�¼"  
	   end if
	   if monthN<>"����" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from proinM where dept="&"'"&deptN&"' and time>=#"&t1&"# and time<#"&t2&"# "
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼"  
	   end if
	 end if
end if
  
if deptN="���в���" then
     if yearN="����" then
	   
	   	 sql="select * from proinM where time>=#2010-1-1#" 
		 stra="���е���֧��¼"
	   
	 end if
end if
  if sql="" or sql="select * from proinM where time>=#2010-1-1#"  then
      sql=sql&"  order by time desc"
  else if  sql<>""  then 
     sql=sql&"  order by time desc"
  end if
  end if
  'response.write(sql&"<br>")
  'sql="select * from reimlisttable where  reimburseDate>=#"&t1&"# and reimburseDate<#"&t2&"#  order by projectId"
  %>
    <%
rs.open sql,conn,1,1
do while not rs.eof and not rs.bof 
%>
<form  name="form" action="listlan.asp" method="post">
<tr>
<td> &nbsp;<%=rs("id")%></td>
<td> &nbsp;<%=rs("pzh")%></td>
<td> &nbsp;<%=rs("time")%></td>
<td>&nbsp; <%=rs("projectId")%></td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td> &nbsp;<%=rs("content")%></td>
<td> 0.00</td>
<td><%=rs("money")%></td>
<td> &nbsp;<%=rs("jinbanren")%></td>
<td> &nbsp;<%=rs("prodept")%></td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
</tr>
</form>
<%
rs.movenext
loop
set rs=nothing
set conn=nothing
%>
<!---------------------------------------end end end------------------------------------------------------>
  <tr>
<td>�ܼ�</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><%=baoxiao%></td>
<td><%=jiezhi%></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
</tr>
</table>
   
</font>
</body>
</html>

