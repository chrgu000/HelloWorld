using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_CheckInPersonal : System.Web.UI.Page
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
        Response.Redirect(string.Format("~/Account/CheckInPersonal.aspx?year={0}&&month={1}", year,month));
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

        CheckIn ci = new CheckIn();
        ci.StaffName = staffName.Value;
        ci.Department = depList.SelectedValue;
        ci.StartDate = Convert.ToDateTime(startDate.Value);
        ci.RecordMonth = new DateTime(year, month, 1);
        ci.ShouldBe = Convert.ToInt16(shouldBe.Value);
        ci.ActualBe = Convert.ToInt16(actualBe.Value);
        ci.InnterTen = Convert.ToInt16(innerTen.Value);
        ci.InnerThirty = Convert.ToInt16(innerThirty.Value);
        ci.OverThirty = Convert.ToInt16(overThirty.Value);
        ci.Late = Convert.ToInt16(late.Value);
        ci.Funneral = Convert.ToInt16(funeral.Value);
        ci.Sick = Convert.ToInt16(sick.Value);
        ci.Matter = Convert.ToInt16(matter.Value);
        ci.Performance = Convert.ToInt16(performance.Value);
        ci.Remaining = Convert.ToInt16(remaining.Value);
        ci.OverTime = Convert.ToInt16(overTime.Value);
        ci.Shift = Convert.ToInt16(shift.Value);
        ci.AllRemaining = ci.Remaining + ci.OverTime - ci.Shift;

        CheckIn.setCheckInInfo(-1, ci);
    }
}