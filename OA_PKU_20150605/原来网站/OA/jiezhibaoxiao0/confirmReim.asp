<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
'response.Write(oabusyname&oabusyusername&oabusyuserdept&oabusyuserlevel&oabusyuserlevelCode)
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
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
          sql="select * from userinf where userdept='"&oabusyuserdept&"' and (levelCode1='BMJL' OR  levelCode='BMJL') and forbid='no' "
          rs.open sql,conn,1,1
          deptleader=rs("name")'�����˵Ĳ���
		  set rs=nothing
		  set conn=nothing
		    
		  occuryear=request("occuryear")
		  occurmonth=request("occurmonth")
		  occurday=request("occurday")
		  projectId=request("projectId")

		  set conn=opendb("GFProjectType","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from projectType_old where projectId='"&projectId&"'"
          rs.open sql,conn,1,1
          givecount=rs("financeCount")
		  projectLeader=rs("principal1")
		  projectDept=rs("dept")
		  projecttype=rs("type")
		  set rs=nothing
		  set conn=nothing
		  summary=request("summary")
		  billCount=request("billCount")
		  money=request("money")
		  remark=request("remark")
		  occurDate=occuryear&occurmonth&occurday
		  

		  set conn=opendb("lmtof","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from userinf where userdept='"&projectDept&"'  and (levelCode1='BMJL' OR  levelCode='BMJL')"
          rs.open sql,conn,1,1
          principaldeptLeader=rs("name")'��Ŀ���ڵĲ��ž���
		  set rs=nothing
		  set conn=nothing
		  
		  
		  
  if billCount=0 then
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
 con= request("con")
 tem=request("tem")
          
%>

</head>

<body>
<%
if billCount<>0 and money<>0 then

set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from reimlisttable_old where id is NULL"
rs.open sql,conn,1,3
'rs.movelast
rs.addnew
    rs("type")= projecttype                 '����������
	rs("claimant")=oabusyusername              '�����ˣ���д����������
	rs("dept")=oabusyuserdept                  '�����˵Ĳ���,��д�������ĵ�λ Ĭ�Ͼ��Ǳ�����
	rs("deptleader")= deptleader           '�����˵Ĳ��ž�������д�������˵Ĳ��ž���Ĭ�Ͼ��Ǳ����˵Ĳ��ž���
	rs("relclaimant")=claimant           'ʵ�ʱ����� �������Ϊ�п��Դ�л�������Ĺ��ܶ����ӵ��ֶ�
	rs("principal")=projectLeader             '��Ŀ������
	rs("projectDept")=projectDept           '��Ŀ���ڲ���
	rs("principaldeptLeader")=principaldeptLeader   '��Ŀ���ڲ��ž���
	'rs("finance")=               '����
	rs("projectId")=projectId             '��Ŀ��
	rs("givecount")=givecount             '��Ŀ�ʺ�
	rs("summary")=summary               'ժҪ
	rs("remark")=remark                '��ע
	rs("billCount")=billCount             '��Ʊ����
	rs("money")=money                 '���
	rs("occurDate")=occurDate             '������Ŀ����������
	rs("reimburseDate")=Tnow         '�������ڣ�д������������
	'rs("stage")=                 '�׶�
	'rs("principalNotes")=        '��Ŀ��������ע
	'rs("deptNotes")=             '���ž�����ע
	'rs("financialNotes")=        '����������ע
	'rs("gManagerNotes")=         '�ܾ�����ע
	'rs("principalApprovalTime")= '��Ŀ������ͨ��ʱ��
	'rs("deptApprovalTime")=      '��������ͨ��ʱ��
	'rs("financialApprovalTime")= '������������ͨ��ʱ��
	'rs("gManagerApprovalTime")=  '�ܾ�������ͨ��ʱ��
	'rs("principalDissentTime")=  '��Ŀ�����˲�ͨ��ʱ��
	'rs("deptDissentTime")=       '����������ͨ��ʱ��
	'rs("financialDissentTime")=  '��������������ͨ��ʱ��
	'rs("gManagerDissentTime")=   '�ܾ���������ͨ��ʱ��
	rs("ch")="N"                    '�Ƿ��Ѿ��޸Ĺ��ʺ�
if con<>"" then
   'if oabusyuserlevelCode="BMJL" then
'   rs("stage")="2"
'   end if
  ' if oabusyuserlevelCode="CWZG" then
'     rs("stage")="3"
'   end if
'   if oabusyuserlevelCode="CW" then
'     rs("stage")="3"
'   end if
   'if (oabusyuserlevelCode="ZSYG" or oabusyuserlevelCode="CN" or oabusyuserlevelCode="BMJL" or oabusyuserlevelCode="CW" or oabusyuserlevelCode="CWZG")  then
      rs("stage")="1"
    'end if
	'2010��2��1�� ������ʦ�Ĺ��ܵ���ԭ��״̬
   if claimant="������" then
    rs("stage")="4" 
   end if
end if
if tem<>"" then
   rs("stage")="0"
end if
rs.update 
end if
'-----------------------------------------add by zhaoshijun at 2010-2-28
set conn=opendb("symx","conn","sql server")
set rs=server.CreateObject("adodb.recordset")
sql= "select * from accProj where projectid="&"'"&projectId&"'"
rs.open sql,conn,1,1
if not rs.eof and not rs.bof then
num=rs("bala")-money
else
num=10
end if
set rs=nothing
set conn=nothing
 if num<0 then response.Write("<script language=javascript>alert('����������Ŀ�н��㣬�ڱ��������н������ʾ')</script>")
 %>
<div align="center">
<form>
<input type="button" value="�ر�" onclick="javascript:window.close();" />
</form>
</form>
</body>
</html>
