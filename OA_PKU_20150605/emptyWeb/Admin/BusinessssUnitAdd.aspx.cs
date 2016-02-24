using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_BusinessssUnitAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "组织管理"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }
        if(IsPostBack)
        {
            if (BusinessUnit.hasBUInfo(Request["BUName"].Trim()))
            {
                string name = Request["BUName"];
                string boss = Request["boss"];
                string code = Request["BUCode"];
                Session["tempName"] = name;
                Session["tempBoss"] = boss;
                Session["tempCode"] = code;

                Response.Write("<Script Language='JavaScript'>if ( window.confirm('事业部已存在，确认更新？')) {window.location.href='BusinessUnitUpdate.aspx' } else {window.location.href='#' };</script>");
            }
            else
            {
                BusinessUnit.SetBU(Request["BUName"].Trim(), Request["boss"], Request["BUCode"]);
                Response.Redirect("~/Account/BasicInfo.aspx");
            }
           
        }
    }
}