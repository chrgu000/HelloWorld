using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_NoCashFilter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "收支一览"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }

        if (!IsPostBack)       {
            

            loadTypeList();
        }
    }

    private void loadTypeList()
    {
        typeList.Items.Clear();
        typeList.Items.Add("到款分配-校内");
        typeList.Items.Add("到款分配-校外");
        typeList.Items.Add("费用报销");
        typeList.Items.Add("出差申请");
        typeList.Items.Add("出差总结");
        typeList.Items.Add("出差报销");
        typeList.Items.Add("合同审批");
        typeList.Items.Add("年度经费概算");
        typeList.Items.Add("资金使用审批");
        typeList.Items.Add("固定资产申购");
        typeList.Items.Add("固定资产报修");
        typeList.Items.Add("员工用餐申请");
        typeList.Items.Add("统一结算");
        typeList.Items.Add("车辆使用申请");
        typeList.Items.Add("工资表");
        typeList.Items.Add("绩效表");
        typeList.Items.Add("考勤表");
        typeList.Items.Add("岗位责任书");
    }
    protected void linkFilter_Click(object sender, EventArgs e)
    {
        //考勤表、绩效表 、工资表：需要参数为年份和月份
        if (typeList.SelectedValue == "绩效表" || typeList.SelectedValue == "考勤表" || typeList.SelectedValue == "年度经费概算")
            handleYearlyMonthly();
        else
            handleApplySheet();

        //其他表
        
    }
    /// <summary>
    /// 处理绩效表和考勤表，页面传递参数是年和月
    /// </summary>
    private void handleYearlyMonthly()
    {
        DateTime dt = Convert.ToDateTime(startDate.Value);
        int year = dt.Year;
        int month = dt.Month;

        string toPage = null;
        switch (typeList.SelectedValue)
        {
            case "绩效表": toPage = string.Format("~/Account/PerformanceShow.aspx?year={0}&&month={1}", year, month); break;
            case "考勤表": toPage = string.Format("~/Account/CheckInShow.aspx?year={0}&&month={1}", year, month); break;
            case "年度经费概算": toPage = string.Format("~/Finance/YearlyBudgetShow.aspx?year={0}&&month={1}", year, month); break; 
        }

        Response.Redirect(toPage);

    }
    /// <summary>
    /// 处理除绩效表和考勤表之外的所有表格，页面传递参数都是标准的sql命令
    /// </summary>
    private void handleApplySheet()
    {
        StringBuilder buff = new StringBuilder();
        buff.Append("SELECT * FROM [AllApplies] WHERE ");
        bool if_filter = false;

        if (sheetType.Checked)
        {
            if (if_filter)
            {
                buff.Append(string.Format("AND [ApplyType]='{0}' ", typeList.SelectedValue));
            }
            else
            {
                buff.Append(string.Format("[ApplyType]='{0}' ", typeList.SelectedValue));
            }
            if_filter = true;
        }
        if (happenDate.Checked)
        {
            if (if_filter)
            {
                buff.Append(string.Format("AND [ApplyDate] Between '{0}' AND '{1}' ", Convert.ToDateTime(startDate.Value).ToShortDateString(), Convert.ToDateTime(endDate.Value).ToShortDateString()));
            }
            else
            {
                buff.Append(string.Format("[ApplyDate] Between '{0}' AND '{1}' ", Convert.ToDateTime(startDate.Value).ToShortDateString(), Convert.ToDateTime(endDate.Value).ToShortDateString()));
            }
        }
        if (staff.Checked)
        {
            if (if_filter)
            {
                buff.Append(string.Format("AND [ApplyStaff]='{0}'", Request["staffName"]));
            }
            else
            {
                buff.Append(string.Format("[ApplyStaff]='{0}'", Request["staffName"]));
            }
        }
        if (!if_filter)
        {
            buff.Clear();
            buff.Append("SELECT * FROM [AllApplies]");
        }
        Response.Redirect(string.Format("~/Account/NoCashSheet.aspx?SqlCmd={0}", buff.ToString()));
    }
   

}