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
	
	function sqlstr(data)
	sqlstr="'" & replace(data,"'","''") & "'"
	end function
	
yearN=request("year")
monthN=request("month")
deptN=request("dept")

'

	if request("submit")="Ӧ��1" then
		pzh1=trim(request("pzh1"))
		id=request("id1")
		set conn=opendb("finance","conn","accessdsn")
		sql="update reimlisttable set "
		sql=sql & "pzh=" & sqlstr(pzh1) & " where id=" & id
		conn.Execute sql
	end if

	if request("submit")="Ӧ��2" then
		pzh2=trim(request("pzh2"))
		id=request("id2")
		set conn=opendb("finance","conn","accessdsn")
		sql="update borrowlist set "
		sql=sql & "pzh=" & sqlstr(pzh2) & " where id=" & id
		conn.Execute sql
	end if

	if request("submit")="Ӧ��3" then
		pzh3=trim(request("pzh3"))
		id=request("id3")
		set conn=opendb("symx","conn","accessdsn")
		sql="update proinM set "
		sql=sql & "pzh=" & sqlstr(pzh3) & " where id=" & id
		conn.Execute sql
	end if

	if request("submit")="Ӧ��4" then
		pzh4=trim(request("pzh4"))
		id=request("id4")
		set conn=opendb("finance","conn","accessdsn")
		sql="update cnaction set "
		sql=sql & "pzh=" & sqlstr(pzh4) & " where id=" & id
		conn.Execute sql
	end if

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

<% 
        'dim projectId
'		i=0
'        set conn=opendb("GFProjectType.mdb","conn","accessdsn")
'        set rs=server.createobject("adodb.recordset")
'		if deptN="" or deptN="���в���" then
'        sql="select *  from projectType"
'		end if
'		if deptN<>"" and deptN<>"���в���" then
'		sql="select *  from projectType where dept='"&deptN&"'"
'		end if
'        rs.open sql,conn,1,1
'        do while not rs.eof and not rs.bof
'		i=i+1   
'        rs.movenext
'        loop
'        set rs=nothing
'        set conn=nothing
'		
'		
'		redim projectId(i-1)
'		ii=0
'		set conn=opendb("GFProjectType.mdb","conn","accessdsn")
'        set rs=server.createobject("adodb.recordset")
'        if deptN="" or deptN="���в���" then
'        sql="select *  from projectType"
'		end if
'		if deptN<>"" and deptN<>"���в���" then
'		sql="select *  from projectType where dept='"&deptN&"'"
'		end if
'        rs.open sql,conn,1,1
'        do while not rs.eof and not rs.bof
'		projectId(ii)=rs("projectId")
'		ii=ii+1
'        rs.movenext
'        loop
'        set rs=nothing
'        set conn=nothing
'		
'				
'		dim financeCount
'		j=0
'        set conn=opendb("GFProjectType.mdb","conn","accessdsn")
'        set rs=server.createobject("adodb.recordset")
'        sql="select DISTINCT financeCount from projectType where financeCount<>'' order by financeCount"
'        rs.open sql,conn,1,1
'        do while not rs.eof and not rs.bof
'		j=j+1   
'        rs.movenext
'        loop
'        set rs=nothing
'        set conn=nothing
'		
'		redim financeCount(j-1)
'		jj=0
'		set conn=opendb("GFProjectType.mdb","conn","accessdsn")
'        set rs=server.createobject("adodb.recordset")
'        sql="select DISTINCT financeCount from projectType where financeCount<>'' order by financeCount"
'        rs.open sql,conn,1,1
'        do while not rs.eof and not rs.bof		 
'		financeCount(jj)=rs("financeCount")
'		jj=jj+1
'        rs.movenext
'        loop
'        set rs=nothing
'        set conn=nothing
'		
'		
'		dim projectName
'		k=0
'        set conn=opendb("GFProjectType.mdb","conn","accessdsn")
'        set rs=server.createobject("adodb.recordset")
'        sql="select *  from projectType"
'        rs.open sql,conn,1,1
'        do while not rs.eof and not rs.bof
'		k=k+1   
'        rs.movenext
'        loop
'        set rs=nothing
'        set conn=nothing
'		
'		redim projectName(k-1)
'		kk=0
'		set conn=opendb("GFProjectType.mdb","conn","accessdsn")
'        set rs=server.createobject("adodb.recordset")
'        sql="select *  from projectType"
'        rs.open sql,conn,1,1
'        do while not rs.eof and not rs.bof
'		projectName(kk)=rs("projectName")
'		kk=kk+1
'        rs.movenext
'        loop
'        set rs=nothing
'        set conn=nothing
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
	<form  name="form" action="listlan.asp" method="post">
	����
		<select name="year" size="1">
			<%if yearN<>"����" then%>
			<%for y=2010 to 2019%>
			<option value="<%response.Write(y)%>" <%=selected(CInt(yearN),CInt(y))%>><%response.Write(y)%></option>
			<%next%>
			<%end if%>
			<option value="����" <%=selected(yearN,"����")%>>����</option>
		</select>
	��
		<select name="month" size="1">
			<%if monthN<>"����" then%>
			<%for m=1 to 12%>
			<option vlue="<%response.Write(m)%>" <%=selected(CInt(monthN),CInt(m))%>><%response.Write(m)%></option>
			<%next%>
			<%end if%>
			<option value="����"<%=selected(monthN,"����")%>>����</option>
		</select>
	��
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
	<option value="���в���" <%=selected(deptN,"���в���")%>>���в���</option>
	</select>
	<input type="submit" name="sub"  value="��ѯ" />
	</form>

<!------------------------------------------------------------------------------------------------------------------------------------------------------>
<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","accessdsn")
set rs=server.CreateObject("adodb.recordset")
'����0�Ĳ���ʾ

if deptN="���в���" or deptN="" then 
     if yearN="����" then	 
	     sql="select * from reimlisttable where signtime between '2010-1-1' and '2020-12-31'" 
		 stra="���е���֧��¼"	     
	 end if
	 if yearN<>"����"  then
	   if monthN="" or monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from reimlisttable where  signtime between '"&t1&"' and '"&t2&"'" 
		 stra=deptN&yearN&"��ļ�¼" 	     
	   end if
	   if monthN<>"" and monthN<>"����" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from reimlisttable where  signtime between '"&t1&"'  and '"&t2&"'"  
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼" 				
	   end if
	  end if
end if
  
if deptN<>"���в���" then 
     if yearN="����" then
	     sql="select * from reimlisttable where projectDept="&"'"&deptN&"' and reimburseDate between '2010-1-1' and '2020-12-31'" 
		 stra=deptN&"������ļ�¼"  
	 end if
	 if yearN<>"����" then
	   if monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from reimlisttable where projectDept="&"'"&deptN&"' and signtime between '"&t1&"' and '"&t2&"'" 
		 stra=deptN&yearN&"��ļ�¼"  
	   end if
	   if monthN<>"����" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from reimlisttable where projectDept="&"'"&deptN&"' and signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼"  
	   end if
	 end if
end if
  
if deptN="���в���" then
     if yearN="����" then
	   
	   	 sql="select * from reimlisttable where signtime between '2010-1-1' and '2020-12-31' " 
		 stra="���е���֧��¼"
	   
	 end if
end if
  if sql="" or sql="select * from reimlisttable where signtime between '2010-1-1' and '2020-12-31'"  then
      sql=sql&" and (stage>6 and stage<10) order by signtime desc"
  else if  sql<>""  then 
     sql=sql&" and  (stage>6 and stage<10) order by signtime desc"
  end if
  end if
  'response.write(sql&"<br>")
  'sql="select * from reimlisttable where  reimburseDate>=#"&t1&"# and reimburseDate<#"&t2&"#  order by projectId"

  %>
<%=stra%><%'=t1%><%'=t2%><br /><%'=sql%>

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
</tr>
  <%
rs.open sql,conn,1,1
zhichu=0
do while not rs.eof and not rs.bof 
%>
<form  name="form" action="listlan.asp" method="post">
<td> &nbsp;<%=rs("id")%></td>
<td> &nbsp;<%IF oabusyuserlevelCode="CN" OR oabusyuserlevelCode="CW" THEN %><input type="text" name="pzh1"  size="10"  value="<%=rs("pzh")%>" /><input type="hidden" name="id1" value="<%=rs("id")%>" />
<input type="hidden" name="year" value="<%=yearN%>" /><input type="hidden" name="month" value="<%=monthN%>" /><input type="hidden" name="dept" value="<%=deptN%>" /><input type="submit" name="submit" value="Ӧ��1"><%end if%>
<%if oabusyuserlevelCode<>"CN" and oabusyuserlevelCode<>"CW" then %><%=rs("pzh")%><%end if%></td>
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
</tr>
</form>
<%
zhichu=zhichu+rs("money")
rs.movenext
loop
set rs=nothing
set conn=nothing
%>

<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
'����0�Ĳ���ʾ

if deptN="���в���" or deptN="" then 
     if yearN="����" then	 
	     sql="select * from borrowlist where signtime between '2010-1-1' and '2020-12-31'" 
		 stra="���е���֧��¼"	     
	 end if
	 if yearN<>"����"  then
	   if monthN="" or monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from borrowlist where  signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"��ļ�¼" 	     
	   end if
	   if monthN<>"" and monthN<>"����" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from borrowlist where  signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼" 				
	   end if
	  end if
end if
  
if deptN<>"���в���" then 
     if yearN="����" then
	     sql="select * from borrowlist where dept="&"'"&deptN&"' and signtime between '2010-1-1' and '2020-12-31'"
		 stra=deptN&"������ļ�¼"  
	 end if
	 if yearN<>"����" then
	   if monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from borrowlist where dept="&"'"&deptN&"' and signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"��ļ�¼"  
	   end if
	   if monthN<>"����" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from borrowlist where dept="&"'"&deptN&"' and signtime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼"  
	   end if
	 end if
end if
  
if deptN="���в���" then
     if yearN="����" then
	   
	   	 sql="select * from borrowlist where signtime>=2010-1-1" 
		 stra="���е���֧��¼"
	   
	 end if
end if
  if sql="" or sql="select * from borrowlist where signtime between '2010-1-1' and '2020-12-31'"  then
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
shouru=0
do while not rs.eof and not rs.bof 
%>
<form  name="form" action="listlan.asp" method="post">
<tr>
<td> &nbsp;<%=rs("id")%></td>
<td> &nbsp;<%IF oabusyuserlevelCode="CN" OR oabusyuserlevelCode="CW" THEN %><input type="text" name="pzh2"  size="10" value="<%=rs("pzh")%>"/><input type="hidden" name="id2"  value="<%=rs("id")%>"/>
<input type="hidden" name="year" value="<%=yearN%>" /><input type="hidden" name="month" value="<%=monthN%>" /><input type="hidden" name="dept" value="<%=deptN%>" /><input type="submit" name="submit" value="Ӧ��2"><%end if%><%if oabusyuserlevelCode<>"CN" and oabusyuserlevelCode<>"CW" then %><%=rs("pzh")%><%end if%></td>
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
</tr>
</form>
<%
shouru=shouru+rs("money")
rs.movenext
loop
set rs=nothing
set conn=nothing
%>
<!---------------------------------------��ʾ�����������---------------------------------------------->
<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("yusuan\symx.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("symx","conn","sql")
set rs=server.CreateObject("adodb.recordset")
'����0�Ĳ���ʾ

if deptN="���в���" or deptN="" then 
     if yearN="����" then	 
	     sql="select * from proinM where timewrite between '2010-1-1' and '2020-12-31'"
		 stra="���е���֧��¼"	     
	 end if
	 if yearN<>"����"  then
	   if monthN="" or monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from proinM where  timewrite between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"��ļ�¼" 	     
	   end if
	   if monthN<>"" and monthN<>"����" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from proinM where  timewrite between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼" 				
	   end if
	  end if
end if
  
if deptN<>"���в���" then 
     if yearN="����" then
	     sql="select * from proinM where dept="&"'"&deptN&"' and timewrite between '2010-1-1' and '2020-12-31'" 
		 stra=deptN&"������ļ�¼"  
	 end if
	 if yearN<>"����" then
	   if monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from proinM where dept="&"'"&deptN&"' and timewrite between '"&t1&"' and '"&t2&"'" 
		 stra=deptN&yearN&"��ļ�¼"  
	   end if
	   if monthN<>"����" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from proinM where dept="&"'"&deptN&"' and timewrite between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼"  
	   end if
	 end if
end if
  
if deptN="���в���" then
     if yearN="����" then
	   
	   	 sql="select * from proinM where timewrite between '2010-1-1' and '2020-12-31'"
		 stra="���е���֧��¼"
	   
	 end if
end if
  if sql="" or sql="select * from proinM where timewrite between '2010-1-1' and '2020-12-31'" then
      sql=sql&"  order by timewrite desc"
  else if  sql<>""  then 
     sql=sql&"  order by timewrite desc"
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
<td> &nbsp;<%IF oabusyuserlevelCode="CN" OR oabusyuserlevelCode="CW" THEN %><input type="text" name="pzh3"  size="10" value="<%=rs("pzh")%>"/><input type="hidden" name="id3"  value="<%=rs("id")%>"/>
<input type="hidden" name="year" value="<%=yearN%>" /><input type="hidden" name="month" value="<%=monthN%>" /><input type="hidden" name="dept" value="<%=deptN%>" /><input type="submit" name="submit" value="Ӧ��3"><%end if%><%if oabusyuserlevelCode<>"CN" and oabusyuserlevelCode<>"CW" then %><%=rs("pzh")%><%end if%></td>
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
<!---------------------------------------��ʾ��֧---------------------------------------------->
<%
 if deptN="���в���" or deptN="" then 
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
'����0�Ĳ���ʾ

if deptN="���в���" or deptN="" then 
     if yearN="����" then	 
	     sql="select * from cnaction where writetime between '2010-1-1' and '2020-12-31'"
		 stra="���е���֧��¼"	     
	 end if
	 if yearN<>"����"  then
	   if monthN="" or monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from cnaction where  writetime between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"��ļ�¼" 	     
	   end if
	   if monthN<>"" and monthN<>"����" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	     sql="select * from cnaction where  writetime between '"&t1&"' and '"&t2&"'" 
		 stra=deptN&yearN&"��"&monthN&"�µļ�¼" 				
	   end if
	  end if
end if
  
if deptN="���в���" then
     if yearN="����" then
	   
	   	 sql="select * from cnaction where writetime between '2010-1-1' and '2020-12-31'" 
		 stra="���е���֧��¼"
	   
	 end if
end if
  if sql="" or sql="select * from cnaction where writetime between '2010-1-1' and '2020-12-31'"  then
      sql=sql&"  order by writetime desc"
  else if  sql<>""  then 
     sql=sql&"  order by writetime desc"
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
<td> &nbsp;<%IF oabusyuserlevelCode="CN" OR oabusyuserlevelCode="CW" THEN %><input type="text" name="pzh4"  size="10" value="<%=rs("pzh")%>"/><input type="hidden" name="id4"  value="<%=rs("id")%>"/>
<input type="hidden" name="year" value="<%=yearN%>" /><input type="hidden" name="month" value="<%=monthN%>" /><input type="hidden" name="dept" value="<%=deptN%>" /><input type="submit" name="submit" value="Ӧ��4"><%END IF%>
<%if oabusyuserlevelCode<>"CN" and oabusyuserlevelCode<>"CW" then %><%=rs("pzh")%><%end if%></td>
<td> &nbsp;<%=rs("writetime")%></td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td>&nbsp; </td>
<td> &nbsp;<%=rs("content")%></td>
<td><%=rs("outmoney")%></td>
<td><%=rs("inmoney")%></td>
<td> &nbsp;<%=rs("jinbanren")%></td>
<td>&nbsp; </td>
<td>&nbsp; </td>
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
<td>�ܼ�</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><%=zhichu%></td>
<td><%=shouru%></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp; </td>
</tr>
</table>
<%IF oabusyuserlevelCode="CN" OR oabusyuserlevelCode="CW" THEN %><a href="listszyl.asp">��֧һ��Ŀ��ʾ</a><%END IF%>
</font>
</body>
</html>



