using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_CarUse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if(!PageAuthorityManage.hasAuthority(info,"车辆使用登记"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='ApplyListPage.aspx'</script>");
        }
        ScriptManager1.RegisterAsyncPostBackControl(addRow);
        if (ViewState["count"] != null)
        {
            for (int i = 0; i < Convert.ToInt16(ViewState["count"]); i++)
                addNewRow();
        } 
        if (!IsPostBack)
        {
            staffName.Text = info.StaffName;
            department.Text = info.Department;            

            
        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        CarUse ci = new CarUse();

        ci.StaffName = staffName.Text;
        ci.DepartmentName = department.Text;
        ci.AlongCount = Convert.ToInt32(alongCount.Value);
        ci.StartDate = Convert.ToDateTime(startDate.Value);
        ci.EndDate = Convert.ToDateTime(endDate.Value);
        ci.AlongName = alongName.Text;
        ci.Destination=destination.Value;
        ci.Driver=driver.Value;
        ci.CarNum=carNum.Value;
        ci.Reason = reason.Text;
        ci.Note = note.Text;
        ci.ApproveProcess = "";

        int recordid = CarUse.SetCarUseByID(-1,ci);
        List<CarUseRecord> recordList = getRecordList();
        CarUseRecord.SetCarUseRecord(recordList,recordid);



        Response.Redirect("~/Account/ApplyListPage.aspx");
    }

    private List<CarUseRecord> getRecordList()
    {
        List<CarUseRecord> result = new List<CarUseRecord>();
        //添加单品
        int row_num = Convert.ToInt16(ViewState["count"]);


        string[] ak = Request.Form.AllKeys;
        for (int i = 0; i < Request.Form.Count; i++)
        {
            //只筛选出动态生成的三个控件的值 
            int counter = 0;
            if (ak[i].IndexOf("box") > -1)
            {
                CarUseRecord item = new CarUseRecord();
                item.Durings = Request.Form[i++].ToString();
                item.Destination = Request.Form[i++].ToString();
                item.MilesBefore = Convert.ToDouble(Request.Form[i++]);
                item.MilesAfter = Convert.ToDouble(Request.Form[i]);
                
                result.Add(item);
            }

        }

        return result;
    }

    private void addNewRow()
    {
        System.Web.UI.HtmlControls.HtmlTableRow row = new System.Web.UI.HtmlControls.HtmlTableRow();
        TextBox tb1 = new TextBox();
        tb1.Height = 30;
        tb1.ID = "box" + (4 * itemList.Rows.Count + 1);//一定要保证ID的唯一性，这样每次增加才能保留原来的值
        System.Web.UI.HtmlControls.HtmlTableCell name = new System.Web.UI.HtmlControls.HtmlTableCell();
        name.Controls.Add(tb1);
        row.Cells.Add(name);

        System.Web.UI.HtmlControls.HtmlTableCell version = new System.Web.UI.HtmlControls.HtmlTableCell();
        TextBox tb2 = new TextBox();
        tb2.Height = 30;
        tb2.ID = "box" + (4 * itemList.Rows.Count + 2);
        version.Controls.Add(tb2);
        row.Cells.Add(version);

        System.Web.UI.HtmlControls.HtmlTableCell price = new System.Web.UI.HtmlControls.HtmlTableCell();
        TextBox tb3 = new TextBox();
        tb3.Height = 30;
        tb3.ID = "box" + (4 * itemList.Rows.Count + 3);
        price.Controls.Add(tb3);
        row.Cells.Add(price);

        System.Web.UI.HtmlControls.HtmlTableCell count = new System.Web.UI.HtmlControls.HtmlTableCell();
        TextBox tb4 = new TextBox();
        tb4.Height = 30;
        tb4.ID = "box" + (4 * itemList.Rows.Count + 4);
        count.Controls.Add(tb4);
        row.Cells.Add(count);

        itemList.Rows.Add(row);
    }
    protected void addRow_Click(object sender, EventArgs e)
    {
        addNewRow();
        ViewState["count"] = Convert.ToInt16(ViewState["count"]) + 1;
        this.UpdatePanel1.Update(); //一定要加这句, 调用完函数后进行局部更新. 
    }
}