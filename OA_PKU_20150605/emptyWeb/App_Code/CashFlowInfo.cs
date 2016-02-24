using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 收支明细表
/// </summary>
public class CashFlowInfo
{
    #region 对象属性
    private int recordID;//该笔收支在相应原始明细表如费用报销 中的ID
    private DateTime happendDate;
    private string projectCode;
    private string projectAccount;
    private string cashType;//报销类型
    private double income;
    private double expense;
    private string department;
    private string summary;
    private string remark;
    private string handler;//经办人
    private string voucherID;//凭单编号
    private string accountID;//科目编号

    public int RecordID { get { return this.recordID; } set { this.recordID = value; } }
    public DateTime HappenDate { get { return this.happendDate; } set { this.happendDate = value; } }
    public string ProjectCode { get { return this.projectCode; } set { this.projectCode = value; } }
    public string ProjectAccount { get { return this.projectAccount; } set { this.projectAccount = value; } }
    public string CashType { get { return this.cashType; } set { this.cashType = value; } }
    public double Income { get { return this.income; } set { this.income = value; } }
    public double Expense { get { return this.expense; } set { this.expense = value; } }
    public string Department { get { return this.department; } set { this.department = value; } }
    public string Summary { get { return this.summary; } set { this.summary = value; } }
    public string Remark { get { return this.remark; } set { this.remark = value; } }
    public string Handler { get { return this.handler; } set { this.handler = value; } }
    public string VoucherID { get { return this.voucherID; } set { this.voucherID = value; } }
    public string AccountID { get { return this.accountID; } set { this.accountID = value; } }

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
    #endregion

    public CashFlowInfo()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}


    /// <summary>
    /// 新增收支情况
    /// </summary>
    /// <param name="ci"></param>
    /// <param name="recordid">该笔收支在相应明细表里ID</param>
    public static void SetCashFlow(CashFlowInfo ci, int recordid)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        if(HasCashFlowInfo(recordid,ci.cashType))
        {
            cmd = new SqlCommand("UPDATE [AllCashFlow] SET [HappenDate]=@HappenDate, [ProjectCode]=@ProjectCode, [ProjectAccount]=@ProjectAccount,  [Income]=@Income, [Expense]=@Expense, [Department]=@Department, [Summary]=@Summary, [Remark]=@Remark, [Handler]=@Handler, [VoucherID]=@VoucherID, [AccountID]=@AccountID  WHERE [RecordID] = @RecordID AND [CashType]=@CashType", conn);
        }
        else{
            cmd = new SqlCommand("INSERT INTO [AllCashFlow] ([RecordID], [HappenDate], [ProjectCode], [ProjectAccount], [CashType], [Income], [Expense], [Department], [Summary], [Remark], [Handler], [VoucherID], [AccountID]) VALUES (@RecordID, @HappenDate, @ProjectCode, @ProjectAccount, @CashType, @Income, @Expense, @Department, @Summary, @Remark, @Handler, @VoucherID, @AccountID)", conn);
        }

        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordid;
        cmd.Parameters.Add("@HappenDate", SqlDbType.DateTime).Value = ci.happendDate;
        cmd.Parameters.Add("@ProjectCode", SqlDbType.VarChar).Value = ci.projectCode;
        cmd.Parameters.Add("@ProjectAccount", SqlDbType.VarChar).Value = ci.projectAccount;
        cmd.Parameters.Add("@CashType", SqlDbType.VarChar).Value = ci.cashType;
        cmd.Parameters.Add("@Income", SqlDbType.Float).Value = ci.income;
        cmd.Parameters.Add("@Expense", SqlDbType.Float).Value = ci.expense;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = ci.department;
        cmd.Parameters.Add("@Summary", SqlDbType.VarChar).Value = ci.summary;
        cmd.Parameters.Add("@Remark", SqlDbType.VarChar).Value = ci.remark;
        cmd.Parameters.Add("@Handler", SqlDbType.VarChar).Value = ci.handler;
        cmd.Parameters.Add("@VoucherID", SqlDbType.VarChar).Value = ci.voucherID;
        cmd.Parameters.Add("@AccountID", SqlDbType.VarChar).Value = ci.accountID;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }    
    
    
    /// <summary>
    /// 根据筛选条件，返回结果集
    /// </summary>
    /// <param name="sql"></param>
    /// <returns></returns>
    public static List<CashFlowInfo> GetFilerResult(string sql)
    {
        List<CashFlowInfo> result = new List<CashFlowInfo>();

        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();

        SqlDataReader sdr = cmd.ExecuteReader();
        CashFlowInfo ci = null;
        while (sdr.Read())
        {
            ci = new CashFlowInfo();
            ci.recordID = (int)sdr["RecordID"];
            ci.happendDate = (DateTime)sdr["HappenDate"];
            ci.projectCode = (string)sdr["ProjectCode"];
            ci.projectAccount = (string)sdr["ProjectAccount"];
            ci.cashType = (string)sdr["CashType"];
            ci.income = (double)sdr["Income"];
            ci.expense = (double)sdr["Expense"];
            ci.department = (string)sdr["Department"];
            ci.summary = (string)sdr["Summary"];
            ci.remark = (string)sdr["Remark"];
            ci.handler = (string)sdr["Handler"];
            ci.voucherID = sdr["VoucherID"]==DBNull.Value?"":(string)sdr["VoucherID"];
            ci.accountID = sdr["AccountID"] == DBNull.Value ? "" : (string)sdr["AccountID"];

            result.Add(ci);
        }
        sdr.Close();

        conn.Close();
        return result;
    }
    public static DataTable GetFilterResultExecl(string sql)
    {
       
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        

        conn.Close();
        return ds.Tables[0];
    }
    /// <summary>
    /// 判断该笔收入是否已存在
    /// </summary>
    /// <param name="recordid"></param>
    /// <param name="cashType"></param>
    /// <returns></returns>
    public static bool HasCashFlowInfo(int recordid,string cashType)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [AllCashFlow] WHERE [RecordID] = @RecordID AND [CashType]=@CashType", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordid;
        cmd.Parameters.Add("@CashType", SqlDbType.VarChar).Value = cashType;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    
}