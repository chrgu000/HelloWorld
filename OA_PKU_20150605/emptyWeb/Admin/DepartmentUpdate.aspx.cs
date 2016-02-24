using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DepartmentUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        Department.SetDepartment(Session["tempName"].ToString(), Convert.ToInt32(Session["tempParent"]), Session["tempBoss"].ToString(),Session["tempLeader"].ToString());
        Session.Remove("tempName");
        Session.Remove("tempParent");
        Session.Remove("tempBoss");
        Session.Remove("tempLeader");
        Response.Redirect("~/Account/CarUse.aspx");
    }
}