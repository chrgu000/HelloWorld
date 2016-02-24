using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_BusinessTripReiShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int recordID = Convert.ToInt32(Request["RecordID"]);
        int applyID = Convert.ToInt32(Request["ApplyID"]);
        bool rejected = Convert.ToBoolean(Request["rejected"]);
        Apply ap = Apply.GetApplyByID(applyID);
        BusinessTripRei bi = BusinessTripRei.GetBusinessTripReiByID(recordID);
        if (!IsPostBack)
        {
            DataSet allPro = ProjectInfo.GetAllProjects();
            accountList.DataSource = allPro.Tables[0].DefaultView;
            accountList.DataTextField = "ProjectAccount";
            accountList.DataValueField = "ProjectAccount";
            accountList.DataBind();



            staffName.Text = bi.StaffName;
            department.Text = bi.Department;
            applyDate.Text = bi.ApplyDate.ToShortDateString();
            startDate.Text = bi.StartDate.ToShortDateString();
            endDate.Text = bi.EndDate.ToShortDateString();
            projectName.Text = bi.ProjectName;
            accountList.SelectedValue = bi.ProjectAccount;
            reason.Text = bi.Reason;
            traffic.Text = bi.Traffic;
            cars.Text = bi.Cars;
            hotel.Text = bi.Hotel;
            meal.Text = bi.Meal;
            others.Text = bi.Others;
            moneyEstimate.Text = bi.MoneyEstimate.ToString();
            moneyRei.Text = bi.MoneyRei.ToString();
            processShow.Text = bi.ApproveProcess;

            accountList.SelectedValue = bi.ProjectAccount;
        }
        //用户权限相关显示功能
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!rejected && ap.NextApprover == bi.StaffName)
        {
            agreeButton.Visible = false;
            disagreeButton.Visible = false;
            cashierButton.Visible = false;
            rejectButton.Visible = false;
            whyDisagree.Visible = false;
            accountList.Enabled = false;
            //可打印状态
            proManager.Text = "已签字";
            depManager.Text = "已签字";
            financial.Text = "已签字";
            company.Text = "已签字";
        }
        else if (info.StaffName.Trim() == bi.StaffName.Trim() || info.Position.Trim() == "出纳")
        {
            agreeButton.Visible = false;
            disagreeButton.Visible = false;

            accountList.Enabled = false;
            if (info.Position.Trim() != "出纳")
            {
                cashierButton.Visible = false;
                rejectButton.Visible = false;
                whyDisagree.Visible = false;
            }
        }
        else if (info.Position.Trim() == "会计")
        {
            accountList.Enabled = true;
            cashierButton.Visible = false;
            rejectButton.Visible = false;
        }
        else
        {
            accountList.Enabled = false;
            cashierButton.Visible = false;
            rejectButton.Visible = false;
        }
        //测试阶段保持处理流程可见，运行阶段记得去掉
        processShow.Visible = true;
    }
    protected void agreeButton_Click(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        updateApprove("同意", getNextApprover(info), info, false);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
    protected void disagreeButton_Click(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        updateApprove("不同意," + whyDisagree.Text, staffName.Text, info, true);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
    private void updateApprove(string if_agree, string next, BasicInfo info, bool if_back)
    {
        //更新审批流程
        int recordID = Convert.ToInt32(Request["RecordID"]);
        BusinessTripRei bi = BusinessTripRei.GetBusinessTripReiByID(recordID);
        bi.ApproveProcess += info.StaffName.Trim() + "-" + if_agree + ",";
        bi.ProjectAccount = accountList.SelectedValue;
        BusinessTripRei.SetBusinessTripRei(bi, recordID);
       
        //更新下一审批人
        int applyID = Convert.ToInt32(Request["ApplyID"]);
        string nextApprover = next;
        Apply.UpdateNextApprover(applyID, nextApprover, if_back);

    }
    /// <summary>
    /// 根据当前审批人，获取下一审批人职位
    /// </summary>
    /// <param name="info"></param>
    /// <returns></returns>
    private string getNextApprover(BasicInfo info)
    {       
        string result = null;
        switch (info.Position.Trim())
        {
            case "项目经理": result = Department.GetDepartmentByName(department.Text).ResponsiblePerson; break;
            case "部门经理": result = "财务主管"; break; //result = BasicInfo.GetDepartmentManager(info.StaffID);
            case "财务主管": result = judgeAdjust("财务主管",department.Text); break;
            case "机构负责人":result = "会计";break;            
            case "会计": result = judgeAdjust("会计",department.Text); break;
            case "出纳": result = staffName.Text; break;
            default: break;

        }
        return result;
    }
    /// <summary>
    /// 若账号调整，需要再经过财务主管审核
    /// </summary>
    /// <returns></returns>
    private string judgeAdjust(string position,string department)
    {
        int recordID = Convert.ToInt32(Request["RecordID"]);
        BusinessTripRei bi = BusinessTripRei.GetBusinessTripReiByID(recordID);
        string originalAccount = ProjectInfo.GetProjectInfoByName(projectName.Text).ProjectAccount;
        if (originalAccount == accountList.SelectedValue)
        {
            if (position == "会计"||bi.ApproveProcess.Contains("财务主管"))
                return "出纳";
            else
                return Department.GetDepartmentByName(department).BULeader; 

        }
        else
        {
            if (position == "会计")
                return "财务主管";
            else
                return "出纳";
        }
    }


    protected void cashierButton_Click(object sender, EventArgs e)
    {
        CashFlowInfo tran = new CashFlowInfo();
        int recordID = Convert.ToInt32(Request["RecordID"]);
        tran.RecordID = recordID;
        tran.HappenDate = DateTime.Today;
        tran.ProjectCode = ProjectInfo.GetProjectInfoByName(projectName.Text).ProjectCode;
        tran.ProjectAccount = accountList.SelectedValue;
        tran.CashType = "出差报销";
        tran.Income = 0;
        tran.Expense = Convert.ToDouble(moneyRei.Text);
        tran.Department = department.Text;
        tran.Summary = "";
        tran.Remark = "";
        tran.Handler = staffName.Text;

        Session["CashierDetail"] = tran;

        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        updateApprove("同意", getNextApprover(info), info, false);

        Response.Redirect("~/Finance/CashCheckin.aspx");
    }
    protected void rejectButton_Click(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        updateApprove("不同意", staffName.Text, info, true);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
}