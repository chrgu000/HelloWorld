using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_PerformanceShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int year = Convert.ToInt16(Request["year"]);
        int month = Convert.ToInt16(Request["month"]);
        List<Performance> result = Performance.GetCheckInByYear(year);

        if (!IsPostBack)
        {
            performanceList.Text = transResult(result);
        }
    }

    private string transResult(List<Performance> list)
    {
        StringBuilder buff = new StringBuilder();
        int count = 1;
        foreach (Performance cc in list)
        {
            buff.Append(string.Format("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8}</td><tr>",
                count, cc.Department, cc.StaffName,
                cc.Month, cc.Week1, cc.Week2,
                cc.Week3, cc.Week4, (cc.Week1+cc.Week2+cc.Week3+cc.Week4)/4));
            ++count;
        }

        string temp = buff.ToString();
        return temp;
    }

}