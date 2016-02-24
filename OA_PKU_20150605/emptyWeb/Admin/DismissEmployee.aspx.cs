using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DismissEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int UserID = Convert.ToInt32(Request["UserID"] == null ? "-1" : Request["UserID"]);
        BasicInfo bi = BasicInfo.GetBasicInfoByID(UserID);
        bi.OnJob = false;
        BasicInfo.SetBasicInfoByID(UserID,bi);
        Response.Write("<script Language='JavaScript'>alert('员工已注销!');window.location.href ='../Admin/UserFilter.aspx'</script>");
    }
}