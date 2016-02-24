using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_PerformanceMonth : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        DateTime dt = Convert.ToDateTime(ApplyDate.Value);
        DateTime monthly = new DateTime(dt.Year, dt.Month, 1);
        Response.Redirect(string.Format("~/Account/PerformancePersonal.aspx?year={0}&&month={1}", monthly.Year, monthly.Month));

        //Response.Redirect(string.Format("~/Account/PerformanceShow.aspx?year={0}", monthly.Year));
    }
}