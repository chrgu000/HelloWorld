<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<!--#include file="getverifyR.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ύ����</title>
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
oabusyuserdepttemp=oabusyuserdept


''��ò��ŵĲ��ž����Ƿ��� add by junnor @2013.9.7
set conn=opendb("lmtof","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from userinf where userdept='"&oabusyuserdept&"' and (levelCode1='BMJL' OR levelCode='DSZ' or  levelCode='BMJL') and forbid='no' "
rs.open sql,conn,1,1
if rs.eof or rs.bof then
oabusyuserdept=getdeptbuname(getbucode(oabusyuserdepttemp))'�����˵Ĳ����쵼��
end if
set rs=nothing
set conn=nothing
''add by junnor @2013.9.7

		  Tnow=year(now)&"��"&month(now)&"��"&day(now)&"��"
		  claimant=request("claimant")
		  set conn=opendb("lmtof","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from userinf where username='"&claimant&"'"
          rs.open sql,conn,1,1
          dept=rs("userdept")'�����˵Ĳ���
		  set rs=nothing
		  set conn=nothing

		  set conn=opendb("lmtof","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from userinf where userdept='"&oabusyuserdept&"' and (levelCode1='BMJL' OR levelCode='DSZ' or levelCode1='DSZ' or  levelCode='BMJL') and forbid='no' "
		  'response.Write(sql)
          rs.open sql,conn,1,1
          deptleader=rs("name")'�����˵Ĳ����쵼��
		  set rs=nothing
		  set conn=nothing
		    
		  occuryear=request("occuryear")
		  occurmonth=request("occurmonth")
		  occurday=request("occurday")
		  projectId=request("projectId")
		  dealtype=request("dealtype")

		  set conn=opendb("GFProjectType","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from projectType where projectId='"&projectId&"'"
          rs.open sql,conn,1,1
          givecount=rs("financeCount")
		  projectLeader=rs("principal1")
		  projectDept=rs("dept")
		  set rs=nothing
		  set conn=nothing
		  summary=request("summary")
		  billCount=request("billCount")
		  money=request("money")
		  remark=request("remark")
		  occurDate=occuryear&occurmonth&occurday
		  chkormn=request("chkormn")
		  
''��ò��ŵĲ��ž����Ƿ��� add by junnor @2013.9.7
projectDepttemp=projectDept
set conn=opendb("lmtof","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from userinf where userdept='"&projectDept&"' and (levelCode1='BMJL' OR levelCode='DSZ' or  levelCode='BMJL') and forbid='no' "
rs.open sql,conn,1,1
if rs.eof or rs.bof then
projectDept=getdeptbuname(getbucode(projectDepttemp))'�����˵Ĳ����쵼��
end if
set rs=nothing
set conn=nothing		  
''add by junnor @2013.9.7

		  set conn=opendb("lmtof","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from userinf where userdept='"&projectDept&"'  and (levelCode1='BMJL' OR  levelCode='BMJL' or levelCode='DSZ' or levelCode1='DSZ' )"
		  'response.Write(sql)
          rs.open sql,conn,1,1
          principaldeptLeader=rs("name")'��Ŀ���ڵĲ��ž���
		  set rs=nothing
		  set conn=nothing
		  
		  
		  
  if billCount=0  and (dealtype="AA" or dealtype="BB") then
  	response.write("<script language=""javascript"">")
	response.write("alert(""����������д������������д"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
  end if
  if money=0 then
  	response.write("<script language=""javascript"">")
	response.write("alert(""�����д������������д"");")
	response.write("window.history.go(-1);")
	response.write("</script>") 
  end if
   set conn=opendb("finance","conn","sql")
   set rs=server.CreateObject("adodb.recordset")
   if dealtype="AA"  then
     sql="select * from reimlisttable where projectId='"&projectId&"' and dealtype='"&dealtype&"' and money="&money&" and claimant='"&oabusyusername &"' and relclaimant='"&claimant&"' and summary='"&summary&"' and remark='һ�㱨��:"&remark&"' and billCount="&billCount
   end if
   if dealtype="BB" then
     sql="select * from reimlisttable where projectId='"&projectId&"' and dealtype='"&dealtype&"' and money="&money&" and claimant='"&oabusyusername &"' and relclaimant='"&claimant&"' and summary='"&summary&"' and remark='��������:"&remark&"' and billCount="&billCount
   end if
   if dealtype="CC" then
     sql="select * from reimlisttable where projectId='"&projectId&"' and dealtype='"&dealtype&"' and money="&money&" and claimant='"&oabusyusername &"' and relclaimant='"&claimant&"' and summary='"&summary&"' and remark='��Ŀ����:"&remark&"' and chkormn='"&chkormn&"'"
   end if
   chongfu="FLASE"
          rs.open sql,conn,1,1
		  if not rs.bof and not rs.eof then
		  response.write("<script language=""javascript"">")
		  response.write("alert(""�����ظ��ύ"");")
	      response.write("window.close();")
	      response.write("</script>") 
		  chongfu="TRUE"
		  end if
	set rs=nothing
	set conn=nothing
 con= request("con")
 tem=request("tem")
 verify=getverifyR(projectId,"R",dealtype)          
%>

</head>

<body>
<%
if chongfu<>"TRUE" then
	if ((dealtype="AA" or dealtype="BB") and billCount<>0 and money<>0) or (dealtype="CC" and money<>0)  then
	set conn=opendb("finance","conn","sql")
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from reimlisttable where id is NULL"
	rs.open sql,conn,1,3
	'rs.movelast
	rs.addnew
		rs("projectId")=projectId             '��Ŀ��
		rs("money")=money 	'��� 
		rs("claimant")=oabusyusername              '�����ˣ���д����������
		rs("claimantdeptcode")=getdeptcode(oabusyuserdept)                 '�����˵Ĳ���,��д�������ĵ�λ Ĭ�Ͼ��Ǳ�����      
		rs("relclaimant")=claimant           'ʵ�ʱ����� �������Ϊ�п��Դ�л�������Ĺ��ܶ����ӵ��ֶ�
		rs("relclaimantdeptcode")=getuserdeptcode(claimant)
		rs("summary")=summary 					'ժҪ
		if dealtype="AA" then
		rs("remark")="һ�㱨��:"&remark                '��ע
		end if
		if dealtype="BB" then
		rs("remark")="��������:"&remark                '��ע
		end if   
		if dealtype="CC" then
		rs("remark")="��Ŀ����:"&remark                '��ע
		end if        
		rs("reimburseDate")=Tnow         '�������ڣ�д������������
		rs("occurDate")=occurDate             '������Ŀ��������
		
		if dealtype="AA" or dealtype="BB" then
		rs("billCount")=billCount             '��Ʊ����
		end if
		rs("givecount")=givecount             '��Ŀ�ʺ�
		
		mystr=split(verify,"--")
		haveverify=""
		nowverify=mystr(0)
		willverify=right(verify,len(verify)-(len(mystr(0))+2))
		getstage=split(mystr(0),":")
		stage=getstage(0)
		
		'rs("notes")=
		'rs("signtime")=
		rs("dealtype")= dealtype                 '���������� AA BB CC
		rs("projectdeptcode")=getprojectdeptcode(projectId)
		if dealtype="CC" then
			rs("chkormn")=chkormn
		end if
		'rs("pzh")=
		if con<>"" then
		   rs("haveverify")=haveverify
		   rs("nowverify")=nowverify
		   rs("willverify")=willverify
		   rs("stage")=stage
		end if
		if tem<>"" then
		   rs("stage")=0
		   rs("haveverify")=""
		   rs("nowverify")=""
		   rs("willverify")=verify
		end if
	rs.update
	end if
end if
 %>
<div align="center">
<form>
<input type="button" value="�ر�" onclick="javascript:window.close();" />
</form>
</form>
</body>
</html>
