using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_PerformancePersonal : System.Web.UI.Page
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

        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        int year = Convert.ToInt16(Request["year"]);
        int month = Convert.ToInt16(Request["month"]);
        insertRecord();
        Response.Redirect(string.Format("~/Account/PerformancePersonal.aspx?year={0}&&month={1}", year, month));
    }
    protected void finish_Click(object sender, EventArgs e)
    {
        insertRecord();
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }

    protected void insertRecord()
    {
        int year = Convert.ToInt16(Request["year"]);
        int month = Convert.ToInt16(Request["month"]);

        Performance pi = new Performance();

        pi.StaffName = staffName.Value;
        pi.Department = depList.SelectedValue;
        pi.Year = year;
        pi.Month = month;
        pi.Week1 = Convert.ToInt16(week1.Value);
        pi.Week2 = Convert.ToInt16(week2.Value);
        pi.Week3 = Convert.ToInt16(week3.Value);
        pi.Week4 = Convert.ToInt16(week4.Value);

        Performance.setPerformanceInfo(-1, pi);
    }

}