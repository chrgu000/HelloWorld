using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_ProjectUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string name = Session["tempName"].ToString();
        string code = Session["tempCode"].ToString();
        string manager = Session["tempManager"].ToString() ;
        string handler = Session["tempHandler"].ToString() ;
        int budget = Convert.ToInt32(Session["tempBudget"]);
        int collected = Convert.ToInt32(Session["tempCollected"]);
        DateTime applyDate = Convert.ToDateTime(Session["tempDate"]); 
        string remark = Session["tempRemark"].ToString() ;

        ProjectInfo pi = new ProjectInfo();
        pi.ProjectCode = code;
        pi.ProjectName = name;
        pi.Manager = manager;
        pi.ProjectAccount = handler;
        pi.Budget = budget;
        pi.Collected = collected;
        pi.ApplyDate = applyDate;
        pi.Remark = remark;

        ProjectInfo.setProjectInfoByCode(code, pi);

        Session.Remove("tempName");
        Session.Remove("tempCode");
        Session.Remove("tempManager");
        Session.Remove("tempHandler");
        Session.Remove("tempBudget");
        Session.Remove("tempCollected");
        Session.Remove("tempDate");
        Session.Remove("tempRemark");
        Response.Redirect("~/Account/CarUse.aspx");
    }
}