<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��д��֧��¼</title>
</head>
<script language="javascript">
var f=0
var k=0
function shou()
{
	   document.getElementById("div").style.display="block";
	   document.getElementById("div1").style.display="none";
	   document.getElementById("div4").style.display="none";
	
}
function zhi()
{
	   document.getElementById("div").style.display="none";
	   document.getElementById("div1").style.display="block";
	   document.getElementById("div3").style.display="none";

}




function   checkKey(){   
        if   (event.keyCode   <   48)   {   event.returnValue=false;   }   
        if   (event.keyCode   >   57)   {   event.returnValue=false;   }   
  }   
   function subn()
   {
    
//	var bn=document.f.name[1]
//	alert(bn.value);
	//if  (document.f.inmoney.value==0.00�� 
//	{
//		if (document.f.outmoney.value==0.00)
//		{
//			alert("������Ҫ��д���");
//			return false;
//		}
//	
//	}
//	
   if(isNaN(document.f.inmoney.value))
   { 
    alert('��������������֣�') 
    return false; 
	}
	
	if(isNaN(document.f.outmoney.value))
	{ 
     alert('֧�������������֣�') 
     return false; 
	}
	

	//if  (document.f.inmoney.value!=0.00) 
//	{
//	   if  (document.f.outmoney.value!=0.00 ) 
//		{
//		alert("��ֻ��Ҫ��дһ�ֽ��");
//		return false;
//	    }
//	}
	
	
		
	var ff
    ff=confirm("����ȷ���Ƿ���д����ȷ�Ϻ��޷��޸ģ���");
	if (ff==false)
	{
		return false;
	}
	if (ff==true)
	{
		document.f.submit();
		//return false;
	}
	

   }
</script>
<body>
<font color="#0d79b3" size="-1">
<center>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="21"><div align="center">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="2" height="25"><span class="style2"><img src="../images/main/l3.gif" width="2" height="25"></span></td>
            <td background="../images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="21"><div align="center"><span class="style2"><img src="../images/main/icon.gif" width="15" height="12"></span></div></td>
                  <td align="left"class="style7"><font size="-1">��֧��¼</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>

<form name="f" method="post" action="cnaction2.asp">

<table cellspacing="0" cellpadding="0" bgcolor="D7E8F8" bordercolor="#339999" border="1" width="60%">
	<tr>
		<td>������</td>
		<td><div id="div3" style="display:block"><input type="text" name="inmoney" value="0.00"  /></div>&nbsp;</td>
		<td>֧�����</td>
		<td><div id="div4" style="display:block"><input type="text" name="outmoney" value="0.00"  /></div>&nbsp;</td> <!--onkeypress="checkKey()" onclick="shou();" onclick="zhi();"-->
	</tr>
	<tr>
		<td>��ע</td>
		<td colspan="3"><textarea cols="60" rows="5" name="content"></textarea></td>
	</tr>
	<tr>
		<td>ѡ��</td>
		<td colspan="3"><div id="div" style="display:block"><input type="checkbox" name="yhshouru" value="Y"  />��������&nbsp;&nbsp;<input type="checkbox" name="xjshouru"  value="Y"/>�ֽ�����</div><div id="div1" style="display:block"><input type="checkbox" name="yhzhichu" value="Y" />����֧��&nbsp;&nbsp;<input type="checkbox" name="xjzhichu" value="Y"  />�ֽ�֧��</div></td>
	</tr>
	<tr>
		<td>ƾ֤��</td>
		<td colspan="3"><input type="text" name="pzh"  /></td>
	</tr>
</table>
<br />
<input type="button" value="����" onclick="subn();" /> <input type="reset" value="����" />

</center>
<br /><br /><br />
<div align="center"><a href="managecnaction.asp">�鿴��֧���</a></div>
</font>
</body>
</html>
