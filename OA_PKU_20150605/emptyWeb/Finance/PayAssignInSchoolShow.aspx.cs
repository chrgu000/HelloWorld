using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_PayAssignInSchoolShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int recordID = Convert.ToInt32(Request["RecordID"]);
        int applyID = Convert.ToInt32(Request["ApplyID"]);
        bool rejected = Convert.ToBoolean(Request["rejected"]);
        Apply ap = Apply.GetApplyByID(applyID);
        PayAssign pi = PayAssign.GetPayAssignByID(recordID);

        school.Text = pi.School;
        staffName.Text = pi.StaffName;
        projectName.Text = pi.ProjectName;
        payee.Text = pi.Payee;
        payed.Text = pi.Payed.ToString();
        income.Text = pi.Income.ToString();
        assigned.Text = pi.Assigned.ToString();
        instrument.Text = pi.Instrument;
        hardware.Text = pi.Hardware;
        fundingID.Text = pi.FundingID;
        management.Text = pi.Management.ToString();
        consult.Text = pi.Consult.ToString();
        labor.Text = pi.Labor.ToString();
        businessTax.Text = pi.BusinessTax.ToString();
        addedValueTax.Text = pi.AddedValueTax.ToString();
        note.Text = pi.Note;
        processShow.Text = pi.ApproveProcess;



        //用户权限相关显示功能
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!rejected && ap.NextApprover == pi.StaffName)
        {
            agreeButton.Visible = false;
            disagreeButton.Visible = false;
            whyDisagree.Visible = false;
            //可打印状态
            
        }
        else if (info.StaffName.Trim() == pi.StaffName.Trim() || info.Position.Trim() == "出纳")
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
        PayAssign pi = PayAssign.GetPayAssignByID(recordID);
        pi.ApproveProcess += info.StaffName.Trim() + "-" + if_agree + ",";
        PayAssign.SetPayAssignOutSchool(recordID, pi);
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
            case "财务主管":  result = staffName.Text; break;
            default: break;
        }
        return result;
    }







}