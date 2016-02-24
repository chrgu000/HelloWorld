<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="opendb.asp"-->
<%
function selected(req,reqvalue)
if req=reqvalue then
selected=" selected"
else
selected=""
end if
end function
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>增加项目编号</title>
<link rel="stylesheet" href="css/css.css">
<style type="text/css">
<!--
.style1 {color: #098abb}
-->
body {SCROLLBAR-FACE-COLOR:#3499D0;
SCROLLBAR-HIGHLIGHT-COLOR:#CCFFFF;
SCROLLBAR-SHADOW-COLOR:#2587C3;
SCROLLBAR-ARROW-COLOR:#CCFFFF;
SCROLLBAR-BASE-COLOR:#1068A4; 
SCROLLBAR-DARK-SHADOW-COLOR:#3499D0} 
</style>
<style type="text/css">
<!--
.style1 {color: #0d79b3}
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
.style8 {color: #2b486a}
-->
</style>
</head>

<body>
<form action="addItem2.asp" method="post">
<!--<table align="center" bgcolor="#66CCFF">-->
<table border=0 cellspacing="1" bgcolor="B0C8EA" align="center" width="98%">
<tr bgcolor="D7E8F8"> 
	<td><span class="style8"><font size="2">项目编号</font></span></td>
    <td><span class="style8"><font size="2"><input type="text" name="IDnum" /></font></span></td>
	<td><span class="style8"><font size="2">部门</font></span></td>
    	<td><span class="style8"><font size="2">
            <select name="dept">
             <%
    
              set conn=opendb("lmtof","conn","sql")
              set rs=server.CreateObject("adodb.recordset")
              sql="select  dept from dept order by dept"
              rs.open sql,conn,1,1
              
              %>
                <%do  while not rs.eof  %>
                     <option value=<%=rs("dept")%> <%=selected(rs("dept"),dept)%>><%=rs("dept")%></option>
                <%
                 rs.movenext
                 loop
                 set rs=nothing
                 set conn=nothing
                %>
           </select>
        </font></span></td>
	<td><span class="style8"><font size="2">帐号</font></span></td>
    	<td><span class="style8"><font size="2"><input type="text" name="IDcount" /></font></span></td>
</tr>
<tr bgcolor="D7E8F8"> 
	<td><span class="style8"><font size="2">类型</font></span></td>
    	<td><span class="style8"><font size="2">
            <select name="type">
                <option value="A">A为非项目</option>
                <option value="B">B为项目</option>   
             </select>
        </font></span></td>
	<td><span class="style8"><font size="2">项目名称</font></span></td>
    	<td><span class="style8"><font size="2"><input type="text" name="Pname" /></font></span></td>
	<td><span class="style8"><font size="2">项目负责人</font></span></td>
    	<td><span class="style8"><font size="2">
            <!--<input type="text" name="PLeader" />-->
            <select name="PLeader">
                 <%
        
                  set conn=opendb("lmtof","conn","sql")
                  set rs=server.CreateObject("adodb.recordset")
                  sql="SELECT  distinct name FROM userinf  where forbid='no'and levelcode!='' order by name desc"
                  rs.open sql,conn,1,1
                  
                  %>
                    <%do  while not rs.eof  %>
                         <option value=<%=rs("name")%> <%=selected(rs("name"),PLeader)%>><%=rs("name")%></option>
                    <%
                     rs.movenext
                     loop
                     set rs=nothing
                     set conn=nothing
                    %>
               </select>
        </font></span></td>
</tr>
<tr bgcolor="D7E8F8"> 
<td colspan="6" align="center"><input type="submit" value="确定" /></td>
</tr>
</table>
</form>
</body>
</html>
