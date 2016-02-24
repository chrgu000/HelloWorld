using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Acount_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            //Users user = Users.VerifyIdentity(Request["Username"].Trim(), Request["Password"]);
                       
        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        string code = (string)Session["VerifyCode"];
        string inputCode=Request["VerifyCodeText"];
        if (code != inputCode)
        {
            Response.Write("<script Language='JavaScript'>alert('验证码错误!');window.location.href ='Login.aspx'</script>");
        }
        else {
            Users user = Users.VerifyIdentity(Username.Text.Trim(), Request["Password"]);
            if (user != null)
            {
                Session["Identify"] = user;
                if (BasicInfo.HasBasicInfo(user.UserID) && BasicInfo.GetDepartment(user.UserID) != null)
                {
                    Response.Redirect("~/Account/ApplyListPage.aspx");
                }
                else {                    
                    Response.Write("<script Language='JavaScript'>alert('请先完善个人基本信息!');window.location.href ='BasicInfoEdit.aspx'</script>");
                }
                

            }
            else
            {
                ErrorSpan.Visible = true;
            }
        }
         
    }
}