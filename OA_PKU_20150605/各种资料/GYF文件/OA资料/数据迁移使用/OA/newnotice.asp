<%@ LANGUAGE = VBScript %>
<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
cook_allow_send_note=request.cookies("cook_allow_send_note")
cook_allow_control_note=request.cookies("cook_allow_control_note")

if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if

set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(oabusyusername)
rs.open sql,conn,1

cook_allow_send_note=rs("allow_send_note")
cook_allow_control_note=rs("allow_control_note")
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<title>办公系统 添加通告</title>
<style type="text/css">
<!--
.z14 {
	font-size: 14px;
	font-weight: bold;
	color: #098abb;
}
.style7 {color: #FF0000}
.style5 {color: #2d4865}
.style8 {color: #2b486a}
-->
</style>
</head>
<body topmargin="0" leftmargin="0">
<table width="583"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="21"><div align="center">
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="2" height="25"><img src="images/main/l3.gif" width="2" height="25"></td>
          <td background="images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="21"><div align="center"><img src="images/main/icon.gif" width="15" height="12"></div></td>
                <td><span class="style5">公司通告</span></td>
              </tr>
          </table></td>
          <td width="1"><img src="images/main/r3.gif" width="1" height="25"></td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td><div align="center">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><center>
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="30"><table width="550"  border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="350" height="50">&nbsp;</td>
                      <td width="70"><div align="right"><a href="noticelook.asp"><img src="images/bt_tonggaoliebiao.gif" width="58" height="18" border="0"></a></div></td>
                      <td width="70"><div align="right"><a href="newnotice.asp"><img src="images/bt_fabutonggao.gif" width="58" height="18" border="0"></a></div></td>
                      <td width="70"><div align="right"><a href="noticecontrol.asp"><img src="images/bt_guanlitonggao.gif" width="58" height="18" border="0"></a></div></td>
                    </tr>
                  </table></td>
                </tr>
              </table>
              <%     
if cook_allow_send_note="yes" or cook_allow_control_note="yes" then     
%>
 <table width="550"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="30"><div align="center" class="z14 style8">发布公司通告</div></td>
                </tr>
                <tr>
                  <td height="1" bgcolor="B0C8EA"></td>
                </tr>
              </table>
            </center>
              <center>
                <%
if request("submit")="发 布 公 告" then
title=request("title")
content=request("content")
set conn=opendb("oabusy","conn","accessdsn")
sql = "Insert Into newnotice (sendusername,title,content) Values( "
sql=sql & SqlStr(oabusyusername) & ","
sql = sql & SqlStr(title) & ", "
sql = sql & SqlStr(content) & ")"
conn.Execute sql
'把是否看过通告改为"no"
set conn=opendb("oabusy","conn","accessdsn")
sql = "update userinf set seenotice='no'"
conn.Execute sql
%>
                <br>
                <br>
                <font color=red>新通告发布成功！</font>
                <%
else
%>
                <script Language="JavaScript">
 function maxlength(str,minl,maxl) {
    if(str.length <= maxl && str.length >= minl){return true;}else{return false;}
                                    }

 function form_check(){
   var l1=maxlength(document.form2.title.value,1,50);
   if(!l1){window.alert("标题的长度大于1位小于50位");document.form2.title.focus();return (false);}

                    }

                </script>
                <br>
                <form method=post name=form2 action="newnotice.asp" onSubmit="return form_check();">
                  <table border=0>
                    <tr>
                      <td><span class="style8"> 通告标题：                      </span></td>
                      <td><input type=text name="title" size=50 style="width:300 ">
                      <font color=red>*</font></td>
                    </tr>
                    <tr>
                      <td valign="top"><span class="style8">
                        
                          通告内容：</span></td>
                      <td valign="top"><textarea rows="9" name="content" style="width:300 "></textarea></td>
                    </tr>
                  </table>
                  <br>
                  <table width="550"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="1" bgcolor="B0C8EA"></td>
                    </tr>
                  </table>
                  <br>
                  <input type="submit" name="submit" value="发 布 公 告">
                  <br>
                  <br>
                  <span class="style8">提示:带"</span><font color=red>*</font><span class="style8">"号的表示必须填写</span>                                                                                
                </form>
                <%
end if
%>
              </center>
              <p>
                <%
else
%>
</p>
              <p align="center" class="style7">对不起,您没有发布公司通告的权限</p>
              <p>  <%
end if
%>
		      </p></td>
          </tr>
        </table>
        <center>
        </center>
    </div></td>
  </tr>
</table>


</body>
</html>