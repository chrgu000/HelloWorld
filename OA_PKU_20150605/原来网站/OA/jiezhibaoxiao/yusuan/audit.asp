<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
</head>

<body>
<div align="center">
<table border="1" width="80%">
<tr align="center">
<td>����</td>
<td>�ٵ�δ���ڼ�¼</td>
<td>��дԭ��</td>
<td>��ٻ��ߵ��ݼƻ�</td>
<td>��ٻ�������</td>
<td>����</td>
</tr>
<tr align="center">
<td>��ʦ��</td>
<td>δ���ڣ�22��
�ٵ���24�� 9��45</td>
<td>22�ţ���Ϊ������Բ��ܼ�ʱ���ڣ�24�ţ����ǿ��ڣ�����δ�ܼ�ʱ����</td>
<td>��</td>
<td>&nbsp;</td>
<td><input type="text" name="score" value="���ž�����д�������"/></td>
</tr>
<tr align="center">
<td>����</td>
<td>δ���ڣ�3��
�ٵ���14�� 9��05</td>
<td>3�ţ���Ϊ������Բ��ܼ�ʱ���ڣ�14�ţ����ǿ��ڣ�����δ�ܼ�ʱ����</td>
<td>27������ٰ���</td>
<td><input type="text" name="conten" value="�������ٻ���ݼƻ������ž�����д���"/></td>
<td><input type="text" name="score" value="���ž�����д�������" /></td>
</tr>
<tr align="center">
<td>��һ</td>
<td>δ�гٵ���¼ δ���ڼ�¼</td>
<td>&nbsp;</td>
<td>��</td>
<td>&nbsp;</td>
<td><input type="text" name="score" value="���ž�����д�������"/></td>
</tr>
<tr align="center">
<td colspan="6"><input type="submit" value="�ύ" /></td>
</tr>
</table>
</div>
</body>
</html>
