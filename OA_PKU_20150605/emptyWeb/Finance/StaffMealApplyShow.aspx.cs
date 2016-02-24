using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_StaffMealApplyShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int recordID = Convert.ToInt32(Request["RecordID"]);
        int applyID = Convert.ToInt32(Request["ApplyID"]);
        bool rejected = Convert.ToBoolean(Request["rejected"]);
        Apply ap = Apply.GetApplyByID(applyID);
        StaffMealApply si = StaffMealApply.GetStaffMealApplyByID(recordID);

        staffName.Text = si.StaffName;
        department.Text = si.DepartmentName;
        position.Text = si.Position;
        mealDate.Text = si.MealDate.ToShortDateString();
        reason.Text = si.Reason;
        persons.Text = si.Persons.ToString();
        money.Text = si.Money.ToString();
        legal.SelectedIndex = si.Legal == true ? 0 : 1;
        style.SelectedIndex = si.Style == true ? 0 : 1;
        standard.Text = si.Standard;
        processShow.Text = si.ApproveProcess;

        //用户权限相关显示功能
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!rejected && ap.NextApprover == si.StaffName)
        {
            agreeButton.Visible = false;
            disagreeButton.Visible = false;
            whyDisagree.Visible = false;
            //可打印状态
            depManager.Text = "已签字";
            company.Text = "已签字";
        }
        else if (info.StaffName.Trim() == si.StaffName.Trim() || info.Position.Trim() == "出纳")
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
        Users usr = (Users)Session["Identify"];
        int recordID = Convert.ToInt32(Request["RecordID"]);
        StaffMealApply si = StaffMealApply.GetStaffMealApplyByID(recordID);
        si.ApproveProcess += info.StaffName.Trim() + "-" + if_agree + ",";
        StaffMealApply.SetStaffMealApplyByID(recordID,si);

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
            case "部门经理": result = Department.GetDepartmentByName(department.Text).BULeader; break; 
            case "机构负责人": result = "会计"; break;
            case "会计": result = "出纳"; break;
            case "出纳": result = staffName.Text; break;
            default: break;

        }
        return result;
    }




}