using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// YearlyBudgetSingle 的摘要说明
/// 年度概算单项实体
/// </summary>
public class YearlyBudgetSingle
{
	public YearlyBudgetSingle()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 批量更新或导入年度概算记录，循环insert不好
    /// </summary>
    /// <param name="offList"></param>
    public static void SetOfficeSupplySingle(List<YearlyBudgetSingle> offList, int applyID)
    {
        SqlConnection conn = new SqlConnection(connString);
        conn.Open();
        foreach (YearlyBudgetSingle os in offList)
        {
            SetSingleBudget(os, applyID, conn);
        }
        conn.Close();
    }

    private static void SetSingleBudget(YearlyBudgetSingle os, int applyID, SqlConnection conn)
    {
        SqlCommand cmd = new SqlCommand("INSERT INTO [YearlyBudgetSingle] ([ApplyID], [ItemType], [ItemDetail], [Budget], [Year]) VALUES (@ApplyID, @ItemType, @ItemDetail, @Budget,  @Year)", conn);

        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = applyID;
        cmd.Parameters.Add("@ItemType", SqlDbType.VarChar).Value = os.itemType;
        cmd.Parameters.Add("@ItemDetail", SqlDbType.VarChar).Value = os.itemDetail;
        cmd.Parameters.Add("@Budget", SqlDbType.Float).Value = os.budget;
        cmd.Parameters.Add("@Year", SqlDbType.Int).Value = os.year;

        cmd.ExecuteNonQuery();
    }
    /// <summary>
    /// 根据编号获取年度概算记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static List<YearlyBudgetSingle> GetYearlyBudgetListByID(int id, ref double sum)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [YearlyBudgetSingle] WHERE [ApplyID] = @ApplyID ORDER BY [ItemType]", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        List<YearlyBudgetSingle> result = new List<YearlyBudgetSingle>();
        while (sdr.Read())
        {
            YearlyBudgetSingle temp = new YearlyBudgetSingle();
            temp.itemType=(string)sdr["ItemType"];
            temp.itemDetail=(string)sdr["ItemDetail"];
            temp.budget = Convert.ToDouble(sdr["Budget"]); sum += temp.budget;
            temp.year = Convert.ToInt16(sdr["Year"]);            
            result.Add(temp);
        }

        conn.Close();
        return result;
    }
    /// <summary>
    /// 根据年份得到年度概算表记录
    /// </summary>
    /// <param name="year"></param>
    /// <returns></returns>
    public static List<YearlyBudgetSingle> GetYearlyBudgetListByYear(int year)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [YearlyBudgetSingle] WHERE [Year] = @Year ORDER BY [ItemType]", conn);
        cmd.Parameters.Add("@Year", SqlDbType.Int).Value = year;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        List<YearlyBudgetSingle> result = new List<YearlyBudgetSingle>();
        while (sdr.Read())
        {
            YearlyBudgetSingle temp = new YearlyBudgetSingle();
            temp.itemType = (string)sdr["ItemType"];
            temp.itemDetail = (string)sdr["ItemDetail"];
            temp.budget = Convert.ToDouble(sdr["Budget"]); 
            temp.year = Convert.ToInt16(sdr["Year"]);
            result.Add(temp);
        }

        conn.Close();
        return result;
    }
    /// <summary>
    /// 判断特定编号的年度概算记录是否已存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasYearlyBudgetInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [YearlyBudgetSingle] WHERE [RecordID] = @RecordID", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    private int year;
    public int Year { get { return this.year; } set { this.year = value; } }
    private string itemType;
    public string ItemType { get { return this.itemType; } set { this.itemType = value; } }
    private string itemDetail;
    public string ItemDetail { get { return this.itemDetail; } set { this.itemDetail = value; } }
    private double budget;
    public double Budget { get { return this.budget; } set { this.budget = value; } }

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;

}