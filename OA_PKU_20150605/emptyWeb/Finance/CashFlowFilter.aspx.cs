using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_CashFlowFilter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "收支一览"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }

        if (!IsPostBack)
        {
            DataSet allDep = Department.GetAllDepartment();
            depList.DataSource = allDep.Tables[0].DefaultView;
            depList.DataTextField = "DepartmentName";
            //depList.DataValueField = "DepartmentID";
            depList.DataValueField = "DepartmentName";
            depList.DataBind();

            DataSet allPro = ProjectInfo.GetAllProjects();
            proList.DataSource = allPro.Tables[0].DefaultView;
            accountList.DataSource = allPro.Tables[0].DefaultView;
            proList.DataTextField = "ProjectName";
            proList.DataValueField = "ProjectCode";
            proList.DataBind();
            accountList.DataTextField = "ProjectAccount";
            accountList.DataValueField = "ProjectAccount";
            accountList.DataBind();

            loadTypeList();
        }
    }

    private void loadTypeList()
    {
        typeList.Items.Clear();       
        typeList.Items.Add("到款分配-校内");
        typeList.Items.Add("到款分配-校外");
        typeList.Items.Add("费用报销");        
        typeList.Items.Add("出差报销");
        typeList.Items.Add("工资表");        
        typeList.Items.Add("统一结算");        
    }




    protected void linkFilter_Click(object sender, EventArgs e)
    {
        StringBuilder buff = new StringBuilder();
        buff.Append("SELECT * FROM [AllCashFlow] WHERE ");
        bool if_filter = false;

        if (department.Checked)
        {
            buff.Append(string.Format("[Department]='{0}' ", depList.SelectedValue));
            if_filter = true;
        }
        if (project.Checked)
        {
            if (if_filter)
            {
                buff.Append(string.Format("AND [ProjectCode]='{0}' ", proList.SelectedValue));
            }
            else
            {
                buff.Append(string.Format("[ProjectCode]='{0}' ", proList.SelectedValue));
            }
            if_filter = true;
        }
        if (cashType.Checked)
        {
            if (if_filter)
            {
                buff.Append(string.Format("AND [CashType]='{0}' ", typeList.SelectedValue));
            }
            else
            {
                buff.Append(string.Format("[CashType]='{0}' ", typeList.SelectedValue));
            }
            if_filter = true;
        }
        if (projectAccount.Checked)
        {
            if (if_filter)
            {
                buff.Append(string.Format("AND [ProjectAccount]='{0}' ", accountList.SelectedValue));
            }
            else
            {
                buff.Append(string.Format("[ProjectAccount]='{0}' ", accountList.SelectedValue));
            }
            if_filter = true;
        }
        if (happenDate.Checked)
        {
            if (if_filter)
            {
                buff.Append(string.Format("AND [HappenDate] Between '{0}' AND '{1}' ", Convert.ToDateTime(startDate.Value).ToShortDateString(), Convert.ToDateTime(endDate.Value).ToShortDateString()));
            }
            else
            {
                buff.Append(string.Format("[HappenDate] Between '{0}' AND '{1}' ", Convert.ToDateTime(startDate.Value).ToShortDateString(), Convert.ToDateTime(endDate.Value).ToShortDateString()));
            }
        }
        if (staff.Checked)
        {
            if (if_filter)
            {
                buff.Append(string.Format("AND [Handler]='{0}'", Request["staffName"]));
            }
            else
            {
                buff.Append(string.Format("[Handler]='{0}'", Request["staffName"]));
            }
        }
        if(!if_filter)
        {
            buff.Clear();
            buff.Append("SELECT * FROM [AllCashFlow]");
        }
        Response.Redirect(string.Format("~/Finance/CashFlowStatistics.aspx?SqlCmd={0}",buff.ToString()));


    }


}