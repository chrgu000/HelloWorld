using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_User : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo bi = BasicInfo.GetBasicInfoByID(usr.UserID);
        if(null!=bi)
        {
            name.Text = bi.StaffName;
            company.Text = bi.Company;
            department.Text = bi.Department;
            position.Text = bi.Position;
        }        
        date.Text = DateTime.Today.ToShortDateString();
        
    }
}
