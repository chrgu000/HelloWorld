<form name="form1" method="post" action="">
  <table width="90%" border="0" align=center cellpadding="5"  cellspacing="1" bgcolor="#336699" class="tableBorder">
    <tr>
      <th width="593" height=25 bgcolor="#FFFFFF" >   <B>��������</B>( ��ҪFSO֧�֣�FSO��ذ����뿴΢����վ ) </th>
    </tr>
    <tr>
      <td height=100 bgcolor="#FFFFFF" class="forumrow">   
        <span class="STYLE1">
        <%
if request.QueryString("action")="bf" then
Dbpath=request.form("Dbpath")
backpath=request.form("backpath")&".mdb"
if dbpath="" then
response.write "��������Ҫ��Ҫ���ݵ����ݿ�" 
else
Dbpath=server.mappath(Dbpath)
end if
backpath=server.mappath(backpath)
Set Fso=server.createobject("scripting.filesystemobject")
if fso.fileexists(dbpath) then       
fso.copyfile Dbpath,Backpath
response.write "���ݱ��ݳɹ���"
else
response.write "���ݿ��ַ�����ڣ�����CONN.ASP�е�DB����һ���Ƿ��Ǿ��Ե�ַ��" 
end if
end if%> 
        </span>        <div align="center">    
          <p>�������ݿ�·��(���)��
            <input name=backpath type=text id="backpath" value="bak\jester_bak" size=30>
            <br>
Ŀ�����ݿ�·��(���)��
<input name=DBpath type=text id="DBpath" value="<%=db%>" size=30>
      <BR>
  <BR>
  
      <input name="submit" type=submit value="��������">      
      </p>
          <p>*�����Ǿ��Ե����ݿ��ַ<br>
          </p>
      </div></td>
    </tr>
  </table>
  <p>   </p>
</form>
<form name="form1" method="post" action="">
  <font color=red class="STYLE1">
  <%
if request.QueryString("action")="hy" then
Dbpath=request.form("Dbpath")
backpath=request.form("backpath")
if dbpath="" then
response.write "��������Ҫ�ָ��ɵ����ݿ�ȫ��" 
else
Dbpath=server.mappath(Dbpath)
end if
backpath=server.mappath(backpath)
Set Fso=server.createobject("scripting.filesystemobject")
if fso.fileexists(dbpath) then       
fso.copyfile Dbpath,Backpath
response.write "�ɹ��ָ����ݣ�"
else
response.write "����Ŀ¼�²������ı����ļ���" 
end if
end if%>
  </font>  <table width="80%" height="1" border="0" align=center cellpadding="5"  cellspacing="1" bgcolor="#336699" class="tableBorder">
    <tr>
      <th width="593" height=25 bgcolor="#FFFFFF" >   <B>�ָ���̳����</B>( ��ҪFSO֧�֣�FSO��ذ����뿴΢����վ ) </th>
    </tr>
    <tr>
      <td height=100 bgcolor="#FFFFFF" class="forumrow">   �������ݿ�·��(���)��
          <input type=text size=30 name=DBpath value="bak\jester_bak.Mdb">
  <BR>
  Ŀ�����ݿ�·��(���)��
      <input name=backpath type=text id="backpath" value="<%=db%>" size=30>
      <BR>
  ��д����ǰʹ�õ����ݿ�·�����粻�븲�ǵ�ǰ�ļ���������������ע��·���Ƿ���ȷ����Ȼ���޸�conn.asp�ļ��� ���Ŀ���ļ����͵�ǰʹ�����ݿ���һ�µĻ��������޸�conn.asp�ļ�<BR>
  
      <input name="submit" type=submit value="�ָ�����">
      <br>
      -----------------------------------------------------------------------------------------<br>
  ��������д����������ݿ�·��ȫ�����������Ĭ�ϱ������ݿ��ļ�Ϊ���밴�����ı����ļ������޸ġ�<br>
  ������������������������ķ������ݣ��Ա�֤�������ݰ�ȫ��<br>
  ע�⣺����·��������������ռ��Ŀ¼�����·�� </td>
    </tr>
  </table>
  <p> </p>
</form>  
<span class="STYLE1">
<%
if request.QueryString("action")="ys" then
dim dbpath,boolIs97
if request("Dbpath")<>"" then Dbpath=request("Dbpath") end if
if request("Dbpath")="" then
if request("bkfolder")<>"" then bkfolder=request("bkfolder") else bkfolder="spubbsbak" end if
if request("bkdbname")<>"" then bkdbname=request("bkdbname") else bkdbname="spubbs" end if 
bkdbname=bkdbname&"#.asp"
Dbpath=bkfolder&"\"&bkdbname 
end if
'dbpath = request("dbpath")
if request("boolIs97")<>"" then boolIs97=request("boolIs97") else boolIs97=true end if
'boolIs97 = request("boolIs97")

If dbpath <> "" Then
dbpath = server.mappath(dbpath)
 response.write(CompactDB(dbpath,boolIs97))
End If


'=====================ѹ������=========================
Function CompactDB(dbPath, boolIs97)
Dim fso, Engine, strDBPath,JET_3X
strDBPath = left(dbPath,instrrev(DBPath,"\"))
Set fso = CreateObject("Scripting.FileSystemObject")

If fso.FileExists(dbPath) Then
 fso.CopyFile dbpath,strDBPath & "temp.mdb"
 Set Engine = CreateObject("JRO.JetEngine")

 If boolIs97 = "True" Then
  Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", _
  "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb;" _
  & "Jet OLEDB:Engine Type=" & JET_3X
 Else
  Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", _
  "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb"
 End If

fso.CopyFile strDBPath & "temp1.mdb",dbpath
fso.DeleteFile(strDBPath & "temp.mdb")
fso.DeleteFile(strDBPath & "temp1.mdb")
Set fso = nothing
Set Engine = nothing

 CompactDB = "������ݿ�, " & dbpath & ", �Ѿ�ѹ���ɹ�!" & vbCrLf

Else
 CompactDB = "���ݿ����ƻ�·������ȷ. ������!" & vbCrLf
End If

End Function

end if%>
</span>
<form action="" method="post">

<table width="80%" height="1" border="0" align=center cellpadding="5"  cellspacing="1" bgcolor="#336699" class="tableBorder">
    <tr>
      <td width="581" height=25 bgcolor="#FFFFFF" class="forumrow"><b>ע�⣺</b><br>
      �������ݿ��������·��,�����������ݿ����ƣ�����ʹ�������ݿⲻ��ѹ������ѡ�񱸷����ݿ����ѹ�������� </td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF" class="forumrow">ѹ�����ݿ⣺
          <input type="text" name="dbpath" value=<%=db%>>
 
      <input name="submit3" type="submit" value="��ʼѹ��"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF" class="forumrow"><input type="checkbox" name="boolIs97" value="True">
        ���ʹ�� Access 97 ���ݿ���ѡ�� (Ĭ��Ϊ Access 2000 ���ݿ�)<br>
      <br></td>
    </tr>
</table>  </form> 