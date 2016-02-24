<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%
function getsql(deptN,yearN,monthN)
  if deptN="所有部门" then 
     if yearN="所有" then
	   sql1="select * from borrowlist where stage>1 and stage<6"
	 end if
	 if yearN<>"所有" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    sql1="select * from borrowlist where stage>1 and stage<6 and date>"&t1&"and date<"&t2
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    sql1="select * from borrowlist where stage>1 and stage<6 and date>"&t1&"and date<"&t2
	   end if
	 end if
  end if
  
  if deptN<>"所有部门" then 
     if yearN="所有" then
	   sql1="select * from borrowlist where stage>1 and stage<6 and dept="&deptN
	 end if
	 if yearN<>"所有" then
	   if monthN="" then
	    t1=DateSerial(yearN,1,1)
		t2=DateSerial(yearN+1,1,1)
	    sql1="select * from borrowlist where stage>1 and stage<6 and date>"&t1&"and date<"&t2&"and dept="&deptN
	   end if
	   if monthN<>"" then
	    t1=DateSerial(yearN,monthN,1)
		t2=DateSerial(yearN,monthN+1,1)
	    sql1="select * from borrowlist where stage>1 and stage<6 and date>"&t1&"and date<"&t2&"and dept="&deptN
	   end if
	 end if
  end if
 end function
%>
</body>
</html>
