<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='../default.asp';")
	response.write("</script>")
	response.end
end if
%>
<%
'session.abandon
'Server.ScriptTimeOut=500
function opendb(DBname,sessionname,dbsort)
dim conn 
Dim StrServer,StrUid,StrSaPwd,StrDbName
StrServer="(local)" '���ݿ��������
StrUid="sa" '���ĵ�¼�ʺ�
StrSaPwd="sa@JUNSHI123" '���ĵ�¼����
StrDbName=DBname '�������ݿ�����

Dim StrDSN '���ݿ������ַ���
Dim Rs '�����ַ��� 
StrDSN="driver={SQL server};server="&StrServer&";uid="&StrUid&";pwd="&StrSaPwd&";database="&StrDbName
'���������ݿ�master������
set conn = Server.CreateObject("ADODB.Connection") 
ON ERROR RESUME NEXT
conn.Open StrDSN

set session(sessionname)=conn
'end if
set opendb=session(sessionname)
end function
%>