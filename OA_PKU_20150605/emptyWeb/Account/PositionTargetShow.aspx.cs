using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_PositionTargetShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        int recordID = Convert.ToInt32(Request["RecordID"]);
        int applyID = Convert.ToInt32(Request["ApplyID"]);
        bool rejected = Convert.ToBoolean(Request["rejected"]);
        Apply ap = Apply.GetApplyByID(applyID);
        PositionTarget pi = PositionTarget.GetTargetByID(recordID);
        staffName.Text = pi.StaffName;
        position.Text = pi.Position;
        department.Text = pi.Department;
        formerPosition.Text = pi.FormerPosition;
        leader.Text = pi.Leader;
        year.Text = string.Format("{0}.1.1~{1}.12.31",pi.Year,pi.Year);
        newPosition.Text = pi.NewPosition;
        duty.Text = pi.Duty.Replace("\n", "<br>").Replace(" ", "& nbsp;");
        target.Text = pi.Target.Replace("\n", "<br>").Replace(" ", "& nbsp;"); ;
        salaryLevel.Text = pi.SalaryLevel;
        processShow.Text = pi.ApproveProcess;

        string[] words = pi.MonthlyIncome.Split(',');
        january.Text=words[0];
        february.Text=words[1];
        march.Text=words[2];
        april.Text=words[3];
        may.Text=words[4];
        june.Text=words[5];
        july.Text=words[6];
        august.Text=words[7];
        september.Text=words[8];
        october.Text=words[9];
        november.Text=words[10];
        december.Text=words[11];

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
        else if (info.StaffName.Trim() == pi.StaffName.Trim())
        {
            agreeButton.Visible = false;
            disagreeButton.Visible = false;           
            whyDisagree.Visible = false;

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
        Users usr = (Users)Session["Identify"];
        int recordID = Convert.ToInt32(Request["RecordID"]);
        PositionTarget pi = PositionTarget.GetTargetByID(recordID);
        pi.ApproveProcess += info.StaffName.Trim() + "-" + if_agree + ",";
        PositionTarget.SetPositionTargetByID(recordID,pi);

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
        result = staffName.Text;
        return result;
    }

}