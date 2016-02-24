using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_CashCheckin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CashFlowInfo ci = (CashFlowInfo)Session["CashierDetail"];
        happenDate.Text = ci.HappenDate.ToShortDateString();
        projectCode.Text = ci.ProjectCode;
        projectAccount.Text = ci.ProjectAccount;
        cashType.Text = ci.CashType;
        income.Text = ci.Income.ToString();
        expense.Text = ci.Expense.ToString();
        department.Text = ci.Department;
        summary.Text = ci.Summary;
        handler.Text = ci.Handler;

        if(!IsPostBack)
        {
            DataSet allAcc = AccountList.GetAllAccount();
            accountIDList.DataSource = allAcc.Tables[0].DefaultView;
            accountIDList.DataTextField = "AccountName";
            accountIDList.DataValueField = "AccountName";
            accountIDList.DataBind();            
        }
        

    }
    protected void agreeButton_Click(object sender, EventArgs e)
    {
        CashFlowInfo ci = (CashFlowInfo)Session["CashierDetail"];
        ci.HappenDate = DateTime.Today;//按日期指的是学校通过记账之后日期
        ci.VoucherID = voucherID.Value;
        ci.AccountID = accountIDList.SelectedValue;
        CashFlowInfo.SetCashFlow(ci,ci.RecordID);

        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
    
    
}