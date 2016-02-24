using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_PersonalPerformanceIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void redictor_Click(object sender, EventArgs e)
    {
        DateTime dt = Convert.ToDateTime(monthFilter.Value);
        int year = dt.Year;
        int month = dt.Month;

        string checkType_str = checkType.SelectedValue;
        string targetPage = "";
        switch(checkType_str)
        {
            case "工资表": targetPage = string.Format("~/Account/PersonalShow.aspx?year={0}&&month={1}&&type={2}",year,month,"salary") ; break;
            case "绩效表": targetPage = string.Format("~/Account/PersonalShow.aspx?year={0}&&month={1}&&type={2}", year, month, "performance"); break;
            case "考勤表": targetPage = string.Format("~/Account/PersonalShow.aspx?year={0}&&month={1}&&type={2}", year, month, "checkin"); break;
        }
        Response.Redirect(targetPage);
    }
}