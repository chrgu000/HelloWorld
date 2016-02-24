using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_BusinessTripApply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "出差申请"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }
        ScriptManager1.RegisterAsyncPostBackControl(projectNameList);
        if (!IsPostBack)
        {//首次加载才需要绑定            

            DataSet allPro = ProjectInfo.GetAllProjects();
            projectNameList.DataSource = allPro.Tables[0].DefaultView;
            projectNameList.DataTextField = "ProjectName";
            projectNameList.DataValueField = "ProjectName";
            projectNameList.DataBind();
            accountList.DataSource = allPro.Tables[0].DefaultView;
            accountList.DataTextField = "ProjectAccount";
            accountList.DataValueField = "ProjectAccount";
            accountList.DataBind();

            accountList.SelectedValue = ProjectInfo.GetProjectInfoByName(projectNameList.SelectedValue).ProjectAccount;

            staffName.Text = info.StaffName;
            department.Text = info.Department;
            applyDate.Text = DateTime.Today.ToShortDateString();
        
        }
    }
    protected void projectNameList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string temp = ProjectInfo.GetProjectInfoByName(projectNameList.SelectedValue).ProjectAccount;
        accountList.SelectedValue = temp;
        this.UpdatePanel1.Update(); //一定要加这句, 调用完函数后进行局部更新. 
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        BusinessTripApply bi = new BusinessTripApply();

        bi.StaffName = staffName.Text;
        bi.Department = department.Text;
        bi.ApplyDate = Convert.ToDateTime(applyDate.Text);
        bi.StartDate = Convert.ToDateTime(startDate.Value);
        bi.EndDate = Convert.ToDateTime(endDate.Value);

        bi.ProjectName = projectNameList.SelectedValue;
        bi.ProjectAccount = accountList.SelectedValue;
        bi.Reason = reason.Text;
        bi.Traffic = traffic.Text;
        bi.Cars = cars.Text;
        bi.Hotel = hotels.Text;
        bi.Meal = meal.Text;
        bi.Others = others.Text;
        bi.MoneyEstimate = Convert.ToDouble(moneyEstimate.Text);
        bi.ApproveProcess = "";

        BusinessTripApply.SetBusinessTripApplyByID(bi,-1);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
}