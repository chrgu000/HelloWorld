using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UserManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlcmd = Request["SqlCmd"];
        List<BasicInfo> employeeList = BasicInfo.GetFilterResult(sqlcmd);
        BasicInfoRowsTemp.Text = transResult(ref employeeList);
        

    }   


    
      
    /// <summary>
    /// 把查询结果转换为html代码
    /// </summary>
    /// <param name="allCashFlow"></param>
    /// <returns></returns>
    private string transResult(ref List<BasicInfo> employeeList)
    {
        StringBuilder buff = new StringBuilder();        
        int counter = 1;


        foreach (BasicInfo cc in employeeList)
        {
            if (counter % 2 == 0)
                buff.Append("<tr class=\"RowA\">");
            else
                buff.Append("<tr class=\"RowB\">");

            buff.Append(string.Format("<td>{0}</td><td>{1}</td><td>{2}</td><td><a href=\"../Account/BasicInfoEdit.aspx?UserID={9}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td><td><a href=\"../Admin/ResetPassword.aspx?UserID={9}\">{7}</a><td><a href=\"../Admin/DismissEmployee.aspx?UserID={9}\">{8}</a></td>", cc.StaffName, cc.Gender ? "男" : "女", cc.Department, cc.Position, cc.Title, cc.EnterDate.ToShortDateString(), cc.OnJob ? "在职" : "离职", "重置密码", "注销", cc.StaffID)); 
            buff.Append("</tr>");
            ++counter;
        }

        string temp = buff.ToString();
        return temp;
    }
    protected void linkFilter_Click(object sender, EventArgs e)
    {

    }
}