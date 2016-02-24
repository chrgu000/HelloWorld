using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DepartmentAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "组织管理"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }
        if (!IsPostBack)
        {//初次加载
            DataSet allBU = BusinessUnit.GetAllBU();
            buList.DataSource = allBU.Tables[0].DefaultView;
            buList.DataTextField = "UnitName";
            buList.DataValueField = "UnitID";
            buList.DataBind();
        }
        else {
            if (Department.hasDepartmentInfo(Request["departmentName"].Trim()))
            {
                string name = Request["departmentName"];
                string boss = Request["boss"];
                string leader = Request["leader"];
                Session["tempName"] = name;
                Session["tempBoss"] = boss;
                Session["tempLeader"] = leader;
                Session["tempParent"] = buList.SelectedValue;

                Response.Write("<Script Language='JavaScript'>if ( window.confirm('部门已存在，确认更新？')) {window.location.href='DepartmentUpdate.aspx' } else {window.location.href='#' };</script>");
            
            }
            else
            {
                Department.SetDepartment(Request["departmentName"], Convert.ToInt32(buList.SelectedValue), Request["boss"], Request["leader"]);
                Response.Redirect("~/Account/BasicInfo.aspx");
            }
            
        }
    }
    

}