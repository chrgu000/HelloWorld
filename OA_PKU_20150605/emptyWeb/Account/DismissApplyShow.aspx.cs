using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_DismissApplyShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int recordID = Convert.ToInt32(Request["RecordID"]);
        DismissionApply di = DismissionApply.GetDismissionApplyByID(recordID);

        staffName.Text = di.StaffName;
        department.Text = di.Department_str;
        businessUnit.Text = di.BusinessUnit;
        position.Text = di.Position;
        startDate.Text = di.StartDate.ToShortDateString();
        endDate.Text = di.EndDate.ToShortDateString();
        address.Text = di.Address;
        teletphone.Text = di.Telephone;
        reason.SelectedValue = di.Reason;
        handOver.Checked = di.HandOver;
        returnThings.Checked = di.ReturnThings;
        reimburse.Checked = di.Reimburse;
        borrow.Checked = di.Borrow;
        removibleDisk.Checked = di.RemovibleDisk;
        computer.Checked = di.Computer;
        communication.Checked = di.Communication;
        books.Checked = di.Books;
        reCheckHandOver.Checked = di.ReCheckHandOver;
        keys.Checked = di.Keys;
        officeThings.Checked = di.OfficeThings;
        processShow.Text = di.ApproveProcess;
    }
    protected void agreeButton_Click(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        updateApprove("同意", getNextApprover(info), info, false);
    }
    protected void disagreeButton_Click(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        updateApprove("不同意", staffName.Text, info, true);
    }




    private void updateApprove(string if_agree, string next, BasicInfo info, bool if_back)
    {
        Users usr = (Users)Session["Identify"];
        int recordID = Convert.ToInt32(Request["RecordID"]);
        DismissionApply di = DismissionApply.GetDismissionApplyByID(recordID);
        di.ApproveProcess += info.StaffName.Trim() + "-" + if_agree + ",";
        DismissionApply.SetDismissionApplyByID(recordID,di,usr.UserID);

        string nextApprover = next;
        int applyID = Convert.ToInt32(Request["ApplyID"]);
        Apply.UpdateNextApprover(applyID, nextApprover, if_back);
    }
    /// <summary>
    /// 根据当前审批人，获取下一审批人职位
    /// </summary>
    /// <param name="info"></param>
    /// <returns></returns>
    private string getNextApprover(BasicInfo info)
    {
        string result = null;
        switch (info.Position.Trim())
        {
            case "部门经理": result = "事业部经理"; break;
            case "事业部经理": result = "机构负责人"; break; 
            case "机构负责人": result = "财务负责人"; break;
            case "财务负责人": result = "管委会负责人"; break;
            case "管委会负责人": result = staffName.Text; break;
            default: break;

        }
        return result;
    }










}