<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>�鿴������</title>
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
'if request("notec")<>"" and oabusyusername="������" then
'    response.Cookies("notec")=request("notec")
'	response.Cookies("notec").Expires=FormatDateTime(d)
'    response.Redirect("getnotechen.asp")
'end if
Id=request("id")
'response.Write(Id)
%>
<script language="javascript">
 function check()
 {
	return false;
 }
</script>
<script language="javascript">
 function asd()
 {
 var t=document.form.money.value;

 /*window.alert(numtochinese(t));*/
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
<div align="center" >
<% if oabusyusername<>"������" then%>
<form name="form" action="newPrintReim.asp" method="post">
<%end if%>
<% if oabusyusername="������" then%>
<form name="form" action="getnotechen.asp" method="get">
<%end if%>
<%
'set conn=server.CreateObject("adodb.connection")
'path=server.MapPath("finance.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable where id="&Id
rs.open sql,conn,1,1
'response.Write(rs("stage"))
%>
<table  width="80%" border="1" cellpadding="0"  cellspacing="0"bordercolor="#999999">
<tr>
<td>������</td><td><%=rs("claimant")%></td><td>����</td><td><%=getdept(rs("claimantdeptcode"))%></td><td>��Ŀ������</td><td><%=getprojectprin(rs("projectId"))%></td>
</tr>
<tr>
<td colspan="2">��������</td><td colspan="4"><%=rs("reimburseDate")%></td>
</tr>
<tr>
<td >��������</td><td >��Ŀ���</td><td >ժҪ</td><td >��ע</td><td >��������</td><td >���</td>
</tr>
<tr><td ><%=rs("occurDate")%></td><td ><%=rs("projectId")%></td><td ><%=rs("summary")%></td><td ><%=rs("remark")%></td><td ><%=rs("billCount")%></td><td ><%=rs("money")%></td></tr>
<tr>
<td>��Сд��</td><td colspan="2"><%=rs("money")%></td><td>����д��</td><td colspan="2">&nbsp;<% if oabusyusername<>"������" then%><input type="text" name="Bmoney"><%end if%></td>
</tr>
<tr>
<td>����</td><td colspan="5">
<%
if rs("notes")<>"" then
notenew=replace(rs("notes"),"####","<br>")
response.Write(notenew)
else 
response.Write("&nbsp;&nbsp;")
end if
%>
</td>
</tr>
<% if oabusyusername="������" and rs("stage")=4 then%>
<tr>
<td>�������</td><td colspan="5">&nbsp;<textarea name="notec" cols="90" rows="4"></textarea></td>
</tr>
<tr>
<td colspan="6"><input type="hidden" name="id" value="<%response.Write(Id)%>" /><input type="submit" value="ȷ��" onclick="check();"/></td>
</tr>
<%end if%>
</table>
<% if oabusyusername<>"������" then%>
<input type="hidden" name="money" value="<%=rs("money")%>" />
<input type="hidden" name="id" value="<%response.Write(Id)%>" />
<%if oabusyuserlevelCode="CN" or oabusyuserlevelCode="CW" then%>
<input type="submit" value="��ӡ" />
<%end if%>
</form>
<form name="form1">
<input type="button" value="��ʾ��д��Ǯ"  onclick="asd()">
</form>
<hr>
<font color="#FF0000">*�ȵ������ʾ��д��Ǯ�����ɽ��Ĵ�д���ٵ������ӡ��</font>
</div>
</font>
<%end if%>
</body>
</html>
