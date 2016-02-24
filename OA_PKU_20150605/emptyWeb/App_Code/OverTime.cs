using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// OverTime 的摘要说明
/// 加班申请表、调休申请表、请假单
/// </summary>
public class OverTime
{
	public OverTime()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 插入或更新一条加班申请记录
    /// </summary>
    /// <param name="id"></param>
    /// <param name="oi"></param>
    public static void SetOverTimeByID(int id, OverTime oi, string proManager)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasOverTimeInfo(id);
        if (isExist)   
        {
            cmd = new SqlCommand("UPDATE [OverTimes] SET [StafffName] = @StaffName, [Departments] = @Departments, [ApplyDate] = @ApplyDate, [StartDate] = @StartDate, [EndDate] = @EndDate, [Reason] = @Reason WHERE [ApplyID] = @ApplyID", conn);
        }
        else 
        {
            cmd = new SqlCommand("INSERT INTO [OverTimes] ([StaffName], [Department], [ApplyDate],[StartDate],[EndDate],[Reason],[ApproveProcess]) VALUES (@StaffName, @Department, @ApplyDate,@StartDate,@EndDate,@Reason, @ApproveProcess)   Select @@Identity as 'Identity'", conn);
        }    
                
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = oi.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = oi.department;
        cmd.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = oi.applyDate;
        cmd.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = oi.startDate;
        cmd.Parameters.Add("@EndDate", SqlDbType.DateTime).Value = oi.endDate;
        cmd.Parameters.Add("@Reason", SqlDbType.VarChar).Value = oi.reason;


        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = oi.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "加班申请";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;
            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = proManager;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }

        conn.Close();
    }
    /// <summary>
    /// 根据申请编号返回加班申请记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static OverTime GetOverTimeByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [OverTimes] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        OverTime oi = null;
        if (sdr.Read())
        {
            oi = new OverTime();
            oi.staffName = (string)sdr["StaffName"];
            oi.department = (string)sdr["Department"];
            oi.applyDate = Convert.ToDateTime(sdr["ApplyDate"]);
            oi.startDate = Convert.ToDateTime(sdr["StartDate"]);
            oi.endDate = Convert.ToDateTime(sdr["EndDate"]);
            oi.reason=(string)sdr["Reason"];
            oi.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();
        return oi;
    }
    /// <summary>
    /// 判断特定编号的加班申请是否已存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasOverTimeInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [OverTimes] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.VarChar).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }


    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    public string Department { get { return this.department; } set { this.department = value; } }
    public DateTime ApplyDate { get { return this.applyDate; } set { this.applyDate = value; } }
    public DateTime StartDate { get { return this.startDate; } set { this.startDate = value; } }
    public DateTime EndDate { get { return this.endDate; } set { this.endDate = value; } }
    public string Reason { get { return this.reason; } set { this.reason = value; } }
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }

    private string staffName;
    private string department;
    private DateTime applyDate;
    private DateTime startDate;
    private DateTime endDate;
    private string reason;
    private string approveProcess;

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}