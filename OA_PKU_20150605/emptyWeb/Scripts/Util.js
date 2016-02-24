function validateUsername(value, ajaxCounter) {
    var username = this.value;
    var url = '/Controls/CheckUsername.aspx?Username=' + username + '&AjaxCounter=' + ajaxCounter;
    try { validanguage.ajax(url, usernameValidated); } catch (e) { }
}
function usernameValidated(rawResponse) {
    if (typeof rawResponse.responseText != 'undefined') rawResponse = rawResponse.responseText;
    var response;
    try { response = eval('(' + rawResponse + ')'); } catch (e) { }
    if (typeof response == 'undefined' || typeof response.returnCode == 'undefined') return false;
    if (validanguage.isExpiredAjax('Username', response.ajaxCounter)) return;
    if (response.returnCode == 'True') validanguage.setValidationStatus('Username', true, response.ajaxCounter);
    else validanguage.setValidationStatus('Username', false, response.ajaxCounter, '此用户名已被占用，请重新选择');
}
function validateVerifyCode(value, ajaxCounter) {
    var verifyCode = this.value;
    var url = '/Controls/CheckVerifyCode.aspx?VerifyCode=' + verifyCode + '&AjaxCounter=' + ajaxCounter;
    try { validanguage.ajax(url, verifyCodeValidated); } catch (e) { }
}
function verifyCodeValidated(rawResponse) {
    if (typeof rawResponse.responseText != 'undefined') rawResponse = rawResponse.responseText;
    var response;
    try { response = eval('(' + rawResponse + ')'); } catch (e) { }
    if (typeof response == 'undefined' || typeof response.returnCode == 'undefined') return false;
    if (validanguage.isExpiredAjax('VerifyCodeText', response.ajaxCounter)) return;
    if (response.returnCode == 'True') validanguage.setValidationStatus('VerifyCodeText', true, response.ajaxCounter);
    else validanguage.setValidationStatus('VerifyCodeText', false, response.ajaxCounter, '验证码不正确，请重新输入');
}
