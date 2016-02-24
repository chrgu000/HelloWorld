using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 出差申请表
/// </summary>
public class BusinessTripApply
{
	public BusinessTripApply()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 新增或更新出差申请记录
    /// </summary>
    /// <param name="bi"></param>
    /// <param name="id"></param>
    public static void SetBusinessTripApplyByID(BusinessTripApply bi, int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasBusinessTripRei(id);
        if (!isExist)
        {
            cmd = new SqlCommand("INSERT INTO [BusinessTripApplies] ([StaffName], [Department], [StartDate], [EndDate], [ApplyDate], [ProjectName], [ProjectAccount], [Reason], [Traffic], [Cars], [Hotel], [Meal], [Others], [MoneyEstimate], [ApproveProcess]) VALUES (@StaffName, @Department, @StartDate, @EndDate, @ApplyDate, @ProjectName, @ProjectAccount, @Reason, @Traffic, @Cars, @Hotel, @Meal, @Others, @MoneyEstimate, @ApproveProcess) Select @@Identity as 'Identity'", conn);
        }
        else
        {
            cmd = new SqlCommand("UPDATE [BusinessTripApplies] SET [ApproveProcess]=@ApproveProcess,[ProjectAccount]=@ProjectAccount WHERE [RecordID] = @RecordID", conn);
        }
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = bi.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = bi.department;
        cmd.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = bi.startDate;
        cmd.Parameters.Add("@EndDate", SqlDbType.DateTime).Value = bi.endDate;
        cmd.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = bi.applyDate;
        cmd.Parameters.Add("@ProjectName", SqlDbType.VarChar).Value = bi.projectName;
        cmd.Parameters.Add("@ProjectAccount", SqlDbType.VarChar).Value = bi.projectAccount;
        cmd.Parameters.Add("@Reason", SqlDbType.VarChar).Value = bi.reason;
        cmd.Parameters.Add("@Traffic", SqlDbType.VarChar).Value = bi.traffic;
        cmd.Parameters.Add("@Cars", SqlDbType.VarChar).Value = bi.cars;
        cmd.Parameters.Add("@Hotel", SqlDbType.VarChar).Value = bi.hotel;
        cmd.Parameters.Add("@Meal", SqlDbType.VarChar).Value = bi.meal;
        cmd.Parameters.Add("@Others", SqlDbType.VarChar).Value = bi.others;
        cmd.Parameters.Add("@MoneyEstimate", SqlDbType.Float).Value = bi.moneyEstimate;
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
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "出差申请";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;
            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = ProjectInfo.GetProjectInfoByName(bi.projectName).Manager;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();

        }

        conn.Close();
    }
    /// <summary>
    /// 根据编号返回特定的出差申请记录
    /// </summary>
    /// <param name="recordID"></param>
    /// <returns></returns>
    public static BusinessTripApply GetBusinessTripReiByID(int recordID)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [BusinessTripApplies] WHERE [RecordID] = @RecordID", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordID;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        BusinessTripApply bi = null;
        if (sdr.Read())
        {
            bi = new BusinessTripApply();
            bi.staffName = (string)sdr["StaffName"];
            bi.department = (string)sdr["Department"];
            bi.startDate = Convert.ToDateTime(sdr["StartDate"]);
            bi.endDate = Convert.ToDateTime(sdr["EndDate"]);
            bi.applyDate = Convert.ToDateTime(sdr["ApplyDate"]);
            bi.projectName = (string)sdr["ProjectName"];
            bi.projectAccount = (string)sdr["ProjectAccount"];
            bi.reason = (string)sdr["Reason"];
            bi.traffic = (string)sdr["Traffic"];
            bi.cars = (string)sdr["Cars"];
            bi.hotel = (string)sdr["Hotel"];
            bi.meal = (string)sdr["Meal"];
            bi.others = (string)sdr["Others"];
            bi.moneyEstimate = Convert.ToDouble(sdr["MoneyEstimate"]);

            bi.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();
        return bi;
    }
    /// <summary>
    /// 判断特定编号的记录是否已经存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasBusinessTripRei(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [BusinessTripApplies] WHERE [RecordID] = @RecordID", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    private string staffName;
    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    private string department;
    public string Department { get { return this.department; } set { this.department = value; } }
    private DateTime startDate;
    public DateTime StartDate { get { return this.startDate; } set { this.startDate = value; } }
    private DateTime endDate;
    public DateTime EndDate { get { return this.endDate; } set { this.endDate = value; } }
    private DateTime applyDate;
    public DateTime ApplyDate { get { return this.applyDate; } set { this.applyDate = value; } }
    private string projectName;
    public string ProjectName { get { return this.projectName; } set { this.projectName = value; } }
    private string projectAccount;
    public string ProjectAccount { get { return this.projectAccount; } set { this.projectAccount = value; } }
    private string reason;
    public string Reason { get { return this.reason; } set { this.reason = value; } }
    private string traffic;
    public string Traffic { get { return this.traffic; } set { this.traffic = value; } }
    private string cars;
    public string Cars { get { return this.cars; } set { this.cars = value; } }
    private string hotel;
    public string Hotel { get { return this.hotel; } set { this.hotel = value; } }
    private string meal;
    public string Meal { get { return this.meal; } set { this.meal = value; } }
    private string others;
    public string Others { get { return this.others; } set { this.others = value; } }

    private double moneyEstimate;
    public double MoneyEstimate { get { return this.moneyEstimate; } set { this.moneyEstimate = value; } }
    private string approveProcess;
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;


}