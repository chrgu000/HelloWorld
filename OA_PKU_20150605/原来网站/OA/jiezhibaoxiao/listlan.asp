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
	response.write("window.top.location.href='mainReim.asp';")
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
projectN=request("projectID")
summaryN=request("summaryID")
givecountN=request("givecountID")

'
if monthN=monthtoN or monthN>monthtoN then
  	response.write("<script language=""javascript"">")
	response.write("alert(""����ѡ�񲻶ԣ�������ѡ��"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
end if


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
		  if yearN=2010 then
		  		yearN=2011
		  end if
		  monthN=month(now())
		  monthtoN=month(now())+1
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
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="21"><div align="center">����
	        
		<select name="year" size="1">
			<%if yearN<>"����" then%>
			<%for y=2011 to 2019%>
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
		�� �� 
        <select name="monthto" size="1">
			<%if monthtoN<>"����" then%>
			<%for mn=1 to 12%>
			<option vlue="<%response.Write(mn)%>" <%=selected(CInt(monthtoN),CInt(mn))%>><%response.Write(mn)%></option>
			<%next%>
			<%end if%>
			<option value="����"<%=selected(monthtoN,"����")%>>����</option>
		</select>
		��
                
		<select name="dept" size="1">
	<%
			set conn=opendb("GFProjectType","conn","accessdsn")
			set rs=server.createobject("adodb.recordset")
			sql="select DISTINCT  dept  from projectType where jieti='NO' order by dept"
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
	</td></tr>
	<tr>
		<td height="21"><div align="center">
	</tr>
        <tr>
		<td height="21"><div align="center">ժҪ
	<%
	  response.write(generate_summarylist(summaryN,true)) 
        %>
          �����ʺ�
        <%
	  response.write(generate_givecountlist(givecountN,true))
	%>

              </td>
        </tr>
	<tr>
		<td height="21"><div align="center">
	</tr>
        <tr>
		<td height="21"><div align="center"> ��Ŀ���
        <%
	  response.write(generate_projectlist(projectN,true))
        %>
           </td>
        </tr>
        </table>
	<input type="submit" name="sub"  value="��ѯ" /> <!--<a href="listlan_2010.asp">****2011��֮ǰ����***</a>-->
	</form>
	

<!--------------------------------------------------------------------------��ʾ����---------------------------------------------------------------------------->
<%
set conn=opendb("finance","conn","accessdsn")
set rs=server.CreateObject("adodb.recordset")
wheresub=""

if Trim(deptN)<>"���в���" and deptN<>"" then
  wheresub=wheresub & "and projectdeptcode='" & getdeptcode(deptN) & "'"
  stra=stra& deptN
end if 
  if yearN<>"����"  then
       stra=stra&yearN&"��" 
	   if monthN="" or monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     wheresub=wheresub & "and signtime between '"&t1&"' and '"&t2&"'" 
	   end if
	   if monthN<>"" and monthN<>"����" then     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthtoN,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     wheresub=wheresub & "and signtime between '"&t1&"' and '"&t2&"'" 
		 stra=stra & monthN&"����"& monthtoN&"��" 				
	   end if
	 end if
if projectN<>"����" then
  wheresub=wheresub & "and projectID='" & projectN & "'"
  stra=stra &"<font color=blue>���̣�</font>"& projectN  	
end if
if summaryN<>"����" then
  wheresub=wheresub & "and summary='" & summaryN & "'"
  stra=stra &"<font color=blue>���ã�</font>" & summaryN 
end if
if givecountN<>"����" then
  wheresub=wheresub & "and givecount='" & givecountN & "'"
  stra=stra &"<font color=blue>�����˺ţ�</font>" & givecountN 	
end if
stra="<font color=red>��֧һ����</font>"& stra 	
sql="select * from reimlisttable where (stage>6 and stage<10)"
sql=sql & wheresub
'response.Write(sql)
 %>
<%=stra%><%'=t1%><%'=t2%><br /><%'=sql%>

<table border="1" cellpadding="1" cellspacing="1" bgcolor="D7E8F8" width="95%">
<tr bgcolor="D7E8F8" bordercolor="#339999">
<td><font color="#0d79b3" size="-1">���</font></td>
<td><font color="#0d79b3" size="-1">ƾ֤��</font></td>
<td><font color="#0d79b3" size="-1">����</font></td>
<td><font color="#0d79b3" size="-1">��Ŀ���</font></td>
<td><font color="#0d79b3" size="-1">�����˺�</font></td>
<td><font color="#0d79b3" size="-1">ժҪ</font></td>
<td><font color="#0d79b3" size="-1">��ע</font></td>
<td><font color="#0d79b3" size="-1">֧��</font></td>
<td><font color="#0d79b3" size="-1">����</font></td>
<td><font color="#0d79b3" size="-1">������</font></td>
<td><font color="#0d79b3" size="-1">����</font></td>
<td><font color="#0d79b3" size="-1">���</font></td>
</tr>
  <%
rs.open sql,conn,1,1
zhichu=0
do while not rs.eof and not rs.bof 
%>
<tr>
<form  name="form" action="listlan.asp" method="post">
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("id")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%IF oabusyuserlevelCode="CN" OR oabusyuserlevelCode="CW" THEN %><input type="text" name="pzh1"  size="8"  value="<%=rs("pzh")%>" /><input type="hidden" name="id1" value="<%=rs("id")%>" />
<input type="hidden" name="year" value="<%=yearN%>" /><input type="hidden" name="month" value="<%=monthN%>" /><input type="hidden" name="dept" value="<%=deptN%>" /><input type="submit" name="submit" size="-1" value="Ӧ��1"><%end if%>
<%if oabusyuserlevelCode<>"CN" and oabusyuserlevelCode<>"CW" then %><%=rs("pzh")%><%end if%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("reimburseDate")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("projectId")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("givecount")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("summary")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("remark")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("money")%></font></td>
<td><font color="#0d79b3" size="-1">0.00</font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("claimant")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=getdept(rs("claimantdeptcode"))%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
</tr>
</form>
<%
if not rs("money") is nothing then
   zhichu=zhichu+cdbl(rs("money"))
end if
rs.movenext
loop
set rs=nothing
set conn=nothing
%>
<!---------------------------------------��֧���ֲ���ʾ�����벿����---------------------------------------------->

<!---------------------------------------��ʾ�����������---------------------------------------------->
<%
set conn=opendb("symx","conn","sql")
set rs=server.CreateObject("adodb.recordset")

if deptN="���в���" or deptN="" then 
     if yearN="����" then	 
	     sql="select * from proinM where timewrite between '2011-1-1' and '2020-12-31'"
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
		t2=DateSerial(yearN,monthtoN,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from proinM where  timewrite between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"��"&monthN&"����"&monthtoN&"�µļ�¼" 				
	   end if
	  end if
end if
  
if deptN<>"���в���" then 
     if yearN="����" then
	     sql="select * from proinM where attendeeDept="&"'"&deptN&"' and timewrite between '2011-1-1' and '2020-12-31'" 
		 stra=deptN&"������ļ�¼"  
	 end if
	 if yearN<>"����" then
	   if monthN="����" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	     sql="select * from proinM where attendeeDept="&"'"&deptN&"' and timewrite between '"&t1&"' and '"&t2&"'" 
		 stra=deptN&yearN&"��ļ�¼"  
	   end if
	   if monthN<>"����" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthtoN,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from proinM where attendeeDept="&"'"&deptN&"' and timewrite between '"&t1&"' and '"&t2&"'"
		 stra=deptN&yearN&"��"&monthN&"����"&monthtoN&"�µļ�¼"   
	   end if
	 end if
end if
  
if deptN="���в���" then
     if yearN="����" then
	   
	   	 sql="select * from proinM where timewrite between '2011-1-1' and '2020-12-31'"
		 stra="���е���֧��¼"
	   
	 end if
end if
  if sql="" or sql="select * from proinM where timewrite between '2011-1-1' and '2020-12-31'" then
      sql=sql&"  order by timewrite desc"
  else if  sql<>""  then 
     sql=sql&"  order by timewrite desc"
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
<td> <font color="#0d79b3" size="-1">&nbsp;<%if oabusyuserlevelCode="CN" OR oabusyuserlevelCode="CW" then %>
<input type="text" name="pzh3"  size="10" value="<%=rs("pzh")%>"/>
<input type="hidden" name="id3"  value="<%=rs("id")%>"/>
<input type="hidden" name="year" value="<%=yearN%>" />
<input type="hidden" name="month" value="<%=monthN%>" />
<input type="hidden" name="dept" value="<%=deptN%>" />
<input  type="submit" name="submit" value="Ӧ��3"><%end if%>
<%if oabusyuserlevelCode<>"CN" and oabusyuserlevelCode<>"CW" then %><%=rs("pzh")%><%end if%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("timewrite")%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; <%=rs("projectId")%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("note")%></font></td>
<td> <font color="#0d79b3" size="-1">0.00</font></td>
<td><font color="#0d79b3" size="-1"><%=rs("summoney")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("inputMan")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("proforDept")%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
</tr>
</form>
<%
shouru=shouru+cdbl(rs("summoney"))
rs.movenext
loop
set rs=nothing
set conn=nothing
%>
<!---------------------------------------��ʾ��֧---------------------------------------------->
<%
 if deptN="���в���" or deptN="" then 
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
if deptN="���в���" or deptN="" then 
     if yearN="����" then	 
	     sql="select * from cnaction where writetime between '2011-1-1' and '2020-12-31'"
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
		t2=DateSerial(yearN,monthtoN,1)
		'add by zhaoshijun 2010-12-21 
		if monthN=12 then
			t2=DateSerial(yearN,monthN,31)
		end if
		'add by zhaoshijun 2010-12-21
	     sql="select * from cnaction where  writetime between '"&t1&"' and '"&t2&"'" 
		 stra=deptN&yearN&"��"&monthN&"����"&monthtoN&"�µļ�¼" 				
	   end if
	  end if
end if
  
if deptN="���в���" then
     if yearN="����" then
	   
	   	 sql="select * from cnaction where writetime between '2011-1-1' and '2020-12-31'" 
		 stra="���е���֧��¼"
	   
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
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("id")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%IF oabusyuserlevelCode="CN" OR oabusyuserlevelCode="CW" THEN %><input type="text" name="pzh4"  size="10" value="<%=rs("pzh")%>"/><input type="hidden" name="id4"  value="<%=rs("id")%>"/>
<input type="hidden" name="year" value="<%=yearN%>" /><input type="hidden" name="month" value="<%=monthN%>" /><input type="hidden" name="dept" value="<%=deptN%>" /><input type="submit" name="submit" value="Ӧ��4"><%END IF%>
<%if oabusyuserlevelCode<>"CN" and oabusyuserlevelCode<>"CW" then %><%=rs("pzh")%><%end if%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("writetime")%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("content")%></font></td>
<td><%=rs("outmoney")%></font></td>
<td><%=rs("inmoney")%></font></td>
<td> <font color="#0d79b3" size="-1">&nbsp;<%=rs("jinbanren")%></font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
<td><font color="#0d79b3" size="-1">&nbsp; </font></td>
</tr>
</form>
<%
zhichu=zhichu+cdbl(rs("outmoney"))
shouru=shouru+cdbl(rs("inmoney"))
rs.movenext
loop
set rs=nothing
set conn=nothing
end if
%>
<!---------------------------------------end end end------------------------------------------------------>
  <tr>
<td><font color="#0d79b3" size="-1">�ܼ�</font></td>
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
</tr>
</table>
<%IF oabusyuserlevelCode="CN" OR oabusyuserlevelCode="CW" THEN %><a href="listszyl.asp">��֧һ��Ŀ��ʾ</a><%END IF%>
<%IF oabusyuserlevelCode="CN" OR oabusyuserlevelCode="CW" THEN %>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
<tr><td height=40></td></tr>
	<tr>
		<td height="21"align="center" width=25%> ���ɣ�ǩ�֣���</td>
		<td height="21"align="center" width=25%>�������ܣ�ǩ�֣���</td>
		<td height="21"align="center" width=25%> ���������ˣ�ǩ�֣���</td>
		<td height="21"align="center" width=5%>���ڣ�</td>
		<td height="21"align="center" width=5%>��</td>
		<td height="21"align="center" width=5%>��</td>
		<td height="21"align="center" width=5%>��</td>
		<td height="21"align="center"></td>
		</tr>
	</table>
		
<%END IF%>

</font>
</body>
</html>



