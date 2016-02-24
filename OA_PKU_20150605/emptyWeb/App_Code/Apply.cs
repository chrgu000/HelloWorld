using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 管理标准化申请
/// </summary>
public class Apply
{
	public Apply()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public Apply(int applyid,int recordid, string staffname, string nextapprover, DateTime applydate, string applytype, bool result)
    {
        this.applyID = applyid;
        this.recordID = recordid;
        this.staffName = staffname;
        this.nextApprover = nextapprover;
        this.applyDate = applydate;
        this.applyType = applytype;
        this.result = result;
    }
    /// <summary>
    /// 删除特定的申请记录，注意只删除了标准申请表里的记录，具体类型表中未删除
    /// </summary>
    /// <param name="id"></param>
    public static void DeleteApply(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("DELETE FROM [AllApplies] where ApplyID=@ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;

        conn.Open();
        cmd.ExecuteNonQuery();       
        conn.Close();
    }
    /// <summary>
    /// 添加新的通用申请记录，暂未使用此方法，考虑涉及数据库连接的多次打开关闭
    /// </summary>
    /// <param name="ai"></param>
    public static void AddApply(Apply ai)
    {
        SqlConnection conn = new SqlConnection(connString);

        SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
        cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = ai.StaffName;
        cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = ai.ApplyDate;
        cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = ai.ApplyType;
        cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = ai.RecordID;
        cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = ai.NextApprover;
        cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
        conn.Open();
        cmd2.ExecuteNonQuery();
        conn.Close();

    }
    /// <summary>
    /// 返回特定编号的申请记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static Apply GetApplyByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT [AllApplies].* FROM [AllApplies] where ApplyID=@ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        Apply result = null;


        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            result = new Apply((int)sdr["ApplyID"], (int)sdr["RecordID"], (string)sdr["ApplyStaff"], (string)sdr["NextApprover"], Convert.ToDateTime(sdr["ApplyDate"]), (string)sdr["ApplyType"], (bool)sdr["Result"]);
        }
        sdr.Close();
        conn.Close();

        return result;
    }
    /// <summary>
    /// 获取需要当前用户审批的所有申请
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static List<Apply> GetUserApply(int id)
    {
        List<Apply> apply = new List<Apply>();
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT [AllApplies].* FROM [AllApplies],[BasicInfo] where [BasicInfo].[UserID]=@UserID and [AllApplies].[NextApprover]!=[AllApplies].[ApplyStaff] and ([BasicInfo].[StaffName]=[AllApplies].[NextApprover] or [BasicInfo].[Position]=[AllApplies].[NextApprover]) ORDER BY [ApplyDate] DESC", conn);
        cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = id;        
        
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            apply.Add(new Apply((int)sdr["ApplyID"], (int)sdr["RecordID"],(string)sdr["ApplyStaff"],(string)sdr["NextApprover"],Convert.ToDateTime(sdr["ApplyDate"]),(string)sdr["ApplyType"],(bool)sdr["Result"]));
        }
        sdr.Close();
        conn.Close();
        return apply;
    }
    /// <summary>
    /// 获取当前用户提交过的申请
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    public static List<Apply> GetOwnApply(int id)
    {
        List<Apply> apply = new List<Apply>();
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT [AllApplies].* FROM [AllApplies],[BasicInfo] where [BasicInfo].[UserID]=@UserID and [BasicInfo].[StaffName]=[AllApplies].[ApplyStaff]  ORDER BY [ApplyDate] DESC", conn);
        cmd.Parameters.Add("@UserID", SqlDbType.VarChar).Value = id;

        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
       
        while (sdr.Read())
        {
            bool temp = (bool)sdr["Result"];
            apply.Add(new Apply((int)sdr["ApplyID"], (int)sdr["RecordID"], (string)sdr["ApplyStaff"], (string)sdr["NextApprover"], Convert.ToDateTime(sdr["ApplyDate"]), (string)sdr["ApplyType"], (bool)sdr["Result"]));
        }
        sdr.Close();
        conn.Close();
        return apply;
    }
    /// <summary>
    /// 根据筛选条件，返回结果集
    /// </summary>
    /// <param name="sql"></param>
    /// <returns></returns>
    public static List<Apply> GetFilerResult(string sql)
    {
        List<Apply> result = new List<Apply>();

        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();

        SqlDataReader sdr = cmd.ExecuteReader();
        Apply ai = null;
        while (sdr.Read())
        {
            ai = new Apply();
            ai.staffName=(string)sdr["ApplyStaff"];
            ai.applyDate = Convert.ToDateTime(sdr["ApplyDate"]);
            ai.applyType=(string)sdr["ApplyType"];
            ai.recordID=(int)sdr["RecordID"];
            ai.applyID=(int)sdr["ApplyID"];

            result.Add(ai);
        }
        sdr.Close();

        conn.Close();
        return result;
    }
    /// <summary>
    /// 更新申请的下一个待审批人
    /// </summary>
    /// <param name="applyid"></param>
    /// <param name="name"></param>
    /// <param name="if_back">标识是否中途打回</param>
    public static void UpdateNextApprover(int applyid, string name, bool if_back)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("UPDATE [AllApplies] SET [NextApprover] = @NextApprover, [Result]=@Result WHERE [ApplyID] = @ApplyID", conn);

        cmd.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = name;
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = applyid;
        cmd.Parameters.Add("@Result", SqlDbType.Bit).Value = if_back;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    public int ApplyID { get { return this.applyID; } set { this.applyID = value; } }
    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    public string ApplyType { get { return this.applyType; } set { this.applyType = value; } }
    public string NextApprover { get { return this.nextApprover; } set { this.nextApprover = value; } }
    public DateTime ApplyDate { get { return this.applyDate; } set { this.applyDate = value; } }
    public int RecordID { get { return this.recordID; } set { this.recordID = value; } }
    public bool Result { get { return this.result; } set { this.result = value; } }

    private int applyID;
    private string staffName;
    private string applyType;
    private DateTime applyDate;
    private string nextApprover;
    private int recordID;//申请记录在对应表中的id
    private bool result;


    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}