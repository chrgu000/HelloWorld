<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<form action="213.asp">   
  <input   type="button"   onclick="addline()"   value="增加">   
  <table   border="1"   id="test">       
      <tr>   
          <td   colspan="2"><input   type="text"   name="tt"></td>   
      </tr>   
  </table>   
  <input   type="submit">   
  </form>   
  <script>   
  function   addline(content){   
  newline=document.all.test.insertRow();   
  newline.insertCell().innerHTML='<input   type="text"   name="date"><input   type="text"   name="Item"><input   type="button"   value="删除此行"   onclick="del()">'   
    
  }   
  function   del(){   
  document.all.test.deleteRow(window.event.srcElement.parentElement.parentElement.rowIndex);   
  }   
  </script>
</body>
</html>
