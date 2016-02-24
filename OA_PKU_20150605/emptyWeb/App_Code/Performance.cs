using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 员工绩效
/// </summary>
public class Performance
{
	public Performance()
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
    public static void setPerformanceInfo(int id, Performance pi)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasPerformanceInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [PerformanceWeekly] SET [StaffName] = @StaffName, [Department] = @Department, [Year]=@Year, [Month]=@Month, [Week1]=@Week1, [Week2]=@Week2, [Week3]=@Week3, [Week4]=@Week4 WHERE [RecordID] = @RecordID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [PerformanceWeekly] ([StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES ( @StaffName, @Department, @Year, @Month, @Week1, @Week2, @Week3, @Week4) Select @@Identity as 'Identity'", conn);
        }
        

        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = pi.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = pi.department;
        cmd.Parameters.Add("@Year", SqlDbType.Int).Value = pi.year;
        cmd.Parameters.Add("@Month", SqlDbType.Int).Value = pi.month;
        cmd.Parameters.Add("@Week1", SqlDbType.Int).Value = pi.week1;
        cmd.Parameters.Add("@Week2", SqlDbType.Int).Value = pi.week2;
        cmd.Parameters.Add("@Week3", SqlDbType.Int).Value = pi.week3;
        cmd.Parameters.Add("@Week4", SqlDbType.Int).Value = pi.week4;
       

        conn.Open();

        //cmd.ExecuteNonQuery();
        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = "会计";
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "绩效表";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;
            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = "机构负责人";
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();

        }



        conn.Close();
    }

    /// <summary>
    /// 根据年份返回绩效表
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    public static List<Performance> GetCheckInByYear(int year)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [PerformanceWeekly] WHERE [Year]=@Year ORDER BY [StaffName],[Month]", conn);
        cmd.Parameters.Add("@Year", SqlDbType.Int).Value = year;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        List<Performance> result = new List<Performance>();
        while (sdr.Read())
        {
            Performance pi = new Performance();
            pi.staffName = (string)sdr["StaffName"];
            pi.department = (string)sdr["Department"];
            
            pi.year = (int)sdr["Year"];
            pi.month = (int)sdr["Month"];
            pi.week1 = (double)sdr["Week1"];
            pi.week2 = (double)sdr["Week2"];
            pi.week3 = (double)sdr["Week3"];
            pi.week4 = (double)sdr["Week4"];            

            result.Add(pi);
        }

        sdr.Close();
        conn.Close();
        return result;
    }
    /// <summary>
    /// 根据月份和姓名返回个人月度绩效表
    /// </summary>
    /// <param name="year"></param>
    /// <param name="month"></param>
    /// <param name="staff"></param>
    /// <returns></returns>
    public static Performance GetPersonalCheckInByMonth(int year, int month, string staff)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [PerformanceWeekly] WHERE [Year]=@Year AND Month=@Month AND StaffName=@StaffName", conn);
        cmd.Parameters.Add("@Year", SqlDbType.Int).Value = year;
        cmd.Parameters.Add("@Month", SqlDbType.Int).Value = month;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = staff;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        Performance pi = null;
        if(sdr.Read())
        {
            pi = new Performance();
            pi.staffName = (string)sdr["StaffName"];
            pi.department = (string)sdr["Department"];

            pi.year = (int)sdr["Year"];
            pi.month = (int)sdr["Month"];
            pi.week1 = (double)sdr["Week1"];
            pi.week2 = (double)sdr["Week2"];
            pi.week3 = (double)sdr["Week3"];
            pi.week4 = (double)sdr["Week4"];

        }

        sdr.Close();
        conn.Close();
        return pi;
    }
    /// <summary>
    /// 判断特定编号的绩效记录是否已存在，存在返回真
    /// </summary>
    /// <param name="id">用户ID</param>
    /// <returns></returns>
    public static bool HasPerformanceInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [PerformanceWeekly] WHERE [RecordID] = @RecordID", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }


    private string staffName;
    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    private string department;
    public string Department { get { return this.department; } set { this.department=value; } }
    private int year;
    public int Year { get { return this.year; } set { this.year = value; } }
    private int month;
    public int Month { get { return this.month; } set { this.month = value; } }
    private double week1;
    public double Week1 { get { return this.week1; } set { this.week1 = value; } }
    private double week2;
    public double Week2 { get { return this.week2; } set { this.week2 = value; } }
    private double week3;
    public double Week3 { get { return this.week3; } set { this.week3 = value; } }
    private double week4;
    public double Week4 { get { return this.week4; } set { this.week4 = value; } }

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;

}