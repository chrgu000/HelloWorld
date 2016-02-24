using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_OrganizationIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "组织管理"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }
    }
    protected void confirmButton_Click(object sender, EventArgs e)
    {
        switch(organizationType.SelectedValue)
        {
            case "添加事业部": Response.Redirect("~/Admin/BusinessssUnitAdd.aspx"); break;
            case "添加部门": Response.Redirect("~/Admin/DepartmentAdd.aspx"); break;
        }
    }
}