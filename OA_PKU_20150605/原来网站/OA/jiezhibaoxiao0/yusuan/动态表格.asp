<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<SCRIPT LANGUAGE="JavaScript">
<!--
function create_table()
{
 var span = document.getElementById("t");
 //����һ��table����
 var vTable=document.createElement("TABLE");

 //����table������
 vTable.setAttribute("CELLPADDING","0");
 vTable.setAttribute("CELLSPACING","0");
 vTable.setAttribute("BORDER","1");

 //����һ��
 vTr=vTable.insertRow();

 //����һ��
 vTd=vTr.insertCell();
 vTd1=vTr.insertCell();
 vTd2=vTr.insertCell();
 vTd3=vTr.insertCell();
 vTd4=vTr.insertCell();
 vTd5=vTr.insertCell();
 vTd6=vTr.insertCell();
 vTd7=vTr.insertCell();
 vTd8=vTr.insertCell();
 vTd9=vTr.insertCell();
 vTd10=vTr.insertCell();
 vTd11=vTr.insertCell();
 vTd12=vTr.insertCell();
 vTd13=vTr.insertCell();


 //����������
 //vTd.style.background="#7596C6";
 //vTd.align="center";

 //������һ������ʾ��html
 vTd.innerHTML="<input type='text' name='name' >";
 vTd1.innerHTML="<input type='text' name='name' >";
 vTd2.innerHTML="<input type='text' name='name' >";
 vTd3.innerHTML="<input type='text' name='name' >";
 vTd4.innerHTML="<input type='text' name='name' >";
 vTd5.innerHTML="<input type='text' name='name' >";
 vTd6.innerHTML="<input type='text' name='name' >";
 vTd7.innerHTML="<input type='text' name='name' >";
 vTd8.innerHTML="<input type='text' name='name' >";
 vTd9.innerHTML="<input type='text' name='name' >";
 vTd10.innerHTML="<input type='text' name='name' >";
 vTd11.innerHTML="<input type='text' name='name' >";
 vTd12.innerHTML="<input type='text' name='name' >";
 vTd13.innerHTML="<input type='text' name='name' >";

 span.appendChild(vTable);

}
function alert1(str)
{
 alert(str);
}
function tt()
{
 var span = document.getElementById("t");
 var fileTag = "<input type='radio' id ='f1' name='f1' size=50>";
 var fileObj = document.createElement(fileTag); 
 span.appendChild(fileObj);
}
//-->
</SCRIPT>
</HEAD>

<BODY>
<A HREF="#" onclick="create_table()">test</A>
<form name="f" action="2.asp" method="post">
<TABLE border=1>
<tr>
			<td colspan="2">�·�</td>
			<td>1��</td>
    		<td>2��</td>
    		<td>3��</td>
    		<td>4��</td>
    		<td>5��</td>
    		<td>6��</td>
    		<td>7��</td>
    		<td>8��</td>
    		<td>9��</td>
    		<td>10��</td>
			<td>11��</td>
			<td>12��</td>
		  </tr>
<TR>
 <TD colspan="14"><span id="t" name="t"></span></TD>
</TR>
</TABLE>
<input type="button" onclick="create_table()" value="����"/>
<input type="submit" />
</form>
</BODY>
</HTML>
