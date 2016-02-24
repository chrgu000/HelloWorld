using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_SalaryMonth : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        staffName.Text = info.StaffName;
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        SalaryApply si = new SalaryApply();
        si.StaffName=staffName.Text;
        DateTime dt=Convert.ToDateTime(ApplyDate.Value);
        si.ApplyDate = new DateTime(dt.Year,dt.Month,1);
        si.ApproveProcess = "";

        int applyid=SalaryApply.SetSalaryApplyByID(-1,si);


        Response.Redirect(string.Format("~/Finance/SalaryPersonal.aspx?applyid={0}&&year={1}&&month={2}",applyid,si.ApplyDate.Year,si.ApplyDate.Month));
    }
}