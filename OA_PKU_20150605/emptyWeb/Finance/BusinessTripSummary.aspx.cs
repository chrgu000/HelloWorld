using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_BusinessTripSummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "出差总结"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }

        if (!IsPostBack)
        {//首次加载才需要绑定            

            DataSet allPro = ProjectInfo.GetAllProjects();
            projectNameList.DataSource = allPro.Tables[0].DefaultView;
            projectNameList.DataTextField = "ProjectName";
            projectNameList.DataValueField = "ProjectName";
            projectNameList.DataBind();

            staffName.Text = info.StaffName;
            department.Text = info.Department;
            
        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        BusinessTripSummary bi = new BusinessTripSummary();

        bi.StaffName = staffName.Text;
        bi.DepartmentName = department.Text;
        bi.StartDate = Convert.ToDateTime(startDate.Value);
        bi.EndDate = Convert.ToDateTime(endDate.Value);

        bi.ProjectName = projectNameList.SelectedValue;
        bi.Location = location.Value;
        bi.Reason = reason.Text;
        bi.Expense = expense.Text;
        bi.Travels = travels.Text;
        bi.Finished = finished.Text;
        bi.Unfinished = unfinished.Text;        
        bi.ApproveProcess = "";

        BusinessTripSummary.SetBusinessTripApplyByID(bi,-1);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
}