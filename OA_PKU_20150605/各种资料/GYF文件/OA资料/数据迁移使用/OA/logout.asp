<%@ LANGUAGE = VBScript %>
<%response.expires=0%>
<!--#include file="kq/conn.asp"-->
<%
closeflag=request("closeflag")
response.cookies("oabusyname")=""
response.cookies("oabusyuserid")=""
response.cookies("oabusyusername")=""
response.cookies("oabusyuserdept")=""
response.cookies("oabusyuserlevel")=""
response.cookies("cook_allow_see_all_workrep")=""
response.cookies("cook_allow_see_dept_workrep")=""
response.cookies("cook_allow_control_dept_user")=""
response.cookies("cook_allow_control_all_user")=""
response.cookies("cook_allow_send_note")=""
response.cookies("cook_allow_control_note")=""
response.cookies("cook_allow_control_file")=""
response.cookies("cook_allow_control_level")=""
response.write("<script language=""javascript"">")
'从内网登录的用户，返回内网首页
if(not isempty(Session("strUserName"))) then 
response.write("window.top.location.href='../innerhome.asp';</script>")
'从OA主页登录的用户，返回OA主页
else
response.write("window.top.location.href='default.asp';</script>")
end if
response.end
%>