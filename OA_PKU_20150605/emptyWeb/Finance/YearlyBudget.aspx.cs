using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_YearlyBudget : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        

        ScriptManager1.RegisterAsyncPostBackControl(addRow);
        if (ViewState["count"] != null)
        {
            for (int i = 0; i < Convert.ToInt16(ViewState["count"]); i++)
                addNewRow();
        } 

    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        YearlyBudget yi = new YearlyBudget();

        yi.StaffName = info.StaffName;      
        yi.ApplyDate = DateTime.Today;        
        yi.ApproveProcess = "";

        int recordid = YearlyBudget.SetYearlyBudgetByID(-1,yi,info.StaffName);
        List<YearlyBudgetSingle> budgetList = getBudgetList();
        YearlyBudgetSingle.SetOfficeSupplySingle(budgetList,recordid);

        Response.Redirect("~/Account/ApplyListPage.aspx");
    }

    private List<YearlyBudgetSingle> getBudgetList()
    {
        List<YearlyBudgetSingle> result = new List<YearlyBudgetSingle>();        
        //添加单品
        int row_num = Convert.ToInt16(ViewState["count"]);
        int year = Convert.ToInt16(year_txt.Text);

        string[] ak = Request.Form.AllKeys;
        for (int i = 0; i < Request.Form.Count; i++)
        {
            //只筛选出动态生成的三个控件的值 
            int counter = 0;
            if (ak[i].IndexOf("box") > -1)
            {
                YearlyBudgetSingle item = new YearlyBudgetSingle();                
                item.ItemType = Request.Form[i++].ToString();
                item.ItemDetail = Request.Form[i++].ToString();
                item.Budget = Convert.ToDouble(Request.Form[i]);
                item.Year = year;
                
                result.Add(item);
            }

        }

        return result;
    }
    protected void addRow_Click(object sender, EventArgs e)
    {
        addNewRow();
        ViewState["count"] = Convert.ToInt16(ViewState["count"]) + 1;
        this.UpdatePanel1.Update(); //一定要加这句, 调用完函数后进行局部更新.
    }

    private void addNewRow()
    {
        System.Web.UI.HtmlControls.HtmlTableRow row = new System.Web.UI.HtmlControls.HtmlTableRow();

        DropDownList db1 = new DropDownList();
        db1.Height = 30;
        db1.Items.Add("设计费");
        db1.Items.Add("专用费");
        db1.Items.Add("材料费");
        db1.Items.Add("外协费");
        db1.Items.Add("燃料动力费");
        db1.Items.Add("固定资产使用费");
        db1.Items.Add("工资费");
        db1.Items.Add("劳务费");
        db1.Items.Add("差旅费");
        db1.Items.Add("会议费");
        db1.Items.Add("事务费");
        db1.Items.Add("专家咨询费");
        db1.Items.Add("管理费");
        db1.Items.Add("不可预见费");        
        db1.ID = "box" + (3 * itemList.Rows.Count + 1);//一定要保证ID的唯一性，这样每次增加才能保留原来的值
        System.Web.UI.HtmlControls.HtmlTableCell itemType = new System.Web.UI.HtmlControls.HtmlTableCell();
        itemType.Controls.Add(db1);        
        row.Cells.Add(itemType);

        System.Web.UI.HtmlControls.HtmlTableCell itemDetail = new System.Web.UI.HtmlControls.HtmlTableCell();
        TextBox tb2 = new TextBox();
        tb2.Height = 30;
        tb2.ID = "box" + (3 * itemList.Rows.Count + 2);
        itemDetail.Controls.Add(tb2);
        row.Cells.Add(itemDetail);

        System.Web.UI.HtmlControls.HtmlTableCell budget = new System.Web.UI.HtmlControls.HtmlTableCell();
        TextBox tb3 = new TextBox();
        tb3.Height = 30;
        tb3.ID = "box" + (3 * itemList.Rows.Count + 3);
        budget.Controls.Add(tb3);
        row.Cells.Add(budget);


        itemList.Rows.Add(row);
    }



}