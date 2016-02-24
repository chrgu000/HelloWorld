using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_YearlyBudgetShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int recordID = Convert.ToInt32(Request["RecordID"]);
        int year = Convert.ToInt16(Request["year"]);
        int month = Convert.ToInt16(Request["month"]);
        bool approveFinished = Convert.ToBoolean(Request["finished"]);
        
        if(recordID!=0)
        {
            YearlyBudget yi = YearlyBudget.GetYearlyBudgetApplyByID(recordID);
            yearlyBudgetRowsTemp.Text = transResult(yi.BudgetList);
        }
        else{
            List<YearlyBudgetSingle> result = YearlyBudgetSingle.GetYearlyBudgetListByYear(year);
            yearlyBudgetRowsTemp.Text = transResult(result);
        }

        
    }

    private string transResult(List<YearlyBudgetSingle> list)
    {
        double sum = 0.0;
        StringBuilder buff = new StringBuilder();
        buff.Append("<tr><td>项目类型</td><td>项目子类型</td><td>预算</td><tr>");
        foreach (YearlyBudgetSingle cc in list)
        {
            buff.Append(string.Format("<tr><td>{0}</td><td>{1}</td><td>{2}</td><tr>", cc.ItemType, cc.ItemDetail,cc.Budget));
            sum += cc.Budget;
        }
        buff.Append(string.Format("<tr><td>合计</td><td>{0}</td><td></td></tr>", sum));
        string temp = buff.ToString();
        return temp;
    }
}