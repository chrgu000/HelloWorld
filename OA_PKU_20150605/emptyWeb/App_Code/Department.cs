using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 部门实体
/// </summary>
public class Department
{
	public Department()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 获取全部部门，用于下拉列表的动态绑定
    /// </summary>
    /// <returns></returns>
    public static DataSet GetAllDepartment()
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [Departments]", conn);
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);

        conn.Close();
        return ds;
    }

    /// <summary>
    /// 根据部门名称返回部门对象
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    public static Department GetDepartmentByName(string name)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [Departments] WHERE [DepartmentName] = @DepartmentName", conn);
        cmd.Parameters.Add("@DepartmentName", SqlDbType.VarChar).Value = name;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        Department di = null;
        if (sdr.Read())
        {
            di = new Department();
            di.departmentID=(int)sdr["DepartmentID"];
            di.departmentName=(string)sdr["DepartmentName"];
            di.responsiblePerson=(string)sdr["Responsible"];
            di.parentID=(int)sdr["Parent"];
            di.buLeader=(string)sdr["BU_Leader"];
            
        }
        sdr.Close();
        conn.Close();
        return di;
    }

    
    /// <summary>
    /// 添加或更新部门信息
    /// </summary>
    /// <param name="name"></param>
    /// <param name="parent"></param>
    /// <param name="boss"></param>
    public static void SetDepartment(string name, int parent, string boss, string leader)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        if (hasDepartmentInfo(name))
        {
            cmd = new SqlCommand("UPDATE [Departments] SET [DepartmentName] = @DepartmentName, [Parent] = @Parent, [Responsible] = @Responsible, [BU_Leader]=@BU_Leader WHERE [DepartmentName] = @DepartmentName", conn);
        }
        else 
        {
            cmd = new SqlCommand("INSERT INTO [Departments] ([DepartmentName], [Parent], [Responsible], [BU_Leader]) VALUES (@DepartmentName, @Parent, @Responsible, @BU_Leader)", conn);
        }    
                
        cmd.Parameters.Add("@DepartmentName", SqlDbType.VarChar).Value = name;
        cmd.Parameters.Add("@Responsible", SqlDbType.VarChar).Value = boss;
        cmd.Parameters.Add("@BU_Leader", SqlDbType.VarChar).Value = leader;
        cmd.Parameters.Add("@Parent", SqlDbType.Int).Value = parent;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    /// <summary>
    /// 判断部门是否已存在
    /// </summary>
    /// <param name="departmentName"></param>
    /// <returns></returns>
    public static bool hasDepartmentInfo(string departmentName)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [Departments] WHERE [DepartmentName] = @DepartmentName", conn);
        cmd.Parameters.Add("@DepartmentName", SqlDbType.VarChar).Value = departmentName;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }




    public int DepartmentID { get { return departmentID; } set { this.departmentID = value; } }
    public string DepartmentName { get { return departmentName; } set { this.departmentName = value; } }
    public int ParentID { get { return parentID; } set { this.parentID = value; } }
    public string ResponsiblePerson { get { return responsiblePerson; } set { this.responsiblePerson = value; } }
    public string BULeader { get { return this.buLeader; } set { this.buLeader = value; } }

    private int departmentID;
    private string departmentName;
    private int parentID;
    private string responsiblePerson;
    private string buLeader;


    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}