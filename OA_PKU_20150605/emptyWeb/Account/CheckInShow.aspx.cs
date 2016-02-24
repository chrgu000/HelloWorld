using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_CheckInShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int year = Convert.ToInt16(Request["year"]);
        int month = Convert.ToInt16(Request["month"]);
        List<CheckIn> result = CheckIn.GetCheckInByMonth(new DateTime(year,month,1));        

        if (!IsPostBack)
        {
            checkInList.Text = transResult(result);
        }
    }

    private string transResult(List<CheckIn> list)
    {
        StringBuilder buff = new StringBuilder();
        int count = 1;
        foreach (CheckIn cc in list)
        {
            buff.Append(string.Format("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td><td>{10}</td><td>{11}</td><td>{12}</td><td>{13}</td><td>{14}</td><td>{15}</td><td>{16}</td><tr>",
                count, cc.Department, cc.StaffName,
                cc.StartDate.ToShortDateString(), cc.ShouldBe, cc.ActualBe,
                cc.InnterTen, cc.InnerThirty, cc.OverThirty,
                cc.Late, cc.Funneral, cc.Sick, cc.Matter,
                cc.Performance,cc.Remaining,cc.OverTime,cc.Shift,
                cc.Remaining+cc.OverTime-cc.Shift));
            ++count;
        }

        string temp = buff.ToString();
        return temp;
    }









}