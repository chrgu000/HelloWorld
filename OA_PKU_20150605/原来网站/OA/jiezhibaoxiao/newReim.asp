<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>借支报销</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
function selected(req,reqvalue)
if req=reqvalue then
selected=" selected"
else
selected=""
end if
end function
mymonth=month(now())
myyear=year(now())
myday=day(now())
Tnow=year(now)&"年"&month(now)&"月"&day(now)&"日"
%>
<script language="javascript" >
function seeProject()
{
window.open("seeProject.asp","_blank");
}
</script>
<script language="javascript" >
function seeZhaiyao()
{
window.open("seeZhaiyao.asp","_blank");
}

</script>
</head>
<body>
<div align="center">
<%
dealtype=request("dealtype")
%>
<table>
<tr bgcolor="D7E8F8" bordercolor="#339999">
	<form action="newReim.asp" method=get name="form1">
      <td colspan="2"><font color="#0d79b3" size="-1">选择填写表单类别</font></td>
        <td colspan="4"> 
          <select name="dealtype" size=1 onChange="document.form1.submit();">
          	<option value=""></option>
            <option value="AA" <%=selected("AA",dealtype)%>>一般报销</option>
<!--            <option value="BB" <%=selected("BB",dealtype)%>>报销冲账</option>
            <option value="CC" <%=selected("CC",dealtype)%>>项目还款</option>-->
          </select><font color="#FF0000">&nbsp;&nbsp;*</font>
        </td>
      </form>
</tr>
<%if dealtype<>"" then%>
<form name="form" method="post" action="confirmReim.asp">
<tr bgcolor="D7E8F8" bordercolor="#339999">
     <td width="80"><font color="#0d79b3" size="-1">报销人</font></td>
     <td width="277"><font color="#0d79b3" size="-1">
	 <select name="claimant">
		 <%
		  set conn=opendb("lmtof","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from userinf where forbid='no' order by userdept"
          rs.open sql,conn,1,1
		  %>
		<%do  while not rs.eof  %>
			     <option value=<%=rs("username")%> <%=selected(rs("username"),oabusyusername)%>><%=rs("username")%></option>
			<%
		     rs.movenext
		     loop
		     set rs=nothing
			 set conn=nothing
		    %>
	   </select>
	 </font></td>
     <td width="161" ><font color="#0d79b3" size="-1">发生日期</font></td>     
     <td colspan="3"><font color="#0d79b3" size="-1">
	 <select name=occuryear size=1> 
	     <% for i=2009 to 2020 %><option value=<%response.Write(i)&"年"%><%=selected(i,year(now()))%>><%response.Write(i)&"年"%></option><% next %>
		 </select>
	     <select name=occurmonth size=1>
		 <% for j=1 to 12 %><option value=<%response.Write(j)&"月"%><%=selected(j,month(now()))%>><%response.Write(j)&"月"%></option><% next %>
		 </select>
		 <select name=occurday size=1>
		 <% for k=1 to 31 %><option value=<%response.Write(k)&"日"%><%=selected(k,day(now()))%>><%response.Write(k)&"日"%></option><% next %>
		 </select>
	 </font></td>
</tr>
<tr bgcolor="D7E8F8" bordercolor="#339999">
     <td><font color="#0d79b3" size="-1">经办人</font></td>
     <td><font color="#0d79b3" size="-1"><%=oabusyusername%></font></td>
     <td ><font color="#0d79b3" size="-1">报销日期</font></td>     
     <td  colspan="3"><font color="#0d79b3" size="-1"><%=year(now())&"-"&month(now())&"-"&day(now())%></font></td>     
</tr>
<tr bgcolor="D7E8F8" bordercolor="#339999">
     <td><font color="#0d79b3" size="-1">项目编号</font></td>    
     <td  colspan="5"><font color="#0d79b3" size="-1">
	 <%
		   set conn=opendb("GFProjectType","conn","sql")
           set rs=server.CreateObject("adodb.recordset")
           sql="select * from projectType where dept="&"'"&oabusyuserdept&"' and jieti='NO'  order by dept,type"
           rs.open sql,conn,1,1
         %>
	     <select name=projectId size=1>
		    <%do  while not rs.eof  %>
			    <option value=<%=rs("projectId")%> <%=selected(rs("projectId"),projectId)%>><%=rs("projectId")%><%=rs("projectName")%></option>
			<%
		        rs.movenext
		        loop
		        set rs=nothing

		  set conn=opendb("GFProjectType","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from projectType where dept<>"&"'"&oabusyuserdept&"' and jieti='NO' order by dept,type"
          rs.open sql,conn,1,1
       %>
	        <%do  while not rs.eof  %>
			     <option value=<%=rs("projectId")%> <%=selected(rs("projectId"),content)%>><%=rs("projectId")%><%=rs("projectName")%></option>
			<%
		     rs.movenext
		     loop
		     set rs=nothing
			 set conn=nothing
		    %>
	   </select>
	 </font></td>     
</tr>
<tr bgcolor="D7E8F8" bordercolor="#339999">
	<% if dealtype="AA" or dealtype="BB" then%>
     <td><font color="#0d79b3" size="-1">摘要</font></td>
     <td><font color="#0d79b3" size="-1">
	 <select name="summary">
	 <%
		  set connn=opendb("CostType","conn","sql")
          set rsn=server.CreateObject("adodb.recordset")
          sqln="select DISTINCT type from costtype "
          rsn.open sqln,connn,1,1
		  %>
		<%do  while not rsn.eof  
		%>
					 <optgroup label="<%=rsn("type")%>">
				 <%
				  set conn=opendb("CostType","conn","sql")
				  set rs=server.CreateObject("adodb.recordset")
				  sql="select * from costtype where type='"&rsn("type")&"'"
				  rs.open sql,conn,1,1
				  %>
				<%do  while not rs.eof  
				%>
						 <option value="<%=rs("content")%>" <%=selected(rs("content"),summary)%>><%=rs("id")%><%=rs("content")%></option>
					<%
					 rs.movenext
					 loop
					 set rs=nothing
					 set conn=nothing
					%>
					</optgroup>				 
			<%
		     rsn.movenext
		     loop
		     set rsn=nothing
			 set connn=nothing
		    %>
	 
	   </select>
	   <%
	   function gaibian(str)
	   response.Redirect("aaa.asp?aa="&str)
	   end function
	   %>
	 </font></td>
     <%end if%>
     <%if dealtype="CC" then%>
     <td><font color="#0d79b3" size="-1">还款方式</font></td>
     <td><font color="#0d79b3" size="-1">
     	<select name="chkormn">
        	<option value="chk">银行汇款</option>
            <option value="mn">现金还款</option>
        </select>
     </font></td>
     <%end if%>
     <%if dealtype="AA" or dealtype="BB" then %>
     <td ><font color="#0d79b3" size="-1">单据</font></td>     
     <td width="256"><font color="#0d79b3" size="-1"> 
       <input type=text name="billCount" size=4 value=0 /></font></td>     
     <td width="128" ><font color="#0d79b3" size="-1">金额</font></td>     
     <td width="45"><font color="#0d79b3" size="-1">
       <input type=text name="money" size=6 value=0 >
       </font></td>
      <%end if%> 
      <%if dealtype="CC" then%>
      <td width="128" colspan="2"><font color="#0d79b3" size="-1">金额</font></td>     
      <td width="45" colspan="2"><font color="#0d79b3" size="-1">
       <input type=text name="money" size=6 value=0 >
       </font></td>
      <%end if%>  
</tr>
<tr bgcolor="D7E8F8" bordercolor="#339999">
     <td><font color="#0d79b3" size="-1">备注</font></td>
	 <td colspan=5>
	      <textarea name="remark" cols=120 rows="4"  ></textarea>
	 </td>
</tr>
</table >
<input type="hidden" name="dealtype" value=<%=dealtype%> />
<input type="submit"  name="con" value="确认提交" />
<input type="submit"  name="tem" value="暂存"  />
<input type="button" value="查看项目编号" onclick="seeProject()">
<input type="button" value="查看项目摘要" onclick="seeZhaiyao()">
</form>
<%end if%>
</div>
</body>
</html>
