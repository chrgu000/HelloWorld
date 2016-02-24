<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>资产保存</title>
<%
username=request("username")
CPU=request("CPU")
display=request("display")
keyboard=request("keyboard")
netcard=request("netcard")

memory=request("memory")
cddriver=request("cddriver")
mouse=request("mouse")
soundcard=request("soundcard")

harddisk=request("harddisk")
dispalycard=request("dispalycard")
mainbord=request("mainbord")
crate=request("crate")

name1=request("name1")
configuration1=request("configuration1")
buytime1=request("buytime1")
purchase1=request("purchase1")

name2=request("name2")
configuration2=request("configuration2")
buytime2=request("buytime2")
purchase2=request("purchase2")

name3=request("name3")
configuration3=request("configuration3")
buytime3=request("buytime3")
purchase3=request("purchase3")

name4=request("name4")
configuration4=request("configuration4")
buytime4=request("buytime4")
purchase4=request("purchase4")

name5=request("name5")
configuration5=request("configuration5")
buytime5=request("buytime5")
purchase5=request("purchase5")

name6=request("name6")
configuration6=request("configuration6")
buytime6=request("buytime6")
purchase6=request("purchase6")

%>
<%
set conn=server.CreateObject("adodb.connection")
  path=server.Mappath("db/asset.mdb")
  conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
  set rs=server.CreateObject("adodb.recordset")
  sql="select * from asset where username = " & "'"&username & "'"
  rs.open sql,conn,1,3 
  
  rs("username")=username
  rs("CPU")=CPU
  rs("display")=display
  rs("keyboard")=keyboard
  rs("netcard")=netcard

  rs("memory")=memory
  rs("cddriver")=cddriver
  rs("mouse")=mouse
  rs("soundcard")=soundcard

  rs("harddisk")=harddisk
  rs("dispalycard")=dispalycard
  rs("mainbord")=mainbord
  rs("crate")=crate

  rs("name1")=name1
  rs("configuration1")=configuration1
  rs("buytime1")=buytime1
  rs("purchase1")=purchase1

  rs("name2")=name2
  rs("configuration2")=configuration2
  rs("buytime2")=buytime2
  rs("purchase2")=purchase2

  rs("name3")=name3
  rs("configuration3")= configuration3
  rs("buytime3")=buytime3
  rs("purchase3")=purchase3

  rs("name4")=name4
  rs("configuration4")=configuration4
  rs("buytime4")=buytime4
  rs("purchase4")=purchase4

  rs("name5")=name5
  rs("configuration5")=configuration5
  rs("buytime5")=buytime5
  rs("purchase5")=purchase5

  rs("name6")=name6
  rs("configuration6")=configuration6
  rs("buytime6")=buytime6
  rs("purchase6")=purchase6
  rs.update
%>
</head>

<body>
<div align="center">
修改成功
</div>
</body>
</html>
