using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_ContractApply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "合同审批"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }
        ScriptManager1.RegisterAsyncPostBackControl(projectNameList);

        if (!IsPostBack)
        {            

            DataSet allPro = ProjectInfo.GetAllProjects();
            projectNameList.DataSource = allPro.Tables[0].DefaultView;
            projectNameList.DataTextField = "ProjectName";
            projectNameList.DataValueField = "ProjectName";
            projectNameList.DataBind();

            projectCode.Text = ProjectInfo.GetProjectInfoByName(projectNameList.SelectedValue).ProjectCode;
            
            staffName.Text = info.StaffName;
            department.Text = info.Department;            
        }
    }
    
    protected void confirmButton_Click(object sender, EventArgs e)
    {
        ContractApply ci = new ContractApply();

        ci.StaffName = staffName.Text;
        ci.Department_str = department.Text;
        ci.ContractName = contractName.Value;
        ci.ProjectCode = projectCode.Text;
        ci.ProjectName = projectNameList.SelectedValue;
        ci.Money = Convert.ToDouble(money.Text);
        ci.PartyBName = partyBName.Value;
        ci.PartyBAddress = partyBAddress.Value;
        ci.PartyBContact = partyBContact.Value;
        ci.PartyBTelephone = partyBTelephone.Value;
        ci.BusinessLicense = businessLicense.Checked;
        ci.IndustoryLicense = industoryLicense.Checked;
        ci.ApproveProcess = "";
        if (others.Checked)
            ci.Others = Request["otherInfo"];
        else
            ci.Others = "";

        Users usr=(Users)Session["Identify"];
        ContractApply.SetContractApplyByID(-1,ci,usr.UserID);
        Response.Redirect("~/Account/ApplyListPage.aspx");
    }
    protected void projectNameList_SelectedIndexChanged(object sender, EventArgs e)
    {
        ProjectInfo pi = ProjectInfo.GetProjectInfoByName(projectNameList.SelectedValue);
        projectCode.Text = pi.ProjectCode;        
        this.projectCodeShow.Update(); //一定要加这句, 调用完函数后进行局部更新.
    }
}