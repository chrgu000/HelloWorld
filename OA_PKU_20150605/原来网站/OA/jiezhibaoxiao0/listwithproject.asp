
<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
code=oabusyuserlevelCode
projectId=request("projectid")
response.write("<div align=center>"&projectId&"的记录</div>")
'response.write(projectid)
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


if yearN=""  then
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

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>帐号一览</title>
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
<form  name="form" action="listwithproject.asp" method="post">
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
<input type="hidden" name="projectid" value="<%=projectId%>" />
<input type="submit"  value="查询" />
</form>
<table border="1" cellpadding="1" cellspacing="1" bgcolor="D7E8F8" width="60%">
<tr  bgcolor="D7E8F8" bordercolor="#339999">
<td>项目号</td>
<td>金额</td>
<td>报销日期</td>
<td>经办人</td>
<!--<td>部门</td>-->
</tr>
<%
        set conn=opendb("finance.mdb","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
		'sql="select *  from reimlisttable_old where projectId='"&projectId&"'"
		   if (yearN="" and monthN="") or yearN="所有" then
		      sql="select *  from reimlisttable_old where projectId='"&projectId&"'  and (stage>6 and stage<10)"
			  response.Write("<div align=center>所有的记录</div>")
			end if
			if yearN<>"所有" and yearN<>"" and monthN="所有" then
			   t1=DateSerial(yearN,1,1)
		       t2=DateSerial(yearN+1,1,1)
			   sql="select *  from reimlisttable_old where projectId='"&projectId&"' and reimburseDate>=#"&t1&"# and reimburseDate<#"&t2&"#  and (stage>6 and stage<10)"
			   response.Write("<div align=center>"&yearN&"年该项目所有记录</div>")
			end if
			if yearN<>"所有" and yearN<>"" and monthN<>"所有" then
			   t1=DateSerial(yearN,monthN,1)
		       t2=DateSerial(yearN,monthN+1,1)
			   sql="select *  from reimlisttable_old where projectId='"&projectId&"' and reimburseDate>=#"&t1&"# and reimburseDate<#"&t2&"#  and (stage>6 and stage<10)"
			   response.Write("<div align=center>"&yearN&"年"&monthN&"月该项目所有记录</div>")
			end if
		'response.Write(t1)
'		response.Write(t2)
		rs.open sql,conn,1,1
		moneyZ=0
        do while not rs.eof and not rs.bof
%>
<tr>
<td><%=rs("projectId")%></td>
<td><%=rs("money")%></td>
<td><%=rs("reimburseDate")%></td>
<td><a href=ViewReim.asp?id=<%=rs("id")%> target="_blank"><%=rs("claimant")%></a></td>
</tr>
<%
        moneyZ=moneyZ+rs("money")
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
%>
<tr>
<td>总计</td>
<td colspan="3"><%=moneyZ%></td>
</tr>
</table>
</font>
</body>
</html>

