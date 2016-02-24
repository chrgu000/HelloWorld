using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// SalaryDetail 的摘要说明
/// 员工个人工资记录
/// </summary>
public class SalaryDetail
{
	public SalaryDetail()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}


    /// <summary>
    /// 插入或更新一条新的工资记录
    /// </summary>
    /// <param name="id"></param>
    /// <param name="si"></param>
    public static void SetSalaryByID(SalaryDetail si)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasSalaryInfo(si.staffName,si.salaryDate);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [SalaryDetail] SET [BasicSalary]=@BasicSalary, [PerformanceSalary]=@PerformanceSalary, [OtherWithHold]=@OtherWithHold, [OtherBonus] = @OtherBonus, [Endowment]=@Endowment, [Unemployed]=@Unemployed, [Medical]=@Medical, [House]=@House, [TaxIncome]=@TaxIncome, [QuickMinus]=@QuickMinus, [TaxRate]=@TaxRate, [Tax]=@Tax, [Income]=@Income, Remark=@Remark WHERE [StaffName] = @StaffName AND [SalaryDate]=@SalaryDate", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [SalaryDetail] ([ApplyID], [StaffName], [Department], [SalaryDate], [BasicSalary], [PerformanceSalary], [OtherWithHold], [OtherBonus], [Endowment], [Unemployed], [Medical], [House], [TaxIncome], [QuickMinus], [TaxRate], [Tax], [Income], [Remark]) VALUES (@ApplyID, @StaffName, @Department, @SalaryDate, @BasicSalary, @PerformanceSalary, @OtherWithHold, @OtherBonus, @Endowment, @Unemployed, @Medical, @House, @TaxIncome, @QuickMinus, @TaxRate, @Tax, @Income, @Remark ) ", conn);
        }
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = si.applyID;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = si.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = si.department;
        cmd.Parameters.Add("@SalaryDate", SqlDbType.DateTime).Value = si.salaryDate;
        cmd.Parameters.Add("@BasicSalary", SqlDbType.Float).Value = si.basicSalary;
        cmd.Parameters.Add("@PerformanceSalary", SqlDbType.Float).Value = si.performanceSalary;
        cmd.Parameters.Add("@OtherWithHold", SqlDbType.Float).Value = si.otherWithHold;
        cmd.Parameters.Add("@OtherBonus", SqlDbType.Float).Value = si.otherBonus;
        cmd.Parameters.Add("@Endowment", SqlDbType.Float).Value = si.endowment;
        cmd.Parameters.Add("@Unemployed", SqlDbType.Float).Value = si.unemployed;
        cmd.Parameters.Add("@Medical", SqlDbType.Float).Value = si.medical;
        cmd.Parameters.Add("@House", SqlDbType.Float).Value = si.house;
        cmd.Parameters.Add("@TaxIncome", SqlDbType.Float).Value = si.taxIncome;
        cmd.Parameters.Add("@QuickMinus", SqlDbType.Float).Value = si.quickMinus;
        cmd.Parameters.Add("@TaxRate", SqlDbType.Float).Value = si.taxRate ;
        cmd.Parameters.Add("@Tax", SqlDbType.Float).Value = si.tax;
        cmd.Parameters.Add("@Income", SqlDbType.Float).Value = si.income;
        cmd.Parameters.Add("@Remark", SqlDbType.VarChar).Value = si.remark;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    /// <summary>
    /// 根据月份id获取相应的工资列表
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static List<SalaryDetail> GetSalaryListByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [SalaryDetail] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();

        List<SalaryDetail> result = new List<SalaryDetail>();
        while (sdr.Read())
        {
            SalaryDetail si = new SalaryDetail();
            si.staffName = (string)sdr["StaffName"];
            si.department=(string)sdr["Department"];
            si.salaryDate = Convert.ToDateTime(sdr["SalaryDate"]);
            si.basicSalary = Convert.ToDouble(sdr["BasicSalary"]);
            si.performanceSalary = Convert.ToDouble(sdr["PerformanceSalary"]);
            si.otherWithHold = Convert.ToDouble(sdr["OtherWithHold"]);
            si.otherBonus = Convert.ToDouble(sdr["OtherBonus"]);
            si.endowment = Convert.ToDouble(sdr["Endowment"]);
            si.unemployed = Convert.ToDouble(sdr["Unemployed"]);
            si.medical = Convert.ToDouble(sdr["Medical"]);
            si.house = Convert.ToDouble(sdr["House"]);
            si.taxIncome = Convert.ToDouble(sdr["TaxIncome"]);
            si.quickMinus = Convert.ToDouble(sdr["QuickMinus"]);
            si.taxRate = Convert.ToDouble(sdr["TaxRate"]);
            si.tax = Convert.ToDouble(sdr["Tax"]);
            si.income = Convert.ToDouble(sdr["Income"]);
            si.remark = (string)sdr["Remark"];


            result.Add(si);
        }
        sdr.Close();
        conn.Close();
        return result;
    }
    /// <summary>
    /// 根据时间返回某个月得工资列表
    /// </summary>
    /// <param name="year"></param>
    /// <param name="month"></param>
    /// <returns></returns>
    public static List<SalaryDetail> GetSalaryListByMonth(int year, int month)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [SalaryDetail] WHERE [SalaryDate] = @SalaryDate", conn);
        cmd.Parameters.Add("@SalaryDate", SqlDbType.DateTime).Value = new DateTime(year, month, 1);
        
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        List<SalaryDetail> result = new List<SalaryDetail>();

        while (sdr.Read())
        {
            SalaryDetail si = new SalaryDetail();
            si.staffName = (string)sdr["StaffName"];
            si.department = (string)sdr["Department"];
            si.salaryDate = Convert.ToDateTime(sdr["SalaryDate"]);
            si.basicSalary = Convert.ToDouble(sdr["BasicSalary"]);
            si.performanceSalary = Convert.ToDouble(sdr["PerformanceSalary"]);
            si.otherWithHold = Convert.ToDouble(sdr["OtherWithHold"]);
            si.otherBonus = Convert.ToDouble(sdr["OtherBonus"]);
            si.endowment = Convert.ToDouble(sdr["Endowment"]);
            si.unemployed = Convert.ToDouble(sdr["Unemployed"]);
            si.medical = Convert.ToDouble(sdr["Medical"]);
            si.house = Convert.ToDouble(sdr["House"]);
            si.taxIncome = Convert.ToDouble(sdr["TaxIncome"]);
            si.quickMinus = Convert.ToDouble(sdr["QuickMinus"]);
            si.taxRate = Convert.ToDouble(sdr["TaxRate"]);
            si.tax = Convert.ToDouble(sdr["Tax"]);
            si.income = Convert.ToDouble(sdr["Income"]);
            si.remark = (string)sdr["Remark"];

            result.Add(si);
        }
        sdr.Close();
        conn.Close();
        return result;
    }
    /// <summary>
    /// 根据时间和姓名返回相应月份的个人工资
    /// </summary>
    /// <param name="year"></param>
    /// <param name="month"></param>
    /// <param name="staff"></param>
    /// <returns></returns>
    public static SalaryDetail GetPersonalSalaryByMonth(int year, int month, string staff)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [SalaryDetail] WHERE [SalaryDate] = @SalaryDate AND StaffName=@StaffName", conn);
        cmd.Parameters.Add("@SalaryDate", SqlDbType.DateTime).Value = new DateTime(year,month,1);
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = staff;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        SalaryDetail si = null;
        
        if (sdr.Read())
        {
            si = new SalaryDetail();
            si.staffName = (string)sdr["StaffName"];
            si.department = (string)sdr["Department"];
            si.salaryDate = Convert.ToDateTime(sdr["SalaryDate"]);
            si.basicSalary = Convert.ToDouble(sdr["BasicSalary"]);
            si.performanceSalary = Convert.ToDouble(sdr["PerformanceSalary"]);
            si.otherWithHold = Convert.ToDouble(sdr["OtherWithHold"]);
            si.otherBonus = Convert.ToDouble(sdr["OtherBonus"]);
            si.endowment = Convert.ToDouble(sdr["Endowment"]);
            si.unemployed = Convert.ToDouble(sdr["Unemployed"]);
            si.medical = Convert.ToDouble(sdr["Medical"]);
            si.house = Convert.ToDouble(sdr["House"]);
            si.taxIncome = Convert.ToDouble(sdr["TaxIncome"]);
            si.quickMinus = Convert.ToDouble(sdr["QuickMinus"]);
            si.taxRate = Convert.ToDouble(sdr["TaxRate"]);
            si.tax = Convert.ToDouble(sdr["Tax"]);
            si.income = Convert.ToDouble(sdr["Income"]);
            si.remark = (string)sdr["Remark"];


        }
        sdr.Close();
        conn.Close();
        return si;
    }
    /// <summary>
    /// 判断某人某月工资记录是否已存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasSalaryInfo(string staffName, DateTime salaryDate)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [SalaryDetail] WHERE [StaffName] = @StaffName AND [SalaryDate]=@SalaryDate", conn);
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = staffName;
        cmd.Parameters.Add("@SalaryDate", SqlDbType.DateTime).Value = salaryDate;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }





    private int applyID;
    public int ApplyID { get { return this.applyID; } set { this.applyID = value; } }
    private string staffName;
    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    private string department;
    public string Department { get { return this.department; } set { this.department = value; } }
    private DateTime salaryDate;
    public DateTime SalaryDate { get { return this.salaryDate; } set { this.salaryDate = value; } }
    private double basicSalary;
    public double BasicSalary { get { return this.basicSalary; } set { this.basicSalary = value; } }
    private double performanceSalary;
    public double PerformanceSalary { get { return this.performanceSalary; } set { this.performanceSalary = value; } }
    private double otherWithHold;
    public double OtherWithHold { get { return this.otherWithHold; } set { this.otherWithHold = value; } }
    private double otherBonus;
    public double OtherBonus { get { return this.otherBonus; } set { this.otherBonus = value; } }
   
    private double endowment;
    public double Endowment { get { return this.endowment; } set { this.endowment = value; } }
    private double unemployed;
    public double Unemployed { get { return this.unemployed; } set { this.unemployed = value; } }
    private double medical;
    public double Medical { get { return this.medical; } set { this.medical = value; } }
    private double house;
    public double House { get { return this.house; } set { this.house = value; } }
    private double taxIncome;
    public double TaxIncome { get { return this.taxIncome; } set { this.taxIncome = value; } }
    private double taxRate;
    public double TaxRate { get { return this.taxRate; } set { this.taxRate = value; } }
    private double tax;
    public double Tax { get { return this.tax; } set { this.tax = value; } }
    private double quickMinus;
    public double QuickMinus { get { return this.quickMinus; } set { this.quickMinus = value; } }
    private double income;
    public double Income { get { return this.income; } set { this.income = value; } }
    private string remark;
    public string Remark { get { return this.remark; } set { this.remark = value; } }

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}