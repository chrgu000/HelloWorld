using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_StaffMealApply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "员工用餐申请"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }

        if (!IsPostBack)
        {
            staffName.Text = info.StaffName;
            department.Text = info.Department;
            position.Text = info.Position;
        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        StaffMealApply si = new StaffMealApply();

        si.StaffName = staffName.Text;
        si.DepartmentName = department.Text;
        si.Position = position.Text;
        si.Reason = reason.Value;
        si.Persons = Convert.ToInt16(persons.Value);
        si.Money = Convert.ToDouble(money.Text);
        si.Standard = standard.Value;
        si.MealDate = Convert.ToDateTime(mealDate.Value);
        si.Legal = Convert.ToBoolean(legal.SelectedValue);
        si.Style = Convert.ToBoolean(style.SelectedValue);
        si.ApproveProcess = "";

        Users usr = (Users)Session["Identify"];
        StaffMealApply.SetStaffMealApplyByID(-1,si);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
}