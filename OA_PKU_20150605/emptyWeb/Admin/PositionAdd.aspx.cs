using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RoleAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "角色管理"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }
        if(IsPostBack)
        {
            if (Roles.hasRoles(Request["PositionName"]))
            {
                string name = Request["PositionName"];
                string limit = Request["limit"];
                Session["tempName"] = name;
                Session["tempLimit"] = limit;


                Response.Write("<Script Language='JavaScript'>if ( window.confirm('职位已存在，确认更新？')) {window.location.href='PositionUpdate.aspx' } else {window.location.href='#' };</script>");
            }
            else
            {
                Roles.SetRole(Request["PositionName"], Convert.ToInt32(Request["limit"]));
                Response.Redirect("~/Account/BasicInfo.aspx");
            }
            
        }
    }
}