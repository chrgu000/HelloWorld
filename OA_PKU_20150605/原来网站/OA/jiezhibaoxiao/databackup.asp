<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>�ޱ����ĵ�</title>
</head>

<body>
<%  
'*****************************************
function CopyTo(ByVal cFile,ByVal toFile)
                cFile=Server.MapPath(cFile) '��Ҫ���ݵ��ļ�
 toFile=Server.MapPath(toFile) '�����ļ�
 Dim cFso,cf
 set cFso=Server.CreateObject("Scripting.FileSystemObject")
 cFso.fileexists(cFile)

  cFso.Copyfile cFile,toFile
end function
'*********************************************
 'ASPʵ�ֱ��ݼ��ָ�ACCESS���ݿ����
'��ҳ��Ϊ databackup.asp
dim dbpath,bkfolder,bkdbname,fso,fso1
  call main()
    call main2()
  conn.close
  set conn=nothing
sub main()
if request("action")="Backup" then
 call backupdata()
else
%>
     <table cellspacing=1 cellpadding=1 align=center width="90%">                 
      <tr>
       <th height=25 >
       &nbsp;&nbsp;<B>���ݿⱸ��</B>
       </th>
      </tr>
      <form method="post" action="databackup.asp?action=Backup">
      <tr>
       <td height=100  style="line-height:150%">
        &nbsp;&nbsp;
      ��ǰ���ݿ�·��(���·��)��
      <input type=text size=15 name=DBpath value="../mdb/database.mdb"><BR>
                       &nbsp;&nbsp; �������ݿ�Ŀ¼(���·��)��
        <input type=text size=15 name=bkfolder value=../Databackup>&nbsp;��Ŀ¼�����ڣ������Զ�����<BR>
                       &nbsp;&nbsp; �������ݿ�����(��д����)��        
                       <input type=text size=15 name=bkDBname value=database.mdb>                       &nbsp;�籸��Ŀ¼�и��ļ��������ǣ���û�У����Զ�����<BR>
      &nbsp;&nbsp;<input type=submit value="��������"><hr align="center" width="90%" color="#999999"></td>
      </tr> 
      </form>
     </table>
     <%
end if
end sub
sub main2()
if request("action")="Restore" then
 Dbpath=request.form("Dbpath")
 backpath=request.form("backpath")
 if dbpath="" then
 response.write "��������Ҫ�ָ��ɵ����ݿ�ȫ��" 
 else
 Dbpath=server.mappath(Dbpath)
 end if
 backpath=server.mappath(backpath)
 Response.write Backpath
 Set Fso=server.createobject("scripting.filesystemobject")
 if fso.fileexists(dbpath) then       
  fso.copyfile Dbpath,Backpath
  response.write "<font color=red>�ɹ��ָ����ݣ�</font>"
 else
  response.write "<font color=red>����Ŀ¼�²������ı����ļ���</font>" 
 end if
else
%>
     <table align=center cellspacing=1 cellpadding=1 width="90%">                 
      <tr>
       <th height=25 >
        &nbsp;&nbsp;<B>�ָ����ݿ�</B>
       </th>
      </tr>
      <form method="post" action="databackup.asp?action=Restore">
      <tr>
       <td height=100 >
        &nbsp;&nbsp;�������ݿ�·��(���)��
      <input type=text size=30 name=DBpath value="../Databackup/database.mdb">&nbsp;&nbsp;<BR>
                        &nbsp;&nbsp;��ǰ���ݿ�·��(���)��
      <input type=text size=30 name=backpath value="../mdb/database.mdb"><BR>
      &nbsp;&nbsp;<input type=submit value="�ָ�����"> <hr width="90%" align="center" color="#999999">
        &nbsp;&nbsp;<font color="#666666">��ע�⣺����·���������·��      &nbsp;&nbsp;</font></td>
      </tr> 
      </form>
</table>
<%
end if
end sub
sub backupdata()
  Dbpath=request.form("Dbpath")
  Dbpath=server.mappath(Dbpath)
  bkfolder=request.form("bkfolder")
  bkdbname=request.form("bkdbname")
  Set Fso=server.createobject("scripting.filesystemobject")
  if fso.fileexists(dbpath) then
   If CheckDir(bkfolder) = True Then
   fso.copyfile dbpath,bkfolder& "\\"& bkdbname
   else
   MakeNewsDir bkfolder
   fso.copyfile dbpath,bkfolder& "\\"& bkdbname
   end if
   response.write "<font color=red>�������ݿ�ɹ��������ݵ����ݿ�·��Ϊ" &bkfolder& "\\"& bkdbname+"</font>"
  Else
   response.write "<font color=red>�Ҳ���������Ҫ���ݵ��ļ���</font>"
  End if
end sub
'------------------���ĳһĿ¼�Ƿ����-------------------
Function CheckDir(FolderPath)
 folderpath=Server.MapPath(".")&"\\"&folderpath
    Set fso1 = CreateObject("Scripting.FileSystemObject")
    If fso1.FolderExists(FolderPath) then
       '����
       CheckDir = True
    Else
       '������
       CheckDir = False
    End if
    Set fso1 = nothing
End Function
'-------------����ָ����������Ŀ¼---------
Function MakeNewsDir(foldername)
 dim f
    Set fso1 = CreateObject("Scripting.FileSystemObject")
        Set f = fso1.CreateFolder(foldername)
        MakeNewsDir = True
    Set fso1 = nothing
End Function
%>

</body>
</html>
