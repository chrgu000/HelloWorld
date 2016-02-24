<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" type="text/css" href="jt.css" >
<title>动态生成表单</title>
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
%>
<style>
<!--
body {CURSOR:default; color: #000000}
table {  font-size: 9pt;}
FORM{FONT-FAMILY: "宋体"; FONT-SIZE: 12px}
INPUT{BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 1px; PADDING-LEFT: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 10pt; 
BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #cccccc; PADDING-BOTTOM: 1px; BORDER-TOP-COLOR: 
#cccccc; PADDING-TOP: 1px; HEIGHT: 18px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #cccccc; font-family: "宋体"; 
font-size: 12px}
A:link{text-decoration:none;color:#0030CC;}
A:visited{text-decoration:none;color:#0030CC;}
A:hover{text-decoration:underline;color:#FF0000;}
-->
</style>
<Script Language="VBScript">
<!--
sub setpro(x)
Dim a()
procount=form1.procount.value
if x=2 then
procount=procount+1
else
procount=2
End if
temp=""
Redim a(procount)
if x=2 then
for i=1 to procount-1
a(i)=form1("pro"&i).value
next
End if
for i=1 to procount
temp=temp&"文本框"&i&"：<input type='text' name='pro"&i&"' size='20' value='"&a(i)&"'><br><br>"
next
document.all("pro").innerHtml=temp
form1.procount.value=procount
End sub
-->
</Script>
</head>
<body onLoad="setpro(1)">
<form method="POST" name="form1" action="">
  <div align="center">
    <center>
    <table border="0" cellpadding="0" cellspacing="0" width="200">
      <tr>
        <td height="24" width="200" align="center"><a href="#" onClick="setpro(2)">增加文本框</a></td>
      </tr>
    </table>
    </center>
  </div>
<br>
  <input style="display:none;"  type="text" name="procount" size="20" style="width: 90; height: 18" value="2">
  <div align="center">
    <center>
    <table border="0" cellpadding="0" cellspacing="0" width="500">
      <tr>
        <td height="26" align="center" id="pro"></td>
      </tr>
    </table>
    </center>
  </div>
</form>
</body>
</html>