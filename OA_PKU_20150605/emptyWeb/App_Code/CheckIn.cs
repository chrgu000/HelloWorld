using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
///考勤表
/// </summary>
public class CheckIn
{
	public CheckIn()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 更新或插入考勤记录，根据编号
    /// </summary>
    /// <param name="id"></param>
    /// <param name="pi"></param>
    public static void setCheckInInfo(int id, CheckIn ci)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist=HasCheckInInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [CheckIn] SET [RecordMonth]=@RecordMonth, [StaffName] = @StaffName, [Department] = @Department, [StartDate]=@StartDate, [ShouldBe]=@ShouldBe, [ActualBe]=@ActualBe, [InnerTen]=@InnerTen, [InnerThirty]=@InnerThirty, [OverThirty]=@OverThirty, [Late]=@Late, [Funeral]=@Funneral, [Sick]=@Sick, [Matter]=@Matter, [Performance]=@Performance, [Remaining]=@Remaining, [OverTime]=@OverTime, [Shift]=@Shift, [AllRemaining]=@AllRemaining WHERE [RecordID] = @RecordID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [CheckIn] ([RecordMonth], [StaffName], [Department], [StartDate], [ShouldBe], [ActualBe], [InnerTen], [InnerThirty], [OverThirty], [Late], [Funeral], [Sick], [Matter], [Performance], [Remaining], [OverTime], [Shift], [AllRemaining] ) VALUES (@RecordMonth, @StaffName, @Department, @StartDate, @ShouldBe, @ActualBe, @InnerTen, @InnerThirty, @OverThirty, @Late, @Funeral, @Sick, @Matter, @Performance, @Remaining, @OverTime, @Shift, @AllRemaining)", conn);
        }
        cmd.Parameters.Add("@RecordMonth", SqlDbType.DateTime).Value = ci.recordMonth;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = ci.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = ci.department;
        cmd.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = ci.startDate;
        cmd.Parameters.Add("@ShouldBe", SqlDbType.Int).Value = ci.shouldBe;
        cmd.Parameters.Add("@ActualBe", SqlDbType.Int).Value = ci.actualBe;
        cmd.Parameters.Add("@InnerTen", SqlDbType.Int).Value = ci.innerTen;
        cmd.Parameters.Add("@InnerThirty", SqlDbType.Int).Value = ci.innerThirty;
        cmd.Parameters.Add("@OverThirty", SqlDbType.Int).Value = ci.overThirty;
        cmd.Parameters.Add("@Late", SqlDbType.Int).Value = ci.late;
        cmd.Parameters.Add("@Funeral", SqlDbType.Int).Value = ci.funneral;
        cmd.Parameters.Add("@Sick", SqlDbType.Int).Value = ci.sick;
        cmd.Parameters.Add("@Matter", SqlDbType.Int).Value = ci.matter;
        cmd.Parameters.Add("@Performance", SqlDbType.Int).Value = ci.performance;
        cmd.Parameters.Add("@Remaining", SqlDbType.Int).Value = ci.remaining;
        cmd.Parameters.Add("@OverTime", SqlDbType.Int).Value = ci.overTime;
        cmd.Parameters.Add("@Shift", SqlDbType.Int).Value = ci.shift;
        cmd.Parameters.Add("@AllRemaining", SqlDbType.Int).Value = ci.allRemaining;

        conn.Open();

        //cmd.ExecuteNonQuery();
        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = "会计";
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "考勤表";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;
            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = "机构负责人";
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();

        }


        conn.Close();
    }
    /// <summary>
    /// 根据月份返回当月考勤表
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    public static List<CheckIn> GetCheckInByMonth(DateTime month)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [CheckIn] WHERE [RecordMonth] = @RecordMonth", conn);
        cmd.Parameters.Add("@RecordMonth", SqlDbType.DateTime).Value = month;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        List<CheckIn> result = new List<CheckIn>();
        
        while (sdr.Read())
        {
            CheckIn ci = new CheckIn();
            ci.staffName=(string)sdr["StaffName"];
            ci.department=(string)sdr["Department"];
            ci.startDate = Convert.ToDateTime(sdr["StartDate"]);
            ci.shouldBe=(int)sdr["ShouldBe"];
            ci.actualBe=(int)sdr["ActualBe"];
            ci.innerTen=(int)sdr["InnerTen"];
            ci.innerThirty = (int)sdr["InnerThirty"];
            ci.overThirty=(int)sdr["OverThirty"];
            ci.late=(int)sdr["Late"];
            ci.funneral=(int)sdr["Funeral"];
            ci.sick=(int)sdr["Sick"];
            ci.matter=(int)sdr["Matter"];
            ci.performance=(int)sdr["Performance"];
            ci.remaining=(int)sdr["Remaining"];
            ci.overTime=(int)sdr["OverTime"];
            ci.shift=(int)sdr["Shift"];
            ci.allRemaining=(int)sdr["AllRemaining"];

            result.Add(ci);
        }

        sdr.Close();
        conn.Close();
        return result;
    }
    /// <summary>
    /// 根据月份和姓名返回个人考勤表
    /// </summary>
    /// <param name="year"></param>
    /// <param name="month"></param>
    /// <param name="staff"></param>
    /// <returns></returns>
    public static CheckIn GetPersonalCheckInByMonth(int year, int month, string staff)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [CheckIn] WHERE [RecordMonth] = @RecordMonth AND [StaffName]=@StaffName", conn);
        cmd.Parameters.Add("@RecordMonth", SqlDbType.DateTime).Value = new DateTime(year,month,1);
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = staff;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        CheckIn ci = null;

        if (sdr.Read())
        {
            ci = new CheckIn();
            ci.staffName = (string)sdr["StaffName"];
            ci.department = (string)sdr["Department"];
            ci.startDate = Convert.ToDateTime(sdr["StartDate"]);
            ci.shouldBe = (int)sdr["ShouldBe"];
            ci.actualBe = (int)sdr["ActualBe"];
            ci.innerTen = (int)sdr["InnerTen"];
            ci.innerThirty = (int)sdr["InnerThirty"];
            ci.overThirty = (int)sdr["OverThirty"];
            ci.late = (int)sdr["Late"];
            ci.funneral = (int)sdr["Funeral"];
            ci.sick = (int)sdr["Sick"];
            ci.matter = (int)sdr["Matter"];
            ci.performance = (int)sdr["Performance"];
            ci.remaining = (int)sdr["Remaining"];
            ci.overTime = (int)sdr["OverTime"];
            ci.shift = (int)sdr["Shift"];
            ci.allRemaining = (int)sdr["AllRemaining"];

        }

        sdr.Close();
        conn.Close();
        return ci;
    }
    /// <summary>
    /// 判断特定编号的考勤记录是否已存在，存在返回真
    /// </summary>
    /// <param name="id">用户ID</param>
    /// <returns></returns>
    public static bool HasCheckInInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [CheckIn] WHERE [RecordID] = @RecordID", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    private DateTime recordMonth;
    public DateTime RecordMonth { get { return this.recordMonth; } set { this.recordMonth = value; } }
    private string staffName;
    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    private string department;
    public string Department { get { return this.department; } set { this.department = value; } }
    private DateTime startDate;
    public DateTime StartDate { get { return this.startDate; } set { this.startDate = value; } }
    private int shouldBe;
    public int ShouldBe { get { return this.shouldBe; } set { this.shouldBe = value; } }
    private int actualBe;
    public int ActualBe { get { return this.actualBe; } set { this.actualBe = value; } }
    private int innerTen;
    public int InnterTen { get { return this.innerTen; } set { this.innerTen = value; } }
    private int innerThirty;
    public int InnerThirty { get { return this.innerThirty; } set { this.innerThirty = value; } }
    private int overThirty;
    public int OverThirty { get { return this.overThirty; } set { this.overThirty = value; } }
    private int late;
    public int Late { get { return this.late; } set { this.late = value; } }
    private int funneral;
    public int Funneral { get { return this.funneral; } set { this.funneral = value; } }
    private int sick;
    public int Sick { get { return this.sick; } set { this.sick = value; } }
    private int matter;
    public int Matter { get { return this.matter; } set { this.matter = value; } }
    private int performance;
    public int Performance { get { return this.performance; } set { this.performance = value; } }
    private int remaining;
    public int Remaining { get { return this.remaining; } set { this.remaining = value; } }
    private int overTime;
    public int OverTime { get { return this.overTime; } set { this.overTime = value; } }
    private int shift;
    public int Shift { get { return this.shift; } set { this.shift = value; } }
    private int allRemaining;
    public int AllRemaining { get { return this.allRemaining; } set { this.allRemaining = value; } }

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;


}