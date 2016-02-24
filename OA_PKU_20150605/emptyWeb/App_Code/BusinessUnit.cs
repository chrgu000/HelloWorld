using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 事业部实体
/// </summary>
public class BusinessUnit
{
	public BusinessUnit()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 获取全部事业部，用于下拉列表框绑定
    /// </summary>
    /// <returns></returns>
    public static DataSet GetAllBU()
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [BusinessUnit]", conn);
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);

        conn.Close();
        return ds;
    }
    /// <summary>
    /// 根据编号返回特定的事业部对象
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static BusinessUnit GetBUByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [BusinessUnits] WHERE [BuID] = @BuID", conn);
        cmd.Parameters.Add("@BuID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        BusinessUnit bu = null;
        if (sdr.Read())
        {
            bu.buID = (int)sdr["BuID"];
            bu.buCode=(string)sdr["BuCode"];
            bu.buName=(string)sdr["BuName"];
            
        }
        sdr.Close();
        conn.Close();
        return bu;
    }

    /// <summary>
    /// 更新或增加新的事业部
    /// </summary>
    /// <param name="buName">事业部名称</param>
    /// <param name="boss">负责人</param>
    public static void SetBU(string buName, string boss, string buCode)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        if(hasBUInfo(buName))
        {
            cmd = new SqlCommand("UPDATE [BusinessUnit] SET [UnitName] = @UnitName, [UnitCode] = @UnitCode, [Responsible] = @Responsible WHERE [UnitName] = @UnitName", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [BusinessUnit] ([UnitName], [UnitCode], [Responsible]) VALUES (@UnitName, @UnitCode, @Responsible)", conn);
        }
             
        cmd.Parameters.Add("@UnitName", SqlDbType.VarChar).Value = buName;
        cmd.Parameters.Add("@Responsible", SqlDbType.VarChar).Value = boss;
        cmd.Parameters.Add("@UnitCode", SqlDbType.VarChar).Value = buCode ;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    /// <summary>
    /// 判断事业部是否已存在
    /// </summary>
    /// <param name="buName"></param>
    /// <returns></returns>
    public static bool hasBUInfo(string buName)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [BusinessUnit] WHERE [UnitName] = @UnitName", conn);
        cmd.Parameters.Add("@UnitName", SqlDbType.VarChar).Value = buName;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }


    public int BuID { get { return buID; } }
    public string BuName { get { return buName; } }
    public string BuCode { get { return buCode; } }
    public string ResponsiblePerson { get { return responsiblePerson; } }

    private int buID;
    private string buName;
    private string buCode;
    private string responsiblePerson;

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}