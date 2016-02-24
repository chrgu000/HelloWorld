using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// PositionTarget 的摘要说明
/// 岗位责任书
/// </summary>
public class PositionTarget
{
	public PositionTarget()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 新增或更新岗位目标责任书
    /// </summary>
    /// <param name="id"></param>
    /// <param name="ri"></param>
    public static void SetPositionTargetByID(int id, PositionTarget pi)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasPositionTarget(id);
        if (!isExist)
        {
            cmd = new SqlCommand("INSERT INTO [PositionTarget] ([StaffName], [Position], [Department], [FormerPosition],  [Leader], [Year], [NewPosition], [Duty], [Target], [MonthlyIncome], [SalaryLevel], [ApproveProcess]) VALUES (@StaffName, @Position, @Department, @FormerPosition,  @Leader, @Year, @NewPosition, @Duty, @Target, @MonthlyIncome, @SalaryLevel, @ApproveProcess) Select @@Identity as 'Identity'", conn);
        }
        else
        {
            cmd = new SqlCommand("UPDATE [PositionTarget] SET [StaffName]=@StaffName, [Position]=@Position, [Department]=@Department, [FormerPosition]=@FormerPosition, [Leader]=@Leader, [Year]=@Year, [NewPosition]=@NewPosition, [Duty]=@Duty, [Target]=@Target, [MonthlyIncome]=@MonthlyIncome, [SalaryLevel]=@SalaryLevel, [ApproveProcess]=@ApproveProcess WHERE [RecordID] = @RecordID", conn);
        }
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = pi.staffName;
        cmd.Parameters.Add("@Position", SqlDbType.VarChar).Value = pi.position;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = pi.department;
        cmd.Parameters.Add("@FormerPosition", SqlDbType.VarChar).Value = pi.formerPosition;
        cmd.Parameters.Add("@Leader", SqlDbType.VarChar).Value = pi.leader;
        cmd.Parameters.Add("@Year", SqlDbType.Int).Value = pi.year;
        cmd.Parameters.Add("@NewPosition", SqlDbType.VarChar).Value = pi.newPosition;
        cmd.Parameters.Add("@Duty", SqlDbType.VarChar).Value = pi.duty;
        cmd.Parameters.Add("@Target", SqlDbType.VarChar).Value = pi.target;

        cmd.Parameters.Add("@MonthlyIncome", SqlDbType.VarChar).Value = pi.monthlyIncome;
        cmd.Parameters.Add("@SalaryLevel", SqlDbType.VarChar).Value = pi.salaryLevel;
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = pi.approveProcess;

        conn.Open();

        //cmd.ExecuteNonQuery();
        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = pi.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "岗位责任书";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;
            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = pi.leader ;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }

        conn.Close();
    }
    /// <summary>
    /// 根据姓名，获取岗位目标责任书
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static PositionTarget GetTargetByName(string staffName)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [PositionTarget] WHERE [StaffName] = @StaffName", conn);
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = staffName;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        PositionTarget pi = null;
        if (sdr.Read())
        {
            pi = new PositionTarget();
            pi.staffName = (string)sdr["StaffName"];
            pi.department = (string)sdr["Department"];
            pi.position = (string)sdr["Position"];
            pi.formerPosition = (string)sdr["FormerPosition"];
            pi.leader = (string)sdr["Leader"];
            pi.year = Convert.ToInt16(sdr["Year"]);
            pi.newPosition = (string)sdr["NewPosition"];
            pi.duty=(string)sdr["Duty"];
            pi.target=(string)sdr["Target"];
            pi.monthlyIncome = (string)sdr["MonthlyIncome"];
            pi.salaryLevel=(string)sdr["SalaryLevel"];
            pi.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();
        return pi;
    }
    /// <summary>
    /// 根据编号获取相应的岗位目标责任书
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static PositionTarget GetTargetByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [PositionTarget] WHERE [RecordID] = @RecordID", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        PositionTarget pi = null;
        if (sdr.Read())
        {
            pi = new PositionTarget();
            pi.staffName = (string)sdr["StaffName"];
            pi.department = (string)sdr["Department"];
            pi.position = (string)sdr["Position"];
            pi.formerPosition = (string)sdr["FormerPosition"];
            pi.leader = (string)sdr["Leader"];
            pi.year = Convert.ToInt16(sdr["Year"]);
            pi.newPosition = (string)sdr["NewPosition"];
            pi.duty = (string)sdr["Duty"];
            pi.target = (string)sdr["Target"];
            pi.monthlyIncome = (string)sdr["MonthlyIncome"];
            pi.salaryLevel = (string)sdr["SalaryLevel"];
            pi.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();
        return pi;
    }
    /// <summary>
    /// 判断特定编号的记录是否已存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasPositionTarget(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [PositionTarget] WHERE [RecordID] = @RecordID", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    private int recordID;
    public int RecordID { get { return this.recordID; } set { this.recordID = value; } }
    private string staffName;
    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    private string department;
    public string Department { get { return this.department; } set { this.department = value; } }
    private string position;
    public string Position { get { return this.position; } set { this.position = value; } }
    private string formerPosition;
    public string FormerPosition { get { return this.formerPosition; } set { this.formerPosition = value; } }
    private string leader;
    public string Leader { get { return this.leader; } set { this.leader = value; } }
    private int year;
    public int Year { get { return this.year; } set { this.year = value; } }
    private string newPosition;
    public string NewPosition { get { return this.newPosition; } set { this.newPosition = value; } }
    private string duty;
    public string Duty { get { return this.duty; } set { this.duty = value; } }
    private string target;
    public string Target { get { return this.target; } set { this.target = value; } }
    private string monthlyIncome;
    public string MonthlyIncome { get { return this.monthlyIncome; } set { this.monthlyIncome = value; } }
    private string salaryLevel;
    public string SalaryLevel { get { return this.salaryLevel; } set { this.salaryLevel = value; } }
    private string approveProcess;
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;

}