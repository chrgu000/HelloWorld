using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RolesUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        Roles.SetRole(Session["tempName"].ToString(),Convert.ToInt32(Session["tempLimit"]));

        Session.Remove("tempName");
        Session.Remove("tempLimit");
        Response.Redirect("~/Account/CarUse.aspx");
    }
}