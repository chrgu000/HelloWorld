using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_ConversionApply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "转正申请"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='ApplyListPage.aspx'</script>");
        }
        if (!IsPostBack)
        {
            DataSet allDep = Department.GetAllDepartment();
            depList.DataSource = allDep.Tables[0].DefaultView;
            depList.DataTextField = "DepartmentName";
            //depList.DataValueField = "DepartmentID";
            depList.DataValueField = "DepartmentName";
            depList.DataBind();

            
        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        ConversionApply ci = new ConversionApply();

        ci.StaffName = Request["staffName"];
        ci.Department_str = depList.SelectedValue;
        ci.Education=Request["education"];
        ci.ApplyDate = Convert.ToDateTime(Request["applyDate"]);
        ci.StartDate = Convert.ToDateTime(Request["startDate"]);
        ci.Level=Request["level"];
        ci.SalaryLevel=Request["salaryLevel"];
        ci.Summary=Request["summary"];
       
        ci.ApproveProcess = "";

        Users usr = (Users)Session["Identify"];
        ConversionApply.SetConversionApplyByID(-1,ci,usr.UserID);
        Response.Redirect("~/Account/BasicInfo.aspx");
    }
}