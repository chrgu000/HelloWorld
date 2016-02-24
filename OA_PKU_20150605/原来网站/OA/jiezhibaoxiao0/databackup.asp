<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>无标题文档</title>
</head>

<body>
<%  
'*****************************************
function CopyTo(ByVal cFile,ByVal toFile)
                cFile=Server.MapPath(cFile) '所要备份的文件
 toFile=Server.MapPath(toFile) '备份文件
 Dim cFso,cf
 set cFso=Server.CreateObject("Scripting.FileSystemObject")
 cFso.fileexists(cFile)

  cFso.Copyfile cFile,toFile
end function
'*********************************************
 'ASP实现备份及恢复ACCESS数据库操作
'本页面为 databackup.asp
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
       &nbsp;&nbsp;<B>数据库备份</B>
       </th>
      </tr>
      <form method="post" action="databackup.asp?action=Backup">
      <tr>
       <td height=100  style="line-height:150%">
        &nbsp;&nbsp;
      当前数据库路径(相对路径)：
      <input type=text size=15 name=DBpath value="../mdb/database.mdb"><BR>
                       &nbsp;&nbsp; 备份数据库目录(相对路径)：
        <input type=text size=15 name=bkfolder value=../Databackup>&nbsp;如目录不存在，程序将自动创建<BR>
                       &nbsp;&nbsp; 备份数据库名称(填写名称)：        
                       <input type=text size=15 name=bkDBname value=database.mdb>                       &nbsp;如备份目录有该文件，将覆盖，如没有，将自动创建<BR>
      &nbsp;&nbsp;<input type=submit value="备份数据"><hr align="center" width="90%" color="#999999"></td>
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
 response.write "请输入您要恢复成的数据库全名" 
 else
 Dbpath=server.mappath(Dbpath)
 end if
 backpath=server.mappath(backpath)
 Response.write Backpath
 Set Fso=server.createobject("scripting.filesystemobject")
 if fso.fileexists(dbpath) then       
  fso.copyfile Dbpath,Backpath
  response.write "<font color=red>成功恢复数据！</font>"
 else
  response.write "<font color=red>备份目录下并无您的备份文件！</font>" 
 end if
else
%>
     <table align=center cellspacing=1 cellpadding=1 width="90%">                 
      <tr>
       <th height=25 >
        &nbsp;&nbsp;<B>恢复数据库</B>
       </th>
      </tr>
      <form method="post" action="databackup.asp?action=Restore">
      <tr>
       <td height=100 >
        &nbsp;&nbsp;备份数据库路径(相对)：
      <input type=text size=30 name=DBpath value="../Databackup/database.mdb">&nbsp;&nbsp;<BR>
                        &nbsp;&nbsp;当前数据库路径(相对)：
      <input type=text size=30 name=backpath value="../mdb/database.mdb"><BR>
      &nbsp;&nbsp;<input type=submit value="恢复数据"> <hr width="90%" align="center" color="#999999">
        &nbsp;&nbsp;<font color="#666666">·注意：所有路径都是相对路径      &nbsp;&nbsp;</font></td>
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
   response.write "<font color=red>备份数据库成功，您备份的数据库路径为" &bkfolder& "\\"& bkdbname+"</font>"
  Else
   response.write "<font color=red>找不到您所需要备份的文件。</font>"
  End if
end sub
'------------------检查某一目录是否存在-------------------
Function CheckDir(FolderPath)
 folderpath=Server.MapPath(".")&"\\"&folderpath
    Set fso1 = CreateObject("Scripting.FileSystemObject")
    If fso1.FolderExists(FolderPath) then
       '存在
       CheckDir = True
    Else
       '不存在
       CheckDir = False
    End if
    Set fso1 = nothing
End Function
'-------------根据指定名称生成目录---------
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
