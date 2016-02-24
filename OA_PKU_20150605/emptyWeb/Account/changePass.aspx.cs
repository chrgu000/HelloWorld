using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_changePass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            Users usr = (Users)Session["Identify"];
            Users legal = Users.VerifyIdentity(usr.Username.Trim(), Request["Password"]);
            if (legal != null)
            {
                Users.ChangePassword(usr.UserID, Request["NewPassword"]);
                Response.Write("<script>alert('密码修改成功！');window.location.href ='BasicInfoEdit.aspx'</script>");
            }
            else {
                Response.Write("<script>alert('原密码输入错误，请重试！');window.location.href ='changePass.aspx'</script>");
            }
            
            
        }
    }
}