using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_MoneyApply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "资金使用审批"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }
        ScriptManager1.RegisterAsyncPostBackControl(money);
        if (!IsPostBack)
        {            

            DataSet allPro = ProjectInfo.GetAllProjects();
            projectCodeList.DataSource = allPro.Tables[0].DefaultView;
            projectCodeList.DataTextField = "ProjectName";
            projectCodeList.DataValueField = "ProjectCode";
            projectCodeList.DataBind();

            staffName.Text = info.StaffName;
            department.Text = info.Department;
            
        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        MoneyApply mi = new MoneyApply();

        mi.StaffName = staffName.Text;
        mi.Department = department.Text;
        mi.Telephone = telephone.Text;
        mi.Money = Convert.ToDouble(money.Text);
        mi.Payee = "暂无";
        mi.ProjectCode = projectCodeList.SelectedValue;
        mi.PayDate = DateTime.Today;//Convert.ToDateTime(payDate.Value);
        mi.Usage = usage.Text;
        mi.Plan = plan.Text;
        mi.Style = style.Value;
        mi.ApproveProcess = "";

        MoneyApply.SetMoneyApplyByID(-1, mi);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }


    protected void money_TextChanged(object sender, EventArgs e)
    {
        capital.Text = MoneyConvert.convertToCapital(money.Text);
        this.capitalShow.Update();
    }
}