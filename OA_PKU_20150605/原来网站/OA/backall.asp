<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��������OA�ĵ�</title>
</head>

<body>
<%
'dim fs,fo
'set fs=Server.CreateObject("Scripting.FileSystemObject")
'set fo=fs.GetFolder("C:\Inetpub\wwwroot\OA\asp")
'fo.Copy("G:\OA����������\oa")
'set fo=nothing
'set fs=nothing

dim fs
set fs=Server.CreateObject("Scripting.FileSystemObject")
fs.CopyFolder "C:\Inetpub\wwwroot\OA","E:\������\OAWEEK"
'fs.CopyFolder "C:\Inetpub\wwwroot\OA","http://192.168.1.65:9889/"
set fs=nothing
response.Write("<div align=center>�������</div>")
%>
</body>
</html>
