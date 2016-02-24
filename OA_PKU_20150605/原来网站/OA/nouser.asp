<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>
<%
k= round((n+1) / 6)
for z=0 to k-1
for y=0 to 5

 if y=4 then 
  if not IsNumeric(str1(z*8+y+2)) then
    mst="单据张数不为数字！"
	showmsg(mst)
  end if
  if IsNumeric(str1(z*8+y+2)) then
    if str1(z*8+y+2)=" " then 
	msg="单据张数不能为空"
	showmsg(msg)
	end if
    if str1(z*8+y+2)<>"" then
	billC=billC+trim((str1(z*8+y+2)))
    end if
  end if
 end if 
 
 
 if y=5 then
    if not IsNumeric(str1(z*8+y+2)) then
     mst="金额数不为数字！"
	 showmsg(mst)
	
    end if
	if IsNumeric(str1(z*8+y+2)) then
    if str1(z*8+y+2)=" " then 
	msg="金额数不能为空"
	showmsg(msg)
	
	end if 
	if str1(z*8+y+2)<>"" then
       moneyT=moneyT+trim((str1(z*8+y+2)))
	end if
	end if
 end if 
 
 
 
 
 
 
 
  if m=4 then 
   if not IsNumeric(str1(j*8+m+2)) then
     mst="单据张数不为数字！"
 	showmsg(mst)
   end if
   if IsNumeric(str1(j*8+m+2)) then
     if str1(j*8+m+2)=" " then 
 	msg="单据张数不能为空"
 	showmsg(msg)
 	end if
     if str1(j*8+m+2)<>"" then
 	billC1=billC1+trim((str1(j*8+m+2)))
     end if
   'end if
  end if 
  
 
  if m=5 then
      mst="金额数不为数字！"
 	 showmsg(mst)
     end if
 	if IsNumeric(str1(j*8+m+3)) then
     if str1(j*8+m+3)=" " then 
     msg="金额数不能为空"
 	showmsg(msg)
	
 	end if 
 	 if str1(j*8+m+3)<>"" then
        moneyT1=moneyT1+trim((str1(j*8+m+3)))
 	end if
 	end if
  end if 
%>
<body>
</body>
</html>
