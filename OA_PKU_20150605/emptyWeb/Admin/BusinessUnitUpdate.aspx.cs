using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_BusinessUnitUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {       
        BusinessUnit.SetBU(Session["tempName"].ToString(),Session["tempBoss"].ToString(),Session["tempCode"].ToString());
        Session.Remove("tempName");
        Session.Remove("tempBoss");
        Session.Remove("tempCode");
        Response.Redirect("~/Account/CarUse.aspx");
    }
}