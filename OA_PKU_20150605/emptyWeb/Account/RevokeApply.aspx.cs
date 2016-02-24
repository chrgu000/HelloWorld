using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_RevokeApply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int applyID = Convert.ToInt32(Request["ApplyID"] == null ? "-1" : Request["ApplyID"]);
        Apply.DeleteApply(applyID);
        Response.Write("<script Language='JavaScript'>alert('申请已撤销!');window.location.href ='../Account/ApplyListPage.aspx'</script>");
    }
}