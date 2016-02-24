using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 行车记录实体
/// </summary>
public class CarUseRecord
{
	public CarUseRecord()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 批量更新或导入行车记录记录，循环insert不好
    /// </summary>
    /// <param name="offList"></param>
    public static void SetCarUseRecord(List<CarUseRecord> offList, int applyID)
    {
        SqlConnection conn = new SqlConnection(connString);
        conn.Open();
        foreach(CarUseRecord os in offList)
        {
            SetSingleRecord(os,applyID,conn);
        }
        conn.Close();
    }
    /// <summary>
    /// 新增或更新单条行车记录
    /// </summary>
    /// <param name="os"></param>
    /// <param name="applyID"></param>
    /// <param name="conn"></param>
    private static void SetSingleRecord(CarUseRecord os, int applyID, SqlConnection conn)
    {
        SqlCommand cmd = new SqlCommand("INSERT INTO [CarUseRecord] ([ApplyID], [Durings], [Destination], [MilesBefore], [MilesAfter]) VALUES (@ApplyID, @Durings, @Destination, @MilesBefore,  @MilesAfter)", conn);

        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = applyID;
        cmd.Parameters.Add("@Durings", SqlDbType.VarChar).Value = os.durings;
        cmd.Parameters.Add("@Destination", SqlDbType.VarChar).Value = os.destination;
        cmd.Parameters.Add("@MilesBefore", SqlDbType.Float).Value = os.milesBefore;
        cmd.Parameters.Add("@MilesAfter", SqlDbType.Float).Value = os.milesAfter;

        cmd.ExecuteNonQuery();
    }
    /// <summary>
    /// 根据申购编号，获取对应的行车记录清单
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static List<CarUseRecord> GetCarUseRecordListByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [CarUseRecord] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        List<CarUseRecord> result = new List<CarUseRecord>();
        while (sdr.Read())
        {
            CarUseRecord temp=new CarUseRecord();
            temp.durings = (string)sdr["Durings"];
            temp.destination = (string)sdr["Destination"];
            temp.milesBefore = Convert.ToDouble(sdr["MilesBefore"]);
            temp.milesAfter=Convert.ToDouble(sdr["MilesAfter"]);

            result.Add(temp);
        }

        conn.Close();
        return result;
    }

    private string durings;
    public string Durings { get { return this.durings; } set { this.durings = value; } }
    private string destination;
    public string Destination { get { return this.destination; } set { this.destination = value; } }
    private double milesBefore;
    public double MilesBefore { get{return this.milesBefore;}set{this.milesBefore=value;}}
    private double milesAfter;
    public double MilesAfter{get{return this.milesAfter;}set{this.milesAfter=value;}}

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;

}