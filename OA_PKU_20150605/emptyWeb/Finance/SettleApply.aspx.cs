using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_SettleApply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "统一结算申请"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }

        if (!IsPostBack)
        {           

            DataSet allPro = ProjectInfo.GetAllProjects();
            accountList.DataSource = allPro.Tables[0].DefaultView;
            accountList.DataTextField = "ProjectAccount";
            accountList.DataValueField = "ProjectAccount";
            accountList.DataBind();

            staffName.Text = info.StaffName;
            department.Text = info.Department;
            position.Text = info.Position;
        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        SettleApply si = new SettleApply();

        si.StaffName = staffName.Text;
        si.Department_str = department.Text;
        si.Position = position.Text;
        si.Reason = reason.Text;
        si.Money = Convert.ToDouble(money.Text);             
        si.SettleDate = Convert.ToDateTime(settleDate.Value);
        si.Leagal = Convert.ToBoolean(legal.SelectedValue);
        si.InnerBudget = Convert.ToBoolean(innerBudget.SelectedValue);
        si.ProjectAccount = accountList.SelectedValue;
        si.ApproveProcess = "";

        if (check_if.Checked)
            si.CheckBill = checkBill.Value;
        else
            si.CheckBill = "无合作单位";

        Users usr=(Users)Session["Identify"];
        SettleApply.SetSettleApplyByID(-1,si,usr.UserID);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
}