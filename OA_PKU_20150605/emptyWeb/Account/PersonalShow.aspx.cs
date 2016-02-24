using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_PersonalShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int year = Convert.ToInt16(Request["year"]);
        int month = Convert.ToInt16(Request["month"]);
        string type_str=Request["type"];

        switch(type_str)
        {
            case "salary": UserRowsTemp.Text = getPersonalSalary(year,month); break;
            case "performance": UserRowsTemp.Text = getPersonalPerformance(year,month); break;
            case "checkin": UserRowsTemp.Text = getPersonalCheckIn(year,month); break;
        }

    }

    private string getPersonalCheckIn(int year, int month)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        CheckIn ci = CheckIn.GetPersonalCheckInByMonth(year,month,info.StaffName);

        StringBuilder buff = new StringBuilder();
        buff.Append("<tr>");
        buff.Append("<td>应出勤天数</td>");
        buff.Append("<td>实际出勤天数</td>");
        buff.Append("<td>10分钟以内</td>");
        buff.Append("<td>10到30分钟</td>");
        buff.Append("<td>30分钟以上</td>");      
        buff.Append("<td>迟到/早退次数</td>");

        buff.Append("<td>丧假</td>");
        buff.Append("<td>病假</td>");
        buff.Append("<td>事假</td>");
        buff.Append("<td>考勤绩效加减分</td>");
       

        buff.Append("<td>年末结余假</td>");
        buff.Append("<td>本月加班</td>");
        buff.Append("<td>本月调休</td>");
        buff.Append("<td>本月结余假</td>");
        buff.Append("</tr>");

        buff.Append("<tr>");
        
        buff.Append(string.Format("<td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td>{5}</td>", ci.ShouldBe,ci.ActualBe,ci.InnterTen,ci.InnerThirty,ci.OverThirty,ci.Late));
        
        buff.Append(string.Format("<td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td>", ci.Funneral,ci.Matter,ci.Sick,ci.Performance));
        
        buff.Append(string.Format("<td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td>", ci.Remaining,ci.OverTime,ci.Shift,ci.AllRemaining));
        buff.Append("</tr>");

        return buff.ToString();
    }

    private string getPersonalPerformance(int year, int month)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        Performance pi = Performance.GetPersonalCheckInByMonth(year,month,info.StaffName);

        StringBuilder buff = new StringBuilder();
        buff.Append("<tr>");
        buff.Append("<td>第一周</td>");
        buff.Append("<td>第二周</td>");
        buff.Append("<td>第三周</td>");
        buff.Append("<td>第四周</td>");
        buff.Append("<td>周平均分</td>");       
        buff.Append("</tr>");

        buff.Append("<tr>");
        double temp = (pi.Week1 + pi.Week2 + pi.Week3 + pi.Week4) / 4;
        buff.Append(string.Format("<td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td>", pi.Week1, pi.Week2, pi.Week3, pi.Week4,temp));
       
        buff.Append("</tr>");

        return buff.ToString();
    }

    private string getPersonalSalary(int year, int month)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        SalaryDetail si = SalaryDetail.GetPersonalSalaryByMonth(year,month,info.StaffName);

        StringBuilder buff = new StringBuilder();
        buff.Append("<tr>");
        buff.Append("<td>基本工资</td>");
        buff.Append("<td>绩效工资</td>");
        buff.Append("<td>绩效工资20%</td>");
        buff.Append("<td>其他扣款</td>");
        buff.Append("<td>其他增项</td>");
        buff.Append("<td>小计</td>");

        buff.Append("<td>养老</td>");
        buff.Append("<td>失业</td>");
        buff.Append("<td>医疗</td>");
        buff.Append("<td>住房基金</td>");
        buff.Append("<td>社保小计（个人扣除部分）</td>");
        buff.Append("<td>计税收入（扣款后小计）</td>");

        buff.Append("<td>税率</td>");
        buff.Append("<td>速算扣除数</td>");
        buff.Append("<td>应交个人所得税</td>");
        buff.Append("<td>实发工资</td>");
        buff.Append("</tr>");

        buff.Append("<tr>");
        double temp=si.BasicSalary+si.PerformanceSalary+si.OtherBonus-0.2*si.PerformanceSalary-si.OtherWithHold;
        buff.Append(string.Format("<td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td>{5}</td>",si.BasicSalary,si.PerformanceSalary,0.2*si.PerformanceSalary,si.OtherWithHold,si.OtherBonus,temp));
        temp = si.Endowment + si.Unemployed + si.Medical + si.House;
        buff.Append(string.Format("<td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td>{5}</td>", si.Endowment, si.Unemployed, si.Medical, si.House, temp,si.TaxIncome));
        temp = si.TaxIncome - si.Tax;
        buff.Append(string.Format("<td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td>", si.TaxRate, si.QuickMinus, si.Tax,  temp));
        buff.Append("</tr>");

        return buff.ToString();
    }
}