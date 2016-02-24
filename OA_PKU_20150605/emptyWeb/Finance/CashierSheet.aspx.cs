using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_CashierSheet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet allDep = Department.GetAllDepartment();
        depList.DataSource = allDep.Tables[0].DefaultView;
        depList.DataTextField = "DepartmentName";
        //depList.DataValueField = "DepartmentID";
        depList.DataValueField = "DepartmentName";
        depList.DataBind();

        DataSet allPro = ProjectInfo.GetAllProjects();
        accountList.DataSource = allPro.Tables[0].DefaultView;
        accountList.DataTextField = "ProjectAccount";
        accountList.DataValueField = "ProjectAccount";
        accountList.DataBind();
    }
}