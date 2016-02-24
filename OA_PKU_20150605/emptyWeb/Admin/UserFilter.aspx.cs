using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UserFilter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "用户管理"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }
        if(!IsPostBack)
        {
            DataSet allDep = Department.GetAllDepartment();
            depList.DataSource = allDep.Tables[0].DefaultView;
            depList.DataTextField = "DepartmentName";
            //depList.DataValueField = "DepartmentID";
            depList.DataValueField = "DepartmentName";
            depList.DataBind();

            DataSet allPos = Roles.GetAllRoles();
            posList.DataSource = allPos.Tables[0].DefaultView;
            posList.DataTextField = "RoleName";
            //posList.DataValueField = "RoleID";
            posList.DataValueField = "RoleName";
            posList.DataBind();
        }


    }
    protected void linkFilter_Click(object sender, EventArgs e)
    {
        StringBuilder buff = new StringBuilder();
        buff.Append("SELECT * FROM [BasicInfo] WHERE ");
        bool if_filter = false;

        if (department.Checked)
        {
            buff.Append(string.Format("[Department]='{0}' ", depList.SelectedValue));
            if_filter = true;
        }
        if (position.Checked)
        {
            if (if_filter)
            {
                buff.Append(string.Format("AND [Position]='{0}' ", posList.SelectedValue));
            }
            else
            {
                buff.Append(string.Format("[Position]='{0}' ", posList.SelectedValue));
            }
            if_filter = true;
        }
        if (staff.Checked)
        {
            if (if_filter)
            {
                buff.Append(string.Format("AND [StaffName]='{0}' ", staffName.Value));
            }
            else
            {
                buff.Append(string.Format("[StaffName]='{0}' ", staffName.Value));
            }
            if_filter = true;
        }
        if (title.Checked)
        {
            if (if_filter)
            {
                buff.Append(string.Format("AND [Title]='{0}' ", titleList.SelectedValue));
            }
            else
            {
                buff.Append(string.Format("[Title]='{0}' ", titleList.SelectedValue));
            }
            if_filter = true;
        }
        if (enterDate.Checked)
        {
            if (if_filter)
            {
                buff.Append(string.Format("AND [EnterDate] Between '{0}' AND '{1}' ", Convert.ToDateTime(startDate.Value).ToShortDateString(), Convert.ToDateTime(endDate.Value).ToShortDateString()));
            }
            else
            {
                buff.Append(string.Format("[EnterDate] Between '{0}' AND '{1}' ", Convert.ToDateTime(startDate.Value).ToShortDateString(), Convert.ToDateTime(endDate.Value).ToShortDateString()));
            }
            if_filter = true;
        }
        if (onJob.Checked)
        {
            if (if_filter)
            {
                buff.Append(string.Format("AND [OnJob]='{0}'", onJobList.SelectedValue));
            }
            else
            {
                buff.Append(string.Format("[OnJob]='{0}'", onJobList.SelectedValue));
            }
            if_filter = true;
        }
        if (!if_filter)
        {
            buff.Clear();
            buff.Append("SELECT * FROM [BasicInfo]");
        }
        Response.Redirect(string.Format("~/Admin/UserManage.aspx?SqlCmd={0}", buff.ToString()));

    }
}