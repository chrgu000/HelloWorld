using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_ProjectAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "新建项目"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }


        if (IsPostBack)
        {
            string name = projectName.Value;
            string code = projectCode.Value;
            string manager = manager_txt.Value;
            string projectAccount = projectAccount_txt.Value;
            string budget = budget_txt.Value;
            string collected = collected_txt.Value;
            string applyDate = DateTime.Today.ToShortDateString();
            string members = memberList.Text;
            string remark = remarkBox.Text;
            string department = depList.SelectedValue;

            if (ProjectInfo.HasProjectInfo(projectCode.Value))
            {
                Session["tempName"] = name;
                Session["tempCode"] = code;
                Session["tempManager"] = manager;
                Session["tempAccount"] = projectAccount;
                Session["tempBudget"] = budget;
                Session["tempCollected"] = collected;
                Session["tempDate"] = applyDate;
                Session["tempMembers"] = members;
                Session["tempRemark"] = remark;
                Session["tempDepartment"] = remark;

                Response.Write("<Script Language='JavaScript'>if ( window.confirm('对应编号的项目已存在，确认更新？')) {window.location.href='RolesUpdate.aspx' } else {window.location.href='#' };</script>");
            }
            else
            {
                ProjectInfo pi = new ProjectInfo();
                pi.ProjectCode = code;
                pi.ProjectName = name;
                pi.Manager = manager;
                pi.ProjectAccount = projectAccount;
                pi.Budget = Convert.ToInt32(budget);
                pi.Collected = Convert.ToInt32(collected);
                pi.ApplyDate = Convert.ToDateTime(applyDate);
                pi.Memeber = members;
                pi.Remark = remark;
                pi.Status = false;
                pi.Department = department;

                ProjectInfo.setProjectInfoByCode(code, pi);
                Response.Redirect("~/Account/BasicInfo.aspx");
            }

        }
        else {
            DataSet allDep = Department.GetAllDepartment();
            depList.DataSource = allDep.Tables[0].DefaultView;
            depList.DataTextField = "DepartmentName";
            //depList.DataValueField = "DepartmentID";
            depList.DataValueField = "DepartmentName";
            depList.DataBind();

            applyDate.Text = DateTime.Today.ToShortDateString();
        }
    }
}