using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_OfficeSupplyApplyShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int recordID = Convert.ToInt32(Request["RecordID"]);
        int applyID = Convert.ToInt32(Request["ApplyID"]);
        bool rejected = Convert.ToBoolean(Request["rejected"]);
        Apply ap = Apply.GetApplyByID(applyID);
        OfficeSupplyApply oi = OfficeSupplyApply.GetOfficeSupplyApplyByID(recordID);

        staffName.Text = oi.StaffName;
        department.Text = oi.Department;
        reason.Text = oi.Reason;
        applyDate.Text = oi.ApplyDate.ToShortDateString();
        
        

        processShow.Text = oi.ApproveProcess;

        double money = 0.0;
        supplyList.Text = transResult(oi.OfficeList, ref money);
        allExpensive.Text = money.ToString();
        allExpensiveUpper.Text = MoneyConvert.convertToCapital(money.ToString());

        //用户权限相关显示功能
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!rejected && ap.NextApprover == oi.StaffName)
        {
            agreeButton.Visible = false;
            disagreeButton.Visible = false;            
            whyDisagree.Visible = false;
            //可打印状态
            proManager.Text = "已签字";
            depManager.Text = "已签字";
            counter.Text = "已签字";
            cashier.Text = "已签字";
            company.Text = "已签字";
        }
        else if (info.StaffName.Trim() == oi.StaffName.Trim())
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
    /// <summary>
    /// 将结果转换为html代码
    /// </summary>
    /// <param name="list"></param>
    /// <returns></returns>
    private string transResult(List<OfficeSupplySingle> list, ref double money)
    {
        
        StringBuilder buff = new StringBuilder();      

        foreach (OfficeSupplySingle cc in list)
        {
            buff.Append(string.Format("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><tr>", cc.Name, cc.Version, cc.Price, cc.Counter, cc.Price*cc.Counter)); 
            money += cc.Counter * cc.Price;
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
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        updateApprove("不同意," + whyDisagree.Text, staffName.Text, info, true);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }


    private void updateApprove(string if_agree, string next, BasicInfo info, bool if_back)
    {
        Users usr = (Users)Session["Identify"];
        int recordID = Convert.ToInt32(Request["RecordID"]);
        OfficeSupplyApply oi = OfficeSupplyApply.GetOfficeSupplyApplyByID(recordID);
        oi.ApproveProcess += info.StaffName.Trim() + "-" + if_agree + ",";
        OfficeSupplyApply.SetOfficeSupplyApplyByID(recordID,oi,proManager.Text);

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
            case "项目经理": result = Department.GetDepartmentByName(department.Text).ResponsiblePerson; break; 
            case "部门经理": result = "财务主管"; break;
            case "财务主管": result = Department.GetDepartmentByName(department.Text).BULeader; break;
            case "机构负责人": result = "会计"; break;
            case "会计": result = "出纳"; break;
            case "出纳": result = staffName.Text; break;
            default: break;

        }
        return result;
    }




}