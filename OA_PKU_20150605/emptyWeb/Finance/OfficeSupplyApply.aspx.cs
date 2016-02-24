using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_OfficeSupplyApply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Users usr = (Users)Session["Identify"];
        BasicInfo info = BasicInfo.GetBasicInfoByID(usr.UserID);
        if (!PageAuthorityManage.hasAuthority(info, "固定资产申购"))
        {
            Response.Write("<script Language='JavaScript'>alert('抱歉!您没有此操作的权限');window.location.href ='../Account/ApplyListPage.aspx'</script>");
        }

        ScriptManager1.RegisterAsyncPostBackControl(addRow);
        if (ViewState["count"] != null)
        {
            for (int i = 0; i < Convert.ToInt16(ViewState["count"]); i++)
                addNewRow();
        } 
        if (!IsPostBack)
        {
            
            DataSet allPro = ProjectInfo.GetAllProjects();
            projectCodeList.DataSource = allPro.Tables[0].DefaultView;
            projectCodeList.DataTextField = "ProjectName";
            projectCodeList.DataValueField = "ProjectCode";
            projectCodeList.DataBind();

            staffName.Text = info.StaffName;
            department.Text = info.Department;
            applyDate.Text = DateTime.Today.ToShortDateString();
        }
    }

    protected void confirm_Click(object sender, EventArgs e)
    {
        OfficeSupplyApply oi = new OfficeSupplyApply();

        oi.StaffName = staffName.Text;
        oi.Department = department.Text;
        oi.ApplyDate = DateTime.Today;
        oi.Reason = reason.Text ;
        oi.ApproveProcess = "";

        int recordid = OfficeSupplyApply.SetOfficeSupplyApplyByID(-1, oi, ProjectInfo.getProjectInfoByCode(projectCodeList.SelectedValue).Manager);
        double allExpense = 0.0;
        List<OfficeSupplySingle> supplyList = getSupplyList(ref allExpense);       
        OfficeSupplySingle.SetOfficeSupplySingle(supplyList,recordid);

        oi.AllExpensive = allExpense;
        OfficeSupplyApply.SetOfficeSupplyApplyByID(recordid, oi, ProjectInfo.getProjectInfoByCode(projectCodeList.SelectedValue).Manager);

        Response.Redirect("~/Account/ApplyListPage.aspx");
    
    }
    private List<OfficeSupplySingle> getSupplyList(ref double allExpense)
    {
        List<OfficeSupplySingle> result = new List<OfficeSupplySingle>();
        //添加单品
        int row_num = Convert.ToInt16(ViewState["count"]);


        string[] ak = Request.Form.AllKeys;
        for (int i = 0; i < Request.Form.Count; i++)
        {
            //只筛选出动态生成的三个控件的值 
            int counter = 0;
            if (ak[i].IndexOf("box") > -1)
            {
                OfficeSupplySingle item = new OfficeSupplySingle();
                item.Name = Request.Form[i++].ToString();
                item.Version = Request.Form[i++].ToString();
                item.Price = Convert.ToDouble(Request.Form[i++]);
                item.Counter = Convert.ToInt16(Request.Form[i++]);
                allExpense += item.Counter * item.Price;
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
        tb1.ID = "box" + (5 * itemList.Rows.Count + 1);//一定要保证ID的唯一性，这样每次增加才能保留原来的值
        System.Web.UI.HtmlControls.HtmlTableCell name = new System.Web.UI.HtmlControls.HtmlTableCell();
        name.Controls.Add(tb1);
        row.Cells.Add(name);

        System.Web.UI.HtmlControls.HtmlTableCell version = new System.Web.UI.HtmlControls.HtmlTableCell();
        TextBox tb2 = new TextBox();
        tb2.Height = 30;
        tb2.ID = "box" + (5 * itemList.Rows.Count + 2);
        version.Controls.Add(tb2);
        row.Cells.Add(version);

        System.Web.UI.HtmlControls.HtmlTableCell price = new System.Web.UI.HtmlControls.HtmlTableCell();
        TextBox tb4 = new TextBox();
        tb4.Height = 30;
        tb4.ID = "box" + (5 * itemList.Rows.Count + 3);
        price.Controls.Add(tb4);
        row.Cells.Add(price);

        System.Web.UI.HtmlControls.HtmlTableCell count = new System.Web.UI.HtmlControls.HtmlTableCell();
        TextBox tb3 = new TextBox();
        tb3.Height = 30;
        tb3.ID = "box" + (5 * itemList.Rows.Count + 4);
        count.Controls.Add(tb3);
        row.Cells.Add(count);        

        System.Web.UI.HtmlControls.HtmlTableCell allExpense = new System.Web.UI.HtmlControls.HtmlTableCell();
        TextBox tb5 = new TextBox();
        tb5.Height = 30;
        tb5.ID = "box" + (5 * itemList.Rows.Count + 5);
        allExpense.Controls.Add(tb5);
        row.Cells.Add(allExpense);


        itemList.Rows.Add(row);
    }


    protected void addRow_Click(object sender, EventArgs e)
    {
        addNewRow();
        ViewState["count"] = Convert.ToInt16(ViewState["count"]) + 1;
        this.UpdatePanel1.Update(); //一定要加这句, 调用完函数后进行局部更新.   


        double all = 0.0;
        List<OfficeSupplySingle> supplyList = getSupplyList(ref all);
        allExpensive.Text = all.ToString();
        allExpensiveUpper.Text = MoneyConvert.convertToCapital(all.ToString());
        this.UpdatePanel2.Update();
        this.UpdatePanel3.Update();
    }
}