using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_ApplyIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager1.RegisterAsyncPostBackControl(applyType);
    }
   

    protected void applyType_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch(applyType.SelectedValue)
        {
            case "财务申请": loadFinanceList(); break;
            default: loadOtherList(); break;
        }
        this.UpdatePanel1.Update(); //一定要加这句, 调用完函数后进行局部更新.
    }

    private void loadOtherList()
    {
        detailList.Items.Clear();           
        detailList.Items.Add("车辆使用登记");
        detailList.Items.Add("岗位责任书");
        detailList.Items.Add("考勤表");
        detailList.Items.Add("绩效表"); 
    }

    private void loadFinanceList()
    {
        detailList.Items.Clear();
        detailList.Items.Add("年度经费概算");
        detailList.Items.Add("到款分配-校内");
        detailList.Items.Add("到款分配-校外");	
        detailList.Items.Add("费用报销");
        detailList.Items.Add("出差申请");
        detailList.Items.Add("出差报销");
        detailList.Items.Add("出差总结");
        detailList.Items.Add("办公用品申购");
        detailList.Items.Add("资金使用审批");
        detailList.Items.Add("合同审批");
        detailList.Items.Add("员工用餐");
        detailList.Items.Add("固定资产报修");
        detailList.Items.Add("统一结算申请");        
        detailList.Items.Add("工资表");
    }
    protected void redictButton_Click(object sender, EventArgs e)
    {
        switch (detailList.SelectedValue)
        {
            case "费用报销": Response.Redirect("~/Finance/ProjectReimbursement.aspx"); break;
            case "到款分配-校外": Response.Redirect("~/Finance/PayAssign.aspx"); break;
            case "到款分配-校内": Response.Redirect("~/Finance/PayAssignInSchool.aspx"); break;
            case "年度经费概算": Response.Redirect("~/Finance/YearlyBudget.aspx"); break;
            case "出差申请": Response.Redirect("~/Finance/BusinessTripApply.aspx"); break;
            case "出差报销": Response.Redirect("~/Finance/BunisessTripRei.aspx"); break;
            case "出差总结": Response.Redirect("~/Finance/BusinessTripSummary.aspx"); break;
            case "加班申请": Response.Redirect("~/Account/OverTime.aspx"); break;
            case "调休申请": Response.Redirect("~/Account/ShiftLeave.aspx"); break;
            case "请假": Response.Redirect("~/Account/LeaveApply.aspx"); break;
            case "办公用品申购": Response.Redirect("~/Finance/OfficeSupplyApply.aspx"); break;
            case "员工转正": Response.Redirect("~/Account/ConversionApply.aspx"); break;
            case "员工考核": Response.Redirect("#"); break;
            case "离职申请": Response.Redirect("~/Account/DismissApply.aspx"); break;
            case "资金使用审批": Response.Redirect("~/Finance/MoneyApply.aspx"); break;
            case "合同审批": Response.Redirect("~/Finance/ContractApply.aspx"); break;
            case "宴请申请": Response.Redirect("~/Finance/EntertainApply.aspx"); break;
            case "员工用餐": Response.Redirect("~/Finance/StaffMealApply.aspx"); break;
            case "固定资产报修": Response.Redirect("~/Finance/RepairApply.aspx"); break;
            case "统一结算申请": Response.Redirect("~/Finance/SettleApply.aspx"); break;
            
            case "车辆使用登记": Response.Redirect("~/Account/CarUse.aspx"); break;
            case "工资表": Response.Redirect("~/Finance/SalaryMonth.aspx"); break;
            case "考勤表": Response.Redirect("~/Account/CheckInMonth.aspx"); break;
            case "绩效表": Response.Redirect("~/Account/PerformanceMonth.aspx"); break;
            case "岗位责任书": Response.Redirect("~/Account/PositionTarget.aspx"); break;
            default: Response.Redirect("~/Account/BasicInfo.aspx"); break;

        }
    }
}