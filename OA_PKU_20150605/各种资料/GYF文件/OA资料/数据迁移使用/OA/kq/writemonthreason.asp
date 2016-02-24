<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<!--#include file="conn.asp"-->
<head>
<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
oabusyuserlevelCode2=request.cookies("oabusyuserlevelCode2")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='../default.asp';")
	response.write("</script>")
	response.end
end if
names=oabusyname
'response.Write("您现在查看的考勤情况是"&names&"的<br>")
monthvalue=month(now())
yearvalue=year(now())
db=yearvalue&".mdb"
monthn="month"&monthvalue
bgt=yearvalue&"-"&monthvalue&"-"&"1"
edt=yearvalue&"-"&monthvalue+1&"-"&"1"
wkq="未考勤："
wkqt=0
cd="迟到: "
cdt=0
dim mz
dim tmcd
'检查是否已经填写，如果已经填写，则不显示 begin
dim txg
dim txgg
txg=0
txgg=0
yearN=request("year")
monthN=request("month")
if yearN="" then yearN=year(now())
if monthN="" then monthN=month(now())
dbname=yearN&"##qsc"
tbname="monthslr"&monthN

timein=year(now())&"年"&month(now())&"月"&day(now())&"日"
timeinB=year(now())&"年"&month(now())+2&"月"&"1日"

set cn=opendb(dbname,"conn","accessdsn")
set r=server.createobject("adodb.recordset")
sl="select usnamefw from  "&tbname&" where usnamefw like '"&names&"'" 
r.open sl,cn,1,1 
if not r.bof and not r.eof then
txg=1
end if
set r=nothing
set cn=nothing

set cn=opendb("yygy","conn","accessdsn")
set r=server.createobject("adodb.recordset")
sl="select * from monthkqtemp where name like '"&names&"'  and time between '"&Cdate(timein)&"' and '"&Cdate(timeinB)&"'"
r.open sl,cn,1,1 
if not r.bof and not r.eof then
txgg=1
end if
set r=nothing
set cn=nothing
if (txg=1 or txg=0) and txgg=1 then
response.Write("<script language=javascript>alert('您已经填写过，请勿重复填写')</script>")
'response.End()
end if
if txg=1 and txgg=0 then
response.Write("<script language=javascript>alert('警告，数据库出现问题，请联系管理员')</script>")
end if
'删除上个月表中存在的数据
timewclbg="2010年1月1日"
if month(now())=1 then
timewclend=year(now())-1&"年12月"&"1日"
end if
if month(now())=2 then
timewclend=year(now())&"年1月"&"1日"
end if
if  month(now())>2 and month(now())<13 then
timewclend=year(now())&"年"&month(now())-2&"月"&"1日"
end if
set cn=opendb("yygy","conn","accessdsn")
sql="delete  monthkqtemp  where  flag='N' and time between '"&Cdate(timewclbg)&"' and '"&Cdate(timewclend)&"'"
cn.Execute sql




'end
if request("ff")="提交" then
	set conn=opendb("yygy","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select *  from monthkqtemp where name='"&names&"'"
	rs.open sql,conn,1,1
	do while not rs.eof and not rs.bof
	i=i+1   
	rs.movenext
	loop
	set rs=nothing
	set conn=nothing
reason=trim(request("reason"))
otherpan=trim(request("otherpan"))
namein=names
recordin=trim(request("record"))
dept=oabusyuserdept
flag="N"
weikaoqintianshu=request("weikaoqintianshu")
chidaotianshu=request("weikaoqintianshu")


	set conn=opendb("yygy","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	'sql="select  * from  monthkqtemp  where name='"&namein&"' and time>="&Cdate(timein)&" and time<="&Cdate(timeinB)
	sql="select  * from  monthkqtemp  where name='"&namein&"' and time between '"&Cdate(timein)&"' and '"&Cdate(timeinB)&"'"
	rs.open sql,conn,1,1
	iii=0
	do while not rs.eof and not rs.bof
	iii=iii+1   
	rs.movenext
	loop
	set rs=nothing
	set conn=nothing
	'response.Write(iii&"shuzi")
	if iii>0 then
		response.Write("<div align=center>您已填写过记录<br><br><br><a href='javascript:window.close();'>关闭</a><div>")
		response.End()
	end if
'response.Write(reason)
'response.Write(otherpan) 
'response.Write(recordin)
	if iii=0 then
		if weikaoqintianshu>0 or chidaotianshu>0 then
			set conn=opendb("yygy","conn","accessdsn")  'INSERT INTO Store_Information (store_name, Sales, Date) VALUES ('Los Angeles', 900, 'Jan-10-1999') 
			sql="delete   monthkqtemp  where name='"&namein&"' and flag='N' and time between '"&Cdate(timein)&"' and '"&Cdate(timeinB)&"'"
			conn.Execute sql
			timesql=year(now())&"-"&month(now())&"-"&day(now())
			'response.Write(timesql)
			sql="insert into  monthkqtemp (name,record,reason,otherpan,dept,flag,time) values ('"&namein&"','"&recordin&"','"&reason&"','"&otherpan&"','"&dept&"','"&flag&"','"&Cdate(timesql)&"') "
			conn.Execute sql
			response.Write("<div align=center>添加成功<br><br><br><a href='javascript:window.close();'>关闭</a><div>")
		end if
		if weikaoqintianshu=0 and chidaotianshu=0 then
			set conn=opendb("yygy","conn","accessdsn")  'INSERT INTO Store_Information (store_name, Sales, Date) VALUES ('Los Angeles', 900, 'Jan-10-1999') 
			sql="delete  monthkqtemp  where name='"&namein&"' and flag='N' and time between '"&Cdate(timein)&"' and '"&Cdate(timeinB)&"'"
			conn.Execute sql
			if otherpan="" then
			timesql=year(now())&"-"&month(now())&"-"&day(now())
			sql="insert into  monthkqtemp (name,record,reason,otherpan,dept,flag) values ('"&namein&"','未有记录',' ',' ','"&dept&"','Y','"&timesql&"') "
			conn.Execute sql
			end if
			if otherpan<>"" then
			timesql=year(now())&"-"&month(now())&"-"&day(now())
			sql="insert into  monthkqtemp (name,record,reason,otherpan,dept,flag) values ('"&namein&"','未有记录',' ','"&otherpan&"','"&dept&"','N','"&timesql&"') "
			conn.Execute sql
			end if
			response.Write("<div align=center>添加成功<br><br><br><a href='javascript:window.close();'>关闭</a><div>")
		end if
	end if
	response.End()
end if
          select case cint(monthvalue)
				case 1,3,5,7,8,10,12
					monthdayvalue=31
				case 4,6,9,11
					monthdayvalue=30
				case 2
					if ((cint(yearvalue) mod 4)=0) or ((cint(yearvalue) mod 100=0) and (cint(yearvalue) mod 400)<>0) then
						monthdayvalue=29
					else
						monthdayvalue=28
					end if
			end select
			if monthdayvalue>=day(now()) then monthdayvalue=day(now())

         for i=1 to monthdayvalue
				datevalueis=dateserial(cint(yearvalue),cint(monthvalue),i)
				weekvalue=weekday(datevalueis)
				select case weekvalue
					case 1
						weekvalue="星期日"
					case 2
						weekvalue="星期一"
					case 3
						weekvalue="星期二"
					case 4
						weekvalue="星期三"
					case 5
						weekvalue="星期四"
					case 6
						weekvalue="星期五"
					case 7
						weekvalue="星期六"
				end select
				if weekvalue<>"星期六" and weekvalue<>"星期日" then
					set conn=opennewdb("conn",yearvalue)
					'response.Write(yearvalue)
	                set rs=server.createobject("adodb.recordset")
					sql="select * from month"&monthvalue&" where day=#"&cdate(datevalueis)&"# and  name='"&names&"' order by comedate asc"
					'response.Write("<br>"&datevalueis)
					set rs=server.createobject("adodb.recordset")
					rs.open sql,conn,1,1
					'response.Write(sql)
						if rs.bof and rs.eof then
						 'if rs.eof then exit for
							wkq=wkq & datevalueis & " "
							wkqt=wkqt+1
							
							'wkq=wkq & CStr(rs("day"))
						end if
						if not rs.bof and not rs.eof then
							cdn=0
							tmcd=rs("day")
							do while not rs.bof and not rs.eof
								cdn=cdn+1
								if cdn=1 then mz1=rs("comedate")
								if cdn=1 then am=rs("amorpm")
								if cdn=2 then mz2=rs("comedate")
								rs.movenext
							loop
							'response.Write("cdn:"&mz1)
							if cdn=1 then
								t1="08:46:00"
								chida=Split(mz1,"上午 ")
								'response.Write("cdn=1:"&mz1&"<br>")
								t2=chida(ubound(chida))
								if am="pm" then t2="12:00:00"
								if am="am" then t2=chida(ubound(chida))
								'response.Write(t2&"<br>")
								dd=DateDiff("s",t1,t2)
								if dd>=0 then
									cd=cd&tmcd&" "
									cdt=cdt+1
								end if
							end if
							if cdn=2 then
								t1="08:46:00"
								chidao=Split(mz2,"上午 ")
								ubound(chidao)
								t2=chidao(ubound(chidao))
								'response.Write("t2 "&t2&"<br>")
								'response.Write("t1 "&t1&"<br>")
								't3=chidao(1)
								'response.Write("t2 "&t3&"<br>")
								dd=DateDiff("s",t1,t2)
'								d2=DateDiff("s",t1,)
								if dd>0  then
									cd=cd&tmcd&" "
									cdt=cdt+1
								end if
							end if
						end if
					set rs=nothing
	                set con=nothing
				end if
			next

%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考勤系统填写未考勤及迟到原因</title>
</head>
<link rel="stylesheet" href="../css/css.css">
<style type="text/css">
<!--
-->
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
</style>
<body>
<center>
  <table width="95%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="21"><div align="center">
          <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="2" height="25"><span class="style2"><img src="../images/main/l3.gif" width="2" height="25"></span></td>
              <td background="../images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="21"><div align="center"><span class="style2"><img src="../images/main/icon.gif" width="15" height="12"></span></div></td>
                    <td class="style7" align="left">考勤系统</td>
                  </tr>
              </table></td>
              <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
            </tr>
          </table>
          <font color="0D79B3"></font></div></td>
    </tr>
  </table>
  </center>
  <center>
  <% if monthdayvalue>=26 and txgg<>1 then %>
	  <form action="writemonthreason.asp" name="f">
	  <%if wkqt>0 and cdt>0 then %>
		  您<font color="#FF0000"><%=wkqt%></font>天<%=wkq%><br />
		  您<font color="#FF0000"><%=cdt%></font>天<%=cd%><br />
		  <%
		  record=wkq&"；"&cd
	  end if%>
	  <%if wkqt=0 and cdt>0 then %>
		  您<font color="#FF0000"><%=cdt%></font>天<%=cd%><br />
		  <%
		  record=cd
	  end if%>
	  <%if wkqt>0 and cdt=0 then %>
		  您<font color="#FF0000"><%=wkqt%></font>天<%=wkq%><br />
		  <%
		  record=wkq
	  end if%>
	  <%if wkqt=0 and cdt=0 then %>
		  您未有迟到及未考勤记录<br /><br />
		  <%
		  record=trim("未有记录")
	  end if%>
	  
		  <font color="#FF0033">请您填写未考勤及迟到原因(未有迟到及未考勤记录的可不填写</font><br />
		  <textarea rows="8" cols="60" name="reason"></textarea><br /><br /><br /><br />
		  <font color="#FF0033">您是否请假或调休计划:如果有请在下面登记，并请您填写请假单或调休单；如果未有请不填。</font><br />
		  <textarea rows="8" cols="60" name="otherpan"></textarea>
		  <br />
		  <input type="hidden" name="record" value="<%=record%>" /><input type="hidden" name="weikaoqintianshu" value="<%=wkqt%>" /><input type="hidden" name="chidaotianshu" value="<%=cdt%>" />
		  <input type="submit" name="ff" value="提交"  />
		  </form>
	   
  <%end if%>
	  <% if monthdayvalue<26 then %>
	  现在还不到填写为考勤及迟到记录时间
  <%end if%>
  
 <br /><br /><br />
<a href="seemysel.asp">查看本人未考勤原因</a>&nbsp;&nbsp;&nbsp;&nbsp; <% if oabusyuserlevelCode="BMJL" OR (oabusyuserlevelCode="DSZ" AND oabusyuserlevelCode1<>"")  then%><a href="managemr.asp">审批本部门本月未考勤原因</a><%end if%>&nbsp;&nbsp;&nbsp;&nbsp;<!--<a href="seeall.asp">查看所有未考勤原因</a>暂时还没有完全完成-->
  </center>
</body>
</html>
