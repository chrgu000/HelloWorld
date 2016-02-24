using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 
/// 员工转正申请表
/// </summary>
public class ConversionApply
{
	public ConversionApply()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 新增或更新转正申请记录
    /// </summary>
    /// <param name="id"></param>
    /// <param name="ci"></param>
    /// <param name="userID"></param>
    public static void SetConversionApplyByID(int id, ConversionApply ci, int userID)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasConversionApplyInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [ConversionApplies] SET [StaffName] = @StaffName, [Department]=@Department, [Education]=@Education, [Level]=@Level, [SalaryLevel]=@SalaryLevel, [StartDate]=@StartDate, [ApplyDate]=@ApplyDate, [Summary] = @Summary, [ApproveProcess]=@ApproveProcess WHERE [ApplyID] = @ApplyID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [ConversionApplies] ( [StaffName], [Department], [Education], [Level], [SalaryLevel], [StartDate], [ApplyDate], [Summary]) VALUES ( @StaffName, @Department, @Education, @Level, @SalaryLevel, @StartDate, @ApplyDate, @Summary)  Select @@Identity as 'Identity'", conn);
        }
        
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = ci.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = ci.department;
        cmd.Parameters.Add("@Education", SqlDbType.VarChar).Value = ci.education;
        cmd.Parameters.Add("@Level", SqlDbType.Float).Value = ci.level;
        cmd.Parameters.Add("@SalaryLevel", SqlDbType.VarChar).Value = ci.salaryLevel;
        cmd.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = ci.startDate;
        cmd.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = ci.applyDate;
        cmd.Parameters.Add("@Summary", SqlDbType.VarChar).Value = ci.summary;
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = ci.approveProcess;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = ci.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "员工转正申请";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;


            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = Department.GetDepartmentByName(ci.department).ResponsiblePerson;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }


        conn.Close();
    }
    /// <summary>
    /// 根据编号返回特定的转正申请记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static ConversionApply GetConversionApplyByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [ConversionApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        ConversionApply ci = null;
        if (sdr.Read())
        {
            ci = new ConversionApply();
            ci.staffName = (string)sdr["StaffName"];
            ci.department = (string)sdr["Department"];
            ci.education = (string)sdr["Education"];
            ci.level = (string)sdr["Level"];
            ci.salaryLevel = (string)sdr["SalaryLevel"];
            ci.startDate = Convert.ToDateTime(sdr["StartDate"]);
            ci.applyDate = Convert.ToDateTime(sdr["ApplyDate"]);
            ci.summary=(string)sdr["Summary"];
            ci.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();
        return ci;
    }

    /// <summary>
    /// 判断特定编号的转正申请是否已存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasConversionApplyInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [ConversionApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    public string Education { get { return this.education; } set { this.education = value; } }
    public string Department_str { get { return this.department; } set { this.department = value; } }
    public DateTime StartDate { get { return this.startDate; } set { this.startDate = value; } }
    public DateTime ApplyDate { get { return this.applyDate; } set { this.applyDate = value; } }
    public string Level { get { return this.level; } set { this.level = value; } }
    public string SalaryLevel { get { return this.salaryLevel; } set { this.salaryLevel = value; } }
    public string Summary { get { return this.summary; } set { this.summary = value; } }
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }

    private string staffName;
    private string education;
    private string department;
    private DateTime startDate;
    private string level;
    private DateTime applyDate;
    private string summary;
    private string salaryLevel;
    private string approveProcess;

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;

}