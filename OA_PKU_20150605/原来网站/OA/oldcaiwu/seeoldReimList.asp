<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="..\jiezhibaoxiao\opendb.asp"-->
<title>�账��Ĵ��������鿴</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
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
</head>

<body>
<font size="-1">
<!--#include file="../asp/checked.asp"-->
<div align="center">
<form  name="form" action="seeoldReimList.asp" method="post">

����
<select name="dept" size="1">
<option vlue="���в���"  <%=selected("���в���",dept)%>>���в���</option>
<%
	  set conn=opendb("finance","conn","sql")
	  set rs=server.CreateObject("adodb.recordset")
	  sql="select distinct(projectDept) from reimlisttable"
	  rs.open sql,conn,1,1
	  do while not rs.eof 
	%>
	<option value="<%=rs("projectDept")%>"  <%=selected(rs("projectDept"),deptN)%>><%=rs("projectDept")%></option>
	<% 
	rs.movenext
	loop
	%>
</select>

����
<select name="year1" size="1">
<option vlue="����" <%=selected("����",year1)%>>����</option>
<%for i=2009 to 2019%>
<option vlue="<%response.Write(i)%>" <%=selected(i,year1)%>><%response.Write(i)%></option>
<%next%>
</select>
��
<select name="month1" size="1">
<option vlue="ȫ��" ></option>
<%for j=1 to 12%>
<option vlue="<%response.Write(j)%>" <%=selected(j,month1)%>><%response.Write(j)%></option>
<%next%>
</select>
��
<input type="submit"  value="��ѯ" />
</form>

<font color="#FF0000">
<%
'����ÿҳ��ʾ������
const MaxPerPage=200
if not isempty(request("page")) then
currentpage=cint(request("page"))
else
currentpage=1
end if


set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")

if deptN="���в���" then 
     if yearN="����" then
	   sql1="select * from reimlisttable_old where (stage>0 and stage<11) or (stage=0 and claimant="&"'"&oabusyname&"')"
	   response.Write("���е�����")
	 end if
	 if yearN<>"����" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    sql1="select * from reimlisttable_old where ((stage>0 and stage<11) or (stage=0 and claimant="&"'"&oabusyname&"'))  and date>=#"&t1&"# and date<#"&t2&"# and  finance="&"'"&oabusyname&"'"
		response.Write(deptN&yearN&"�������")
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    sql1="select * from reimlisttable_old where ((stage>0 and stage<11) or (stage=0 and claimant="&"'"&oabusyname&"'))  and date>=#"&t1&"# and date<#"&t2&"# and  finance="&"'"&oabusyname&"'"
		response.Write(deptN&yearN&"��"&monthN&"��"&"������")
	   end if
	 end if
  end if
  
  if deptN<>"���в���"  and deptN<>"" then 
     if yearN="����" then
	   sql1="select * from reimlisttable_old where  ((stage>0 and stage<11) or (stage=0 and claimant="&"'"&oabusyname&"'))  and projectDept="&"'"&deptN&"'"
	   response.Write(deptN&yearN&"�������")
	 end if
	 if yearN<>"����" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    sql1="select * from reimlisttable_old where ((stage>0 and stage<11) or (stage=0 and claimant="&"'"&oabusyname&"'))  and date>=#"&t1&"# and date<#"&t2&"# and projectDept="&"'"&deptN&"'"
		response.Write(deptN&yearN&"�������")
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    sql1="select * from reimlisttable_old where ((stage>0 and stage<11) or (stage=0 and claimant="&"'"&oabusyname&"'))  and date>=#"&t1&"# and date<#"&t2&"# and projectDept="&"'"&deptN&"'"
		response.Write(deptN&yearN&"��"&monthN&"��"&"������")
	   end if
	 end if
  end if
  
  if deptN="" then
     if yearN="" then
	   if monthN="" then
	   sql1="select * from reimlisttable_old where (stage>0 and stage<11)or (stage=0 and claimant="&"'"&oabusyname&"')"
	   end if
	 end if
  end if


sql1=sql1&" order by stage"
'response.Write(sql1)
rs.open sql1,conn,1,1
%>
</font>
</div>
<%
totalPut=rs.recordcount
'response.Write(totalPut)
'�������ݿ�����ʾ�ĸ���
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
'��ʾ��ҳ��Ϣ
 if currentpage=1 then
    showpage totalput,MaxPerPage,"seeoldReimList.asp"
	showContent
	showpage totalput,MaxPerPage,"seeoldReimList.asp"
 else 
    if(currentpage-1)*MaxPerPage<totalPut then
	 rs.move (currentpage-1)*MaxPerPage
	 dim bookmark
	 bookmark=rs.bookmark
	 showpage totalput,MaxPerPage,"seeoldReimList.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeoldReimList.asp"
	else
	 currentpage=1
	 showpage totalput,MaxPerPage,"seeoldReimList.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeoldReimList.asp"
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
	'����Ŀǰ��ҳ��λ�������ø�������
	if currentpage<2 then
	   response.Write "<font color='#000080'>��ҳ  ��һҳ</font>&nbsp;"
	else
	   response.Write "<a href="&filename&"?page=1>��ҳ</a>&nbsp;"
	   response.Write "<a href="&filename&"?page="&currentpage-1&">��һҳ</a>&nbsp;"
	end if
	
	if n-currentPage<1 then
	   response.Write "<font color='#000080'>��һҳ βҳ</font>"
	else 
	   response.Write ("<a href="&filename&"?page="&(currentpage+1)&">")
	   response.Write ("��һҳ</a>&nbsp;<a href="&filename&"?page="&n&">βҳ</a>")
	 end if
	 
	 response.Write "<font color='#000080'>&nbsp;ҳ�Σ�</font><strong><font color=red>"&currentPage&"</font><font color='#000080'>/"&n&"</strong>ҳ</strong></font>"
	 response.Write "<font color='#000080'>&nbsp;��<b>"&totalnumber&"</b>����¼<b>&nbsp;"&maxperpage&"</b>����¼/ҳ</font>"
end function
%>
<%
    moneySumCount=0
	billSumCount=0
sub showContent
dim i
i=0	
%>
<div align="center">
<table border="1" cellpadding="1" cellspacing="0">
<tr  bgcolor="D7E8F8" bordercolor="#339999"><td><font color="#0d79b3" size="-1">ʵ�ʱ�����</font></td><td><font color="#0d79b3" size="-1">��������(������)</font></td><td><font color="#0d79b3" size="-1">�����˲���</font></td><td><font color="#0d79b3" size="-1">��Ŀ����</font></td><td><font color="#0d79b3" size="-1">��������</font></td><td><font color="#0d79b3" size="-1">�����ܽ��(Ԫ)</font></td><td><font color="#0d79b3" size="-1">��������</font></td><td><font color="#0d79b3" size="-1">������Ŀ��Ϣ</font></td><td><font color="#0d79b3" size="-1">��������</font></td><td>&nbsp;</td></tr>
<%do while not rs.eof %>
<tr><td><font size="-1"><%=rs("relclaimant")%></font></td><td><font size="-1"><%=rs("claimant")%></font></td><td><font size="-1"><%=rs("dept")%></font></td><td><font size="-1"><%=rs("projectDept")%></font></td><td><font size="-1"><%response.Write(formatdatetime(rs("reimburseDate"), 1))%></font></td><td><font size="-1"><%=rs("money")%></font></td><td><font size="-1"><%=rs("billCount")%></font></td>
<td><font size="-1">
<%
set connTS=opendb("GFProjectType","conn","sql")
set rsTS=server.CreateObject("adodb.recordset")
sqlTS="select * from projectType_old where projectid='"&rs("projectid")&"'"
rsTS.open sqlTS,connTS,1,1
%>
<%=rs("projectid")&"|"&rsTS("financecount")&"|"&rsTS("projectname")%>
<%
set connTS=nothing
set rsTS=nothing
set sqlTS=nothing
%>
</font></td>
<td><font size="-1">
<%
set connTS=opendb("finance","conn","sql")
set rsTS=server.CreateObject("adodb.recordset")
sqlTS="select * from stage where stage="&rs("stage")
rsTS.open sqlTS,connTS,1,1
%>
<%=rsTS("txt")%>
</font></td><td><font size="-1"><a href=ViewReim.asp?id=<%=rs("id")%>>�鿴</a></font></td></tr>
<%
i=i+1
if i>=MaxPerPage then exit Do
 rs.movenext 
loop %>
<tr><td colspan="3"><font size="-1">�ϼ�</font></td><td><font size="-1"><%=moneySumCount%>Ԫ</font></td><td><font size="-1"><%=billSumCount%>��</font></td><td></td><td></td></tr>
</table>
</div>
<% end sub %>
<br>
</font>
</body>
</html>
