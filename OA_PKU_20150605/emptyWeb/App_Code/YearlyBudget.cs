using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// YearlyBudget 的摘要说明
/// </summary>
public class YearlyBudget
{
	public YearlyBudget()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 根据编号新增或更新办公用品申购记录
    /// </summary>
    /// <param name="id"></param>
    /// <param name="oi"></param>
    /// <param name="projectName"></param>
    public static int SetYearlyBudgetByID(int id, YearlyBudget yi, string manager)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasYearlyBudgetApplyInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [YearlyBudgetApplies] SET [StaffName] = @StaffName, [ApplyDate]=@ApplyDate, [ApproveProcess]=@ApproveProcess WHERE [ApplyID] = @ApplyID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [YearlyBudgetApplies] ([StaffName], [ApplyDate]) VALUES (@StaffName, @ApplyDate)  Select @@Identity as 'Identity'", conn);
        }
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = yi.staffName;        
        cmd.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = yi.applyDate;

        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = yi.approveProcess;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = yi.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "年度经费概算";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;


            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = yi.StaffName;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }


        conn.Close();
        return recordId;
    }

    /// <summary>
    /// 根据编号获取年度概算记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static YearlyBudget GetYearlyBudgetApplyByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [YearlyBudgetApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        YearlyBudget yi = null;
        if (sdr.Read())
        {
            yi = new YearlyBudget();
            yi.budgetList = new List<YearlyBudgetSingle>();            
            yi.staffName = (string)sdr["StaffName"];            
            yi.applyDate = Convert.ToDateTime(sdr["ApplyDate"]);
            yi.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();

        double all = 0.0;
        List<YearlyBudgetSingle> result = YearlyBudgetSingle.GetYearlyBudgetListByID(id, ref all);
        yi.sum = all;
        yi.budgetList.AddRange(result);
        
        return yi;
    }
    
    /// <summary>
    /// 判断特定编号的年度概算申请是否已存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasYearlyBudgetApplyInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [YearlyBudgetApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    private double sum;
    public double Sum { get { return this.sum; } set { this.sum = value; } }
    private List<YearlyBudgetSingle> budgetList;
    public List<YearlyBudgetSingle> BudgetList { get { return this.budgetList; } set { foreach (YearlyBudgetSingle s in value) { this.budgetList.Add(s); } } }
    private string staffName;
    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    private DateTime applyDate;
    public DateTime ApplyDate { get { return this.applyDate; } set { this.applyDate = value; } }
    private string approveProcess;
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }


    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}