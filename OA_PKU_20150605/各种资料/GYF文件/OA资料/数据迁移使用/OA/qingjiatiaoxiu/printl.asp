<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
oabusyuserlevelCode2=request.cookies("oabusyuserlevelCode2")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
function opendb(DBPath,sessionname,dbsort)
    dim conn
    Set conn=Server.CreateObject("ADODB.Connection")
    DBPath1=server.mappath(DBPath)
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
    set session(sessionname)=conn
    set opendb=session(sessionname)
end function
function selected(req,reqvalue)
if req=reqvalue then
selected=" selected"
else
selected=""
end if
end function
function checked(req,reqvalue)
if req=reqvalue then
checked=" checked"
else
checked=""
end if
end function
id=request("id")
    set conn=opendb("��ٵ���.mdb","conn","accessdsn")
    set rs=server.createobject("adodb.recordset")
    sql="select * from leave where id="&id
    rs.open sql,conn,1,1
    name1=rs("name")
	dept=rs("dept")
	time1=rs("time")
	beigintime=rs("beigintime")
	endtime=rs("endtime")
	shi=rs("shi")
	bin=rs("bin")
	chan=rs("chan")
	nian=rs("nian")
	hun=rs("hun")
	sang=rs("sang")
	qin=rs("qin")
	other=rs("other")
	content=rs("content")
	deptnote=rs("deptnote")
	zhurennote=rs("zhurennote")
    set rs=nothing
    set conn=nothing
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��ӡ��ٵ�</title>
</head>
<body>
<div align="center">
<table width="60%" border="1">
<th colspan="6">��ٵ�</th>
<tr>
<td>����</td>
<td><%=name1%></td>
<td>����</td>
<td><%=dept%></td>
<td>ʱ��</td>
<td><%=time1%></td>
</tr>
<tr>
<td>����ڼ䣺</td>
<td colspan="5">��<%=beigintime%>��<%=endtime%></td>
</tr>
<tr>
<td>�������:</td>
<td colspan="5">
<input type="checkbox" name="shi" value="yes" <%=checked(shi,"yes")%>>�¼�
<input type="checkbox" name="bin" value="yes" <%=checked(bin,"yes")%>>����
<input type="checkbox" name="chan" value="yes" <%=checked(chan,"yes")%>>����
<input type="checkbox" name="nian" value="yes" <%=checked(nian,"yes")%>>��н���ݼ�
<input type="checkbox" name="hun" value="yes" <%=checked(hun,"yes")%>>���
<input type="checkbox" name="sang" value="yes" <%=checked(sang,"yes")%>>ɥ��
<input type="checkbox" name="qin" value="yes" <%=checked(qin,"yes")%>>̽�׼�
<input type="checkbox" name="other" value="yes" <%=checked(other,"yes")%>>����
</td>
</tr>
<tr>
<td>��ϸ˵����</td>
<td colspan="5"><%=content%></td>
</tr>
<tr>
<td>�������</td>
<td colspan="5"><%=deptnote%></td>
</tr>
<tr>
<td>�ܾ������</td>
<td colspan="5"><%=deptnote%></td>
</tr>
</table>
</div>
</body>
<script language="javascript">
if (confirm('�뵥����ȷ������ť��ʼ��ӡ��������ȡ������ť����ӡ��'))
{
	window.print();
}
</script>
</html>
