<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<%

'��һ�����иó����ʱ�� ��ʼ�����ݿ�
'���õĴ��룬deleted by lsl 20101224
'����


function selected(req,reqvalue)
if req=reqvalue  then
selected=" selected"
else
selected=""
end if
end function
%>
<!--����������-->
<%
	idflag=request("idflag")
	saveflag=request("save")
	frefound=cdbl(request("fin"))
	srefound=cdbl(request("sin"))
	trefound=cdbl(request("tin"))	
	
	if saveflag="����" then
		set conn=opendb("finance","conn","accessdsn")
		set rs=server.createobject("adodb.recordset")
		sql="select * from borrowlist where id="&CInt(idflag)
		rs.open sql,conn,1,3
		if  not (Isnumeric(frefound) and isnumeric(srefound) and isnumeric(trefound))  then
				response.Write("<script languange=javascript>alert('����д����������,Ӧ��д����');history.go(-1);</script>")
				response.End()
	    	end if
                money=cdbl(rs("money")) 
		if  frefound + srefound + trefound > money  then
		  response.Write("<script languange=javascript>alert('����д����������,�����ɴ��ڽ���');history.go(-1);</script>")
		  response.End()
	       end if
		borr_clear=false
		if (frefound + srefound + trefound = money ) then
		   borr_clear=true
		end if
		if frefound<>0.00 then 
			rs("frefound")=frefound
			rs("fretime")=FormatDateTime(now(),2)
		end if
		if srefound<>0.00 then 
			rs("srefound")=srefound
			rs("sretime")=FormatDateTime(now(),2)
		end if
		if trefound<>0.00 then 
			rs("trefound")=trefound
			rs("tretime")=FormatDateTime(now(),2)
		end if
		'���ý�֧����Ŀ���壬Ҫ�޸�״̬
		if(borr_clear) then
		   rs("stage")=8
		 end if
		username =rs("borrower")
		rs.update
		'�޸��˻�Ƿ��
		set conn=opendb("lmtof","coynn","accessdsn")
		set rs=server.createobject("adodb.recordset")
		sql="select * from userinf where name='"&username &"'"
		rs.open sql,conn,1,3
		if rs("arearage")>0 then
                arearage=rs("arearage")
		arearage =arearage-frefound-srefound-trefound
		rs("arearage")=arearage
		rs.update
		end if
	end if
%>
<!--end-->
<!--�����Ǵ�����ܵ�����-->
<%
	'����ѡ��ʱ�䡢�û���ֱ�Ӷ�ȡ��δ���塱�Ľ�֧��cancel by lsl 101224
	'�����õ�ʱ������
	'if "ȷ��"=request("conf1") then
		'yearG=request("year")
		'monthG=request("month")
		'response.Write yearG
		'response.Write monthG
			'if yearG="" then
			'	yearG=year(now())
			'end if
			'if monthG="" then
				'monthG=month(now())
			'end if
			'if monthG="ȫ��" then
				'monthG=13
			'end if
			
			'�����õĲ�������
			'deptG=request("dept")
				'if deptG="" then
					'deptG="���в���"
				'end if	
		'response.Cookies("name")=""
		'response.Cookies("t")=""
		'response.Cookies("flag")=""
	
	'end if
		
	'if "ȷ��"=request("conf2") then
		'�����õ���������
		'nameG=request("name")
		
		'response.Cookies("year")=""
		'response.Cookies("month")=""
		'response.Cookies("dept")=""
		'response.Cookies("t")=""
		'response.Cookies("flag")=""
	'end if
	'if "ȷ��"=request("conf3") then
		'������Ĵ���
		'tG=request("t")
		'response.Cookies("year")=""
		'response.Cookies("month")=""
		'response.Cookies("dept")=""
		'response.Cookies("name")=""
		'response.Cookies("flag")=""
	'end if
	'if "ȷ��"=request("conf4") then
		'�����õ��Ƿ���ı�־
		'flagG=request("flag")
		'response.Cookies("year")=""
		'response.Cookies("month")=""
		'response.Cookies("dept")=""
'		response.Cookies("name")=""
'		response.Cookies("t")=""
	'end if
'	response.Write("<div align=center> <font color=#0d79b3>")
'	if yearG<>""  then response.Write yearG&" �� "
'	if monthG<>13 and monthG<>""  then response.Write monthG&" �� "
'	if monthG=13 then response.Write " ȫ�� "
'	response.Write nameG
'	response.Write deptG
'	response.Write tG
'	response.Write flagG
'	response.Write("</font></div>")
%>
<!--����-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����ƽ̨(����)��</title>
</head>

<body>
<div align="center"><font color="#0d79b3" size="-1">
<form action="easy.asp">
  <div align=center> <font color=#0d79b3 size="+2">δ����Ľ�֧��</font></div>
</form>


<table   border="1" cellpadding="1" cellspacing="0" width="97%">
	<tr bgcolor="D7E8F8" bordercolor="#339999" align="center">
		<td><font color="#0d79b3" size="-1">�����</font></td>
		<td><font color="#0d79b3" size="-1">����</font></td>
		<td><font color="#0d79b3" size="-1">���ʱ��</font></td>
		<td><font color="#0d79b3" size="-1">Ԥ�ƻ���ʱ��</font></td>
		<td><font color="#0d79b3" size="-1">�����</font></td>
		<td><font color="#0d79b3" size="-1">��һ�λ���</font></td>
		<td><font color="#0d79b3" size="-1">�ڶ��λ���</font></td>
		<td><font color="#0d79b3" size="-1">�����λ���</font></td>
		<td><font color="#0d79b3" size="-1">���</font></td>
		<td><font color="#0d79b3" size="-1">����ƾ֤����</font></td>
		<td><font color="#0d79b3" size="-1">����</font></td>
		<td><font color="#0d79b3" size="-1">���</font></td>
		<td><font color="#0d79b3" size="-1">״̬</font></td>
	</tr>
	<%
		set conn=opendb("finance","conn","accessdsn")
		set rs=server.createobject("adodb.recordset")
		'����ѡ���ѯ������ֱ�Ӷ�ȡ��֧��cancel by lsl 101224
		'if nameG="" and tG="" and flagG="" then
'			if deptG="���в���" then
'				if CInt(monthG)=CInt(13) then
'					 t1=DateSerial(yearG,1,1)
'					 t2=DateSerial(yearG+1,1,1)
'					 
'					sql="select * from borrowlist where stage=7 and borrowTime between '"&t1&"' and '"&t2&"'"
'				end if
'				if CInt(monthG)<>CInt(13) then
'					 t1=DateSerial(yearG,monthG,1)
'					 t2=DateSerial(yearG,monthG+1,1)
'					sql="select * from borrowlist where stage=7 and borrowTime between '"&t1&"' and '"&t2&"'"
'				end if				
'			end if
'			if deptG<>"���в���" then
'				'sql="select * from borrowlist where stage=7"
'				if CInt(monthG)=CInt(13) then
'					 t1=DateSerial(yearG,1,1)
'					 t2=DateSerial(yearG+1,1,1)
'					 
'					sql="select * from borrowlist where stage=7 and borrowTime between '"&t1&"' and '"&t2&"' and dept='"&deptG&"' order by borrower desc"
'				end if
'				if CInt(monthG)<>CInt(13) then
'					 t1=DateSerial(yearG,monthG,1)
'					 t2=DateSerial(yearG,monthG+1,1)
'					sql="select * from borrowlist where stage=7 and borrowTime between '"&t1&"' and '"&t2&"' and dept='"&deptG&"' order by borrower desc"
'				end if
'			end if
'		end if
'		if nameG<>"" then
'			sql="select * from borrowlist where stage=7 and borrower='"&nameG&"' order by borrowTime desc"
'		end if
'		if tG<>"" then
'			if tG="��һ�λ���" then
'				sql="select * from borrowlist where stage=7 and frefound=0 and srefound=0 and trefound=0"
'			end if
'			if tG="�ڶ��λ���" then
'				sql="select * from borrowlist where stage=7 and frefound<>0 and srefound=0 and trefound=0"
'			end if
'			if tG="�����λ���" then
'				sql="select * from borrowlist where stage=7 and frefound<>0 and srefound<>0 and trefound=0"
'			end if
'		end if
		'if flagG<>"" then
'			if flagG="δ����" then
				sql="select * from borrowlist where stage=15 order by borrowTime desc"				
			'end if
'			if flagG="�ѻ���" then
'				sql="select * from borrowlist where stage=8 order by borrowTime desc"
'			end if
'		end if
		'sql="select * from borrowlist where stage=7 and borrowTime between '2010-3-1' and '2010-4-1'"
		'response.Write(sql)
		rs.open sql,conn,1,1
		do while not rs.eof and not rs.eof 
	%>
	<tr>
	<form action="easy.asp">
		<td><%=rs("borrower")%></td>
		<td><%=rs("dept")%></td>
		<td><%=rs("borrowTime")%></td>
		<td><%=rs("repayTime")%></td>
		<td><%=rs("money")%></td>
		<td>
		<%frefound=cdbl(rs("frefound")) %>
		<%if frefound<>0 then%>
		<%=frefound%><br><%=FormatDateTime(now(),2)%>
		<%end if%>
                <% if frefound =0 then%>
		<input type="text" size="8" name="fin" value="<%=frefound%>"/><br>
		<%if rs("fretime")<>NULL then%>
		<%=FormatDateTime(rs("fretime"),2)%>
		<%end if%>
		<%if rs("fretime")=NULL then%>
		<%=FormatDateTime(now(),2)%>
		<%end if%>
		
		<%end if%>
		</td>
		<td>
		<%srefound=cdbl(rs("srefound"))%>
		<% if srefound<>0 then%>
		<%=srefound%><br><%=FormatDateTime(now(),2)%>
		<%end if%>
		<% if srefound=0 then%>
		<input type="text" size="8" name="sin" value="<%=srefound%>"/><br>
		<%if rs("sretime")<>NULL then%>
		<%=FormatDateTime(rs("sretime"),2)%>
		<%end if%>
		<%if rs("sretime")=NULL then%>
		<%=FormatDateTime(now(),2)%>
		<%end if%>
		
		<%end if%>
		</td>
		<td>
		<%trefound=cdbl(rs("trefound"))%>
		<% if trefound<>0.00 then%>
		<%=trefound%><br><%=FormatDateTime(now(),2)%>
		<%end if%>
		<% if trefound=0.00 then%>
		<input type="text" size="8" name="tin" value="<%=trefound%>"/><br>
		<%if rs("tretime")<>NULL then%>
		<%=FormatDateTime(rs("tretime"),2)%>
		<%end if%>
		<%if rs("tretime")=NULL then%>
		<%=FormatDateTime(now(),2)%>
		<%end if%>
		
		<%end if%>
		</td>
		<td>
		<%money=cdbl(rs("money"))%>
		<%= money - frefound - srefound - trefound%>
		</td>
		<td><a href="printeasy.asp?num=1&id=<%=rs("id")%>">��һ�λ���</a>&nbsp;&nbsp;<a href="printeasy.asp?num=2&id=<%=rs("id")%>">�ڶ��λ���</a>&nbsp;&nbsp;<a href="printeasy.asp?num=3&id=<%=rs("id")%>">�����λ���</a></td>
		<td><input type="hidden" name="idflag" value="<%=rs("id")%>" />
		<%
			if yearG<>"" then response.Cookies("year")=yearG
			if monthG<>"" then response.Cookies("month")=monthG
			if deptG<>"" then response.Cookies("dept")=deptG
			if nameG<>"" then response.Cookies("name")=nameG
			if tG<>"" then response.Cookies("t")=tG
			if flagG<>"" then response.Cookies("flag")=flagG
		%>
		<input type="submit" name="save" name="conf5"  value="����" />
		</td>
		<td>
		<% if rs("stage")=8 then%>
			<a href="viewBorr.asp?num=1&id=<%=rs("id")%>"><%=rs("id")%></a>
		<% end if%>
		<% if rs("stage")<>8 then %>
			<%=rs("id")%>
		<% end if%>
		</td>
		<td>
		<%
		set cn=opendb("finance","conn","accessdsn")
		set r=server.createobject("adodb.recordset")
		sq="select * from stage where stage="&rs("stage")
		r.open sq,cn,1
		if not r.eof and not r.eof then
		%>
		<%=r("txt")%>
		<%end if%>
		</td>
	  </form>
	</tr>
	<%
		rs.movenext
		loop
	%>
	
</table>
</div>
</body>
</html>
