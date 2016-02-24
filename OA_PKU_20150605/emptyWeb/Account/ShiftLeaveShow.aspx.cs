using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_ShiftLeaveShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int recordID = Convert.ToInt32(Request["RecordID"]);
        OverTime oi = OverTime.GetOverTimeByID(recordID);

        staffName.Text = oi.StaffName;
        department.Text = oi.Department;
        reason.Text = oi.Reason;
        applyDate.Text = oi.ApplyDate.ToShortDateString();
        TimeSpan span = oi.EndDate - oi.StartDate;
        durings.Text = "从" + oi.StartDate.ToShortDateString() + "到" + oi.EndDate.ToShortDateString() + "共" + span.Days + "天" + span.Hours + "时";

        processShow.Text = oi.ApproveProcess;
    }
    protected void agreeButton_Click(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        updateApprove("同意", getNextApprover(info), info, false);
    }
    protected void disagreeButton_Click(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        updateApprove("不同意", staffName.Text, info, true);
    }


    private void updateApprove(string if_agree, string next, BasicInfo info, bool if_back)
    {
        int recordID = Convert.ToInt32(Request["RecordID"]);
        Reimbursement ri = Reimbursement.GetReimbursementByID(recordID);
        ri.ApproveProcess += info.StaffName.Trim() + "-" + if_agree + ",";
        Reimbursement.SetReimbursement(recordID, ri);

        string nextApprover = next;
        Apply.UpdateNextApprover(recordID, nextApprover, if_back);
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
            case "部门经理": result = "机构负责人"; break;
            case "机构负责人": result = staffName.Text; break;
            default: break;

        }
        return result;
    }

}