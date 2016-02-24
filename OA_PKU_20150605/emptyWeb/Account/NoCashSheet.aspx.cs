using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_NoCashSheet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlcmd = Request["SqlCmd"];
        List<Apply> allApplies = Apply.GetFilerResult(sqlcmd);
        StringBuilder buff = new StringBuilder();
        int counter = 1;

        foreach (Apply ap in allApplies)
        {
            if (counter % 2 == 0)
                buff.Append("<tr class=\"RowA\">");
            else
                buff.Append("<tr class=\"RowB\">");
            switch (ap.ApplyType)
            {
                case "费用报销": buff.Append(string.Format("<td><a href=\"../Finance/ProjectReimbursementShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "到款分配-校内": buff.Append(string.Format("<td><a href=\"../Finance/PayAssignInSchoolShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "到款分配-校外": buff.Append(string.Format("<td><a href=\"../Finance/PayAssignShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "出差报销": buff.Append(string.Format("<td><a href=\"../Finance/BusinessTripReiShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "出差申请": buff.Append(string.Format("<td><a href=\"../Finance/BusinessTripApplyShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "出差总结报告": buff.Append(string.Format("<td><a href=\"../Finance/BusinessTripApplyShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "车辆使用登记": buff.Append(string.Format("<td><a href=\"../Account/CarUseShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "合同审批": buff.Append(string.Format("<td><a href=\"../Finance/ContractApplyShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "员工转正申请": buff.Append(string.Format("<td><a href=\"../Finance/ConversionApplyShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "离职申请": buff.Append(string.Format("<td><a href=\"../Finance/DismissApplyShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "宴请申请": buff.Append(string.Format("<td><a href=\"../Finance/EntertainApplyShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "资金使用审批": buff.Append(string.Format("<td><a href=\"../Finance/MoneyApplyShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "办公用品申购": buff.Append(string.Format("<td><a href=\"../Finance/OfficeSupplyApplyShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "加班申请": buff.Append(string.Format("<td><a href=\"../Finance/OverTimeShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "调休申请": buff.Append(string.Format("<td><a href=\"../Finance/ShiftLeaveShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "请假": buff.Append(string.Format("<td><a href=\"../Finance/LeaveApplyShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "统一结算申请": buff.Append(string.Format("<td><a href=\"../Finance/SettleApplyShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "固定资产保修申请": buff.Append(string.Format("<td><a href=\"../Finance/RepairApplyShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "员工用餐申请": buff.Append(string.Format("<td><a href=\"../Finance/StaffMealApplyShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "工资表": buff.Append(string.Format("<td><a href=\"../Finance/SalaryShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "绩效表": buff.Append(string.Format("<td><a href=\"../Finance/SalaryShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "考勤表": buff.Append(string.Format("<td><a href=\"../Finance/SalaryShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                case "岗位责任书": buff.Append(string.Format("<td><a href=\"../Account/PositionTargetShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td>", ap.RecordID, ap.ApplyID, true, counter, ap.ApplyType, ap.StaffName, ap.ApplyDate.ToShortDateString())); break;
                default: break;
            }

            buff.Append("</tr>");
            ++counter;
        }
        string temp = buff.ToString();
        UserRowsTemp.Text = buff.ToString();
    }

    
}