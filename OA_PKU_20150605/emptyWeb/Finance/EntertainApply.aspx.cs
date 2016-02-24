using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_EntertainApply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "宴请申请"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
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
        EntertainApply ei = new EntertainApply();

        ei.StaffName = Request["staffName"];
        ei.Department = depList.SelectedValue;
        ei.Manager = manager.Text;
        ei.ApplyDate = Convert.ToDateTime(applyDate.Value);
        ei.TreatDate = Convert.ToDateTime(treatDate.Value);
        ei.Reason=Request["reason"];
        ei.Treated=Request["treated"];
        ei.TreatStandard=Request["treatStandard"];
        ei.TreatStyle=Request["treatStyle"];
        ei.Budget = Convert.ToDouble(budget.Text);        
        ei.ApproveProcess = "";

        EntertainApply.SetEntertainApplyByID(-1,ei);
        Response.Redirect("~/Account/BasicInfo.aspx");
    }
    protected void depList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string manager = Department.GetDepartmentByName(depList.SelectedValue).ResponsiblePerson;
        this.managerShow.Update();

    }
}