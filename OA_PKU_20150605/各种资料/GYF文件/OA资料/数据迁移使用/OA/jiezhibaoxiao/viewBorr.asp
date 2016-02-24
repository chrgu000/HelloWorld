<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
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
    Num = Num.replace(",","")//替换tomoney()中的“,”
    Num = Num.replace(" ","")//替换tomoney()中的空格
    }
 
    Num = Num.replace("￥","")//替换掉可能出现的￥字符
    if(isNaN(Num)) 
    {
   //验证输入的字符是否为数字
   alert("请检查小写金额是否正确");
   return;
    }
    //---字符处理完毕，开始转换，转换采用前后两部分分别转换---//
    part = String(Num).split(".");
    newchar = ""; 
    //小数点前进行转化
    for(i=part[0].length-1;i>=0;i--)
    {
     if(part[0].length > 10){ alert("位数过大，无法计算");return "";}//若数量超过拾亿单位，提示
   tmpnewchar = ""
   perchar = part[0].charAt(i);
   switch(perchar){
   case "0": tmpnewchar="零" + tmpnewchar ;break;
   case "1": tmpnewchar="壹" + tmpnewchar ;break;
   case "2": tmpnewchar="贰" + tmpnewchar ;break;
   case "3": tmpnewchar="叁" + tmpnewchar ;break;
   case "4": tmpnewchar="肆" + tmpnewchar ;break;
   case "5": tmpnewchar="伍" + tmpnewchar ;break;
   case "6": tmpnewchar="陆" + tmpnewchar ;break;
   case "7": tmpnewchar="柒" + tmpnewchar ;break;
   case "8": tmpnewchar="捌" + tmpnewchar ;break;
   case "9": tmpnewchar="玖" + tmpnewchar ;break;
     }
     switch(part[0].length-i-1)
  {
   case 0: tmpnewchar = tmpnewchar +"元" ;break;
   case 1: if(perchar!=0)tmpnewchar= tmpnewchar +"拾" ;break;
   case 2: if(perchar!=0)tmpnewchar= tmpnewchar +"佰" ;break;
   case 3: if(perchar!=0)tmpnewchar= tmpnewchar +"仟" ;break; 
   case 4: tmpnewchar= tmpnewchar +"万" ;break;
   case 5: if(perchar!=0)tmpnewchar= tmpnewchar +"拾" ;break;
   case 6: if(perchar!=0)tmpnewchar= tmpnewchar +"佰" ;break;
   case 7: if(perchar!=0)tmpnewchar= tmpnewchar +"仟" ;break;
   case 8: tmpnewchar= tmpnewchar +"亿" ;break;
   case 9: tmpnewchar= tmpnewchar +"拾" ;break;
     }
     newchar = tmpnewchar + newchar;
    }
    //小数点之后进行转化
    if(Num.indexOf(".")!=-1)
    {
     if(part[1].length > 2)
     {
    alert("小数点之后只能保留两位,系统将自动截段");
    part[1] = part[1].substr(0,2)
   }
     for(i=0;i<part[1].length;i++)
     {
    tmpnewchar = ""
    perchar = part[1].charAt(i)
    switch(perchar){
    case "0": tmpnewchar="零" + tmpnewchar ;break;
    case "1": tmpnewchar="壹" + tmpnewchar ;break;
    case "2": tmpnewchar="贰" + tmpnewchar ;break;
    case "3": tmpnewchar="叁" + tmpnewchar ;break;
    case "4": tmpnewchar="肆" + tmpnewchar ;break;
    case "5": tmpnewchar="伍" + tmpnewchar ;break;
    case "6": tmpnewchar="陆" + tmpnewchar ;break;
    case "7": tmpnewchar="柒" + tmpnewchar ;break;
    case "8": tmpnewchar="捌" + tmpnewchar ;break;
    case "9": tmpnewchar="玖" + tmpnewchar ;break;
   }
   if(i==0)tmpnewchar =tmpnewchar + "角";
   if(i==1)tmpnewchar = tmpnewchar + "分";
   newchar = newchar + tmpnewchar;
     }
    }
    //替换所有无用汉字
    while(newchar.search("零零") != -1)
      newchar = newchar.replace("零零", "零");
    newchar = newchar.replace("零亿", "亿");
    newchar = newchar.replace("亿万", "亿");
    newchar = newchar.replace("零万", "万"); 
    newchar = newchar.replace("零元", "元");
    newchar = newchar.replace("零角", "");
    newchar = newchar.replace("零分", "");
 
    if (newchar.charAt(newchar.length-1) == "元" || newchar.charAt(newchar.length-1) == "角")
     newchar = newchar+"整"
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
'if rs("dept")<>"综合管理部" then
sl="select * from userinf where userdept ="&"'"& rs("dept")&"'"&" and (levelCode= 'BMJL' or levelCode1= 'BMJL')"
'else
'sl="select * from userinf where userdept ="&"'"& rs("dept")&"'"
'end if
r.open sl,cn,1,1
%>
<form  name="form"action="newPrintBorr.asp" method="post">
<table width="80%" height="324" border="1" cellpadding="1" cellspacing="0" bordercolor="#999999">
<tr>
<td>编号</td><td><%=rs("id")%></td><td>申请人</td><td><%=rs("borrower")%></td><td>部门</td><td><%=rs("dept")%></td><td>部门负责人</td>
<td>

<%=r("username")%>

</td>
</tr>
<tr>
<td>金额</td><td><%=rs("money")%></td><td colspan="2">借款日期</td><td><%=rs("borrowTime")%></td><td colspan="2">还款日期</td>
<td><%=rs("repayTime")%></td></tr>
<tr>
<td>申请日期</td><td colspan="5"><%=rs("date")%></td><td>金额（大写）</td><td><input type="text" name="Bmoney" ></td>
</tr>
<tr>
<td>事由</td><td colspan="7"><%=rs("content")&"&nbsp;&nbsp;"%></td>
</tr>
<tr>
<td>部门审批</td><td colspan="7"><%=rs("deptNotes")&"&nbsp;&nbsp;"%></td>
</tr>
<tr>
<td>财务审批</td><td colspan="7"><%=rs("financialNotes")&"&nbsp;&nbsp;"%></td>
</tr>
<tr>
<td>机构负责人审批</td><td colspan="7"><%=rs("gManagerNotes")&"&nbsp;&nbsp;"%></td>
</tr>
</table>
<input type="hidden" name="money" value="<%=rs("money")%>" />
<input type="hidden" name="id" value="<%=Id%>" />
<%if oabusyuserlevelCode="CN" or oabusyuserlevelCode="CW" then%>
<input type="submit" value="打印">
<%end if%>
</form>
<form name="form1">
<input type="button" value="显示大写金钱"  onclick="asd()">
</form>
<hr>
<font color="#FF0000">*先点击“显示大写金钱”生成金额的大写后，再点击“打印”</font>
</div>
</font>
</body>
</html>
