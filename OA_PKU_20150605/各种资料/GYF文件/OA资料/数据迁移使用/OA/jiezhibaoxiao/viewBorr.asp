<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>�ޱ����ĵ�</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
Id=request("id")
'response.Write(Id)
%>

<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from borrowlist where id=90"
rs.open sql,conn,1,1
%>
<script language="javascript">
 function asd()
 {
 var t=document.form.money.value;

/* window.alert(numtochinese(t));*/
  document.form.Bmoney.value=numtochinese(t);
 }
</script>
<script language="javascript">
 function numtochinese(Num)
 {
    for(i=Num.length-1;i>=0;i--)
    {
    Num = Num.replace(",","")//�滻tomoney()�еġ�,��
    Num = Num.replace(" ","")//�滻tomoney()�еĿո�
    }
 
    Num = Num.replace("��","")//�滻�����ܳ��ֵģ��ַ�
    if(isNaN(Num)) 
    {
   //��֤������ַ��Ƿ�Ϊ����
   alert("����Сд����Ƿ���ȷ");
   return;
    }
    //---�ַ�������ϣ���ʼת����ת������ǰ�������ֱַ�ת��---//
    part = String(Num).split(".");
    newchar = ""; 
    //С����ǰ����ת��
    for(i=part[0].length-1;i>=0;i--)
    {
     if(part[0].length > 10){ alert("λ�������޷�����");return "";}//����������ʰ�ڵ�λ����ʾ
   tmpnewchar = ""
   perchar = part[0].charAt(i);
   switch(perchar){
   case "0": tmpnewchar="��" + tmpnewchar ;break;
   case "1": tmpnewchar="Ҽ" + tmpnewchar ;break;
   case "2": tmpnewchar="��" + tmpnewchar ;break;
   case "3": tmpnewchar="��" + tmpnewchar ;break;
   case "4": tmpnewchar="��" + tmpnewchar ;break;
   case "5": tmpnewchar="��" + tmpnewchar ;break;
   case "6": tmpnewchar="½" + tmpnewchar ;break;
   case "7": tmpnewchar="��" + tmpnewchar ;break;
   case "8": tmpnewchar="��" + tmpnewchar ;break;
   case "9": tmpnewchar="��" + tmpnewchar ;break;
     }
     switch(part[0].length-i-1)
  {
   case 0: tmpnewchar = tmpnewchar +"Ԫ" ;break;
   case 1: if(perchar!=0)tmpnewchar= tmpnewchar +"ʰ" ;break;
   case 2: if(perchar!=0)tmpnewchar= tmpnewchar +"��" ;break;
   case 3: if(perchar!=0)tmpnewchar= tmpnewchar +"Ǫ" ;break; 
   case 4: tmpnewchar= tmpnewchar +"��" ;break;
   case 5: if(perchar!=0)tmpnewchar= tmpnewchar +"ʰ" ;break;
   case 6: if(perchar!=0)tmpnewchar= tmpnewchar +"��" ;break;
   case 7: if(perchar!=0)tmpnewchar= tmpnewchar +"Ǫ" ;break;
   case 8: tmpnewchar= tmpnewchar +"��" ;break;
   case 9: tmpnewchar= tmpnewchar +"ʰ" ;break;
     }
     newchar = tmpnewchar + newchar;
    }
    //С����֮�����ת��
    if(Num.indexOf(".")!=-1)
    {
     if(part[1].length > 2)
     {
    alert("С����֮��ֻ�ܱ�����λ,ϵͳ���Զ��ض�");
    part[1] = part[1].substr(0,2)
   }
     for(i=0;i<part[1].length;i++)
     {
    tmpnewchar = ""
    perchar = part[1].charAt(i)
    switch(perchar){
    case "0": tmpnewchar="��" + tmpnewchar ;break;
    case "1": tmpnewchar="Ҽ" + tmpnewchar ;break;
    case "2": tmpnewchar="��" + tmpnewchar ;break;
    case "3": tmpnewchar="��" + tmpnewchar ;break;
    case "4": tmpnewchar="��" + tmpnewchar ;break;
    case "5": tmpnewchar="��" + tmpnewchar ;break;
    case "6": tmpnewchar="½" + tmpnewchar ;break;
    case "7": tmpnewchar="��" + tmpnewchar ;break;
    case "8": tmpnewchar="��" + tmpnewchar ;break;
    case "9": tmpnewchar="��" + tmpnewchar ;break;
   }
   if(i==0)tmpnewchar =tmpnewchar + "��";
   if(i==1)tmpnewchar = tmpnewchar + "��";
   newchar = newchar + tmpnewchar;
     }
    }
    //�滻�������ú���
    while(newchar.search("����") != -1)
      newchar = newchar.replace("����", "��");
    newchar = newchar.replace("����", "��");
    newchar = newchar.replace("����", "��");
    newchar = newchar.replace("����", "��"); 
    newchar = newchar.replace("��Ԫ", "Ԫ");
    newchar = newchar.replace("���", "");
    newchar = newchar.replace("���", "");
 
    if (newchar.charAt(newchar.length-1) == "Ԫ" || newchar.charAt(newchar.length-1) == "��")
     newchar = newchar+"��"
    return newchar;
	
	
	
 }

</script>
</head>

<body>
<font size="-1">
<div align="center">
<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")

set rs=server.CreateObject("adodb.recordset")
sql="select * from borrowlist where id="&Id
rs.open sql,conn,1,1

'set cn=server.CreateObject("adodb.connection")
'ph=server.MapPath("../db/lmtof.mdb")
'cn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & ph
set cn=opendb("lmtof","conn","sql")
set r=server.CreateObject("adodb.recordset")
'if rs("dept")<>"�ۺϹ���" then
sl="select * from userinf where userdept ="&"'"& rs("dept")&"'"&" and (levelCode= 'BMJL' or levelCode1= 'BMJL')"
'else
'sl="select * from userinf where userdept ="&"'"& rs("dept")&"'"
'end if
r.open sl,cn,1,1
%>
<form  name="form"action="newPrintBorr.asp" method="post">
<table width="80%" height="324" border="1" cellpadding="1" cellspacing="0" bordercolor="#999999">
<tr>
<td>���</td><td><%=rs("id")%></td><td>������</td><td><%=rs("borrower")%></td><td>����</td><td><%=rs("dept")%></td><td>���Ÿ�����</td>
<td>

<%=r("username")%>

</td>
</tr>
<tr>
<td>���</td><td><%=rs("money")%></td><td colspan="2">�������</td><td><%=rs("borrowTime")%></td><td colspan="2">��������</td>
<td><%=rs("repayTime")%></td></tr>
<tr>
<td>��������</td><td colspan="5"><%=rs("date")%></td><td>����д��</td><td><input type="text" name="Bmoney" ></td>
</tr>
<tr>
<td>����</td><td colspan="7"><%=rs("content")&"&nbsp;&nbsp;"%></td>
</tr>
<tr>
<td>��������</td><td colspan="7"><%=rs("deptNotes")&"&nbsp;&nbsp;"%></td>
</tr>
<tr>
<td>��������</td><td colspan="7"><%=rs("financialNotes")&"&nbsp;&nbsp;"%></td>
</tr>
<tr>
<td>��������������</td><td colspan="7"><%=rs("gManagerNotes")&"&nbsp;&nbsp;"%></td>
</tr>
</table>
<input type="hidden" name="money" value="<%=rs("money")%>" />
<input type="hidden" name="id" value="<%=Id%>" />
<%if oabusyuserlevelCode="CN" or oabusyuserlevelCode="CW" then%>
<input type="submit" value="��ӡ">
<%end if%>
</form>
<form name="form1">
<input type="button" value="��ʾ��д��Ǯ"  onclick="asd()">
</form>
<hr>
<font color="#FF0000">*�ȵ������ʾ��д��Ǯ�����ɽ��Ĵ�д���ٵ������ӡ��</font>
</div>
</font>
</body>
</html>
