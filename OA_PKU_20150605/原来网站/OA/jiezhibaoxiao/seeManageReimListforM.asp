<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
<form  name="form" action="seeManageReimListforM.asp" method="post">
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
const MaxPerPage=20
if not isempty(request("page")) then
currentpage=cint(request("page"))
else
currentpage=1
end if

'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")


     if yearN="����" then
	   sql1="select * from ReimMilti where Stage>1"
	   response.Write("���е�����")
	 end if
	 if yearN<>"����" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    sql1="select * from ReimMilti where Stage>1  and ReimDate>=#"&t1&"# and ReimDate<#"&t2&"# "
		response.Write(deptN&yearN&"�������")
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    sql1="select * from ReimMilti where Stage>1  and ReimDate>=#"&t1&"# and ReimDate<#"&t2&"# "
		response.Write(deptN&yearN&"��"&monthN&"��"&"������")
	   end if
	 end if


  
  if deptN="" then
     if yearN="" then
	   if monthN="" then
	   sql1="select * from ReimMilti where Stage>1 "
	   end if
	 end if
  end if


'sql="select * from reimbursementlist where stage > 1 and  stage < 6"
rs.open sql1,conn,1,1
%>
</font>
</div>
<%
'set connItem=server.CreateObject("adodb.connection")
'pathItem=server.MapPath("finance.mdb")
'connItem.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathItem
set connItem=opendb("finance","conn","sql")
set rsItem=server.CreateObject("adodb.recordset")
sqlItem="select * from ReimMilti " 
rsItem.open sqlItem,connItem,1,1

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
    showpage totalput,MaxPerPage,"seeAllReimListforM.asp"
	showContent
	showpage totalput,MaxPerPage,"seeAllReimListforM.asp"
 else 
    if(currentpage-1)*MaxPerPage<totalPut then
	 rs.move (currentpage-1)*MaxPerPage
	 dim bookmark
	 bookmark=rs.bookmark
	 showpage totalput,MaxPerPage,"seeAllReimListforM.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeAllReimListforM.asp"
	else
	 currentpage=1
	 showpage totalput,MaxPerPage,"seeAllReimListforM.asp"
	 showContent
	 showpage totalput,MaxPerPage,"seeAllReimListforM.asp"
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
<tr  bgcolor="D7E8F8" bordercolor="#339999"><td><font color="#0d79b3">����</font></td><td><font color="#0d79b3">��������</font></td><td><font color="#0d79b3">�����ܽ��(Ԫ)</font></td><td><font color="#0d79b3">��������</font></td><td><font color="#0d79b3">��������</font></td><td>&nbsp;</td></tr>
<%do while not rs.eof %>
<tr>
<td>
<%if rs("ProductDepartM")>0 then 
   if rs("ProductDepartAg")="No" then
 response.Write("<font color=red>��Ʒ����</font>"&rs("ProductDepartM")&"Ԫ&nbsp;")
   end if
   if rs("ProductDepartAg")<>"No" then
 response.Write("��Ʒ����"&rs("ProductDepartM")&"Ԫ&nbsp;")
   end if
 end if %>
 <%if rs("EngineeringDepartM")>0 then 
   if rs("EngineeringDepartAg")="No" then
 response.Write("<font color=red>���̲���</font>"&rs("EngineeringDepartM")&"Ԫ&nbsp;")
   end if
   if rs("ProductDepartAg")<>"No" then
 response.Write("���̲���"&rs("EngineeringDepartM")&"Ԫ&nbsp;")
   end if
 end if %>
 <%if rs("EduTrainDepartM")>0 then 
   if rs("EduTrainDepartAg")="No" then
 response.Write("<font color=red>������ѵ����</font>"&rs("EduTrainDepartM")&"Ԫ&nbsp;")
   end if
   if rs("EduTrainDepartAg")<>"No" then
 response.Write("������ѵ����"&rs("EduTrainDepartM")&"Ԫ&nbsp;")
   end if
 end if %>
 <%if rs("MarketDepartM")>0 then 
   if rs("MarketDepartAg")="No" then
 response.Write("<font color=red>ҵ��չ����</font>"&rs("MarketDepartM")&"Ԫ&nbsp;")
   end if
   if rs("MarketDepartAg")<>"No" then
 response.Write("ҵ��չ����"&rs("MarketDepartM")&"Ԫ&nbsp;")
   end if
 end if %>
<%if rs("GeneManageDepartM")>0 then 
   if rs("GeneManageDepartAg")="No" then
 response.Write("<font color=red>�ۺϹ�����</font>"&rs("GeneManageDepartM")&"Ԫ&nbsp;")
   end if
   if rs("GeneManageDepartAg")<>"No" then
 response.Write("�ۺϹ�����"&rs("GeneManageDepartM")&"Ԫ&nbsp;")
   end if
 end if %>
 <%if rs("sichuanJDM")>0 then 
   if rs("sichuanJDAg")="No" then
 response.Write("<font color=red>�Ĵ����أ�</font>"&rs("sichuanJDM")&"Ԫ&nbsp;")
   end if
   if rs("sichuanJDAg")<>"No" then
 response.Write("�Ĵ����أ�"&rs("sichuanJDM")&"Ԫ&nbsp;")
   end if
 end if %>
 <%if rs("YanFDepartM")>0 then 
   if rs("YanFDepartAg")="No" then
 response.Write("<font color=red>�з�����</font>"&rs("YanFDepartM")&"Ԫ&nbsp;")
   end if
   if rs("YanFDepartAg")<>"No" then
 response.Write("�з�����"&rs("YanFDepartM")&"Ԫ&nbsp;")
   end if
 end if %>
 <%if rs("SDepartM")>0 then 
   if rs("SDepartAg")="No" then
 response.Write("<font color=red>ʱ�ղ���</font>"&rs("SDepartM")&"Ԫ&nbsp;")
   end if
   if rs("SDepartAg")<>"No" then
 response.Write("ʱ�ղ���"&rs("SDepartM")&"Ԫ&nbsp;")
   end if
 end if %>
 
 
</td>
<td><%response.Write(formatdatetime(rs("ReimDate"), 1))%></td>
<td><%=rs("MoneySum")%><%moneySumCount=moneySumCount+rs("moneySum")%></td>
<td><%=rs("BillCount")%><%billSumCount=billSumCount+Cint(rs("BillCount"))%></td>
<td>
<%
'set connTS=server.CreateObject("adodb.connection")
'pathTS=server.MapPath("finance.mdb")
'connTS.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & pathTS
set connTS=opendb("finance","conn","sql")
set rsTS=server.CreateObject("adodb.recordset")
sqlTS="select * from stage where stage="&rs("stage")
rsTS.open sqlTS,connTS,1,1
%>
<%=rsTS("txt")%>
</td><td><a href=ViewReimforM.asp?id=<%=rs("id")%>>�鿴</a></td></tr>
<%
i=i+1
if i>=MaxPerPage then exit Do
 rs.movenext 
loop %>
<tr><td colspan="3">�ϼ�</td><td><%=moneySumCount%>Ԫ</td><td><%=billSumCount%>��</td><td></td><td></td></tr>
</table>
</div>
<% end sub %>
<br>
</font>
</body>
</html>
