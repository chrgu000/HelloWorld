using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_PositionTarget : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!IsPostBack)
        {
            staffName.Text = info.StaffName;
            department.Text = info.Department;
            position.Text = info.Position;     

        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        PositionTarget pi = new PositionTarget();
        pi.StaffName = staffName.Text;
        pi.Position = position.Text;
        pi.Department = department.Text;
        pi.FormerPosition=formerPosition.Value;
        pi.Leader=leader.Value;
        DateTime dt=Convert.ToDateTime(happenDate.Value);
        pi.Year = dt.Year;
        pi.NewPosition=newPosition.Value;
        pi.Duty = duty.Text;
        pi.Target = target.Text;
        pi.SalaryLevel=salaryLevel.Value;
        pi.ApproveProcess = "";

        StringBuilder temp = new StringBuilder();
        temp.Append(Request["january"]+",");
        temp.Append(Request["february"] + ",");
        temp.Append(Request["march"] + ","); 
        temp.Append(Request["april"] + ",");
        temp.Append(Request["may"] + ",");
        temp.Append(Request["june"] + ",");
        temp.Append(Request["july"] + ",");
        temp.Append(Request["august"] + ",");
        temp.Append(Request["september"] + ",");
        temp.Append(Request["october"] + ",");
        temp.Append(Request["november"] + ",");
        temp.Append(Request["december"]);
        pi.MonthlyIncome = temp.ToString();


        PositionTarget.SetPositionTargetByID(-1,pi);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
}