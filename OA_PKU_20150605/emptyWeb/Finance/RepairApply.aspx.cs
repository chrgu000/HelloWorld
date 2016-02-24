using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_RepairApply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "固定资产报修"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }

        if (!IsPostBack)
        {
            staffName.Text = info.StaffName;
            department.Text = info.Department;            
        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        RepairApply ri = new RepairApply();

        ri.EquipmentName = equipmentName.Value;
        ri.EquipmentType = equipmentType.Value;
        ri.StaffName = staffName.Text;
        ri.DepartmentName = department.Text;
        ri.BuyDate = Convert.ToDateTime(buyDate.Value);
        ri.BugDate = Convert.ToDateTime(bugDate.Value);
        ri.SentToRepair = Convert.ToDateTime(sentToRepair.Value);
        ri.BugDetail = bugDetail.Text;
        ri.FixDate = Convert.ToDateTime(fixDate.Value);
        ri.DuringGuarantee = !Convert.ToBoolean(duringGuarantee.SelectedIndex);
        ri.RepairSelf = !Convert.ToBoolean(RepairSelf.SelectedIndex);
        ri.Budget = Convert.ToDouble(budget.Text);
        ri.SettleType = settleType.SelectedValue=="签单"?Request["checkBill"]:settleType.SelectedValue;
        ri.ApproveProcess = "";

        RepairApply.SetRepairApplyByID(-1,ri);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
}