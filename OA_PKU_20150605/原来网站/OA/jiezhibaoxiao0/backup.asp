<form name="form1" method="post" action="">
  <table width="90%" border="0" align=center cellpadding="5"  cellspacing="1" bgcolor="#336699" class="tableBorder">
    <tr>
      <th width="593" height=25 bgcolor="#FFFFFF" >   <B>备份数据</B>( 需要FSO支持，FSO相关帮助请看微软网站 ) </th>
    </tr>
    <tr>
      <td height=100 bgcolor="#FFFFFF" class="forumrow">   
        <span class="STYLE1">
        <%
if request.QueryString("action")="bf" then
Dbpath=request.form("Dbpath")
backpath=request.form("backpath")&".mdb"
if dbpath="" then
response.write "请输入您要您要备份的数据库" 
else
Dbpath=server.mappath(Dbpath)
end if
backpath=server.mappath(backpath)
Set Fso=server.createobject("scripting.filesystemobject")
if fso.fileexists(dbpath) then       
fso.copyfile Dbpath,Backpath
response.write "数据备份成功！"
else
response.write "数据库地址不存在，请检查CONN.ASP中的DB＝这一项是否是绝对地址！" 
end if
end if%> 
        </span>        <div align="center">    
          <p>备份数据库路径(相对)：
            <input name=backpath type=text id="backpath" value="bak\jester_bak" size=30>
            <br>
目标数据库路径(相对)：
<input name=DBpath type=text id="DBpath" value="<%=db%>" size=30>
      <BR>
  <BR>
  
      <input name="submit" type=submit value="备份数据">      
      </p>
          <p>*必须是绝对的数据库地址<br>
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
response.write "请输入您要恢复成的数据库全名" 
else
Dbpath=server.mappath(Dbpath)
end if
backpath=server.mappath(backpath)
Set Fso=server.createobject("scripting.filesystemobject")
if fso.fileexists(dbpath) then       
fso.copyfile Dbpath,Backpath
response.write "成功恢复数据！"
else
response.write "备份目录下并无您的备份文件！" 
end if
end if%>
  </font>  <table width="80%" height="1" border="0" align=center cellpadding="5"  cellspacing="1" bgcolor="#336699" class="tableBorder">
    <tr>
      <th width="593" height=25 bgcolor="#FFFFFF" >   <B>恢复论坛数据</B>( 需要FSO支持，FSO相关帮助请看微软网站 ) </th>
    </tr>
    <tr>
      <td height=100 bgcolor="#FFFFFF" class="forumrow">   备份数据库路径(相对)：
          <input type=text size=30 name=DBpath value="bak\jester_bak.Mdb">
  <BR>
  目标数据库路径(相对)：
      <input name=backpath type=text id="backpath" value="<%=db%>" size=30>
      <BR>
  填写您当前使用的数据库路径，如不想覆盖当前文件，可自行命名（注意路径是否正确），然后修改conn.asp文件， 如果目标文件名和当前使用数据库名一致的话，不需修改conn.asp文件<BR>
  
      <input name="submit" type=submit value="恢复数据">
      <br>
      -----------------------------------------------------------------------------------------<br>
  在上面填写本程序的数据库路径全名，本程序的默认备份数据库文件为，请按照您的备份文件自行修改。<br>
  您可以用这个功能来备份您的法规数据，以保证您的数据安全！<br>
  注意：所有路径都是相对与程序空间根目录的相对路径 </td>
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


'=====================压缩参数=========================
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

 CompactDB = "你的数据库, " & dbpath & ", 已经压缩成功!" & vbCrLf

Else
 CompactDB = "数据库名称或路径不正确. 请重试!" & vbCrLf
End If

End Function

end if%>
</span>
<form action="" method="post">

<table width="80%" height="1" border="0" align=center cellpadding="5"  cellspacing="1" bgcolor="#336699" class="tableBorder">
    <tr>
      <td width="581" height=25 bgcolor="#FFFFFF" class="forumrow"><b>注意：</b><br>
      输入数据库所在相对路径,并且输入数据库名称（正在使用中数据库不能压缩，请选择备份数据库进行压缩操作） </td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF" class="forumrow">压缩数据库：
          <input type="text" name="dbpath" value=<%=db%>>
 
      <input name="submit3" type="submit" value="开始压缩"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF" class="forumrow"><input type="checkbox" name="boolIs97" value="True">
        如果使用 Access 97 数据库请选择 (默认为 Access 2000 数据库)<br>
      <br></td>
    </tr>
</table>  </form> 