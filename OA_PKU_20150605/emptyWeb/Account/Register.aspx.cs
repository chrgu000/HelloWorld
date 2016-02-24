using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Acount_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack )
        {
            if (Users.IsUserExist(Request["Username"].Trim()))
            {
                Response.Write("<script>alert('用户名已存在！');window.location.href ='Login.aspx'</script>");
            }
            else {
                Users.AddUser(Request["Username"].Trim(), Request["Password"]);
                Session["Identify"] = Users.VerifyIdentity(Request["Username"].Trim(), Request["Password"]);
                Response.Write("<script>alert('注册成功！!请重新登录！');window.location.href ='Login.aspx'</script>");
            }
            
            
        }
    }
}