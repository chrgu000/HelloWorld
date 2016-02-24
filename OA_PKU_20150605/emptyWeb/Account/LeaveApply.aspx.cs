using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_LeaveApply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager1.RegisterAsyncPostBackControl(reason);
        if (!IsPostBack)
        {//初次加载
            //DataSet allDep = Department.GetAllDepartment();
            //depList.DataSource = allDep.Tables[0].DefaultView;
            //depList.DataTextField = "DepartmentName";
            //depList.DataValueField = "DepartmentID";
            //depList.DataBind();

            //Users usr=(Users)Session["Identify"];
            //DataSet allPro = ProjectInfo.GetProjectByUserID(usr.UserID);
            //proManagerList.DataSource = allPro.Tables[0].DefaultView;
            //proManagerList.DataTextField = "Manager";
            //proManagerList.DataValueField = "Manager";
            //proManagerList.DataBind();
        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        OverTime oi = new OverTime();

        oi.StaffName = Request["staffName"];
        oi.Department = depList.SelectedValue;
        oi.ApplyDate = Convert.ToDateTime(applyDate.Value);
        oi.StartDate = Convert.ToDateTime(startDate.Value).Date.AddHours(Convert.ToInt32(Request["startTime"]));
        oi.EndDate = Convert.ToDateTime(endDate.Value).Date.AddHours(Convert.ToInt32(Request["endTime"]));
        oi.Reason = Request["reason"]+"!"+leaveType.SelectedValue;//请假类型
        oi.ApproveProcess = "";

        OverTime.SetOverTimeByID(-1, oi,proManagerList.SelectedValue);

        Response.Redirect("~/Account/BasicInfo.aspx");
    }

    protected void reason_TextChanged(object sender, EventArgs e)
    {
        DateTime startTime = Convert.ToDateTime(Request["startDate"]).Date.AddHours(Convert.ToInt32(Request["startTime"]));
        DateTime endTime = Convert.ToDateTime(Request["endDate"]).Date.AddHours(Convert.ToInt32(Request["endTime"]));
        TimeSpan during = endTime - startTime;
        durings.Text = "共" + during.Days + "天" + during.Hours + "时";

        this.duringsShow.Update();
    }
}