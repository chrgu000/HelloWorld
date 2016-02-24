using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_PayAssign : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "到款分配"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }


        if (!IsPostBack)
        {//首次加载才需要绑定
            DataSet allPro = ProjectInfo.GetAllProjects();
            projectNameList.DataSource = allPro.Tables[0].DefaultView;
            projectNameList.DataTextField = "ProjectName";
            projectNameList.DataValueField = "ProjectName";
            projectNameList.DataBind();

            staffName.Text = info.StaffName;
            
        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        PayAssign pi = new PayAssign();

        pi.School = schoolList.SelectedValue;
        pi.ProjectName = projectNameList.SelectedValue;
        pi.StaffName = staffName.Text;
        pi.Payee = payee.Value;
        pi.Payed = Convert.ToDouble(payed.Text);
        pi.Income = Convert.ToDouble(income.Text);
        pi.Assigned = Convert.ToDouble(assigned.Text);
        pi.Instrument = instrument.Text;
        pi.Hardware = hardware.Text;
        pi.FundingID = fundingID.Value;

        pi.ToUniversity = Convert.ToDouble(toUniversity.Text);
        pi.ToUniversityDetail = toUniversityDetail.Value;
        pi.ToSchool = Convert.ToDouble(toSchool.Text);
        pi.ToSchoolDetail = toSchoolDetail.Value;
        pi.Fundings = Convert.ToDouble(fundings.Text);
        pi.FundingsDetail = fundingsDetail.Value;
        pi.Welfare = Convert.ToDouble(welfare.Text);
        pi.WelfareDetail = welfareDetail.Value;
        pi.Note = note.Text;
        pi.ApproveProcess = "";

        PayAssign.SetPayAssignOutSchool(-1,pi);


        CashFlowInfo tran = new CashFlowInfo();
        int recordID = Convert.ToInt32(Request["RecordID"]);
        tran.RecordID = recordID;
        tran.HappenDate = Convert.ToDateTime(DateTime.Today);
        tran.ProjectCode = ProjectInfo.GetProjectInfoByName(pi.ProjectName).ProjectCode;
        tran.ProjectAccount = ProjectInfo.GetProjectInfoByName(pi.ProjectName).ProjectAccount;
        tran.CashType = "到款分配-校外";
        tran.Income = pi.Income;
        tran.Expense = 0;
        tran.Department = "";
        tran.Summary = "";
        tran.Remark = "";
        tran.Handler = pi.StaffName;
        tran.AccountID = "应收账款";
        tran.VoucherID = "暂无";
        CashFlowInfo.SetCashFlow(tran, tran.RecordID);


        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
}