<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>seeAll</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername="" then 
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
<form  name="form" action="seeAllList.asp" method="post">
����
<select name="dept" size="1">
<option vlue="���в���"  <%=selected("���в���",dept)%>>���в���</option>
<option vlue="��Ʒ��"    <%=selected("��Ʒ��",dept)%>>��Ʒ��</option>
<option vlue="���̲�"    <%=selected("���̲�",dept)%>>���̲�</option>
<option vlue="�ۺϹ���" <%=selected("�ۺϹ���",dept)%>>�ۺϹ���</option>
<option vlue="ҵ��չ��"     <%=selected("ҵ��չ��",dept)%>>ҵ��չ��</option>
<option vlue="������ѵ��"     <%=selected("������ѵ��",dept)%>>������ѵ��</option>
<option vlue="�Ĵ�����"   <%=selected("�Ĵ�����",dept)%>>�Ĵ�����</option>
<option vlue="�з���"      <%=selected("�з���",dept)%>>�з���</option>
<option vlue="ʱ����Ϣ������ѵ��"      <%=selected("ʱ����Ϣ������ѵ��",dept)%>>ʱ����Ϣ������ѵ��</option>
</select>
����
<select name="year1" size="1">
<option vlue="����" <%=selected("����",year1)%>>����
<%for i=2009 to 2019%>
<option vlue="<%response.Write(i)%>" <%=selected(i,year1)%>><%response.Write(i)%></option>
<%next%>
</select>
��
<select name="month1" size="1">
<option vlue="ȫ��" >
<%for j=1 to 12%>
<option vlue="<%response.Write(j)%>" <%=selected(j,month1)%>><%response.Write(j)%></option>
<%next%>
</select>
��
<input type="submit"  value="��ѯ" />
</form>
</div>
<div align="center">
<form name="form1">
<font color="#FF0000">
<%
'����ÿҳ��ʾ������
const MaxPerPage=20
if not isempty(request("page")) then
currentpage=cint(request("page"))
else
currentpage=1
end if

'�����ݿ�
'set cnborr=server.CreateObject("ADODB.Connection")
'DBPath1=server.mappath("finance.mdb")
'cnborr.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set cnborr=opendb("finance","conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
  if deptN="���в���" then 
     if yearN="����" then
	   sql1="select * from borrowlist where stage>1 and stage<8 and finance="&"'"&oabusyusername&"'"
	   response.Write("���е�����")
	 end if
	 if yearN<>"����" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    sql1="select * from borrowlist where stage>1 and stage<8 and date>=#"&t1&"# and date<#"&t2&"# and finance="&"'"& oabusyusername&"'"
		response.Write(deptN&yearN&"�������")
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    sql1="select * from borrowlist where stage>1 and stage<8 and date>=#"&t1&"# and date<#"&t2&"# and finance="&"'"& oabusyusername&"'"
		response.Write(deptN&yearN&"��"&monthN&"��"&"������")
	   end if
	 end if
  end if
  
  if deptN<>"���в���"  and deptN<>"" then 
     if yearN="����" then
	   sql1="select * from borrowlist where stage>1 and stage<8 and dept="&"'"&deptN&"' and finance="&"'"&oabusyusername&"'"
	   response.Write(deptN&yearN&"�������")
	 end if
	 if yearN<>"����" and yearN<>"" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    sql1="select * from borrowlist where stage>1 and stage<8 and date>=#"&t1&"# and date<#"&t2&"# and dept="&"'"&deptN&"' and finance="&"'"&oabusyusername&"'"
		response.Write(deptN&yearN&"�������")
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    sql1="select * from borrowlist where stage>1 and stage<8 and date>=#"&t1&"# and date<#"&t2&"# and dept="&"'"&deptN&"' and finance="&"'"&oabusyusername&"'"
		response.Write(deptN&yearN&"��"&monthN&"��"&"������")
	   end if
	 end if
  end if
  
  if deptN="" then
     if yearN="" then
	   if monthN="" then
	   sql1="select * from borrowlist where stage>1 and stage<8 and finance="&"'"&oabusyusername&"'"
	   end if
	 end if
  end if
 %>	   
</font>	
<%
rsborr.open sql1,cnborr,1,1

totalPut=rsborr.recordcount
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
    showpage totalput,MaxPerPage,"seeAllList.asp"
	showContent
	showpage totalput,MaxPerPage,"seeAllList.asp"
 else 
    if(currentpage-1)*MaxPerPage<totalPut then
	 rsborr.move (currentpage-1)*MaxPerPage
	 dim bookmark
	 bookmark=rsborr.bookmark
	 showpage totalput,MaxPerPage,"seeAllList.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeAllList.asp"
	else
	 currentpage=1
	 showpage totalput,MaxPerPage,"seeAllList.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeAllList.asp"
	end if
	rsborr.close
end if
set rsborr=nothing
cnborr.close
set cnborr=nothing
%>
</div>

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
    moneySum=0
	billSum=0
	sub showContent
	dim i
	i=0
	
	%>

<div align=center>  <form name="form1" ><table border=1  cellpadding=0 cellspacing=0 >
<tr  bgcolor="D7E8F8" bordercolor="#339999"><td ><font color="#0d79b3">������</font></td><td><font color="#0d79b3">����</font></td><td ><font color="#0d79b3">���Ÿ�����</font></td><td align=center><font color="#0d79b3">�������</font></td><td align=center><font color="#0d79b3">��������</font></td><td align=center><font color="#0d79b3">���(Ԫ)</font></td><td><font color="#0d79b3">״̬</font></td><td align=center>&nbsp;&nbsp;</td></tr>
<%
do while not rsborr.eof  
 %>

  <input type="hidden"  name="id" value="<%=rsborr("id")%>"/>
  <tr><td align=center><%=rsborr("borrower")%></td>
  <td align=center><%=rsborr("dept")%></td>
  <% 
	
	'set conn=server.CreateObject("ADODB.Connection")
    'DBPath=server.mappath("../db/lmtof.mdb")
    'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath
	set conn=opendb("lmtof","conn","sql")
    set rs=server.CreateObject("adodb.recordset")
    sql="select * from userinf where userdept='"&rsborr("dept")&"' and userlevel='���ž���'"
    rs.open sql,conn,1,1
%>
	<td align=center>
	<%=rs("username")%>
	
	</td>
	<td align=center><%response.Write(formatdatetime(rsborr("borrowTime"), 1))%></td>
	<td align=center><%response.Write(formatdatetime(rsborr("repayTime"), 1))%></td>
	<td align=center><%=rsborr("money")%><%moneySum=moneySum+rsborr("money")%></td>
	<% 
	'set conn2=server.CreateObject("ADODB.Connection")
    'DBPath2=server.mappath("finance.mdb")
    'conn2.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath2
	set conn2=opendb("finance","conn","sql")
    set rs2=server.CreateObject("adodb.recordset")
    sql2="select * from stage where stage="&rsborr("stage")
    rs2.open sql2,conn2,1,1
    %>
	<td align=center><%=rs2("txt")%></td>
	<td align=center>
  <a href=viewBorr.asp?id=<%response.Write(rsborr("id"))%>>�鿴</a>
  </td></tr>
  
<%
i=i+1
if i>=MaxPerPage then exit Do
rsborr.movenext
loop
%>
<tr><td colspan="5">�ϼ�<td><%=moneySum%>Ԫ</td><td></td><td></td></tr>
</table></from></div>
<% end sub %>
<%
function getsql(deptN,yearN,monthN)
  if deptN="���в���" then 
     if yearN="����" then
	   response.Write("select * from borrowlist where stage>1 and stage<6")
	 end if
	 if yearN<>"����" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    response.Write("select * from borrowlist where stage>1 and stage<6 and date>"&t1&"and date<"&t2)
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    response.Write("select * from borrowlist where stage>1 and stage<6 and date>"&t1&"and date<"&t2)
	   end if
	 end if
  end if
  
  if deptN<>"���в���" then 
     if yearN="����" then
	   response.Write("select * from borrowlist where stage>1 and stage<6 and dept="&deptN)
	 end if
	 if yearN<>"����" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    response.Write("select * from borrowlist where stage>1 and stage<6 and date>"&t1&"and date<"&t2&"and dept="&deptN)
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    response.Write("select * from borrowlist where stage>1 and stage<6 and date>"&t1&"and date<"&t2&"and dept="&deptN)
	   end if
	 end if
  end if
 end function
%>
</form>
</font>
</body>
</html>
