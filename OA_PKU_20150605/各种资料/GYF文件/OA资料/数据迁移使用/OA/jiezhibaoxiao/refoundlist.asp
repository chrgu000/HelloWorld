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
	
	if(yearN="") then yearN="����" end if
    if(monthN="") then monthN="����" end if
function selected(req,reqvalue)
if req=reqvalue then
selected=req & " selected"
else
selected=req
end if
end function

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�鿴�����¼</title>



<%

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
                  <td align="left"class="style7"><font size="-1">�����¼</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<form  name="form" action="refoundlist.asp" method="post">
����
<select name="year1" size="1">
<option value=<%=selected("����",yearN)%>>����</option>
<%for i=2009 to 2019%>
<option value=<%=selected(cstr(i),yearN) %>> <%=i%> </option>
<%next%>
</select>
��
<select name="month1" size="1">
<option value=<%=selected("����",monthN)%>>����</option>
<%for j=1 to 12%>
<option value=<%=selected(cstr(j),monthN)%>><%=j%></option>
<%next%>
</select>
��
<input type="submit"  value="��ѯ" />
</form>

<%
'����ÿҳ��ʾ������
const MaxPerPage=50
if not isempty(request("page")) then
currentpage=cint(request("page"))
else
currentpage=1
end if

'�����ݿ�
'set cnborr=server.CreateObject("ADODB.Connection")
'DBPath1=server.mappath("finance.mdb")
'cnborr.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set cnborr=opendb("finance" ,"conn","sql")
set rsborr=server.CreateObject("adodb.recordset")
'sql1="select * from borrowlist where stage > 1 and  stage < 6 "
'getsql dept1,year1,month1 
	 
      if yearN="����" then '���еĻ����¼
		sql1="select * from refoundlist where borrower="&"'"&oabusyusername&"'"
	  else
	    if monthN="����" then 'ĳ�����еĻ����¼
	    	t1=DateSerial(yearN,1,1)
			t2=DateSerial(yearN+1,1,1)
	    else
	    	t1=DateSerial(yearN,monthN,1)
			t2=DateSerial(yearN,monthN+1,1)
		end if
		sql1="select * from refoundlist where borrower='" &oabusyusername& "' and (fretime between '"&t1&"' and '"&t2&"' or sretime between '"&t1&"' and '"&t2&"' or tretime between '"&t1&"' and '"&t2&"')"
	end if
  if currentpage>1 then
  sql1=request.Cookies("sqlt")
  end if
  'response.Write(sql1)
  response.Write("<br>"&stra)
  rsborr.open sql1,cnborr,1,1
 %>	

<!------------------------------------------------------------------------------------------------------------------------------------------>
<%


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
	
	if currentpage<2 then
	   response.Write "<font color='#000080'>��ҳ  ��һҳ</font>&nbsp;"
	else
	   response.Cookies("sqlt")=sql
	   response.Cookies("stra")=stra
	   response.Write "<a href="&filename&"?page=1>��ҳ</a>&nbsp;"
	   response.Write "<a href="&filename&"?page="&currentpage-1&">��һҳ</a>&nbsp;"
	end if
	
	if n-currentPage<1 then
	   response.Write "<font color='#000080'>��һҳ βҳ</font>"
	else 
	   response.Cookies("sqlt")=sql1
	   response.Cookies("stra")=stra
	   response.Write ("<a href="&filename&"?page="&(currentpage+1)&">")
	   response.Write ("��һҳ</a>&nbsp;<a href="&filename&"?page="&n&">βҳ</a>")
	 end if
	 
	 response.Write "<font color='#000080'>&nbsp;ҳ�Σ�</font><strong><font color=red>"&currentPage&"</font><font color='#000080'>/"&n&"</strong>ҳ</strong></font>"
	 response.Write "<font color='#000080'>&nbsp;��<b>"&totalnumber&"</b>����¼<b>&nbsp;"&maxperpage&"</b>����¼/ҳ</font>"
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
<tr bgcolor="D7E8F8" bordercolor="#339999"><td rowspan=2><font size="-1">������</font></td><td rowspan=2><font size="-1">����</font></td><td colspan=2><font size="-1">�����¼</font></td><td align=center rowspan=2><font size="-1">���</font></td></tr>
<tr bgcolor="D7E8F8" bordercolor="#339999"><td><font size="-1">ʱ��</td></td><td><font size="-1">�����</font></td></tr>

<%
do while not rsborr.eof  
 %>
<%
	  n=0
	  if(rsborr("fretime")>0) then
	    n=n+1
	  end if
	  if(rsborr("sretime")>0) then
	    n=n+1
	  end if
	  if(rsborr("tretime")>0) then
	    n=n+1
	  end if
	  unrefound=cdbl(rsborr("money"))-cdbl(rsborr("frefound"))-cdbl(rsborr("srefound"))-cdbl(rsborr("trefound"))
	%>
  <input type="hidden"  name="id" value="<%=rsborr("id")%>"/>
  <tr><td align=center rowspan=<%=n%>><%=rsborr("borrower")%></td>
  <td align=center rowspan=<%=n%>><%=rsborr("content")%></td>
  	<td align=center><%=rsborr("fretime")%></td>
	<td align=center><%=rsborr("frefound")%></td>
	<td align=center rowspan=<%=n%>><%=unrefound%></td>
  </tr>
  <%
     if(rsborr("sretime")>0) then
	 	response.Write("<tr>")
	 	response.Write("<td align=center>" & rsborr("sretime") & "</td>")
	    response.Write("<td align=center>" & rsborr("srefound") & "</td>")
		response.Write("</tr>")
	 end if
	 if(rsborr("tretime")>0) then
	 	response.Write("<tr>")
	 	response.Write("<td align=center>" & rsborr("tretime") & "</td>")
	    response.Write("<td align=center>" & rsborr("trefound") & "</td>")		
	    response.Write("</tr>")
	 end if
  %>
  
<%
i=i+1
if i>=MaxPerPage then exit Do
rsborr.movenext
loop
%>
</table>
<% end sub %>
</form>
</div>

</font>
</body>
</html>
