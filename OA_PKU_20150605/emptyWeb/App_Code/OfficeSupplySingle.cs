using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// OfficeSupplySingle 的摘要说明
/// 办公用品实体
/// </summary>
public class OfficeSupplySingle
{
	public OfficeSupplySingle()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 批量更新或导入办公用品记录，循环insert不好
    /// </summary>
    /// <param name="offList"></param>
    public static void SetOfficeSupplySingle(List<OfficeSupplySingle> offList, int applyID)
    {
        SqlConnection conn = new SqlConnection(connString);
        conn.Open();
        foreach(OfficeSupplySingle os in offList)
        {
            SetSingleSupply(os,applyID,conn);
        }
        conn.Close();
    }

    private static void SetSingleSupply(OfficeSupplySingle os, int applyID, SqlConnection conn)
    {
        SqlCommand cmd = new SqlCommand("INSERT INTO [OfficeSupplies] ([ApplyID], [Name], [Version], [Price], [Counter]) VALUES (@ApplyID, @Name, @Version, @Price,  @Counter)", conn);

        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = applyID;
        cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = os.Name;
        cmd.Parameters.Add("@Version", SqlDbType.VarChar).Value = os.Version;
        cmd.Parameters.Add("@Price", SqlDbType.Float).Value = os.Price;
        cmd.Parameters.Add("@Counter", SqlDbType.Int).Value = os.Counter;

        cmd.ExecuteNonQuery();
    }

    
    /// <summary>
    /// 根据申购编号，获取对应的办公用品清单
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static List<OfficeSupplySingle> GetOfficeSupplyListByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [OfficeSupplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        List<OfficeSupplySingle> result = new List<OfficeSupplySingle>();
        while (sdr.Read())
        {
            OfficeSupplySingle temp = new OfficeSupplySingle();
            temp.name = (string)sdr["Name"];
            temp.version = (string)sdr["Version"];
            temp.counter = Convert.ToInt32(sdr["Counter"]);
            temp.price = (double)sdr["Price"];
            temp.allExpense = temp.price * temp.counter;
            result.Add(temp);
        }

        conn.Close();
        return result;
    }

    public string Name { get { return this.name; } set { this.name = value; } }
    public string Version { get { return this.version; } set { this.version = value; } }
    public double Price { get { return this.price; } set { this.price = value; } }
    public int Counter { get { return this.counter; } set { this.counter = value; } }
    public double AllExpense { get { return this.price * this.counter; } }

    private string name;
    private string version;
    private double price;
    private int counter;
    private double allExpense;

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;

}