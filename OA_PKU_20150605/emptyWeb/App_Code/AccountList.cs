using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 科目编号
/// </summary>
public class AccountList
{
	public AccountList()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 获取全部科目，用于下拉列表的动态绑定
    /// </summary>
    /// <returns></returns>
    public static DataSet GetAllAccount()
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [AccountList]", conn);
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);

        conn.Close();
        return ds;
    }

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}