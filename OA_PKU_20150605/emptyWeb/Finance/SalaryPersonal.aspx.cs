using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_SalaryPersonal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int applyid = Convert.ToInt16(Request["applyid"]);
        int year = Convert.ToInt16(Request["year"]);
        int month = Convert.ToInt16(Request["month"]);

        if(!IsPostBack)
        {
            DataSet allDep = Department.GetAllDepartment();
            depList.DataSource = allDep.Tables[0].DefaultView;
            depList.DataTextField = "DepartmentName";
            //depList.DataValueField = "DepartmentID";
            depList.DataValueField = "DepartmentName";
            depList.DataBind();

            applyDate.Text = new DateTime(year,month,1).ToShortDateString();
        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        int applyid = Convert.ToInt16(Request["applyid"]);
        int year = Convert.ToInt16(Request["year"]);
        int month = Convert.ToInt16(Request["month"]);

        insertRecord();
        Response.Redirect(string.Format("~/Finance/SalaryPersonal.aspx?applyid={0}&&year={1}&&month={2}", applyid, year, month));
    }

    private double getTax(double p1, double p2, double p3)
    {
        return (p1 - 3500) * p2 - p3;
    }

    private double getQuickMinus(double p)
    {
        double quickMinus = 0.0;
        double income = p - 3500;
        if (income < 1500)
            quickMinus = 0;
        else if (income < 4500)
            quickMinus = 105;
        else if (income < 9000)
            quickMinus = 555;
        else if (income < 35000)
            quickMinus = 1005;
        else if (income < 55000)
            quickMinus = 2755;
        else if (income < 80000)
            quickMinus = 5505;
        else
            quickMinus = 13505;

        return quickMinus;
    }

    private double getTaxRate(double p)
    {
        double rate=0.0;
        double income = p - 3500;
        if (income < 0)
            rate = 0;
        else if (income < 1500)
            rate = 0.03;
        else if (income < 4500)
            rate = 0.1;
        else if (income < 9000)
            rate = 0.2;
        else if (income < 35000)
            rate = 0.25;
        else if (income < 55000)
            rate = 0.3;
        else if (income < 80000)
            rate = 0.35;
        else
            rate = 0.4;

        return rate;
    }
    protected void remark_TextChanged(object sender, EventArgs e)
    {

    }
    protected void finish_Click(object sender, EventArgs e)
    {
        insertRecord();
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
    protected void insertRecord()
    {
        int applyid = Convert.ToInt16(Request["applyid"]);
        int year = Convert.ToInt16(Request["year"]);
        int month = Convert.ToInt16(Request["month"]);

        SalaryDetail si = new SalaryDetail();
        si.ApplyID = applyid;
        si.StaffName = staffName.Value;
        si.SalaryDate = new DateTime(year, month, 1);
        si.Department = depList.SelectedValue;
        si.BasicSalary = Convert.ToDouble(basicSalary.Value);
        si.PerformanceSalary = Convert.ToDouble(performanceSalary.Value);
        si.OtherWithHold = Convert.ToDouble(otherWithHold.Value);
        si.OtherBonus = Convert.ToDouble(otherBonus.Value);
        si.Endowment = Convert.ToDouble(endowment.Value);
        si.Unemployed = Convert.ToDouble(unemployed.Value);
        si.Medical = Convert.ToDouble(medical.Value);
        si.House = Convert.ToDouble(house.Value);
        si.TaxIncome = si.BasicSalary + si.PerformanceSalary + si.OtherBonus - si.PerformanceSalary * 0.2 - si.OtherWithHold - si.Endowment - si.Unemployed - si.Medical - si.House;

        si.TaxRate = getTaxRate(si.TaxIncome);
        si.QuickMinus = getQuickMinus(si.TaxIncome);
        si.Tax = getTax(si.TaxIncome, si.TaxRate, si.QuickMinus);
        si.Income = si.TaxIncome - si.Tax;
        si.Remark = remark.Text;

        SalaryDetail.SetSalaryByID(si);
    }
}