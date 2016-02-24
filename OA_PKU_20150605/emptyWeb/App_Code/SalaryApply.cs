using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// SalaryApply 的摘要说明
/// 工资表
/// </summary>
public class SalaryApply
{
	public SalaryApply()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 根据编号新增或更新办公用品申购记录
    /// </summary>
    /// <param name="id"></param>
    /// <param name="oi"></param>
    /// <param name="projectName"></param>
    public static int SetSalaryApplyByID(int id, SalaryApply si)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasSalaryApplyInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [SalaryMonthly] SET [StaffName] = @StaffName, [ApplyDate]=@ApplyDate, [ApproveProcess]=@ApproveProcess WHERE [ApplyID] = @ApplyID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [SalaryMonthly] ([StaffName], [ApplyDate], [ApproveProcess]) VALUES (@StaffName,  @ApplyDate, @ApproveProcess)  Select @@Identity as 'Identity'", conn);
        }
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = si.staffName;
        cmd.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = si.applyDate;
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = si.approveProcess;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = si.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Today;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "工资表";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;


            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = "财务主管";
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }


        conn.Close();
        return recordId;
    }
    /// <summary>
    /// 根据编号获取工资表
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static SalaryApply GetSalaryApplyByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [SalaryMonthly] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        SalaryApply si = null;
        if (sdr.Read())
        {
            si = new SalaryApply();
            si.staffSalaryList = new List<SalaryDetail>();            
            si.staffName = (string)sdr["StaffName"];
            si.applyDate = Convert.ToDateTime(sdr["ApplyDate"]);
            si.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();

        List<SalaryDetail> result = SalaryDetail.GetSalaryListByID(id);
        si.staffSalaryList.AddRange(result);
        
        return si;
    }

    
    /// <summary>
    /// 判断特定编号的工资申请是否已存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasSalaryApplyInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [SalaryMonthly] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }






    private string staffName;
    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    private DateTime applyDate;
    public DateTime ApplyDate { get { return this.applyDate; } set { this.applyDate = value; } }
    private List<SalaryDetail> staffSalaryList;
    public List<SalaryDetail> StaffSalaryList { get { return this.staffSalaryList; } set { foreach (SalaryDetail s in value) { this.staffSalaryList.Add(s); } } }
    
    private string approveProcess;
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }
    private string projectAccount;
    public string ProjectAccount { get { return this.projectAccount; } set { this.projectAccount = value; } }


    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}