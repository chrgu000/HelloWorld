using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 出差总结报告
/// </summary>
public class BusinessTripSummary
{
	public BusinessTripSummary()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 新增或更新出差总结报告
    /// </summary>
    /// <param name="bi"></param>
    /// <param name="id"></param>
    public static void SetBusinessTripApplyByID(BusinessTripSummary bi, int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasBusinessTripSummary(id);
        if (!isExist)
        {
            cmd = new SqlCommand("INSERT INTO [BusinessTripSummary] ([StaffName], [Department], [StartDate], [EndDate], [ProjectName], [Location], [Expense], [Travel], [Reason], [Finished], [Unfinished], [ApproveProcess]) VALUES (@StaffName, @Department, @StartDate, @EndDate, @ProjectName, @Location, @Expense, @Travel, @Reason, @Finished, @Unfinished, @ApproveProcess) Select @@Identity as 'Identity'", conn);
        }
        else
        {
            cmd = new SqlCommand("UPDATE [BusinessTripSummary] SET [ApproveProcess]=@ApproveProcess WHERE [RecordID] = @RecordID", conn);
        }
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = bi.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = bi.departmentName;
        cmd.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = bi.startDate;
        cmd.Parameters.Add("@EndDate", SqlDbType.DateTime).Value = bi.endDate;
        cmd.Parameters.Add("@ProjectName", SqlDbType.VarChar).Value = bi.projectName;
        cmd.Parameters.Add("@Location", SqlDbType.VarChar).Value = bi.location;
        cmd.Parameters.Add("@Reason", SqlDbType.VarChar).Value = bi.reason;
        cmd.Parameters.Add("@Travel", SqlDbType.VarChar).Value = bi.travels;
        cmd.Parameters.Add("@Expense", SqlDbType.VarChar).Value = bi.expense;
        cmd.Parameters.Add("@Finished", SqlDbType.VarChar).Value = bi.finished;
        cmd.Parameters.Add("@Unfinished", SqlDbType.VarChar).Value = bi.finished;
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = bi.approveProcess;

        conn.Open();
        //cmd.ExecuteNonQuery();
        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = bi.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "出差总结报告";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;
            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = bi.StaffName;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();

        }

        conn.Close();
    }
    /// <summary>
    /// 根据编号获取指定的出差总结报告记录
    /// </summary>
    /// <param name="recordID"></param>
    /// <returns></returns>
    public static BusinessTripSummary GetBusinessTripReiByID(int recordID)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [BusinessTripSummary] WHERE [RecordID] = @RecordID", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordID;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        BusinessTripSummary bi = null;
        if (sdr.Read())
        {
            bi = new BusinessTripSummary();
            bi.staffName = (string)sdr["StaffName"];
            bi.departmentName = (string)sdr["DepartmentName"];
            bi.startDate = Convert.ToDateTime(sdr["StartDate"]);
            bi.endDate = Convert.ToDateTime(sdr["EndDate"]);
           
            bi.projectName = (string)sdr["ProjectName"];
            bi.location = (string)sdr["Location"];
            bi.reason = (string)sdr["Reason"];
            bi.expense = (string)sdr["Expense"];
            bi.travels = (string)sdr["Travel"];
            bi.finished = (string)sdr["Finished"];
            bi.unfinished = (string)sdr["Unfinished"];
          

            bi.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();
        return bi;
    }
    /// <summary>
    /// 判断指定编号的出差总结是否存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasBusinessTripSummary(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [BusinessTripSummary] WHERE [RecordID] = @RecordID", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    private string staffName;
    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    private string departmentName;
    public string DepartmentName { get { return this.departmentName; } set { this.departmentName = value; } }
    private DateTime startDate;
    public DateTime StartDate { get { return this.startDate; } set { this.startDate = value; } }
    private DateTime endDate;
    public DateTime EndDate { get { return this.endDate; } set { this.endDate = value; } }
    private string projectName;
    public string ProjectName { get { return this.projectName; } set { this.projectName = value; } }
    private string location;
    public string Location { get { return this.location; } set { this.location = value; } }
    private string expense;
    public string Expense { get { return this.expense; } set { this.expense = value; } }
    private string travels;
    public string Travels { get { return this.travels; } set { this.travels  = value; } }
    private string reason;
    public string Reason { get { return this.reason; } set { this.reason = value; } }
    private string finished;
    public string Finished { get { return this.finished; } set { this.finished = value; } }
    private string unfinished;
    public string Unfinished { get { return this.unfinished; } set { this.unfinished=value; } }
    private string approveProcess;
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}