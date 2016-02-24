<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<SCRIPT language=javascript>
function unselectall()
{
    if(document.form1.ID.checked){
	document.form1.chkAll.checked = document.form1.chkAll.checked&0;
    } 	
}

function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
    }
  }  
</SCRIPT>
<SCRIPT language=javascript>
  function printselected()
  {
    window.open('printsel.asp?id='+document.form1.ID.value,"_self");
  }
  
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>需处理的处理报销单查看</title>
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

yearN=request.Form("year1")
monthN=request.Form("month1")
deptN=request.Form("dept")
dayN=request.Form("day1")
counta=request.Form("counta")
uname=request.Form("uname")
ustage=request.Form("ustage")


num=request.Form("id")
f=dateDiff("y","2009-11-1",date)
'response.Write(f)
if num<>"" then
numA=split(num,",")
n= UBound(numA)
'response.Write(counta)
'response.Write("&"&n)
countA=split(counta,",")
t=UBound(countA)

    for j=0 to n
        set connJ=opendb("finance","conn","accessdsn")
        set rsJ=server.createobject("adodb.recordset")
        sqlJ="select * from reimlisttable_old where id="&Cint(numA(j))
        rsJ.open sqlJ,connJ,1,3
        if not rsJ.eof and not rsJ.bof then
        rsJ("givecount")=trim(countA(j))
        rsJ.update
        rsJ.movenext
        end if
        set rsJ=nothing
        set connJ=nothing
         
		
		set conn=opendb("finance","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select * from reimlisttable_old where id="&Cint(numA(j))
        rs.open sql,conn,1,3
        if not rs.eof and not rs.bof then
		 if rs("stage")=5 then
           rs("stage")=6
		 end if
        rs.update
		'response.Write("*"&Cint(numA(j)))
        rs.movenext
        end if
        set rs=nothing
        set conn=nothing
	 next
end if


function selected(req,reqvalue)
if req=reqvalue  then
selected=" selected"
else
selected=""
end if
end function
%>
</head>

<body>
<div align="center">
<table width="100%"  border="1" cellspacing="0" cellpadding="0">
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
<%response.Write("<br><font color=red>* 部门经理只能查看本部门的申请*</font>")%>
<!--<marquee behavior="scroll" behavior="alternate">部门经理</marquee>-->
<form  name="form" action="manageReimList.asp" method="post">
<select name="dept" size="1" onChange="document.form.submit();" >
<option value="所有部门"  <%=selected("所有部门",deptN)%> >所有部门</option>
<option value="产品部"    <%=selected("产品部",deptN)%> >产品部</option>
<option value="工程部"    <%=selected("工程部",deptN)%>>工程部</option>
<option value="综合管理部" <%=selected("综合管理部",deptN)%>>综合管理部</option>
<option value="业务发展部"     <%=selected("业务发展部",deptN)%>>业务发展部</option>
<option value="教育培训部"     <%=selected("教育培训部",deptN)%>>教育培训部</option>
<option value="四川基地"   <%=selected("四川基地",deptN)%>>四川基地</option>
<option value="研发部"      <%=selected("研发部",deptN)%>>研发部</option>
</select>
<%
	set conn=opendb("lmtof","conn","accessdsn")
	set rs1=server.createobject("adodb.recordset")
	sql="select DISTINCT username,name from userinf where userdept ='"&deptN&"'"
	rs1.open sql,conn,1
%>
<!--<select size=1 name="username">
<option vlue="所有"  <%=selected("所有",username)%> >所有</option>
<%
	if not rs1.eof and not rs1.bof then
		username=rs1("username")
	end if
	if request("username")<>"" then
		username=request("username")
	end if
	while not rs1.eof and not rs1.bof
		if rs1("username")=username then
			namevalue=rs1("name")
		end if
%>
<option value="<%=rs1("username")%>"<%=selected(username,rs1("username"))%>><%=rs1("name")%></option>
<%
		rs1.movenext
	wend
	conn.close
	set conn=nothing
	set rs=nothing
	set rs1=nothing
%>
</select>-->
<%
'IF yearN<>"" and yearN<>"所有" then
'   yearT=yearN
'end if
'IF monthN<>"" and monthN<>"所有" then
'   monthT=monthN
'end if
'IF dayN<>"" and dayN<>"所有" then
'   dayT=dayN
'end if
%>
日期
<select name="year1" size="1">
<option vlue="所有" <%=selected("所有",yearN)%>>所有</option>
<%for i=2009 to 2019%>
<option value="<%response.Write(i)%>" <%=selected(i,yearN)%>><%response.Write(i)%></option>
<%next%>
</select>
年
<select name="month1" size="1">
<option value="所有"<%=selected("所有",monthN)%>>所有</option>
<%for j=1 to 12%>
<option value="<%response.Write(j)%>" <%=selected(j,monthN)%>><%response.Write(j)%></option>
<%next%>
</select>
月
<select name="day1" size="1">
<option value="所有"<%=selected("所有",dayN)%>>所有</option>
<%for k=1 to 31%>
<option value="<%response.Write(k)%>" <%=selected(k,dayN)%>><%response.Write(k)%></option>
<%next%>
</select>
日
<input type="submit"  value="查询" />
</form>
<form  name="form1" action="manageReimList.asp" method="post">
<select name="uname" size="1">
<option value=""><%response.Write("")%></option>
<%
        set conn=opendb("finance","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select distinct claimant from reimlisttable_old order by claimant desc"
        rs.open sql,conn,1,1
        do while not rs.eof and not rs.bof
%>
<option value="<%response.Write(rs("claimant"))%>" <%=selected(rs("claimant"),uname)%>><%response.Write(rs("claimant"))%></option>
<%
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
%>
</select>
<input type="submit"  value="查询" />
</form>
<% if oabusyuserlevelCode="CN" or oabusyuserlevelCode="CWZG"  or oabusyuserlevelCode="DSZ"  then%>
<form  name="form2" action="manageReimList.asp" method="post">
按照阶段选择
<select name="ustage" size="1">
<option value=""><%response.Write("")%></option>
<%
        set conn=opendb("finance","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select stage,txt  from stage"
        rs.open sql,conn,1,1
        do while not rs.eof and not rs.bof
		 if rs("stage")<>0 and  rs("stage")<>010 then
%>
<option value="<%response.Write(rs("stage"))%>" <%=selected(rs("stage"),ustage)%>><%response.Write(rs("stage"))%><%response.Write("|"&rs("txt"))%></option>
<%
        end if
        rs.movenext
        loop
        set rs=nothing
        set conn=nothing
%>
</select>
<input type="submit"  value="查询" />
</form>
<%end if%>
<% if oabusyuserlevelCode="DSZ" or oabusyuserlevelCode="CWZG" or oabusyuserlevelCode="CW" or oabusyuserlevelCode="CN" or oabusyuserlevelCode="BMJL" then%><div align="center"><a href="listlan.asp" target="_blank">收支一览表</a></div><%end if%>
<%
'设置每页显示的条数
const MaxPerPage=100
if not isempty(request("page")) then
currentpage=cint(request("page"))
else
currentpage=1
end if

'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","accessdsn")
set rs=server.CreateObject("adodb.recordset")
'等于0的不显示
if deptN="所有部门" then 
     if yearN="所有" then
	 
	     if oabusyuserlevelCode="ZSYG" then
	     stage1=0
	     sql="select * from reimlisttable_old where claimant="&"'"&oabusyusername&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
	     sql="select * from reimlisttable_old where (dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&"  and stage>1 ) order by reimburseDate desc" 
	     end if
		 if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
	     sql="select * from reimlisttable_old where ((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0) or (dept<>"&"'"&oabusyuserdept&"'"&" and type='A' and stage>2)) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&" and stage>0) order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CWZG" then
	     sql="select * from reimlisttable_old where (stage >2 and stage < 11) or ( claimant="&"'"&oabusyusername&"')  order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="DSZ" then
	     stage1=3
	     sql="select * from reimlisttable_old where (stage >3 and stage < 11) or ( claimant="&"'"&oabusyusername&"') order by reimburseDate desc"
	     end if
		 if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
	     sql="select * from reimlisttable_old where (stage >3 and stage < 11) or ( dept="&"'"&oabusyuserdept&"' and stage>0) order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CN" then
	     sql="select * from reimlisttable_old where (stage>6 and  stage<10) or ( claimant="&"'"&oabusyusername&"')  order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CW" then
	     sql="select * from reimlisttable_old where (stage>4 and  stage<10) or ( claimant="&"'"&oabusyusername&"')  order by reimburseDate desc"
	     end if
		 stra="所有的申请"
	   
	 end if
	 if yearN<>"所有" then
	   if monthN="" or monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
		
		 if oabusyuserlevelCode="ZSYG" then
	     stage1=0
	     sql="select * from reimlisttable_old where claimant="&"'"&oabusyusername&"' and reimburseDate between '"&t1&"' and '"&t2&"'   order by reimburseDate desc" 
	     end if
	     if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
	     sql="select * from reimlisttable_old where ((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0 ) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&"  and stage>1 )) and reimburseDate between '"&t1&"' and '"&t2&"'  order by reimburseDate desc"
	     end if
		 if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
	     sql="select * from reimlisttable_old where (((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0) or (dept<>"&"'"&oabusyuserdept&"'"&" and type='A' and stage>2)) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&" and stage>0)) and reimburseDate between '"&t1&"' and '"&t2&"'  order by reimburseDate desc" 
	     end if
	     if oabusyuserlevelCode="CWZG" then
	     sql="select * from reimlisttable_old wheres ((stage >2 and stage < 11) or ( claimant="&"'"&oabusyusername&"'))  and reimburseDate between '"&t1&"' and '"&t2&"'   order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="DSZ" then
	     stage1=3
	     sql="select * from reimlisttable_old where ((stage >3 and stage < 11) or ( claimant="&"'"&oabusyusername&"'))  and reimburseDate between '"&t1&"' and '"&t2&"'   order by reimburseDate desc"
	     end if
		 if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
	     sql="select * from reimlisttable_old where ((stage >3 and stage < 11) or ( dept="&"'"&oabusyuserdept&"' and stage>0)) and reimburseDate between '"&t1&"' and '"&t2&"'   order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CN" then
	     sql="select * from reimlisttable_old where ((stage>6 and  stage<10) or ( claimant="&"'"&oabusyusername&"')) and reimburseDate between '"&t1&"' and '"&t2&"'   order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CW" then
	     sql="select * from reimlisttable_old where ((stage>4 and  stage<10) or ( claimant="&"'"&oabusyusername&"'))  and reimburseDate between '"&t1&"' and '"&t2&"'  order by reimburseDate desc"
	     end if
		 stra=deptN&yearN&"年"&"的申请"
		
	   end if
	   if monthN<>""and monthN<>"所有" then
	    if dayN="" or dayN="所有" then
'-------------------------------------------------------	     
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		
		if oabusyuserlevelCode="ZSYG" then
	     stage1=0
	     sql="select * from reimlisttable_old where claimant="&"'"&oabusyusername&"' and reimburseDate between '"&t1&"' and '"&t2&"' order by reimburseDate desc" 
	     end if
	     if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
	     sql="select * from reimlisttable_old where ((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0 ) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&"  and stage>1 )) and reimburseDate between '"&t1&"' and '"&t2&"'   order by reimburseDate desc" 
	     end if
		 if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
	     sql="select * from reimlisttable_old where (((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0) or (dept<>"&"'"&oabusyuserdept&"'"&" and type='A' and stage>2)) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&" and stage>0))  and reimburseDate between '"&t1&"' and '"&t2&"'  order by reimburseDate desc" 
	     end if
	     if oabusyuserlevelCode="CWZG" then
	     sql="select * from reimlisttable_old where ((stage >2 and stage < 11) or ( claimant="&"'"&oabusyusername&"')) and reimburseDate between '"&t1&"' and '"&t2&"'  order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="DSZ" then
	     stage1=3
	     sql="select * from reimlisttable_old where ((stage >3 and stage < 11) or ( claimant="&"'"&oabusyusername&"'))  and reimburseDate between '"&t1&"' and '"&t2&"' order by reimburseDate desc"
	     end if
		 if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
	     sql="select * from reimlisttable_old where ((stage >3 and stage < 11) or ( dept="&"'"&oabusyuserdept&"' and stage>0)) and reimburseDate between '"&t1&"' and '"&t2&"'  order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CN" then
	     sql="select * from reimlisttable_old where ((stage>6 and  stage<10) or ( claimant="&"'"&oabusyusername&"'))  and reimburseDate between '"&t1&"' and '"&t2&"'  order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CW" then
	     sql="select * from reimlisttable_old where ((stage>4 and  stage<10) or ( claimant="&"'"&oabusyusername&"')) and reimburseDate between '"&t1&"' and '"&t2&"' order by reimburseDate desc"
	     end if
		
	    'sql1="select * from reimbursementlist where ((stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"'))  and reimburseDate>=#"&t1&"# and reimburseDate<#"&t2&"# and  finance="&"'"&oabusyname&"'"
		stra=deptN&yearN&"年"&monthN&"月"&"的申请"
		
		end if
		
		if dayN<>"" and dayN<>"所有" then
		  
		  t1=DateSerial(yearN,monthN,dayN)
		't2=DateSerial(yearN,monthN+1,1)
		
		if oabusyuserlevelCode="ZSYG" then
	     stage1=0
	     sql="select * from reimlisttable_old where claimant="&"'"&oabusyusername&"' and reimburseDate='"&t1&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
	     sql="select * from reimlisttable_old where ((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0 ) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&"  and stage>1 )) and reimburseDate='"&t1&"'  order by reimburseDate desc" 
	     end if
		 if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
	     sql="select * from reimlisttable_old where (((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0) or (dept<>"&"'"&oabusyuserdept&"'"&" and type='A' and stage>2)) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&" and stage>0))  and reimburseDate='"&t1&"'  order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CWZG" then
	     sql="select * from reimlisttable_old where ((stage >2 and stage < 11) or ( claimant="&"'"&oabusyusername&"')) and reimburseDate='"&t1&"'  order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="DSZ" then
	     stage1=3
	     sql="select * from reimlisttable_old where ((stage >3 and stage < 11) or ( claimant="&"'"&oabusyusername&"'))  and reimburseDate='"&t1&"'  order by reimburseDate desc"
	     end if
		 if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
	     sql="select * from reimlisttable_old where ((stage >3 and stage < 11) or ( dept="&"'"&oabusyuserdept&"' and stage>0)) and reimburseDate='"&t1&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CN" then
	     sql="select * from reimlisttable_old where ((stage>6 and  stage<10) or ( claimant="&"'"&oabusyusername&"'))  and reimburseDate='"&t1&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CW" then
	     sql="select * from reimlisttable_old where ((stage>4 and  stage<10) or ( claimant="&"'"&oabusyusername&"')) and reimburseDate='"&t1&"' order by reimburseDate desc"
	     end if
		
	    'sql1="select * from reimbursementlist where ((stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"'))  and reimburseDate>=#"&t1&"# and reimburseDate<#"&t2&"# and  finance="&"'"&oabusyname&"'"
		stra=deptN&yearN&"年"&monthN&"月"&dayN&"的申请"
		
		end if
	   end if
	 end if
  end if
  
if deptN<>"所有部门"  and deptN<>"" then 
     if yearN="所有" then
	 
	    if oabusyuserlevelCode="ZSYG" then
	     stage1=0
	     sql="select * from reimlisttable_old where claimant="&"'"&oabusyusername&"' order by reimburseDate desc" 
	     end if
	     if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
	     sql="select * from reimlisttable_old where (dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0 ) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&"  and stage>1 ) order by reimburseDate desc" 
	     end if
		 if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
	     sql="select * from reimlisttable_old where (((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0) or (dept<>"&"'"&oabusyuserdept&"'"&" and type='A' and stage>2)) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&" and stage>0)) and dept="&"'"&deptN&"'  order by reimburseDate desc" 
	     end if
	     if oabusyuserlevelCode="CWZG" then
	     sql="select * from reimlisttable_old where ((stage >2 and stage <11) or ( claimant="&"'"&oabusyusername&"'))  and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="DSZ" then
	     stage1=3
	     sql="select * from reimlisttable_old where ((stage >3 and stage <11) or ( claimant="&"'"&oabusyusername&"'))  and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
		 if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
	     sql="select * from reimlisttable_old where ((stage >3 and stage < 11) or ( dept="&"'"&oabusyuserdept&"' and stage>0)) and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CN" then
	     sql="select * from reimlisttable_old where ((stage>6 and  stage<10) or ( claimant="&"'"&oabusyusername&"'))   and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CW" then
	     sql="select * from reimlisttable_old where ((stage>4 and  stage<10) or ( claimant="&"'"&oabusyusername&"'))  and dept="&"'"&deptN&"'  order by reimburseDate desc"
	     end if
	 
	   'sql1="select * from reimbursementlist where  ((stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"'))  and dept="&"'"&deptN&"' and  finance="&"'"&oabusyname&"'"
	   stra=deptN&yearN&"年的申请"
	   
	 end if
	 if yearN<>"所有" then
	   if monthN="所有" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
		
		 if oabusyuserlevelCode="ZSYG" then
	     stage1=0
	     sql="select * from reimlisttable_old where claimant="&"'"&oabusyusername&"' and reimburseDate between '"&t1&"' and '"&t2&"' order by reimburseDate desc" 
	     end if
	     if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
	     sql="select * from reimlisttable_old where ((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0 ) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&"  and stage>1 )) and reimburseDate between '"&t1&"' and '"&t2&"' order by reimburseDate desc" 
	     end if
		 if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
	     sql="select * from reimlisttable_old where (((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0) or (dept<>"&"'"&oabusyuserdept&"'"&" and type='A' and stage>2)) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&" and stage>0)) and reimburseDate between '"&t1&"' and '"&t2&"' and dept="&"'"&deptN&"'  order by reimburseDate desc" 
	     end if
	     if oabusyuserlevelCode="CWZG" then
	     sql="select * from reimlisttable_old where ((stage >2 and stage <11) or ( claimant="&"'"&oabusyusername&"')) and reimburseDate between '"&t1&"' and '"&t2&"' and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="DSZ" then
	     stage1=3
	     sql="select * from reimlisttable_old where ((stage >3 and stage <11) or ( claimant="&"'"&oabusyusername&"')) and reimburseDate between '"&t1&"' and '"&t2&"' and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
		 if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
	     sql="select * from reimlisttable_old where ((stage >3 and stage < 11) or ( dept="&"'"&oabusyuserdept&"' and stage>0)) and reimburseDate between '"&t1&"' and '"&t2&"' and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CN" then
	     sql="select * from reimlisttable_old where ((stage>6 and  stage<10) or ( claimant="&"'"&oabusyusername&"')) and reimburseDate between '"&t1&"' and '"&t2&"' and dept="&"'"&deptN&"'  order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CW" then
	     sql="select * from reimlisttable_old where ((stage>4 and  stage<10) or ( claimant="&"'"&oabusyusername&"')) and reimburseDate between '"&t1&"' and '"&t2&"' and dept="&"'"&deptN&"'  order by reimburseDate desc"
	     end if				
	    'sql1="select * from reimbursementlist where ((stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"'))  and reimburseDate>=#"&t1&"# and reimburseDate<#"&t2&"# and dept="&"'"&deptN&"' and  finance="&"'"&oabusyname&"'"
		stra=deptN&yearN&"年的申请"
		
	   end if
	   if monthN<>"所有" then
	    if dayN="所有" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
		
		if oabusyuserlevelCode="ZSYG" then
	     stage1=0
	     sql="select * from reimlisttable_old where claimant="&"'"&oabusyusername&"' and reimburseDate between '"&t1&"' and '"&t2&"'  order by reimburseDate desc" 
	     end if
	     if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
	     sql="select * from reimlisttable_old where ((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0 ) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&"  and stage>1 )) and reimburseDate between '"&t1&"' and '"&t2&"'  order by reimburseDate desc"
	     end if
		 if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
	     sql="select * from reimlisttable_old where (((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0) or (dept<>"&"'"&oabusyuserdept&"'"&" and type='A' and stage>2)) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&" and stage>0)) and reimburseDate between '"&t1&"' and '"&t2&"'  and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CWZG" then
	     sql="select * from reimlisttable_old where ((stage >2 and stage <11) or ( claimant="&"'"&oabusyusername&"')) and reimburseDate between '"&t1&"' and '"&t2&"' and dept="&"'"&deptN&"'  order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="DSZ" then
	     stage1=3
	     sql="select * from reimlisttable_old where ((stage >3 and stage <11) or ( claimant="&"'"&oabusyusername&"'))  and reimburseDate between '"&t1&"' and '"&t2&"' and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
		 if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
	     sql="select * from reimlisttable_old where ((stage >3 and stage < 11) or ( dept="&"'"&oabusyuserdept&"' and stage>0)) and reimburseDate between '"&t1&"' and '"&t2&"' and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CN" then
	     sql="select * from reimlisttable_old where ((stage>6 and  stage<10) or ( claimant="&"'"&oabusyusername&"'))  and reimburseDate between '"&t1&"' and '"&t2&"' and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CW" then
	     sql="select * from reimlisttable_old where ((stage>4 and  stage<10) or ( claimant="&"'"&oabusyusername&"'))  and reimburseDate between '"&t1&"' and '"&t2&"' and dept="&"'"&deptN&"'  order by reimburseDate desc"
	     end if		
	    'sql1="select * from reimbursementlist where ((stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"'))  and reimburseDate>=#"&t1&"# and reimburseDate<#"&t2&"# and dept="&"'"&deptN&"' and  finance="&"'"&oabusyname&"'"
		stra=deptN&yearN&"年"&monthN&"月"&"的申请"
		
		end if
		
		if dayN<>"所有" then
		 t1=DateSerial(yearN,monthN,dayN)
		t2=DateSerial(yearN,monthN+1,1)
		
		if oabusyuserlevelCode="ZSYG" then
	     stage1=0
	     sql="select * from reimlisttable_old where claimant="&"'"&oabusyusername&"' and reimburseDate='"&t1&"'  order by reimburseDate desc" 
	     end if
	     if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
	     sql="select * from reimlisttable_old where ((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0 ) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&"  and stage>1 )) and reimburseDate='"&t1&"'  order by reimburseDate desc" 
	     end if
		 if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
	     sql="select * from reimlisttable_old where (((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0) or (dept<>"&"'"&oabusyuserdept&"'"&" and type='A' and stage>2)) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&" and stage>0)) and reimburseDate='"&t1&"' and dept="&"'"&deptN&"' order by reimburseDate desc" 
	     end if
	     if oabusyuserlevelCode="CWZG" then
	     sql="select * from reimlisttable_old where ((stage >2 and stage <11) or ( claimant="&"'"&oabusyusername&"')) and reimburseDate='"&t1&"'and dept="&"'"&deptN&"'  order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="DSZ" then
	     stage1=3
	     sql="select * from reimlisttable_old where ((stage >3 and stage <11) or ( claimant="&"'"&oabusyusername&"'))  and reimburseDate='"&t1&"' and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
		 if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
	     sql="select * from reimlisttable_old where ((stage >3 and stage < 11) or ( dept="&"'"&oabusyuserdept&"' and stage>0)) and reimburseDate='"&t1&"' and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CN" then
	     sql="select * from reimlisttable_old where ((stage>6 and  stage<10) or ( claimant="&"'"&oabusyusername&"'))  and reimburseDate='"&t1&"'  and dept="&"'"&deptN&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CW" then
	     sql="select * from reimlisttable_old where ((stage>4 and  stage<10) or ( claimant="&"'"&oabusyusername&"'))  and reimburseDate='"&t1&"' and dept="&"'"&deptN&"'  order by reimburseDate desc"
	     end if		
	    'sql1="select * from reimbursementlist where ((stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"'))  and reimburseDate>=#"&t1&"# and reimburseDate<#"&t2&"# and dept="&"'"&deptN&"' and  finance="&"'"&oabusyname&"'"
		stra=deptN&yearN&"年"&monthN&"月"&dayN&"的申请"
		
		end if
	   end if
	 end if
  end if
  
  if deptN="" then
     if yearN="" then
	   if monthN="" then
	   
	   	 if oabusyuserlevelCode="ZSYG" then
	     stage1=0
	     sql="select * from reimlisttable_old where claimant="&"'"&oabusyusername&"' order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
	     sql="select * from reimlisttable_old where (dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0 ) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&"  and stage>1 ) order by reimburseDate desc"
	     end if
		 if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
	     sql="select * from reimlisttable_old where ((dept="&"'"&oabusyuserdept&"'"&" and type='A' and stage>0) or (dept<>"&"'"&oabusyuserdept&"'"&" and type='A' and stage>2)) or (type='B' and projectDept = "&"'"&oabusyuserdept&"'"&" and stage>0) order by reimburseDate desc" 
	     end if
	     if oabusyuserlevelCode="CWZG" then
	     sql="select * from reimlisttable_old where (stage > 2 and stage <11) or ( claimant="&"'"&oabusyusername&"')  order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="DSZ" then
	     stage1=3
	     sql="select * from reimlisttable_old where (stage >3 and stage <11) or ( claimant="&"'"&oabusyusername&"') order by reimburseDate desc"
	     end if
		 if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then
	     sql="select * from reimlisttable_old where (stage >3 and stage < 11) or ( dept="&"'"&oabusyuserdept&"' and stage>0) order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CN" then
	     sql="select * from reimlisttable_old where (stage>6 and  stage<10) or ( claimant="&"'"&oabusyusername&"')  order by reimburseDate desc"
	     end if
	     if oabusyuserlevelCode="CW" then
	     sql="select * from reimlisttable_old where (stage>4 and  stage<10) or ( claimant="&"'"&oabusyusername&"')   order by reimburseDate desc"
	     end if
		 
	   'sql1="select * from reimbursementlist where (stage>0 and stage<9) or stage=10 or (stage=0 and claimant="&"'"&oabusyname&"')"
	   stra="所有的申请"
	   
	   end if
	 end if
  end if
  if uname<>"" then
  'sql=sql&" or claimant='"&uname&"'"
  end if
  
  if currentpage>1 then
  sql=request.Cookies("sqlt")
  strb=request.Cookies("stra")
  end if
  if strb<>"" then
  stra=strb
  end if
  if uname="" and ustage="" then
  response.Write(stra)
  'response.Write(sql)
  rs.open sql,conn,1,1
  end if
  if uname<>"" then
  response.Write("您选择的报销人是"&uname)
   if oabusyusername=uname then
      sql="select * from reimlisttable_old where claimant='"&uname&"' order by stage asc"
   end if
   if oabusyusername<>uname then
      sql="select * from reimlisttable_old where claimant='"&uname&"' and stage>0 and stage<>10  order by reimburseDate desc"
   end if
  'response.Write(sql)
  rs.open sql,conn,1,1
  end if
  if ustage<>"" then
  response.Write("您选择的阶段是"&ustage)
  sql="select * from reimlisttable_old where stage="&ustage&" order by reimburseDate"
  'response.Write(sql)
  rs.open sql,conn,1,1
  end if
%>

<%


totalPut=rs.recordcount
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
    showpage totalput,MaxPerPage,"manageReimList.asp"
	showContent
	showpage totalput,MaxPerPage,"manageReimList.asp"
 else 
    if(currentpage-1)*MaxPerPage<totalPut then
	 rs.move (currentpage-1)*MaxPerPage
	 dim bookmark
	 bookmark=rs.bookmark
	 showpage totalput,MaxPerPage,"manageReimList.asp"
	 showContent
	 showpage totalput,MaxPerPage,"manageReimList.asp"
	else
	 currentpage=1
	 showpage totalput,MaxPerPage,"manageReimList.asp"
	 showContent
	 showpage totalput,MaxPerPage,"manageReimList.asp"
	end if
	rs.close
end if
%>	
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
	
	   response.Write "<a href="&filename&"?page=1>首页</a>&nbsp;"
	   response.Write "<a href="&filename&"?page="&currentpage-1&">上一页</a>&nbsp;"
	end if
	
	if n-currentPage<1 then
	   response.Write "<font color='#000080'>下一页 尾页</font>"
	else 
	   response.Cookies("sqlt")=sql
	   response.Cookies("stra")=stra
	   'response.Write ("<a href="&filename&"?page="&(currentpage+1)&">")
	   response.Write ("<a href="&filename&"?page="&(currentpage+1)&">")
	   response.Write ("下一页</a>&nbsp;<a href="&filename&"?page="&n&">尾页</a>")
	 end if
	 
	 response.Write "<font color='#000080'>&nbsp;页次：</font><strong><font color=red>"&currentPage&"</font><font color='#000080'>/"&n&"</strong>页</strong></font>"
	 response.Write "<font color='#000080'>&nbsp;共<b>"&totalnumber&"</b>条记录<b>&nbsp;"&maxperpage&"</b>条记录/页</font>"
end function
%>

<%
    moneySumCount=0
	billSumCount=0
sub showContent
dim i
i=0	
%>
<%
'set connItem=server.CreateObject("adodb.connection")
'pathItem=server.MapPath("finance.mdb")
'connItem.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathItem
'set rsItem=server.CreateObject("adodb.recordset")
'sqlItem="select * from reimburseItem " 
'rsItem.open sqlItem,connItem,1,1
%>
<%if code<>"CW" then%>
<form name="form1" action="huizong.asp" method="post">
<%end if%>
<%if code="CW" then%>
<form name="form1" action="manageReimlist.asp" method="post">
<%end if%>

<table border="1"  cellspacing="1" cellspacing="1">
<tr bgcolor="D7E8F8" bordercolor="#339999" ><td>报销人</td><!--<td>部门</td>--><td>报销日期</td><td>报销总金额</td><%if code<>"CN" and code<>"CW" then%><td>单据总数</td><%end if%><%if code="CN" or code="CW" then%><td>摘要</td><%end if%><td>状态</td>
<%if (code<>"ZSYG" and code<>"SSYG") then%><%if code<>"CW" and code<>"CN" then%><td>项目编号</td><%end if%><%if code<>"BMJL" then%><td>报销账号</td><%end if%><%end if%><%if code="CN" then%><td>选中</td><%end if%>
<%if code="CW" then%><td><font color="#0d79b3" size="-1"></font></td><%end if%></tr>
<%do while not rs.eof %>
<tr bordercolor="#339999"><td bordercolor="339999"><a href=ViewReim.asp?id=<%=rs("id")%>><%=rs("claimant")%></a></td><!--<td><%=rs("dept")%></td>--><td><%=rs("reimburseDate")%></td><td><%=rs("money")%></td>
<%if code<>"CN" and code<>"CW" then%>
<td bordercolor="339999"><%=rs("billCount")%></td>
<%end if%>
<%if code="CN" or code="CW" then%>
<td bordercolor="339999">
<%
set connJ=opendb("finance","conn","accessdsn")
set rsJ=server.createobject("adodb.recordset")
sqlJ="select * from reimlisttable_old where id="&rs("id")
rsJ.open sqlJ,connJ,1,1
if not rsJ.eof and not rsJ.bof then   
  response.Write(rsJ("summary"))
  end if
  set connJ=nothing
  set rsJ=nothing
%>
</td><%end if%>
<td bordercolor="339999">
<input type="hidden" name="id" value="<%=rs("id")%>" />
<%
'set connTS=server.CreateObject("adodb.connection")
'pathTS=server.MapPath("finance")
'connTS.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathTS
set connTS=opendb("finance","conn","sql")
set rsTS=server.CreateObject("adodb.recordset")
sqlTS="select * from stage where stage="&rs("stage")
rsTS.open sqlTS,connTS,1,1
%>
<%=rsTS("txt")%>
</td>
<%if (code<>"ZSYG" and code<>"SSYG" ) then
%>
<%
set connJ=opendb("finance","conn","accessdsn")
set rsJ=server.createobject("adodb.recordset")
sqlJ="select * from reimlisttable_old where id="&rs("id")
rsJ.open sqlJ,connJ,1,1
if not rsJ.eof and not rsJ.bof then
projectId=rsJ("projectId") 
if code<>"CW" and code<>"CN" then
%>
<td bordercolor="339999">
<%
   
  response.Write(projectId)
  end if
  set connJ=nothing
  set rsJ=nothing
%>
</td>
<%end if%>
<%if code<>"BMJL" then 
    if code<>"CW" then
%>
<td bordercolor="339999">
    <%
       set connJ=opendb("finance","conn","accessdsn")
       set rsJ=server.createobject("adodb.recordset")
       sqlJ="select * from reimlisttable_old where id="&rs("id")
       rsJ.open sqlJ,connJ,1,1
       if not rsJ.eof and not rsJ.bof then
	          response.Write(rsJ("givecount")&"&nbsp;")
       end if
       set connJ=nothing
       set rsJ=nothing
    %>
</td>
    <%end if%>
<%ft=dateDiff("y","2009-11-11",rs("reimburseDate"))
'response.Write(f)
%>
   
   <%
       set connT=opendb("finance","conn","accessdsn")
       set rsT=server.createobject("adodb.recordset")
       sqlT="select * from reimlisttable_old where id="&rs("id")
       rsT.open sqlT,connT,1,1
       if not rsT.eof and not rsT.bof then
       financeCount=rsT("givecount")
       end if
       set connT=nothing
       set rsT=nothing
    if code="CW"  then
   %>
<td bordercolor="339999">&nbsp;
   <select name="counta" size="1">
   <%
       'set connItem=server.CreateObject("adodb.connection")
       'pathItem=server.MapPath("finance.mdb")
       'connItem.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathItem
	   set connItem=opendb("finance","conn","sql")
       set rsItem=server.CreateObject("adodb.recordset")
       sqlItem="select * from reimlisttable_old where id="&rs("id")
       rsItem.open sqlItem,connItem,1,1
       financeCount=rsItem("givecount")
       '______________________________________________________________
       'set connJ=opendb("GFProjectType.mdb","conn","accessdsn")
	   set connJ=opendb("GFProjectType","conn","sql")
       set rsJ=server.createobject("adodb.recordset")
       sqlJ="select DISTINCT financeCount from projectType_old order by financeCount"
       rsJ.open sqlJ,connJ,1,1
       do  while not rsJ.eof 
   %>
       <% if  Cint(f)>Cint(0) then%>
  <option value=<%=rsJ("financeCount")%> <%=selected(rsJ("financeCount"),financeCount)%>>
      <% 
          response.Write(rsJ("financeCount")&"&nbsp;")
      %></option>
      <%end  if%>
      <% if Cint(f)<Cint(0) then%>
  <option value=<%=rsJ("financeCount")%> <%=selected(rsJ("financeCount"),financeCount)%>><!--rsItem("givecount"))-->
      <% 
        response.Write(rsJ("financeCount")&"&nbsp;")
      %></option>
      <%end  if%>
   <%
   'response.Write(rsJ("financeCount"))
   response.Write("junshi"&rsItem("givecount"))
       rsJ.movenext
       loop
       set rsJ=nothing
       set connJ=nothing
   %>
   </select>
   <%
       end if
   %>
   </td>  
     <%end if%>
	 <%if code="CN" and f<0 then%>
       <td bordercolor="339999"><%response.Write(financeCount)&"&nbsp;"%></td>
      <%end if%>
<%end if%>

<%if code="CN" and rs("stage")=7 then%>
<td bordercolor="339999"><input type="hidden" name="ttid"   value="<%=rs("id")%>"> <input name='printid' type='checkbox'  value='<%=rs("id")%>'><%response.Write(rs("id"))%></td>
<%end if%>
<%if code="CN" and rs("stage")<>7 then%>
<td bordercolor="339999"><%response.Write(rs("id"))%></td>
<%end if%>
</tr>
<%
i=i+1
if i>=MaxPerPage then exit Do
 rs.movenext 
 
loop %>
</table>
<% end sub %>

<%if code="CN" then%>
<input type="submit" name="sub" value="打印选中" />
<input type="submit" name="submit" value="这些已经签字" />
<%end if%>
<%if code="CW" then%>
<!--<input type="submit" value="保存" />不再使用该页面来批量的修改帐号2010-12-24-->
<%end if%>
<%if code="CN" then%>
<input name="chkAll" type="checkbox"  onclick=CheckAll(this.form) value="checkbox">
              选中本页所有
<%end if%>
<%if code<>"CW"and code<>"CN" then%>
<input type="submit" value="汇总显示" />
<%end if%>
</form>



<%
if oabusyuserlevel="财务" or oabusyuserlevel="名誉董事长" then
   'set connf=server.CreateObject("adodb.connection")
   'dpathf=server.Mappath("finance.mdb")
   'connf.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dpathf
   set connf=opendb("finance","conn","sql")
   set rsf=server.CreateObject("adodb.recordset")
   if oabusyuserlevel="财务" then
   sqlf="select * from ReimMilti where Stage = 4 or Stage =8 or Stage = 3"
   else if oabusyuserlevel="名誉董事长" then
   sqlf="select * from ReimMilti where Stage = 3 "
   end if
   end if
   rsf.open sqlf,connf,1,1 
   if not rsf.eof or not rsf.bof then
%>
<div align="center">
<br><font color="#330033" size="-1">以下是您需要处理混合报销单：</font>
<table  border="1" cellpadding="1" cellspacing="0" width="560">
<tr bgcolor="D7E8F8" bordercolor="#339999"><td><font color="#0d79b3" size="-1">编号</font></td><td><font color="#0d79b3" size="-1">日期</font></td><td><font color="#0d79b3" size="-1">金额(元)</font></td><td><font color="#0d79b3" size="-1">部门</font></td><td><font color="#0d79b3" size="-1">状态</font></td></tr>
<%do while not rsf.eof %>
<tr>
<td>
<a href="editReimForMil.asp?id=<%=rsf("id")%>" target="_self"><%=rsf("id")%></a>
</td>
<td><%response.Write(formatdatetime(rsf("ReimDate"), 1))%></td>
<td><%=rsf("MoneySum")%></td>
<td>
<%if rsf("ProductDepartM")<>0.00 then 
response.Write("产品部："&rsf("ProductDepartM")&"元&nbsp;")
end if %>
<%if rsf("ProductDepartM")<>0.00 then 
response.Write("工程部："& rsf("EngineeringDepartM")&"元&nbsp;")
end if %>
<%if rsf("ProductDepartM")<>0.00 then 
response.Write( "教育培训部："&rsf("EduTrainDepartM")&"元&nbsp;")
end if %>
<%if rsf("ProductDepartM")<>0.00 then 
response.Write("业务发展部："& rsf("MarketDepartM")&"元&nbsp;")
end if %>
<%if rsf("ProductDepartM")<>0.00 then 
response.Write( "综合管理部："&rsf("GeneManageDepartM")&"元&nbsp;")
end if %>
<%if rsf("ProductDepartM")<>0.00 then 
response.Write( "四川基地："&rsf("sichuanJDM")&"元")
end if %>
</td>
<td>
<%
'set cnSt=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'cnSt.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set cnSt=opendb("finance","conn","sql")
set rsSt=server.CreateObject("adodb.recordset")
sqlS="select * from stage where stage="&rsf("Stage")
rsSt.open sqlS,cnSt,1,1
if rsf("Stage")=4 then
%>
<font  color="#6600FF"><%response.Write(rsSt("txt"))%></font>
<% 
end if
if rsf("Stage")<>4 then
response.Write(rsSt("txt"))
end if
%>
</td>
</tr>
<%
rsf.movenext
loop
%>
</table>
</div>
<%
end if
end if
%>
</div>
</font>
</body>
</html>
