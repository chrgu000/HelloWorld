<HTML>   
  <HEAD>   
  <TITLE>   New   Document   </TITLE>   
  <META   NAME="Generator"   CONTENT="EditPlus">   
  <META   NAME="Author"   CONTENT="">   
  <META   NAME="Keywords"   CONTENT="">   
  <META   NAME="Description"   CONTENT="">   
  </HEAD>   
    
  <BODY>   
        <table   width="100%"   border="0"   cellspacing="1"   cellpadding="0">   
        <tr>   
              <td>   
              <table   id='TB'   width="100%"   border="1"   cellspacing="1"   cellpadding="0">    
              <tr>   
                    <td>&nbsp;</td>   
                    <td>&nbsp;</td>   
                    <td>&nbsp;</td>   
                    <td>&nbsp;</td>   
                    <td>&nbsp;</td>  
                    <td>&nbsp;</td>   
                    <td>&nbsp;</td>   
                    <td>&nbsp;</td>   
                    <td>&nbsp;</td>   
                    <td>&nbsp;</td>   

              </tr>   
              </table>   
              </td>   
              <td>   
              <table   width="100"   border="1"   cellspacing="1"   cellpadding="0">   
                    <tr><td>����</td></tr>   
                    <tr><td><input   type="button"   name="delLine"   value="ɾ��һ��"   onclick="delline()"></td></tr>   
                    <tr><td><input   type="button"   name="addLine"   value="����һ��"   onclick="addline()"></td><tr>   
              </table>   
                    </td>   
              </tr>   
              </table>   
  </BODY>   
  </HTML>   
  <SCRIPT   LANGUAGE="JavaScript">   
  <!--   
  function   addline(){   
        var   newRow   =   TB.insertRow();   
        var   newCell;   
        for(var   i=0;   i<10;   i++)   {   
              newCell   =   newRow.insertCell(i);   
              newCell.innerText   =   "Add";   
        }   
  }   
  function   delline()   {   
        TB.deleteRow();   
  }   
  //-->   
  </SCRIPT>