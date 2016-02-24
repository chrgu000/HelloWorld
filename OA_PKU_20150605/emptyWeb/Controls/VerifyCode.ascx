<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VerifyCode.ascx.cs" Inherits="Controls_VerifyCode" %>

<img id="VerifyCode" src="../Controls/VerifyCode.aspx" alt="验证码" /> [<a href="javascript:RefreshImageCode()">看不清，换一张</a>]
<script language="javascript" type="text/javascript">
    function RefreshImageCode() {       
        document.getElementById('VerifyCode').src = document.getElementById('VerifyCode').src + '?';
        //alert("调用成功！");
    }
</script>