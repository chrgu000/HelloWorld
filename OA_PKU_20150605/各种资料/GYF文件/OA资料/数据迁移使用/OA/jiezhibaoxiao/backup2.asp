<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>backup</title>
</head>

<body>
<form name="form1" method="post" action="backup2.asp">
<%
dim fs
set fs=Server.CreateObject("Scripting.FileSystemObject")
fs.CopyFile "C:\Inetpub\wwwroot\OA\jiezhibaoxiao\*.mdb","E:\������\backdata\jiezhibaoxiao\"
set fs=nothing
set fs=Server.CreateObject("Scripting.FileSystemObject")
fs.CopyFile "C:\Inetpub\wwwroot\OA\db\*.mdb","E:\������\backdata\db\"
set fs=nothing
set fs=Server.CreateObject("Scripting.FileSystemObject")
fs.CopyFile "C:\Inetpub\wwwroot\OA\kq\*.mdb","E:\������\backdata\kq\"
set fs=nothing
set fs=Server.CreateObject("Scripting.FileSystemObject")
fs.CopyFile "C:\Inetpub\wwwroot\OA\csnc\data\*.mdb","E:\������\backdata\csnc\"
set fs=nothing
%>
</form>
<div align="center">OK�������</div>
</body>
</html>
