<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>
<% 

dim databasename '定义数据库名称 
databasename="finance2.mdb"    '数据库名称 
dim databasepath '定义数据库存放路径 
databasepath="C:\Inetpub\wwwroot\OA\jiezhibaoxiao\" '数据库绝对路径 
dim databasever '定义数据库版本 2000 或者 97 
databasever = "2000"




Function Createdfile(FilePath,FileName,Ver) 
Dim Ca,dbver 
select case ver  
case "97" 
dbver = "3.51" 
case "2000" 
dbver = "4.0" 
end select 
if dbver <> "" then 
Set Ca = Server.CreateObject("ADOX.Catalog")  
call Ca.Create("Provider=Microsoft.Jet.OLEDB." & dbver & ";Data Source=" & filepath & filename) 
end if 
End Function 

'Createdfile databasepath,databasename,databasever '创建数据库 

set conn=server.CreateObject("ADODB.Connection")
DBpath=server.MapPath("finance2.mdb")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath
'conn.execute "ALTER table jun drop Gend   "
%> 


<body>
</body>
</html>
