<%
'session.abandon
'Server.ScriptTimeOut=500
function opendb(DBPath,sessionname,dbsort)
dim conn 
Dim StrServer,StrUid,StrSaPwd,StrDbName
StrServer="(local)" '���ݿ��������
StrUid="sa" '���ĵ�¼�ʺ�
StrSaPwd="sa@JUNSHI123" '���ĵ�¼����
StrDbName="lmtof" '�������ݿ�����

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