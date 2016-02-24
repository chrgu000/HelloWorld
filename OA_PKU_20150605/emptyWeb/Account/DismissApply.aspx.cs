using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_DismissApply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet allDep = Department.GetAllDepartment();
            depList.DataSource = allDep.Tables[0].DefaultView;
            depList.DataTextField = "DepartmentName";
            //depList.DataValueField = "DepartmentID";
            depList.DataValueField = "DepartmentName";
            depList.DataBind();            

            DataSet allPos = Roles.GetAllRoles();
            posList.DataSource = allPos.Tables[0].DefaultView;
            posList.DataTextField = "RoleName";
            //posList.DataValueField = "RoleID";
            posList.DataValueField = "RoleName";
            posList.DataBind();
        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        DismissionApply di = new DismissionApply();

        di.StaffName = Request["staffName"];
        di.Department_str = depList.SelectedValue;
        di.BusinessUnit = buList.SelectedValue;
        di.Position = posList.SelectedValue;
        di.StartDate = Convert.ToDateTime(startDate.Value);
        di.EndDate = Convert.ToDateTime(endDate.Value);
        di.Address=Request["address"];
        di.Telephone=Request["telephone"];
        di.Reason = reason.SelectedValue;
        di.HandOver = handOver.Checked;
        di.ReturnThings = returnThings.Checked;
        di.Reimburse = reimburse.Checked;
        di.Borrow = borrow.Checked;
        di.RemovibleDisk = removibleDisk.Checked;
        di.Computer = computer.Checked;
        di.Communication = communication.Checked;
        di.Books = books.Checked;
        di.ReCheckHandOver = reCheckHandOver.Checked;
        di.Keys = keys.Checked;
        di.OfficeThings = officeThings.Checked;
        
        di.ApproveProcess = "";

        Users usr = (Users)Session["Identify"];
        DismissionApply.SetDismissionApplyByID(-1,di,usr.UserID);
        Response.Redirect("~/Account/BasicInfo.aspx");
    }
}