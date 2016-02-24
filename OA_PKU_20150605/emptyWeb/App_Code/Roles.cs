using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Roles 的摘要说明
/// 职位管理，涉及权限
/// </summary>
public class Roles
{
	public Roles()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 获取全部职位信息，用于下拉列表框动态绑定
    /// </summary>
    /// <returns></returns>
    public static DataSet GetAllRoles()
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [Roles]", conn);
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);

        conn.Close();
        return ds;
    }
    /// <summary>
    /// 更新或增加新角色，职位信息
    /// </summary>
    /// <param name="name"></param>
    /// <param name="limit"></param>
    public static void SetRole(string name, int limit=0)
    {
        SqlConnection conn = new SqlConnection(connString);

        SqlCommand cmd;
        if(hasRoles(name))
        {
            cmd = new SqlCommand("UPDATE [Roles] SET [RoleName] = @RoleName, [CostLimit] = @CostLimit WHERE [RoleName] = @RoleName", conn);
        }
        else
        {
           cmd = new SqlCommand("INSERT INTO [Roles] ([RoleName], [CostLimit]) VALUES (@RoleName, @CostLimit)", conn);
        }   
        
        cmd.Parameters.Add("@RoleName", SqlDbType.VarChar).Value = name;
        cmd.Parameters.Add("@CostLimit", SqlDbType.Int).Value = limit;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    /// <summary>
    /// 判断角色是否已存在
    /// </summary>
    /// <param name="buName"></param>
    /// <returns></returns>
    public static bool hasRoles(string roleName)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [Roles] WHERE [RoleName] = @RoleName", conn);
        cmd.Parameters.Add("@RoleName", SqlDbType.VarChar).Value = roleName;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }


    public int RoleID { get { return roleID; } }
    public string RoleName { get { return roleName; } }
    public int CostLimit { get { return costLimit; } }


    private int roleID;
    private string roleName;
    private int costLimit;

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}