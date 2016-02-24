<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<%

'第一次运行该程序的时候 初始化数据库
	set conn=opendb("finance","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from borrowlist where stage=77"
	rs.open sql,conn,1,3
		do while not rs.eof and not rs.bof 
		rs("frefound")=0.00
		rs("fretime")=NULL
		rs("srefound")=0.00
		rs("sretime")=NULL
		rs("trefound")=0.00
		rs("tretime")=NULL
		rs.update
		rs.movenext
		loop
	set rs=nothing
	set conn=nothing
	set conn=opendb("finance","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from borrowlist where stage=88"
	rs.open sql,conn,1,3
		do while not rs.eof and not rs.bof 
		rs("frefound")=rs("money")
		rs("fretime")=FormatDateTime(now(),2)
		rs("srefound")=0.00
		rs("sretime")=NULL
		rs("trefound")=0.00
		rs("tretime")=NULL
		rs.update
		rs.movenext
		loop
	set rs=nothing
	set conn=nothing
'结束


function selected(req,reqvalue)
if req=reqvalue  then
selected=" selected"
else
selected=""
end if
end function
%>
<!--处理保存命令-->
<%
	idflag=request("idflag")
	saveflag=request("save")
	frefound=request("fin")
	srefound=request("sin")
	trefound=request("tin")	
	
	if saveflag="保存" then
		set conn=opendb("finance","conn","accessdsn")
		set rs=server.createobject("adodb.recordset")
		sql="select * from borrowlist where id="&CInt(idflag)
		rs.open sql,conn,1,3
		if (CInt(rs("frefound"))+CInt(rs("srefound"))+CInt(rs("trefound")))<rs("money") then
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
			'CInt(frefound)+CInt(srefound)+CInt(trefound)
			if CInt(rs("frefound"))+CInt(rs("srefound"))+CInt(rs("trefound"))<>CInt(rs("money")) and (rs("frefound")<>0 and rs("srefound")<>0 and rs("trefound")<>0) then
				response.Write("<script languange=javascript>alert('您填写的数据有误');history.go(-1);</script>")
				response.End()
			end if
			rs.update
			
			set conn=opendb("finance","conn","accessdsn")
			set rs=server.createobject("adodb.recordset")
			sql="select * from borrowlist where id="&CInt(idflag)
			rs.open sql,conn,1,3
			if (rs("money")=CInt(rs("frefound"))+CInt(rs("srefound"))+CInt(rs("trefound"))) then
				rs("stage")=8
			end if
			rs.update
		end if
		if (CInt(rs("frefound"))+CInt(rs("srefound"))+CInt(rs("trefound")))>=rs("money") then
			response.Write("<script languange=javascript>alert('您填写的数据有误');history.go(-1);</script>")
			response.End()
		end if
	end if		
%>
<!--end-->
<!--下面是处理接受的数据-->
<%
	'处理获得的时间数据
	if "确定"=request("conf1") then
		yearG=request("year")
		monthG=request("month")
		'response.Write yearG
		'response.Write monthG
			if yearG="" then
				yearG=year(now())
			end if
			if monthG="" then
				monthG=month(now())
			end if
			if monthG="全年" then
				monthG=13
			end if
			
			'处理获得的部门名称
			deptG=request("dept")
				if deptG="" then
					deptG="所有部门"
				end if	
		response.Cookies("name")=""
		response.Cookies("t")=""
		response.Cookies("flag")=""
	
	end if
		
	if "确定"=request("conf2") then
		'处理获得的人物名称
		nameG=request("name")
		
		response.Cookies("year")=""
		response.Cookies("month")=""
		response.Cookies("dept")=""
		response.Cookies("t")=""
		response.Cookies("flag")=""
	end if
	if "确定"=request("conf3") then
		'处理还款的次数
		tG=request("t")
		response.Cookies("year")=""
		response.Cookies("month")=""
		response.Cookies("dept")=""
		response.Cookies("name")=""
		response.Cookies("flag")=""
	end if
	if "确定"=request("conf4") then
		'处理获得的是否还清的标志
		flagG=request("flag")
		response.Cookies("year")=""
		response.Cookies("month")=""
		response.Cookies("dept")=""
		response.Cookies("name")=""
		response.Cookies("t")=""
	end if
	response.Write("<div align=center> <font color=#0d79b3>")
	if yearG<>""  then response.Write yearG&" 年 "
	if monthG<>13 and monthG<>""  then response.Write monthG&" 月 "
	if monthG=13 then response.Write " 全年 "
	response.Write nameG
	response.Write deptG
	response.Write tG
	response.Write flagG
	response.Write("</font></div>")
%>
<!--结束-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>借支工作台(出纳)）</title>
</head>

<body>
<div align="center"><font color="#0d79b3" size="-1">
<form action="easy.asp">
<select name="year">
	<%for h=2009 to 2020%>
	<option <%=selected(CInt(yearG),CInt(h))%>><%=h%></option>
	<%next%>
</select>年
<select name="month">
<%
	for i=1 to 13
%>
	<%if i<> 13 then%>
	<option <%=selected(CInt(monthG),CInt(i))%>><%=i%></option>
	<%end if%>
	<%if i=13 then%>
	<option <%=selected(CInt(monthG),CInt(i))%>>全年</option>
	<%end if%>
<%
	next
%>
</select>月
<select name="dept">
	<%
		set conn=opendb("lmtof","conn","accessdsn")
		set rs=server.createobject("adodb.recordset")
		sql="select distinct userdept from userinf"
		rs.open sql,conn,1
		do while not rs.eof and not rs.eof 
	%>
	<option <%=selected(deptG,rs("userdept"))%>> <%=rs("userdept")%></option>
	<%
		rs.movenext 
		loop
	%>
	<option <%=selected(deptG,"所有部门")%>>所有部门</option>
</select>
<input type="submit" name="conf1" value="确定" />
</font>
</form>
<form action="easy.asp">
<select name="name">
	<%
		set conn=opendb("lmtof","conn","accessdsn")
		set rs=server.createobject("adodb.recordset")
		sql="select distinct username from userinf order by username desc"
		rs.open sql,conn,1
		do while not rs.eof and not rs.eof 
	%>
	
	<option <%=selected(nameG,rs("username"))%>><%=rs("username")%></option>
	<%
		rs.movenext 
		loop
	%>
	<option>test</option>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="conf2"  value="确定" />       
</form>
<form action="easy.asp">
<select name="t">
	<option <%=selected(tG,"第一次还款")%>>第一次还款</option>
	<option <%=selected(tG,"第二次还款")%>>第二次还款</option>
	<option <%=selected(tG,"第三次还款")%>>第三次还款</option>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="conf3" value="确定" />       
</form>
<form action="easy.asp">
<select name="flag">
	<option <%=selected(flagG,"已还清")%>>已还清</option>
	<option <%=selected(flagG,"未还清")%>>未还清</option>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="conf4" value="确定" />       
</form>
<table   border="1" cellpadding="1" cellspacing="0" width="85%">

	<tr bgcolor="D7E8F8" bordercolor="#339999" align="center">
		<td><font color="#0d79b3" size="-1">借款人</font></td>
		<td><font color="#0d79b3" size="-1">部门</font></td>
		<td><font color="#0d79b3" size="-1">借款时间</font></td>
		<td><font color="#0d79b3" size="-1">预计还款时间</font></td>
		<td><font color="#0d79b3" size="-1">借款金额</font></td>
		<td><font color="#0d79b3" size="-1">第一次还款</font></td>
		<td><font color="#0d79b3" size="-1">第二次还款</font></td>
		<td><font color="#0d79b3" size="-1">第三次还款</font></td>
		<td><font color="#0d79b3" size="-1">余额</font></td>
		<td><font color="#0d79b3" size="-1">还款凭证索引</font></td>
		<td><font color="#0d79b3" size="-1">操作</font></td>
		<td><font color="#0d79b3" size="-1">编号</font></td>
		<td><font color="#0d79b3" size="-1">状态</font></td>
	</tr>
	<%
		set conn=opendb("finance","conn","accessdsn")
		set rs=server.createobject("adodb.recordset")
		if nameG="" and tG="" and flagG="" then
			if deptG="所有部门" then
				if CInt(monthG)=CInt(13) then
					 t1=DateSerial(yearG,1,1)
					 t2=DateSerial(yearG+1,1,1)
					 
					sql="select * from borrowlist where stage=7 and borrowTime between '"&t1&"' and '"&t2&"'"
				end if
				if CInt(monthG)<>CInt(13) then
					 t1=DateSerial(yearG,monthG,1)
					 t2=DateSerial(yearG,monthG+1,1)
					sql="select * from borrowlist where stage=7 and borrowTime between '"&t1&"' and '"&t2&"'"
				end if				
			end if
			if deptG<>"所有部门" then
				'sql="select * from borrowlist where stage=7"
				if CInt(monthG)=CInt(13) then
					 t1=DateSerial(yearG,1,1)
					 t2=DateSerial(yearG+1,1,1)
					 
					sql="select * from borrowlist where stage=7 and borrowTime between '"&t1&"' and '"&t2&"' and dept='"&deptG&"' order by borrower desc"
				end if
				if CInt(monthG)<>CInt(13) then
					 t1=DateSerial(yearG,monthG,1)
					 t2=DateSerial(yearG,monthG+1,1)
					sql="select * from borrowlist where stage=7 and borrowTime between '"&t1&"' and '"&t2&"' and dept='"&deptG&"' order by borrower desc"
				end if
			end if
		end if
		if nameG<>"" then
			sql="select * from borrowlist where stage=7 and borrower='"&nameG&"' order by borrowTime desc"
		end if
		if tG<>"" then
			if tG="第一次还款" then
				sql="select * from borrowlist where stage=7 and frefound=0 and srefound=0 and trefound=0"
			end if
			if tG="第二次还款" then
				sql="select * from borrowlist where stage=7 and frefound<>0 and srefound=0 and trefound=0"
			end if
			if tG="第三次还款" then
				sql="select * from borrowlist where stage=7 and frefound<>0 and srefound<>0 and trefound=0"
			end if
		end if
		if flagG<>"" then
			if flagG="未还清" then
				sql="select * from borrowlist where stage=7 order by borrowTime desc"
			end if
			if flagG="已还清" then
				sql="select * from borrowlist where stage=8 order by borrowTime desc"
			end if
		end if
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
		<% if rs("frefound")<>0.00 then%>
		<%=rs("frefound")%><br><%=FormatDateTime(now(),2)%>
		<%end if%>
		<% if rs("frefound")=0.00 then%>
		<input type="text" size="8" name="fin" value="<%=rs("frefound")%>"/><br>
		<%if rs("fretime")<>NULL then%>
		<%=FormatDateTime(rs("fretime"),2)%>
		<%end if%>
		<%if rs("fretime")=NULL then%>
		<%=FormatDateTime(now(),2)%>
		<%end if%>
		
		<%end if%>
		</td>
		<td>
		<% if rs("srefound")<>0.00 then%>
		<%=rs("srefound")%><br><%=FormatDateTime(now(),2)%>
		<%end if%>
		<% if rs("srefound")=0.00 then%>
		<input type="text" size="8" name="sin" value="<%=rs("srefound")%>"/><br>
		<%if rs("sretime")<>NULL then%>
		<%=FormatDateTime(rs("sretime"),2)%>
		<%end if%>
		<%if rs("sretime")=NULL then%>
		<%=FormatDateTime(now(),2)%>
		<%end if%>
		
		<%end if%>
		</td>
		<td>
		<% if rs("trefound")<>0.00 then%>
		<%=rs("trefound")%><br><%=FormatDateTime(now(),2)%>
		<%end if%>
		<% if rs("trefound")=0.00 then%>
		<input type="text" size="8" name="tin" value="<%=rs("trefound")%>"/><br>
		<%if rs("tretime")<>NULL then%>
		<%=FormatDateTime(rs("tretime"),2)%>
		<%end if%>
		<%if rs("tretime")=NULL then%>
		<%=FormatDateTime(now(),2)%>
		<%end if%>
		
		<%end if%>
		</td>
		<td>
		<%=(rs("money")-rs("frefound")-rs("srefound")-rs("trefound"))%>
		</td>
		<td><a href="printeasy.asp?num=1&id=<%=rs("id")%>">第一次还款</a>&nbsp;&nbsp;<a href="printeasy.asp?num=2&id=<%=rs("id")%>">第二次还款</a>&nbsp;&nbsp;<a href="printeasy.asp?num=3&id=<%=rs("id")%>">第三次还款</a></td>
		<td><input type="hidden" name="idflag" value="<%=rs("id")%>" />
		<%
			if yearG<>"" then response.Cookies("year")=yearG
			if monthG<>"" then response.Cookies("month")=monthG
			if deptG<>"" then response.Cookies("dept")=deptG
			if nameG<>"" then response.Cookies("name")=nameG
			if tG<>"" then response.Cookies("t")=tG
			if flagG<>"" then response.Cookies("flag")=flagG
		%>
		<input type="submit" name="save" name="conf5"  value="保存"/></td>
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
