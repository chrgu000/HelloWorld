<html>
<head><title>table test</title>
</head>
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
<body>
<script type="text/javascript">
var oTable = document.createElement("table");
oTable.border = 1;
oTable.style.width = "300px";
oTable.style.height = "300px";
oTable.style.borderCollapse = "collapse";

var oTr1 = oTable.insertRow();
var oTd1 = oTr1.insertCell();
oTd1.rowSpan = 3;
var oTd2 = oTr1.insertCell();
var oTd3 = oTr1.insertCell();

var oTr2 = oTable.insertRow();
var oTd22 = oTr2.insertCell();
var oTd23 = oTr2.insertCell();

var oTr3 = oTable.insertRow();
var oTd32 = oTr3.insertCell();
var oTd33 = oTr3.insertCell();

var oTr4 = oTable.insertRow();
var oTd41 = oTr4.insertCell();
oTd41.colSpan = 2;
var oTd43 = oTr4.insertCell();

document.body.appendChild(oTable);
</script>

</body>
</html>