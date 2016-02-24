using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_SalaryShow : System.Web.UI.Page
{
    double allCash = 0.0;
    protected void Page_Load(object sender, EventArgs e)
    {
        int recordID = Convert.ToInt32(Request["RecordID"]);
        int applyID = Convert.ToInt32(Request["ApplyID"]);
        bool rejected = Convert.ToBoolean(Request["rejected"]);
        Apply ap = Apply.GetApplyByID(applyID);
        SalaryApply si = SalaryApply.GetSalaryApplyByID(recordID);
        
        if(!IsPostBack)
        {
            salaryList.Text = transResult(si.StaffSalaryList, ref allCash);
        }

        //用户权限相关显示功能
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!rejected && ap.NextApprover == si.StaffName)
        {
            agreeButton.Visible = false;
            disagreeButton.Visible = false;
            cashierButton.Visible = false;
            rejectButton.Visible = false;
            whyDisagree.Visible = false;
            //可打印状态
            proManager.Text = "已签字";
            depManager.Text = "已签字";
            financial.Text = "已签字";
            company.Text = "已签字";
        }
        else if (info.StaffName.Trim() == si.StaffName.Trim() || info.Position.Trim() == "出纳")
        {
            agreeButton.Visible = false;
            disagreeButton.Visible = false;
            
            if (info.Position.Trim() != "出纳")
            {
                cashierButton.Visible = false;
                rejectButton.Visible = false;
                whyDisagree.Visible = false;
            }
        }
        else if (info.Position.Trim() == "会计")
        {
            
            cashierButton.Visible = false;
            rejectButton.Visible = false;
        }
        else
        {
            
            cashierButton.Visible = false;
            rejectButton.Visible = false;
        }
        //测试阶段保持处理流程可见，运行阶段记得去掉
        processShow.Visible = true;
    }
    /// <summary>
    /// 将结果转换为html代码
    /// </summary>
    /// <param name="list"></param>
    /// <returns></returns>
    private string transResult(List<SalaryDetail> list, ref double allCash)
    {

        StringBuilder buff = new StringBuilder();
        int count = 1;
        foreach (SalaryDetail cc in list)
        {
            buff.Append(string.Format("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td><td>{10}</td><td>{11}</td><td>{12}</td><td>{13}</td><td>{14}</td><td>{15}</td><td>{16}</td><td>{17}</td><td>{18}</td><td>{19}</td><tr>",
                count,cc.Department,cc.StaffName,
                cc.BasicSalary,cc.PerformanceSalary,cc.PerformanceSalary*0.2,cc.OtherWithHold,cc.OtherBonus,cc.BasicSalary+cc.PerformanceSalary+cc.OtherBonus-cc.OtherWithHold-cc.PerformanceSalary*0.2,
                cc.Endowment,cc.Unemployed,cc.Medical,cc.House,cc.Endowment+cc.Unemployed+cc.Medical+cc.House,
                cc.TaxIncome,
                cc.TaxRate,cc.QuickMinus,cc.Tax,
                cc.Income,
                cc.Remark));
            ++count;
            allCash += cc.Income;
        }

        string temp = buff.ToString();
        return temp;


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
        int recordID = Convert.ToInt32(Request["RecordID"]);
        SalaryApply si = SalaryApply.GetSalaryApplyByID(recordID); 

        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);     
        updateApprove("不同意," + whyDisagree.Text, si.StaffName, info, true);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
    protected void cashierButton_Click(object sender, EventArgs e)
    {
        CashFlowInfo tran = new CashFlowInfo();
        int recordID = Convert.ToInt32(Request["RecordID"]);
        tran.RecordID = recordID;
        tran.HappenDate = DateTime.Today;
        tran.ProjectCode = "";
        tran.ProjectAccount = "";
        tran.CashType = "工资表";
        tran.Income = 0;
        tran.Expense = allCash;
        tran.Department = "";
        tran.Summary = "";
        tran.Remark = "";
        tran.Handler = "";

        Session["CashierDetail"] = tran;

        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        updateApprove("同意", getNextApprover(info), info, false);

        Response.Redirect("~/Finance/CashCheckin.aspx");
    }
    protected void rejectButton_Click(object sender, EventArgs e)
    {
        int recordID = Convert.ToInt32(Request["RecordID"]);
        SalaryApply si = SalaryApply.GetSalaryApplyByID(recordID);

        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        updateApprove("不同意," + whyDisagree.Text, si.StaffName, info, true);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
    private void updateApprove(string if_agree, string next, BasicInfo info, bool if_back)
    {
        Users usr = (Users)Session["Identify"];
        int recordID = Convert.ToInt32(Request["RecordID"]);
        SalaryApply si = SalaryApply.GetSalaryApplyByID(recordID);        
        si.ApproveProcess += info.StaffName.Trim() + "-" + if_agree + ",";
        SalaryApply.SetSalaryApplyByID(recordID,si);

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
        int recordID = Convert.ToInt32(Request["RecordID"]);
        SalaryApply si = SalaryApply.GetSalaryApplyByID(recordID);

        string result = null;
        switch (info.Position.Trim())
        {           
            case "财务主管": result = "机构负责人"; break;
            case "机构负责人": result = "会计"; break;
            case "会计": result = "出纳"; break;
            case "出纳": result = si.StaffName; break;
            default: break;

        }
        return result;
    }

}