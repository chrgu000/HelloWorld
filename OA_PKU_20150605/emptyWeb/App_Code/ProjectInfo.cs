using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

/// <summary>
/// 项目信息表
/// </summary>
public class ProjectInfo
{

    public ProjectInfo()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 获取全部项目，用于绑定下拉列表
    /// </summary>
    /// <returns></returns>
    public static DataSet GetAllProjects()
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [Projects]", conn);
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);

        conn.Close();
        return ds;
    }
    /// <summary>
    /// 更新或插入项目记录，根据项目编号
    /// </summary>
    /// <param name="id"></param>
    /// <param name="pi"></param>
    public static void setProjectInfoByCode(string code, ProjectInfo pi)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        if (HasProjectInfo(code))
        {
            cmd = new SqlCommand("UPDATE [Projects] SET [ProjectName] = @ProjectName, [ProjectCode] = @ProjectCode, [Budget]=@Budget, [Collected]=@Collected, [Manager]=@Manager, [Members]=@Members, [ProjectAccount]=@ProjectAccount, [ApplyDate]=@ApplyDate, [Remark]=@Remark, [Department]=@Department WHERE [ProjectCode] = @ProjectCode", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [Projects] ([ProjectCode], [ProjectName], [Manager], [Budget], [Collected], [ProjectAccount],[Members], [ApplyDate], [Remark], [Department], [Status]) VALUES (@ProjectCode, @ProjectName, @Manager, @Budget, @Collected, @ProjectAccount, @Members, @ApplyDate, @Remark, @Department, @Status)", conn);
        }
        cmd.Parameters.Add("@ProjectCode", SqlDbType.VarChar).Value = pi.projectCode;
        cmd.Parameters.Add("@ProjectName", SqlDbType.VarChar).Value = pi.projectName;
        cmd.Parameters.Add("@Manager", SqlDbType.VarChar).Value = pi.manager;
        cmd.Parameters.Add("@Budget", SqlDbType.Int).Value = pi.budget;
        cmd.Parameters.Add("@Collected", SqlDbType.Int).Value = pi.collected;
        cmd.Parameters.Add("@ProjectAccount", SqlDbType.VarChar).Value = pi.projectAccount;
        cmd.Parameters.Add("@Members", SqlDbType.VarChar).Value = pi.members;
        cmd.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = pi.applyDate;
        cmd.Parameters.Add("@Status", SqlDbType.Bit).Value = pi.status;
        cmd.Parameters.Add("@Remark", SqlDbType.VarChar).Value = pi.remark ;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = pi.department;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    /// <summary>
    /// 根据项目编号返回项目记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public  static ProjectInfo getProjectInfoByCode(string code)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [Projects] WHERE [ProjectCode] = @ProjectCode", conn);
        cmd.Parameters.Add("@ProjectCode", SqlDbType.VarChar).Value = code;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        ProjectInfo pi = null;
        if (sdr.Read())
        {
            pi = new ProjectInfo();
            pi.projectID=(int)sdr["ProjectID"];
            pi.projectCode=(string)sdr["ProjectCode"];
            pi.projectName=(string)sdr["ProjectName"];
            pi.budget=(int)sdr["Budget"];
            pi.collected=(int)sdr["Collected"];
            pi.manager=(string)sdr["Manager"];
            pi.projectAccount=(string)sdr["ProjectAccount"];
            pi.applyDate=(DateTime)sdr["ApplyDate"];
            pi.status=(bool)sdr["Status"];
            pi.remark=(string)sdr["Remark"];
            pi.members=(string)sdr["Members"];
            pi.department = (string)sdr["Department"];
        }
        sdr.Close();
        conn.Close();
        return pi;
    }
    /// <summary>
    /// 根据项目名称返回项目对象
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    public static ProjectInfo GetProjectInfoByName(string name)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [Projects] WHERE [ProjectName] = @ProjectName", conn);
        cmd.Parameters.Add("@ProjectName", SqlDbType.VarChar).Value = name;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        ProjectInfo pi = null;
        if (sdr.Read())
        {
            pi = new ProjectInfo();
            pi.projectID = (int)sdr["ProjectID"];
            pi.projectCode = (string)sdr["ProjectCode"];
            pi.projectName = (string)sdr["ProjectName"];
            pi.budget = (int)sdr["Budget"];
            pi.collected = (int)sdr["Collected"];
            pi.manager = (string)sdr["Manager"];
            pi.projectAccount = (string)sdr["ProjectAccount"];
            pi.applyDate = (DateTime)sdr["ApplyDate"];
            pi.status = (bool)sdr["Status"];
            pi.remark = (string)sdr["Remark"];
            pi.members = (string)sdr["Members"];
            pi.department=(string)sdr["Department"];
        }
        sdr.Close();
        conn.Close();
        return pi;
    }
    /// <summary>
    /// 判断特定编号的项目是否已存在，存在返回真
    /// </summary>
    /// <param name="id">用户ID</param>
    /// <returns></returns>
    public static bool HasProjectInfo(string code)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [Projects] WHERE [ProjectCode] = @ProjectCode", conn);
        cmd.Parameters.Add("@ProjectCode", SqlDbType.VarChar).Value = code;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }


    /// <summary>
    /// 返回当前用户所在项目列表
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static DataSet GetProjectByUserID(int userID)
    {       

        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT [Projects].* FROM [Projects],[BasicInfo] WHERE [BasicInfo].[StaffID]=@UserID and [Projects].[Members] like [BasicInfo].[StaffName]", conn);
        cmd.Parameters.Add("@UserID", SqlDbType.VarChar).Value=userID;
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);

        conn.Close();
        return ds;
    }

    public int ProjectID { get { return this.projectID; } }
    public string ProjectCode { get { return this.projectCode; } set { this.projectCode = value; } }
    public string ProjectName { get { return this.projectName; } set { this.projectName = value; } }
    public int Budget { get { return this.budget; } set { this.budget = value; } }
    public int Collected { get { return this.collected; } set { this.collected = value; } }
    public string Manager { get { return this.manager; } set { this.manager = value; } }
    public string ProjectAccount { get { return this.projectAccount; } set { this.projectAccount = value; } }
    public DateTime ApplyDate { get { return this.applyDate; } set { this.applyDate = value; } }
    public bool Status { get { return this.status; } set { this.status = value; } }
    public string Remark { get { return this.remark; } set { this.remark = value; } }
    public string Memeber { get { return this.members; } set { this.members = value; } }
    public string Department { get { return this.department; } set { this.department = value; } }

    private int projectID;
    private string projectCode;
    private string projectName;
    private int budget;
    private int collected;//到账金额
    private string manager;
    private string projectAccount;//项目账号
    private DateTime applyDate;
    private string members;
    private bool status;
    private string remark;
    private string department;

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;

}