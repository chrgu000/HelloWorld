<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>查看报销单</title>
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
'if request("notec")<>"" and oabusyusername="陈秀万" then
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
<div align="center" >
<% if oabusyusername<>"陈秀万" then%>
<form name="form" action="newPrintReim.asp" method="post">
<%end if%>
<% if oabusyusername="陈秀万" then%>
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
<td>报销人</td><td><%=rs("claimant")%></td><td>部门</td><td><%=getdept(rs("claimantdeptcode"))%></td><td>项目负责人</td><td><%=getprojectprin(rs("projectId"))%></td>
</tr>
<tr>
<td colspan="2">报销日期</td><td colspan="4"><%=rs("reimburseDate")%></td>
</tr>
<tr>
<td >发生日期</td><td >项目编号</td><td >摘要</td><td >备注</td><td >单据张数</td><td >金额</td>
</tr>
<tr><td ><%=rs("occurDate")%></td><td ><%=rs("projectId")%></td><td ><%=rs("summary")%></td><td ><%=rs("remark")%></td><td ><%=rs("billCount")%></td><td ><%=rs("money")%></td></tr>
<tr>
<td>金额（小写）</td><td colspan="2"><%=rs("money")%></td><td>金额（大写）</td><td colspan="2">&nbsp;<% if oabusyusername<>"陈秀万" then%><input type="text" name="Bmoney"><%end if%></td>
</tr>
<tr>
<td>审批</td><td colspan="5">
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
<% if oabusyusername="陈秀万" and rs("stage")=4 then%>
<tr>
<td>顾问意见</td><td colspan="5">&nbsp;<textarea name="notec" cols="90" rows="4"></textarea></td>
</tr>
<tr>
<td colspan="6"><input type="hidden" name="id" value="<%response.Write(Id)%>" /><input type="submit" value="确认" onclick="check();"/></td>
</tr>
<%end if%>
</table>
<% if oabusyusername<>"陈秀万" then%>
<input type="hidden" name="money" value="<%=rs("money")%>" />
<input type="hidden" name="id" value="<%response.Write(Id)%>" />
<%if oabusyuserlevelCode="CN" or oabusyuserlevelCode="CW" then%>
<input type="submit" value="打印" />
<%end if%>
</form>
<form name="form1">
<input type="button" value="显示大写金钱"  onclick="asd()">
</form>
<hr>
<font color="#FF0000">*先点击“显示大写金钱”生成金额的大写后，再点击“打印”</font>
</div>
</font>
<%end if%>
</body>
</html>
