<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="opendb.asp"-->

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%
set cn=opendb("finance","conn","accessdsn")
set r=server.createobject("adodb.recordset")
sq="select * from reimburseItem"
r.open sq,cn,1,1
do while not r.eof 
        set conn=opendb("finance","conn","accessdsn")
        set rs=server.createobject("adodb.recordset")
        sql="select * from reimlisttable_old"
        rs.open sql,conn,1,3
        rs.addnew
		
		                        set cnn=opendb("finance","conn","accessdsn")
                                set rn=server.createobject("adodb.recordset")
                                sqn="select * from reimbursementlist where id="&r("Itemid")
                                rn.open sqn,cnn,1,1
								if not rn.eof and not rn.bof then
								rs("type")=rn("type")
						 		rs("claimant")=rn("claimant")
						 		rs("dept")=rn("dept")
						 		rs("deptleader")=rn("deptleader")	
						 		rs("relclaimant")=rn("relclaimant")
						 		rs("principal")=rn("principal")	
						 		rs("finance")=rn("finance")
						 		rs("reimburseDate")=rn("reimburseDate")	
						 		rs("stage")=rn("stage")		
						 		rs("deptNotes")=rn("deptNotes")		
						 		rs("financialNotes")=rn("financialNotes")	
						 		rs("gManagerNotes")=rn("gManagerNotes")		
						 		'rs("principalApprovalTime")=rn("principalApprovalTime")		
						 		rs("deptApprovalTime")=rn("deptApprovalTime")	
						 		rs("financialApprovalTime")=rn("financialApprovalTime")		
						 		rs("gManagerApprovalTime")=rn("gManagerApprovalTime")	
						 		'rs("principalDissentTime")=rn("principalDissentTime")	
						 		rs("deptDissentTime")=rn("deptDissentTime")	
						 		rs("financialDissentTime")=rn("financialDissentTime")	
						 		rs("gManagerDissentTime")=rn("gManagerDissentTime")	
						 		rs("ch")=rn("ch")
								rn.movenext	
								end if
								'set rn=nothing
                       		    'set cnn=nothing
		
		rs("itemid")=r("Itemid")		    
		rs("projectDept")=r("projectDept")	
		rs("projectId")=r("projectId")	
		rs("givecount")=r("givecount")		
		rs("summary")=r("summary")	
		rs("remark")=r("remark")		
		rs("billCount")=r("billCount")		
		rs("money")=r("money")		
		rs("occurDate")=r("occurDate")
		rs.update
        rs.movenext
r.movenext
loop

        

%>
</body>
</html>
