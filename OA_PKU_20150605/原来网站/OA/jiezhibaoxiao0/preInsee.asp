<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="opendb.asp"-->
<!--#include file="../asp/sqlstr.asp"-->

<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	end if
%>
<%
  if request.Form("borrowdateM")="" or request.Form("borrowdateD")="" or request.Form("borrowdateY")="" then
  	response.write("<script language=""javascript"">")
	response.write("alert(""借款日期填写错误，请重新填写"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
  end if
    if request.Form("backdateM")="" or request.Form("backdateD")="" or request.Form("backdateY")="" then
  	response.write("<script language=""javascript"">")
	response.write("alert(""还款日期填写错误，请重新填写"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
  end if
    if cint(request.Form("backdateM"))>cint(12) or cint(request.Form("backdateD"))>cint(31) or cint(request.Form("backdateY"))<cint(1999) or cint(request.Form("backdateM"))=cint(0) or cint(request.Form("backdateY"))=cint(0) or cint(request.Form("backdateD"))=cint(0) then
  	response.write("<script language=""javascript"">")
	response.write("alert(""还款日期填写错误，请重新填写"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
    end if
    if cint(request.Form("borrowdateM"))>cint(12) or cint(request.Form("borrowdateD"))>cint(31) or cint(request.Form("borrowdateY"))<cint(1999) or cint(request.Form("borrowdateM"))=cint(0) or cint(request.Form("borrowdateY"))=cint(0) or cint(request.Form("borrowdateD"))=cint(0) then
  	response.write("<script language=""javascript"">")
	response.write("alert(""借款日期填写错误，请重新填写"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
    end if
	if cint(request.Form("borrowdateY"))>cint(request.Form("backdateY")) then 
  	response.write("<script language=""javascript"">")
	response.write("alert(""还款日期早于借款日期，错误，请重新填写"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
	end if
	if  cint(request.Form("borrowdateY"))=cint(request.Form("backdateY")) and  cint(request.Form("backdateM"))<cint(request.Form("borrowdateM")) then
  	response.write("<script language=""javascript"">")
	response.write("alert(""还款日期早于借款日期，错误，请重新填写"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
	end if
	if  cint(request.Form("borrowdateY"))=cint(request.Form("backdateY")) and  cint(request.Form("backdateM"))=cint(request.Form("borrowdateM"))  and cint(request.Form("backdateD"))<cint(request.Form("borrowdateD"))  then
  	response.write("<script language=""javascript"">")
	response.write("alert(""还款日期早于借款日期，错误，请重新填写"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
	end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "宋体";
	font-size: large;
	font-weight: bold;
}
.STYLE2 {font-family: "宋体"}
-->
</style>
<script language="javascript">
function InStore()
{
	window.open('confirmBorr.asp?borrower='+document.form.borrower.value+'&userdept='+document.form.dept.value+'&borrowTime='
+document.form.borrowTime.value+'&repayTime='+document.form.repayTime.value+'&moneyS='+document.form.moneyS.value+'&content='+document.form.content.value+'&finance='+document.form.finance.value,"_self");
}
</script>
<script language="javascript">
function tempInStore()
{
	window.open('tempInstorBorr.asp?borrower='+document.form.borrower.value+'&userdept='+document.form.dept.value+'&borrowTime='
+document.form.borrowTime.value+'&repayTime='+document.form.repayTime.value+'&moneyS='+document.form.moneyS.value+'&content='+document.form.content.value+'&finance='+document.form.finance.value,"_self");
}
</script>
</head>

<body>
<SCRIPT   LANGUAGE="JavaScript">   
  document.onkeydown   =   function()   {   
  if(event.keyCode==116)   {   
  event.keyCode=0;   
  event.returnValue   =   false;   
  }   
  }   
  document.oncontextmenu   =   function()   {event.returnValue   =   false;}   
  </SCRIPT> 
<%
borrowdateY=request.Form("borrowdateY")
borrowdateM=request.Form("borrowdateM")
borrowdateD=request.Form("borrowdateD")
backdateY=request.Form("backdateY")
backdateM=request.Form("backdateM")
backdateD=request.Form("backdateD")
moneyS=trim(request.Form("moneyS"))
moneyBW=trim(request.Form("moneyBW"))
moneyBQ=trim(request.Form("moneyBQ"))
moneyBB=trim(request.Form("moneyBB"))
moneyBS=trim(request.Form("moneyBS"))
moneyBG=trim(request.Form("moneyBG"))
moneyB=request.Form("moneyB")
content=request.Form("content")
finance=request.Form("finance")
borrowTime=borrowdateY&"年"&borrowdateM&"月"&borrowdateD&"日"
repayTime=backdateY& "年"&backdateM&"月"&backdateD&"日"
'小写转换成大写

'这是用来提交数据的，但是没有用到
'set conn=server.CreateObject("adodb.connection")
'DBPath1=server.mappath("finance.mdb")
'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
sql= "select * from [borrowlist_old]"
rs.open sql,conn,1,3
'set cn=server.CreateObject("adodb.connection")
'DBPath2=server.mappath("../db/lmtof.mdb")
'cn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath2
set cn=opendb("lmtof","conn","sql")
set rs2=server.CreateObject("adodb.recordset")
sql2="select * from userinf where username="& "'"& oabusyusername & "'"
rs2.open sql2,cn,1,1
if not rs2.eof then
'response.Write(rs2("userdept"))
end if
if  borrowTime<>"" and repayTime<>"" and moneyS<>"" and id<0 then 
rs.addnew
rs("borrower")=oabusyusername
rs("dept")=rs2("userdept")
rs("borrowTime")=borrowTime
rs("repayTime")=repayTime
rs("money")=moneyS
rs("content")=content
rs("stage")="0"
rs("finance")=finance
rs.update
end if
%>

<div align="center">申请借支单</div>
<form name="form">
 <font size="2">
 <table width="83%"  height="196" bordercolor="#000000"cellpadding="0" cellspacing="0" border="2" align="center" >
   <tr>
     <td bordercolor="#000000" colspan="10" align="center" valign="middle"><div align="center"><span class="STYLE1">费用借支单</span></div></td>
   </tr>
   <div align="center">
   <tr>
     <td width="4%" height="33"  bordercolor="#000000" >借款人</td>
     <td width="21%" bordercolor="#000000" ><input type="text" name="borrower" value="<%response.Write(oabusyusername)%>" /></td>
	 <td width="4%" height="33" bordercolor="#000000">部门</td>
     <td bordercolor="#000000" colspan="2" ><input type="text" name="dept" value="<%=rs2("userdept")%>">	</td>
   </tr>
   <tr>

     <td width="21%" height="34" bordercolor="#000000">借款日期</td>
     <td bordercolor="#000000" >
     <input type="text" name="borrowTime" value="<%response.Write(borrowTime)%>">	 </td>
     <td bordercolor="#000000" width="2%">预计冲款日期</td>
     <td bordercolor="#000000" colspan="2" width="21%" ><input type="text" name="repayTime" value="<%response.Write(repayTime)%>"></td>
   </tr>
   <tr>
     <td bordercolor="#000000" width="4%" height="20">金额（小写）</td>
     <td bordercolor="#000000"  height="20" ><input type="text" name="moneyS" value="<%response.Write(moneyS)%>" /></td>
	 <td bordercolor="#000000" width="4%" height="20">财务人员</td>
	 <td bordercolor="#000000" width="4%" height="20"><input type="text" name="finance" value="<%response.Write(finance)%>" /></td>
   </tr>
   <tr>
     <td  width="4%" height="41" bordercolor="#000000"><%response.Write("&nbsp;&nbsp;")%>事<%response.Write("&nbsp;&nbsp;&nbsp;&nbsp;")%>由<%response.Write("&nbsp;&nbsp;")%></td>
     <td bordercolor="#000000" colspan="8">
	 <input type="text" name="content" value="<%response.Write(content)%>"></td>
   </tr>
   </div>
 </table>
<div align="center">
<!--<input type="button"  value="打印" onclick="printsub()">-->
 </div>
</form>
<div align="center">
<table>
<tr>
<td>
<form name="form1">
<input type="button" value="确认提交" onclick="InStore()" />
</form>
</td>
<td>
<form  name="form2">
<input type="button" value="暂存" onclick="tempInStore()" />
</form>
</td>
<td>
<form action="mainborrow.asp" name="form3">
<input type="submit" value="返回修改" />
</form>
</td>
</form>
</tr>
</table>
</div>
</body>
</html>
