<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<%

'第一次运行该程序的时候 初始化数据库
'无用的代码，deleted by lsl 20101224
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
	frefound=cdbl(request("fin"))
	srefound=cdbl(request("sin"))
	trefound=cdbl(request("tin"))	
	
	if saveflag="保存" then
		set conn=opendb("finance","conn","accessdsn")
		set rs=server.createobject("adodb.recordset")
		sql="select * from borrowlist where id="&CInt(idflag)
		rs.open sql,conn,1,3
		if  not (Isnumeric(frefound) and isnumeric(srefound) and isnumeric(trefound))  then
				response.Write("<script languange=javascript>alert('您填写的数据有误,应填写数字');history.go(-1);</script>")
				response.End()
	    	end if
                money=cdbl(rs("money")) 
		if  frefound + srefound + trefound > money  then
		  response.Write("<script languange=javascript>alert('您填写的数据有误,还款额不可大于借款额');history.go(-1);</script>")
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
		'若该借支单账目已清，要修改状态
		if(borr_clear) then
		   rs("stage")=8
		 end if
		username =rs("borrower")
		rs.update
		'修改账户欠款
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
<!--下面是处理接受的数据-->
<%
	'无需选择时间、用户，直接读取“未还清”的借支表，cancel by lsl 101224
	'处理获得的时间数据
	'if "确定"=request("conf1") then
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
			'if monthG="全年" then
				'monthG=13
			'end if
			
			'处理获得的部门名称
			'deptG=request("dept")
				'if deptG="" then
					'deptG="所有部门"
				'end if	
		'response.Cookies("name")=""
		'response.Cookies("t")=""
		'response.Cookies("flag")=""
	
	'end if
		
	'if "确定"=request("conf2") then
		'处理获得的人物名称
		'nameG=request("name")
		
		'response.Cookies("year")=""
		'response.Cookies("month")=""
		'response.Cookies("dept")=""
		'response.Cookies("t")=""
		'response.Cookies("flag")=""
	'end if
	'if "确定"=request("conf3") then
		'处理还款的次数
		'tG=request("t")
		'response.Cookies("year")=""
		'response.Cookies("month")=""
		'response.Cookies("dept")=""
		'response.Cookies("name")=""
		'response.Cookies("flag")=""
	'end if
	'if "确定"=request("conf4") then
		'处理获得的是否还清的标志
		'flagG=request("flag")
		'response.Cookies("year")=""
		'response.Cookies("month")=""
		'response.Cookies("dept")=""
'		response.Cookies("name")=""
'		response.Cookies("t")=""
	'end if
'	response.Write("<div align=center> <font color=#0d79b3>")
'	if yearG<>""  then response.Write yearG&" 年 "
'	if monthG<>13 and monthG<>""  then response.Write monthG&" 月 "
'	if monthG=13 then response.Write " 全年 "
'	response.Write nameG
'	response.Write deptG
'	response.Write tG
'	response.Write flagG
'	response.Write("</font></div>")
%>
<!--结束-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>还款处理平台(出纳)）</title>
</head>

<body>
<div align="center"><font color="#0d79b3" size="-1">
<form action="easy.asp">
  <div align=center> <font color=#0d79b3 size="+2">未还清的借支表</font></div>
</form>


<table   border="1" cellpadding="1" cellspacing="0" width="97%">
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
		'无需选择查询条件，直接读取借支表。cancel by lsl 101224
		'if nameG="" and tG="" and flagG="" then
'			if deptG="所有部门" then
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
'			if deptG<>"所有部门" then
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
'			if tG="第一次还款" then
'				sql="select * from borrowlist where stage=7 and frefound=0 and srefound=0 and trefound=0"
'			end if
'			if tG="第二次还款" then
'				sql="select * from borrowlist where stage=7 and frefound<>0 and srefound=0 and trefound=0"
'			end if
'			if tG="第三次还款" then
'				sql="select * from borrowlist where stage=7 and frefound<>0 and srefound<>0 and trefound=0"
'			end if
'		end if
		'if flagG<>"" then
'			if flagG="未还清" then
				sql="select * from borrowlist where stage=15 order by borrowTime desc"				
			'end if
'			if flagG="已还清" then
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
		<input type="submit" name="save" name="conf5"  value="保存" />
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
