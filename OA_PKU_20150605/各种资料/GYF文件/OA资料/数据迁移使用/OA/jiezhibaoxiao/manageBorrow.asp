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
if oabusyusername=""  then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if

yearN=request.Form("year1")
monthN=request.Form("month1")
deptN=request.Form("dept")
function selected(req,reqvalue)
if req=reqvalue then
selected=" selected"
else
selected=""
end if
end function
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>表单处理</title>



<%
dept = request.Form("dept")
year1=request.Form("year")
month1=request.Form("month")
str=dept+year1+month1
'response.Write(str)
'set cn=server.CreateObject("ADODB.Connection")
'path=server.mappath("finance.mdb")
'cn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cn=opendb("finance","conn","sql")
set rsB=server.CreateObject("adodb.recordset")
%>
<script language="javascript">
function chuli()
{
    
	window.open("editBorr.asp?id="+document.form1.id.value);
}
</script>
</head>

<body>
<font size="-1">
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
                  <td align="left"class="style7"><font size="-1">借支模块</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<form  name="form" action="manageBorrow.asp" method="post">
部门
<select name="dept" size="1">
<option vlue="所有部门"  <%=selected("所有部门",deptN)%>>所有部门</option>
<option vlue="产品部"    <%=selected("产品部",deptN)%>>产品部</option>
<option vlue="工程部"    <%=selected("工程部",deptN)%>>工程部</option>
<option vlue="综合管理部" <%=selected("综合管理部",deptN)%>>综合管理部</option>
<option vlue="业务发展部"     <%=selected("业务发展部",deptN)%>>业务发展部</option>
<option vlue="教育培训部"     <%=selected("教育培训部",deptN)%>>教育培训部</option>
<option vlue="四川基地"   <%=selected("四川基地",deptN)%>>四川基地</option>
<option vlue="研发部"      <%=selected("研发部",deptN)%>>研发部</option>
<option vlue="时空信息技术培训部"      <%=selected("时空信息技术培训部",deptN)%>>时空信息技术培训部</option>
</select>
日期
<select name="year1" size="1">
<option vlue="所有" <%=selected("所有",yearN)%>>所有</option>
<%for i=2009 to 2019%>
<option vlue="<%response.Write(i)%>" <%=selected(i,yearN)%>><%response.Write(i)%></option>
<%next%>
</select>
年
<select name="month1" size="1">
<option vlue="全年" ></option>
<%for j=1 to 12%>
<option vlue="<%response.Write(j)%>" <%=selected(j,monthN)%>><%response.Write(j)%></option>
<%next%>
</select>
月
<input type="submit"  value="查询" />
</form>

<%
'设置每页显示的条数
const MaxPerPage=50
if not isempty(request("page")) then
currentpage=cint(request("page"))
else
currentpage=1
end if

'打开数据库
'set cnborr=server.CreateObject("ADODB.Connection")
'DBPath1=server.mappath("finance.mdb")
'cnborr.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
'sql1="select * from borrowlist where stage > 1 and  stage < 6 "
'getsql dept1,year1,month1 
  if deptN="所有部门" then 
     if yearN="所有" then
	    
		if oabusyuserlevelCode="ZSYG" or oabusyuserlevelCode="SYYG"  then
		stage1=0
		sql1="select * from borrowlist where borrower="&"'"&oabusyusername&"'"
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
		stage1=1
		sql1="select * from borrowlist where (dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or ( borrower="&"'"&oabusyusername&"')" 
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
		stage1=1
		sql1="select * from borrowlist where  (stage > 2 or ( borrower="&"'"&oabusyusername&"'))" 
		end if
		if oabusyuserlevelCode="CWZG" then
		stage1=3
		sql1="select * from borrowlist where (stage >2 and stage < 10)  or ( borrower="&"'"&oabusyusername&"')"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1<>"BMJL" then
		stage1=3
		sql1="select * from borrowlist where stage > 3 and stage < 10"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
		stage1=3
		sql1="select * from borrowlist where (stage > 3 and stage < 10) or (dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or ( borrower="&"'"&oabusyusername&"') "
		end if
		
		if oabusyuserlevelCode="CN" then
		stage1=3
		sql1="select * from borrowlist where (stage>6 and  stage<10)  or ( borrower="&"'"&oabusyusername&"')"
		end if
		if oabusyuserlevelCode="CW" then
		stage1=3
		sql1="select * from borrowlist where (stage>6 and  stage<10)  or ( borrower="&"'"&oabusyusername&"')"
		end if
	 
	   'sql1="select * from borrowlist where stage>1 and stage<8 and finance="&"'"&oabusyusername&"'"
	   stra="所有的申请"
	 end if
	 if yearN<>"所有" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
		
		if oabusyuserlevelCode="ZSYG" then
		stage1=0
		sql1="select * from borrowlist where borrower="&"'"&oabusyusername&"' and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
		stage1=1
		sql1="select * from borrowlist where ((dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or (borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"'" 
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
		stage1=1
		sql1="select * from borrowlist where  (stage > 2 or ( borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"'" 
		end if
		if oabusyuserlevelCode="CWZG" then
		stage1=3
		sql1="select * from borrowlist where ((stage >2 and stage < 10) or ( borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1<>"BMJL" then
		stage1=3
		sql1="select * from borrowlist where (stage > 3 and stage < 10) nd date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
		stage1=3
		sql1="select * from borrowlist where ((stage > 3 and stage < 10) or (dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or ( borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"' "
		end if
		if oabusyuserlevelCode="CN" then
		stage1=3
		sql1="select * from borrowlist where ((stage>6 and  stage<10) or ( borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="CW" then
		stage1=3
		sql1="select * from borrowlist where ((stage>6 and  stage<10) or ( borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"'"
		end if		
		
	    'sql1="select * from borrowlist where stage>1 and stage<8 and date>=#"&t1&"# and date<#"&t2&"# and finance="&"'"& oabusyusername&"'  "
		stra=deptN&yearN&"年的申请"
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		
		if oabusyuserlevelCode="ZSYG" then
		stage1=0
		sql1="select * from borrowlist where borrower="&"'"&oabusyusername&"' and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
		stage1=1
		sql1="select * from borrowlist where ((dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or ( borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"'" 
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
		stage1=1
		sql1="select * from borrowlist where  (stage > 2 or ( borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"'" 
		end if
		if oabusyuserlevelCode="CWZG" then
		stage1=3
		sql1="select * from borrowlist where ((stage >2 and stage < 10) or ( borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1<>"BMJL" then
		stage1=3
		sql1="select * from borrowlist where (stage > 3 and stage < 10) and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
		stage1=3
		sql1="select * from borrowlist where ((stage > 3 and stage < 10) or (dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or ( borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="CN" then
		stage1=3
		sql1="select * from borrowlist where ((stage>6 and  stage<10) or ( borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="CW" then
		stage1=3
		sql1="select * from borrowlist where ((stage>6 and  stage<10) or ( borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"'"
		end if		
		
	    'sql1="select * from borrowlist where stage>1 and stage<8 and date>=#"&t1&"# and date<#"&t2&"# and finance="&"'"& oabusyusername&"'"
		stra=deptN&yearN&"年"&monthN&"月"&"的申请"
	   end if
	 end if
  end if
  
  if deptN<>"所有部门"  and deptN<>"" then 
     if yearN="所有" then
	 
		if oabusyuserlevelCode="ZSYG" then
		stage1=0
		sql1="select * from borrowlist where borrower="&"'"&oabusyusername&"'"
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
		stage1=1
		sql1="select * from borrowlist where (dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or ( borrower="&"'"&oabusyusername&"')" 
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
		stage1=1
		sql1="select * from borrowlist where  (stage > 2 or ( borrower="&"'"&oabusyusername&"')) and dept="&"'"&deptN&"'" 
		end if
		if oabusyuserlevelCode="CWZG" then
		stage1=3
		sql1="select * from borrowlist where ((stage >2 and stage < 10) or ( borrower="&"'"&oabusyusername&"')) and dept="&"'"&deptN&"'"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1<>"BMJL" then
		stage1=3
		sql1="select * from borrowlist where (stage > 3 and stage < 10) and  dept="&"'"&deptN&"'"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
		stage1=3
		sql1="select * from borrowlist where ((stage > 3 and stage < 10) or (dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or ( borrower="&"'"&oabusyusername&"')) and  dept="&"'"&deptN&"'"
		end if
		if oabusyuserlevelCode="CN" then
		stage1=3
		sql1="select * from borrowlist where ((stage>6 and  stage<10) or ( borrower="&"'"&oabusyusername&"')) and dept="&"'"&deptN&"'"
		end if
		if oabusyuserlevelCode="CW" then
		stage1=3
		sql1="select * from borrowlist where ((stage>6 and  stage<10) or ( borrower="&"'"&oabusyusername&"')) and dept="&"'"&deptN&"'"
		end if
	 
	   'sql1="select * from borrowlist where stage>1 and stage<8 and dept="&"'"&deptN&"' and finance="&"'"&oabusyusername&"'"
	   stra=deptN&yearN&"年的申请"
	 end if
	 if yearN<>"所有" and yearN<>"" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
		
		
		if oabusyuserlevelCode="ZSYG" then
		stage1=0
		sql1="select * from borrowlist where borrower="&"'"&oabusyusername&"' and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
		stage1=1
		sql1="select * from borrowlist where ((dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or (borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"'" 
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
		stage1=1
		sql1="select * from borrowlist where  (stage > 2 or ( borrower="&"'"&oabusyusername&"')) and dept="&"'"&deptN&"' and date between '"&t1&"' and '"&t2&"'" 
		end if
		if oabusyuserlevelCode="CWZG" then
		stage1=3
		sql1="select * from borrowlist where ((stage >2 and stage < 10) or ( borrower="&"'"&oabusyusername&"')) and dept="&"'"&deptN&"' and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1<>"BMJL" then
		stage1=3
		sql1="select * from borrowlist where (stage > 3 and stage < 10) and  dept="&"'"&deptN&"'and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
		stage1=3
		sql1="select * from borrowlist where ((stage > 3 and stage < 10) or (dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or ( borrower="&"'"&oabusyusername&"')) and  dept="&"'"&deptN&"'and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="CN" then
		stage1=3
		sql1="select * from borrowlist where ((stage>6 and  stage<10) or ( borrower="&"'"&oabusyusername&"')) and dept="&"'"&deptN&"' and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="CW" then
		stage1=3
		sql1="select * from borrowlist where ((stage>6 and  stage<10) or ( borrower="&"'"&oabusyusername&"')) and dept="&"'"&deptN&"' and date between '"&t1&"' and '"&t2&"'"
		end if
		
	    'sql1="select * from borrowlist where stage>1 and stage<8 and date>=#"&t1&"# and date<#"&t2&"# and dept="&"'"&deptN&"' and finance="&"'"&oabusyusername&"'"
		stra=deptN&yearN&"年的申请"
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		
		if oabusyuserlevelCode="ZSYG" then
		stage1=0
		sql1="select * from borrowlist where borrower="&"'"&oabusyusername&"' and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
		stage1=1
		sql1="select * from borrowlist where ((dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or ( borrower="&"'"&oabusyusername&"')) and date between '"&t1&"' and '"&t2&"'" 
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
		stage1=1
		sql1="select * from borrowlist where  (stage > 2 or ( borrower="&"'"&oabusyusername&"')) and dept="&"'"&deptN&"' and date between '"&t1&"' and '"&t2&"'" 
		end if
		if oabusyuserlevelCode="CWZG" then
		stage1=3
		sql1="select * from borrowlist where ((stage >2 and stage < 10) or ( borrower="&"'"&oabusyusername&"')) and dept="&"'"&deptN&"' and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1<>"BMJL" then
		stage1=3
		sql1="select * from borrowlist where (stage > 3 and stage < 10) and  dept="&"'"&deptN&"' and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
		stage1=3
		sql1="select * from borrowlist where ((stage > 3 and stage < 10) or (dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or ( borrower="&"'"&oabusyusername&"')) and  dept="&"'"&deptN&"'and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="CN" then
		stage1=3
		sql1="select * from borrowlist where ((stage>6 and  stage<10) or ( borrower="&"'"&oabusyusername&"')) and dept="&"'"&deptN&"' and date between '"&t1&"' and '"&t2&"'"
		end if
		if oabusyuserlevelCode="CW" then
		stage1=3
		sql1="select * from borrowlist where ((stage>6 and  stage<10) or ( borrower="&"'"&oabusyusername&"')) and dept="&"'"&deptN&"' and date between '"&t1&"' and '"&t2&"'"
		end if		
		
	    'sql1="select * from borrowlist where stage>1 and stage<8 and date>=#"&t1&"# and date<#"&t2&"# and dept="&"'"&deptN&"' and finance="&"'"&oabusyusername&"'"
		stra=deptN&yearN&"年"&monthN&"月"&"的申请"
	   end if
	 end if
  end if
  
  if deptN="" then
     if yearN="" then
	   if monthN="" then
	   
		if oabusyuserlevelCode="ZSYG" then
		stage1=0
		sql1="select * from borrowlist where borrower="&"'"&oabusyusername&"'"
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
		stage1=1
		sql1="select * from borrowlist where (dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or ( borrower="&"'"&oabusyusername&"')" 
		end if
		if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
		stage1=1
		sql1="select * from borrowlist where  (stage > 2 or ( borrower="&"'"&oabusyusername&"'))" 
		end if
		if oabusyuserlevelCode="CWZG" then
		stage1=3
		sql1="select * from borrowlist where (stage >2 and stage < 10) or ( borrower="&"'"&oabusyusername&"')"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1<>"BMJL" then
		stage1=3
		sql1="select * from borrowlist where stage > 3 and stage < 10"
		end if
		if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
		stage1=3
		sql1="select * from borrowlist where (stage > 3 and stage < 10) or (dept="&"'"&oabusyuserdept&"'"&" and stage > 0)  or ( borrower="&"'"&oabusyusername&"') "
		end if
		if oabusyuserlevelCode="CN" then
		stage1=3
		sql1="select * from borrowlist where (stage>6 and  stage<10) or ( borrower="&"'"&oabusyusername&"')"
		end if
		if oabusyuserlevelCode="CW" then
		stage1=3
		sql1="select * from borrowlist where (stage>6 and  stage<10) or ( borrower="&"'"&oabusyusername&"')"
		end if	   
	   
	   'sql1="select * from borrowlist where stage>1 and stage<8 and finance="&"'"&oabusyusername&"'"
	   end if
	 end if
  end if
 
  response.Write("<br><font color=red>*部门经理只能查看本部门的申请*</font>")
  if currentpage>1 then
  sql1=request.Cookies("sqlt")
  stra=request.Cookies("stra")
  end if
  'response.Write(sql1)
  response.Write("<br>"&stra)
  rsborr.open sql1,cnborr,1,1
 %>	

<!------------------------------------------------------------------------------------------------------------------------------------------>
<%


totalPut=rsborr.recordcount
'response.Write(totalPut)
'设置数据库中显示的个数
 if currentpage<1 then
     currentpage=1
 end if
 
 if (currentpage-1)*MaxPerPage>totalPut then
    if(totalPut mod MaxPerPage)=0 then
	   currentpage=totalPut\MaxPerPage
	else 
	   currentpage=totalPut\MaxPerPage+1
	end if
 end if
'显示该页信息
 if currentpage=1 then
    showpage totalput,MaxPerPage,"manageBorrow.asp"
	showContent
	showpage totalput,MaxPerPage,"manageBorrow.asp"
 else 
    if(currentpage-1)*MaxPerPage<totalPut then
	 rsborr.move (currentpage-1)*MaxPerPage
	 dim bookmark
	 bookmark=rsborr.bookmark
	 showpage totalput,MaxPerPage,"manageBorrow.asp"
	 showContent
	 showpage totalput,MaxPerPage,"manageBorrow.asp"
	else
	 currentpage=1
	 showpage totalput,MaxPerPage,"manageBorrow.asp"
	 showContent
	 showpage totalput,MaxPerPage,"manageBorrow.asp"
	end if
	rsborr.close
end if
%>	

<!------------------------------------------------------------------------------------------------------------------------------------------>
<%
function showpage(totalnumber,maxperpage,filename)
dim n
    if totalnumber mod maxperpage = 0 then
	   n = totalnumber\maxperpage
	else
	   n=totalnumber\maxperpage+1
	end if
	response.Write("<p align='center'>&nbsp;")
	'根据目前的页数位置来设置各个链接
	if currentpage<2 then
	   response.Write "<font color='#000080'>首页  上一页</font>&nbsp;"
	else
	   response.Cookies("sqlt")=sql
	   response.Cookies("stra")=stra
	   response.Write "<a href="&filename&"?page=1>首页</a>&nbsp;"
	   response.Write "<a href="&filename&"?page="&currentpage-1&">上一页</a>&nbsp;"
	end if
	
	if n-currentPage<1 then
	   response.Write "<font color='#000080'>下一页 尾页</font>"
	else 
	   response.Cookies("sqlt")=sql1
	   response.Cookies("stra")=stra
	   response.Write ("<a href="&filename&"?page="&(currentpage+1)&">")
	   response.Write ("下一页</a>&nbsp;<a href="&filename&"?page="&n&">尾页</a>")
	 end if
	 
	 response.Write "<font color='#000080'>&nbsp;页次：</font><strong><font color=red>"&currentPage&"</font><font color='#000080'>/"&n&"</strong>页</strong></font>"
	 response.Write "<font color='#000080'>&nbsp;共<b>"&totalnumber&"</b>条记录<b>&nbsp;"&maxperpage&"</b>条记录/页</font>"
end function
%>
<!------------------------------------------------------------------------------------------------------------------------------------------>

<%
    moneySumCount=0
	billSumCount=0
sub showContent
dim i
i=0	
%>
<form name="form1"  action="SeeAllBorr.asp" >
 <table border=1  cellpadding=1 cellspacing=0 >
<tr bgcolor="D7E8F8" bordercolor="#339999"><td ><font size="-1">申请人</font></td><td><font size="-1">部门</font></td><td ><font size="-1">部门负责人</font></td><td align=center><font size="-1">借款日期</font></td><td align=center><font size="-1">还款日期</font></td><td align=center><font size="-1">金额</font></td><td><font size="-1">状态</font></td><td align=center>操作</td></tr>
<%
do while not rsborr.eof  
 %>

  <input type="hidden"  name="id" value="<%=rsborr("id")%>"/>
  <tr><td align=center><%=rsborr("borrower")%></td>
  <td align=center><%=rsborr("dept")%></td>
  <% 
	

	set conn=opendb("lmtof","conn","sql")
    set rs=server.CreateObject("adodb.recordset")
    sql="select * from userinf where userdept="&"'"&rsborr("dept")&"'"&"and (levelCode='BMJL' or levelCode1='BMJL')"
    rs.open sql,conn,1,1
%>
	<td align=center>
	<%
	response.Write(rs("username"))
	%>
	</td>
	<td align=center><%=rsborr("borrowTime")%></td>
	<td align=center><%=rsborr("repayTime")%></td>
	<td align=center><%=rsborr("money")%></td>
	<% 
	set conn2=opendb("finance","conn","sql")
    set rs2=server.CreateObject("adodb.recordset")
    sql2="select * from stage where stage="&rsborr("stage")
    rs2.open sql2,conn2,1,1
    %>
	<td align=center><%=rs2("txt")%></td>
	<td align=center>
  <!--<a href=seeBorr.asp?id=<%response.Write(rsborr("id"))%>><font size="-1">查看</font></a>-->
  <a href=viewBorr.asp?id=<%response.Write(rsborr("id"))%>>查看</a>
  </td>
  </tr>
  
<%
i=i+1
if i>=MaxPerPage then exit Do
rsborr.movenext
loop
%>
</table>
<% end sub %>
<input type="submit" value="汇总显示" />
</form>
<!--<form  name="form" action="manageBorrow.asp" method="get">
部门
<select name="dept">
<option vlue="所有部门">所有部门
<option vlue="产品部">产品部
<option vlue="工程部">工程部
<option vlue="综合管理部">综合管理部
<option vlue="业务发展部">业务发展部
<option vlue="教育培训部">教育培训部
<option vlue="四川基地">四川基地
<option vlue="其他">其他
</select>
日期
<select name="year">
<%for i=2009 to 2019%>
<option vlue="<%response.Write(i)%>"><%response.Write(i)%>
<%next%>
</select>
年
<select name="month">
<option vlue="全年">
<%for j=1 to 12%>
<option vlue="<%response.Write(j)%>"><%response.Write(j)%>
<%next%>
</select>
月
<input type="submit"  value="查询" />
</form>-->
</from>
</div>

</font>
</body>
</html>
