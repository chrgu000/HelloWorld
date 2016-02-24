using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_CashFlowStatistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlcmd=Request["SqlCmd"];
        List<CashFlowInfo> result = CashFlowInfo.GetFilerResult(sqlcmd);
        CashFlowRowsTemp.Text = transResult(ref result);
    }

    


    /// <summary>
    /// 把查询结果转换为html代码
    /// </summary>
    /// <param name="allCashFlow"></param>
    /// <returns></returns>
    private string transResult(ref List<CashFlowInfo> allCashFlow)
    {
        StringBuilder buff = new StringBuilder();
        buff.Append("<tr><td>序号</td><td>日期</td><td>项目编号</td><td>摘要</td><td>备注</td><td>收入</td><td>支出</td><td>经办人</td><td>所属机构部门</td><td>合计</td></tr>");
        int counter = 1;


        foreach (CashFlowInfo cc in allCashFlow)
        {
            if (counter % 2 == 0)
                buff.Append("<tr class=\"RowA\">");
            else
                buff.Append("<tr class=\"RowB\">");
            switch (cc.CashType)
            {
                case "费用报销": buff.Append(string.Format("<td><a href=\"../Finance/ProjectReimbursementShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td><td>{10}</td><td>{11}</td><td>{12}</td>", cc.RecordID, -1, true , counter, cc.HappenDate.ToShortDateString(), cc.ProjectCode, cc.Summary, cc.Remark, cc.Income, cc.Expense, cc.Handler, cc.Department, cc.Income - cc.Expense)); break;
                case "出差报销": buff.Append(string.Format("<td><a href=\"../Finance/BusinessTripReiShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td><td>{10}</td><td>{11}</td><td>{12}</td>", cc.RecordID, -1, true, counter, cc.HappenDate.ToShortDateString(), cc.ProjectCode, cc.Summary, cc.Remark, cc.Income, cc.Expense, cc.Handler, cc.Department, cc.Income - cc.Expense)); break;
                case "工资表": buff.Append(string.Format("<td><a href=\"../Finance/SalaryShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td><td>{10}</td><td>{11}</td><td>{12}</td>", cc.RecordID, -1, true, counter, cc.HappenDate.ToShortDateString(), cc.ProjectCode, cc.Summary, cc.Remark, cc.Income, cc.Expense, cc.Handler, cc.Department, cc.Income - cc.Expense)); break;
                case "统一结算": buff.Append(string.Format("<td><a href=\"../Finance/SettleApplyShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td><td>{10}</td><td>{11}</td><td>{12}</td>", cc.RecordID, -1, true, counter, cc.HappenDate.ToShortDateString(), cc.ProjectCode, cc.Summary, cc.Remark, cc.Income, cc.Expense, cc.Handler, cc.Department, cc.Income - cc.Expense)); break;
                case "到款分配-校内": buff.Append(string.Format("<td><a href=\"../Finance/PayAssignInSchoolShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td><td>{10}</td><td>{11}</td><td>{12}</td>", cc.RecordID, -1, true, counter, cc.HappenDate.ToShortDateString(), cc.ProjectCode, cc.Summary, cc.Remark, cc.Income, cc.Expense, cc.Handler, cc.Department, cc.Income - cc.Expense)); break;
                case "到款分配-校外": buff.Append(string.Format("<td><a href=\"../Finance/PayAssignShow.aspx?RecordID={0}&&ApplyID={1}&&finished={2}\">{3}</a></td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td><td>{10}</td><td>{11}</td><td>{12}</td>", cc.RecordID, -1, true, counter, cc.HappenDate.ToShortDateString(), cc.ProjectCode, cc.Summary, cc.Remark, cc.Income, cc.Expense, cc.Handler, cc.Department, cc.Income - cc.Expense)); break;


                default: break;
            }

            buff.Append("</tr>");
            ++counter;
        }

        string temp = buff.ToString();
        return temp;
    }


    protected void linkExport_Click(object sender, EventArgs e)
    {
        string sqlcmd = Request["SqlCmd"];
        DataTable result = CashFlowInfo.GetFilterResultExecl(sqlcmd);
        //DataTable2Excel(result);//可用
        //ExcelImport(result,"testOA");
        //Export(creatView(result));
        ExportExcel(result);//可用
    }
    
    public void DataTable2Excel(System.Data.DataTable dtData)
    {
        System.Web.UI.WebControls.DataGrid dgExport = null;
        // 当前对话   
        System.Web.HttpContext curContext = System.Web.HttpContext.Current;
        // IO用于导出并返回excel文件   
        System.IO.StringWriter strWriter = null;
        System.Web.UI.HtmlTextWriter htmlWriter = null;

        if (dtData != null)
        {
            // 设置编码和附件格式   
            curContext.Response.ContentType = "application/vnd.ms-excel";
            curContext.Response.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");
            curContext.Response.Charset = "gb2312";

            // 导出excel文件   
            strWriter = new System.IO.StringWriter();
            htmlWriter = new System.Web.UI.HtmlTextWriter(strWriter);

            // 为了解决dgData中可能进行了分页的情况，需要重新定义一个无分页的DataGrid   
            dgExport = new System.Web.UI.WebControls.DataGrid();
            dgExport.DataSource = dtData.DefaultView;
            dgExport.AllowPaging = false;
            dgExport.DataBind();

            // 返回客户端   
            dgExport.RenderControl(htmlWriter);
            curContext.Response.Clear();
            curContext.Response.Write("<meta http-equiv=\"content-type\" content=\"application/ms-excel; charset=gb2312\"/>" + strWriter.ToString());
            curContext.Response.End();
        }
    }

    public GridView creatView(DataTable dt)
    {
        GridView gv = new GridView();
        gv.AutoGenerateColumns = false;

        BoundField happenDate = new BoundField();
        happenDate.DataField = "HappenDate";
        happenDate.HeaderText = "日期";
        BoundField projectCode = new BoundField();
        projectCode.DataField = "ProjectCode";
        projectCode.HeaderText = "项目编号";
        BoundField projectAccount = new BoundField();
        projectAccount.DataField = "ProjectAccount";
        projectAccount.HeaderText = "项目账号";
        BoundField cashType = new BoundField();
        cashType.DataField = "CashType";
        cashType.HeaderText = "报销类型";
        BoundField income = new BoundField();
        income.DataField = "Income";
        income.HeaderText = "收入";
        BoundField expense = new BoundField();
        expense.DataField = "Expense";
        expense.HeaderText = "支出";
        BoundField department = new BoundField();
        department.DataField = "Department";
        department.HeaderText = "机构部门";
        BoundField summary = new BoundField();
        summary.DataField = "Summary";
        summary.HeaderText = "摘要";
        BoundField remark = new BoundField();
        remark.DataField = "Remark";
        remark.HeaderText = "备注";
        BoundField handler = new BoundField();
        handler.DataField = "Handler";
        handler.HeaderText = "经办人";
        
        

        gv.Columns.Add(happenDate);
        gv.Columns.Add(projectCode);
        gv.Columns.Add(projectAccount);
        gv.Columns.Add(cashType);
        gv.Columns.Add(income);
        gv.Columns.Add(expense);
        gv.Columns.Add(department);
        gv.Columns.Add(summary);
        gv.Columns.Add(remark);
        gv.Columns.Add(handler);      



        gv.DataSource = dt.DefaultView;
        gv.DataBind();

        return gv;

    }
    /// <summary>
    /// 导出gridview为EXCEL
    /// </summary>
    /// <param name="GridView1"></param>
    public void Export(GridView GridView1)
    {
        //Excel.ApplicationClass oExcel = new Excel.ApplicationClass();
        Excel.ApplicationClass oExcel = new Excel.ApplicationClass();
        object oMissing = System.Reflection.Missing.Value;
        oExcel.Workbooks.Add(oMissing);
        Excel.Workbook oBook = oExcel.Workbooks[1];
        Excel.Worksheet oSheet = (Excel.Worksheet)oBook.Sheets[1];
        oSheet.Name = "最终名单";//this.Title;

        Excel.Range rg;

        //String test = GridView1.Rows[0].Cells[0].Text;


        for (int j = 0; j < GridView1.HeaderRow.Cells.Count; j++)
        {
            rg = ((Excel.Range)oSheet.Cells[1, j + 1]);
            rg.FormulaR1C1 = GridView1.HeaderRow.Cells[j].Text;
        }

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            for (int j = 0; j < GridView1.Rows[0].Cells.Count; j++)
            {
                rg = ((Excel.Range)oSheet.Cells[i + 2, j + 1]);
                rg.NumberFormatLocal = "@";//设置单元格格式为文本
                rg.FormulaR1C1 = GridView1.Rows[i].Cells[j].Text;
            }
        }
        rg = null;

        string VirFileName = Guid.NewGuid().ToString() + ".xls";
        oBook.SaveAs(Server.MapPath(VirFileName), Excel.XlFileFormat.xlExcel9795, oMissing, oMissing, oMissing, oMissing, Excel.XlSaveAsAccessMode.xlExclusive,
        oMissing, oMissing, oMissing, oMissing, oMissing);
        oExcel.Workbooks.Close();
        oExcel.Quit();

        oSheet = null;
        oBook = null;
        oExcel = null;

        GC.Collect();

        Response.Redirect(VirFileName);
    }

    private void ExportExcel(DataTable dt)
    {
        if (dt == null) return;
        Excel.Application xlApp = new Excel.Application();

        if (xlApp == null)
        {
            return;
        }
        System.Globalization.CultureInfo CurrentCI = System.Threading.Thread.CurrentThread.CurrentCulture;
        System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
        Excel.Workbooks workbooks = xlApp.Workbooks;
        Excel.Workbook workbook = workbooks.Add(Excel.XlWBATemplate.xlWBATWorksheet);
        Excel.Worksheet worksheet = (Excel.Worksheet)workbook.Worksheets[1];
        Excel.Range range;
        long totalCount = dt.Rows.Count;
        long rowRead = 0;
        float percent = 0;
        for (int i = 0; i < dt.Columns.Count; i++)
        {
            worksheet.Cells[1, i + 1] = transColumnName(dt.Columns[i].ColumnName);
            range = (Excel.Range)worksheet.Cells[1, i + 1];
            range.Interior.ColorIndex = 15;
            range.Font.Bold = true;
        }

        for (int r = 0; r < dt.Rows.Count; r++)
        {
            for (int i = 0; i < dt.Columns.Count; i++)
            {                
                worksheet.Cells[r + 2, i + 1] = dt.Rows[r][i];
            }
            rowRead++;
            percent = ((float)(100 * rowRead)) / totalCount;
        }
        xlApp.Visible = true;
    }

    private object transColumnName(object p)
    {
        string result = "";
        switch(p.ToString())
        {
            case "HappenDate": result = "日期"; break;
            case "ProjectCode": result = "项目编号"; break;
            case "ProjectAccount": result = "项目账号"; break;
            case "CashType": result = "报销类型"; break;
            case "Income": result = "收入"; break;
            case "Expense": result = "支出"; break;
            case "Department": result = "机构部门"; break;
            case "Summary": result = "摘要"; break;
            case "Remark": result = "备注"; break;
            case "Handler": result = "经办人"; break;
        }
        return result;
    }
}