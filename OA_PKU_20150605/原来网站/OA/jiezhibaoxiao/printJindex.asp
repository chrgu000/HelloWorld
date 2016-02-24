<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../asp/checked.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>

<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("alert(""对不起，您已经过期，请重新登录！"");")
	response.write("window.close();")
	response.write("</script>")
	response.end
end if
%>
<script language="javascript">
function printsub()
{
  window.open("printJindex.asp","_blank")
}
</script>
<%
borrower=request("borrower")
itemObN=request("itemObN")
ProjectLeader=request("ProjectLeader")
dept=request("dept")
borrowTime=request("borrowTime")
repayTime=request("repayTime")
moneyS=request("moneyS")
moneyB=request("moneyB")
content=request("content")
xiangmuFuZeren2=request("xiangmuFuZeren2")
%>
</head>

<body>
<div align="center">申请借支单</div>
 <font size="2">
 <table width="80%"  height="700" bordercolor="#000000"cellpadding="0" cellspacing="0" border="2" align="center" >
   <tr  height="50">
     <td bordercolor="#000000" colspan="10" align="center" valign="middle"><div align="center"><span class="STYLE1">费用借支单</span></div></td>
   </tr>
   <div align="center">
   <tr height="50">
     <td  bordercolor="#000000" width="10%"  align="center">借款人</td>
     <td bordercolor="#000000" colspan="2" align="center" ><%response.Write(borrower&"&nbsp;")%></td>
     <td bordercolor="#000000" width="13%" align="center">项目编号</td>
     <td bordercolor="#000000"  colspan="2" align="center"><%response.Write(itemObN&"&nbsp;")%></td>
     <td bordercolor="#000000" width="20%" align="center">项目负责人</td>
     <td bordercolor="#000000" width="20%"  colspan="2" align="center"><%response.Write(ProjectLeader&"&nbsp;")%></td>
   </tr>
   <tr height="50">
     <td width="10%" height="31" align="center" bordercolor="#000000">部门</td>
     <td bordercolor="#000000" colspan="2"  align="center"><%response.Write(dept&"&nbsp;")%>
	</td>
     <td bordercolor="#000000" width="13%" align="center">借款日期</td>
     <td bordercolor="#000000" colspan="2" align="center" >
     <%response.Write(borrowTime)%>
	 </td>
     <td bordercolor="#000000" width="20%" align="center">预计冲款日期</td>
     <td bordercolor="#000000" colspan="2" width="20%"  align="center"><%response.Write(repayTime&"&nbsp;")%></td>
   </tr>
   <tr height="50">
     <td bordercolor="#000000" width="10%" height="20" align="center">金额（小写）</td>
     <td bordercolor="#000000" colspan="2"  height="20"  align="center" ><%response.Write(moneyS&"&nbsp;")%></td>
     <td bordercolor="#000000" colspan="2" align="center">金额（大写）</td>
     <td bordercolor="#000000" colspan="4"  align="center"><%response.Write(moneyB&"&nbsp;")%></td>
   </tr>
   <tr height="350">
     <td bordercolor="#000000"  width="10%" align="center"><%response.Write("&nbsp;&nbsp;")%>事<%response.Write("&nbsp;&nbsp;&nbsp;&nbsp;")%>由<%response.Write("&nbsp;&nbsp;")%></td>
     <td bordercolor="#000000" colspan="8" align="center"><%response.Write(content&"&nbsp;")%></td>
   </tr>
   </div>
</table>

 <script language="javascript">
if (confirm('请单击“确定”按钮开始打印，单击“取消”按钮不打印！'))
{
	window.print();
}
</script>
</body>
</html>
