using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_ConversionApplyShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int recordID = Convert.ToInt32(Request["RecordID"]);
        ConversionApply ci = ConversionApply.GetConversionApplyByID(recordID);

        staffName.Text = ci.StaffName;
        department.Text = ci.Department_str;
        education.Text = ci.Education;
        startDate.Text = ci.StartDate.ToShortDateString();
        applyDate.Text = ci.ApplyDate.ToShortDateString();
        level.Text = ci.Level;
        salaryLevel.Text = ci.SalaryLevel;
        summary.Text = ci.Summary;
        processShow.Text = ci.ApproveProcess;
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
        Users usr=(Users)Session["Identify"];
        int recordID = Convert.ToInt32(Request["RecordID"]);
        ConversionApply ci = ConversionApply.GetConversionApplyByID(recordID);
        ci.ApproveProcess += info.StaffName.Trim() + "-" + if_agree + ",";
        ConversionApply.SetConversionApplyByID(recordID,ci,usr.UserID);

        string nextApprover = next;
        int applyID = Convert.ToInt32(Request["ApplyID"]);
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
            case "部门经理": result = BasicInfo.GetBUByUserID(info.StaffID).ResponsiblePerson; break;
            case "事业部经理":    result = "机构负责人"; break;
            case "机构负责人": result = staffName.Text; break;
            default: break;

        }
        return result;
    }
}