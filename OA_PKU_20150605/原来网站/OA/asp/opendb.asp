<%
'session.abandon
'Server.ScriptTimeOut=500
function opendb(DBPath,sessionname,dbsort)
dim conn 
Dim StrServer,StrUid,StrSaPwd,StrDbName
StrServer="(local)" '数据库服务器名
StrUid="sa" '您的登录帐号
StrSaPwd="sa@JUNSHI123" '您的登录密码
StrDbName="lmtof" '您的数据库名称

Dim StrDSN '数据库连接字符串
Dim Rs '命令字符串 
StrDSN="driver={SQL server};server="&StrServer&";uid="&StrUid&";pwd="&StrSaPwd&";database="&StrDbName
'建立和数据库master的连接
set conn = Server.CreateObject("ADODB.Connection") 
ON ERROR RESUME NEXT
conn.Open StrDSN

set session(sessionname)=conn
'end if
set opendb=session(sessionname)
end function


%>