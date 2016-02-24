using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_EntertainApplyShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int recordID = Convert.ToInt32(Request["RecordID"]);
        int applyID = Convert.ToInt32(Request["ApplyID"]);
        bool rejected = Convert.ToBoolean(Request["rejected"]);
        Apply ap = Apply.GetApplyByID(applyID);
        EntertainApply ei = EntertainApply.GetEntertainApplyByID(recordID);

        if (!IsPostBack)
        {
            staffName.Text = ei.StaffName;
            department.Text = ei.Department;
            manager.Text = ei.Manager;
            applyDate.Text = ei.ApplyDate.ToShortDateString();
            treatDate.Text = ei.TreatDate.ToShortDateString();
            treated.Text = ei.Treated;
            treatStandard.Text = ei.TreatStandard;
            treatStyle.Text = ei.TreatStyle;
            reason.Text = ei.Reason;
            budget.Text = ei.Budget.ToString();

            processShow.Text = ei.ApproveProcess;
        }

        //用户权限相关显示功能
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!rejected && ap.NextApprover == ei.StaffName)
        {
            agreeButton.Visible = false;
            disagreeButton.Visible = false;            
            whyDisagree.Visible = false;
            //可打印状态
            financial.Text = "已签字";
            company.Text = "已签字";
        }
        else if (info.StaffName.Trim() == ei.StaffName.Trim() || info.Position.Trim() == "出纳")
        {
            agreeButton.Visible = false;
            disagreeButton.Visible = false;

            if (info.Position.Trim() != "出纳")
            {
                whyDisagree.Visible = false;
            }
        }
        //测试阶段保持处理流程可见，运行阶段记得去掉
        processShow.Visible = true;
        
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
        Users usr = (Users)Session["Identify"];
        int recordID = Convert.ToInt32(Request["RecordID"]);
        EntertainApply ei = EntertainApply.GetEntertainApplyByID(recordID);
        ei.ApproveProcess += info.StaffName.Trim() + "-" + if_agree + ",";
        EntertainApply.SetEntertainApplyByID(recordID,ei);

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
            
            case "机构负责人": result = "会计"; break;
            case "会计": result = "出纳"; break;
            case "出纳": result = staffName.Text; break;
            default: break;

        }
        return result;
    }

}