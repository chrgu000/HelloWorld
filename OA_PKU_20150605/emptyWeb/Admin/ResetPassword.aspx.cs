using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ResetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int UserID = Convert.ToInt32(Request["UserID"] == null ? "-1" : Request["UserID"]);
        Users.ChangePassword(UserID,"135246");
        Response.Write("<script Language='JavaScript'>alert('密码已重置!');window.location.href ='../Admin/UserFilter.aspx'</script>");
    }
}