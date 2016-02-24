using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_ProjectReimbursement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "费用报销"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }

        ScriptManager1.RegisterAsyncPostBackControl(projectCodeList);
        ScriptManager1.RegisterAsyncPostBackControl(allExpense);
        if (!IsPostBack)
        {
            DataSet allPro = ProjectInfo.GetAllProjects();
            projectCodeList.DataSource = allPro.Tables[0].DefaultView;
            projectCodeList.DataTextField = "ProjectName";
            projectCodeList.DataValueField = "ProjectCode";
            projectCodeList.DataBind();

            staffName.Text = info.StaffName;
            department.Text = info.Department;
            applyDate.Text = DateTime.Today.ToShortDateString();
            manager.Text = ProjectInfo.getProjectInfoByCode(projectCodeList.SelectedValue).Manager;
            
                        
            
        }
       
    }

    protected void projectCodeList_SelectedIndexChanged(object sender, EventArgs e)
    {
        ProjectInfo pi = ProjectInfo.getProjectInfoByCode(projectCodeList.SelectedValue);
        manager.Text = pi.Manager;
        this.UpdatePanel1.Update(); //一定要加这句, 调用完函数后进行局部更新.        
    }

    protected void allExpense_TextChanged(object sender, EventArgs e)
    {
        capital.Text = MoneyConvert.convertToCapital(allExpense.Text);
        this.capitalShow.Update();
    }
    protected void redictor_Click(object sender, EventArgs e)
    {
        Reimbursement ri = new Reimbursement();

        ri.StaffName = staffName.Text;
        ri.Department = department.Text;
        ri.Manager = manager.Text ;
        ri.Payee = Request["payee"];
        ri.ProjectCode = projectCodeList.SelectedValue;
        ri.ProjectAccount = ProjectInfo.getProjectInfoByCode(ri.ProjectCode).ProjectAccount;
        ri.HappenDate = Convert.ToDateTime(happenDate.Value);
        ri.ReimburestDate = Convert.ToDateTime(applyDate.Text);
        
        ri.Bill = Convert.ToInt32(bill.Value);
        ri.Expense = Convert.ToDouble(expense.Text);
        ri.AllExpense = Convert.ToDouble(allExpense.Text);
        ri.Remark = remarkBox.Text;
        ri.Note = Request["note"];
        ri.ApproveProcess = "";

        Reimbursement.SetReimbursement(-1,ri);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
}