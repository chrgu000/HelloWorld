using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// SettleApply 的摘要说明
/// 统一结算申请表
/// </summary>
public class SettleApply
{
	public SettleApply()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 插入或更新一条新的统一结算申请记录
    /// </summary>
    /// <param name="id"></param>
    /// <param name="si"></param>
    public static void SetSettleApplyByID(int id, SettleApply si, int userID)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasSettleApplyInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [SettleApplies] SET [StaffName] = @StaffName, [Department]=@Department, [Position]=@Position, [Reason]=@Reason, [SettleDate]=@SettleDate, [Money]=@Money, [Legal] = @Legal, [InnerBudget]=@InnerBudget, [CheckBill]=@CheckBill, [ApproveProcess]=@ApproveProcess, [ProjectAccount]=@ProjectAccount WHERE [RecordID] = @RecordID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [SettleApplies] ([StaffName], [Department], [Position], [Reason], [SettleDate], [Money], [Legal], [InnerBudget], [CheckBill],[ProjectAccount]) VALUES ( @StaffName, @Department, @Position, @Reason, @SettleDate, @Money, @Legal, @InnerBudget, @CheckBill, @ProjectAccount)  Select @@Identity as 'Identity'", conn);
        }
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = si.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = si.department;
        cmd.Parameters.Add("@Position", SqlDbType.VarChar).Value = si.position;
        cmd.Parameters.Add("@Money", SqlDbType.Float).Value = si.money;
        cmd.Parameters.Add("@Reason", SqlDbType.VarChar).Value = si.reason;
        cmd.Parameters.Add("@SettleDate", SqlDbType.DateTime).Value = si.settleDate;
        cmd.Parameters.Add("@Legal", SqlDbType.Bit).Value = si.legal;
        cmd.Parameters.Add("@InnerBudget", SqlDbType.Bit).Value = si.innerBudget;
        cmd.Parameters.Add("@CheckBill", SqlDbType.VarChar).Value = si.checkBill;        
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = si.approveProcess;
        cmd.Parameters.Add("@ProjectAccount", SqlDbType.VarChar).Value = si.projectAccount;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = si.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "统一结算申请";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;

            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = getNextApprover(userID,si.department);
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }


        conn.Close();
    }
    /// <summary>
    /// 获取申请后第一个审批人，注意处理本人是部门经理或财务主管的情况
    /// </summary>
    /// <param name="userID"></param>
    /// <param name="department"></param>
    /// <returns></returns>
    private static string getNextApprover(int userID, string department)
    {
        Department dp=Department.GetDepartmentByName(department);
        string origin = dp.ResponsiblePerson;
        BasicInfo bi = BasicInfo.GetBasicInfoByID(userID);
        string result="";
        if (bi.StaffName != origin)
            result = origin;
        else {
            if (bi.Position.Trim() == "财务主管")
                result = dp.BULeader;
            else
                result = "财务主管";
        }

        return result;
    }
    
    /// <summary>
    /// 根据记录编号获取相应的统一结算申请记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static SettleApply GetSettleApplyByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [SettleApplies] WHERE [RecordID] = @RecordID", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        
        SettleApply si = null;
        if (sdr.Read())
        {
            si = new SettleApply();
            si.staffName = (string)sdr["StaffName"];
            si.department = (string)sdr["Department"];
            si.position = (string)sdr["Position"];
            si.money = Convert.ToDouble(sdr["Money"]);
            si.reason = (string)sdr["Reason"];
            si.legal = (bool)sdr["Legal"];
            si.innerBudget = (bool)sdr["InnerBudget"];
            si.settleDate = Convert.ToDateTime(sdr["SettleDate"]);
            si.checkBill = (string)sdr["CheckBill"];            
            si.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
            si.projectAccount=sdr["ProjectAccount"]==DBNull.Value?"":(string)sdr["ProjectAccount"];
        }
        sdr.Close();
        conn.Close();
        return si;
    }
    /// <summary>
    /// 判断统一结算申请记录是否已存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasSettleApplyInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [SettleApplies] WHERE [RecordID] = @RecordID", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    public string Department_str { get { return this.department; } set { this.department = value; } }
    public string Position { get { return this.position; } set { this.position = value; } }
    public string Reason { get { return this.reason; } set { this.reason = value; } }
    public DateTime SettleDate { get { return this.settleDate; } set { this.settleDate = value; } }
    public double Money { get { return this.money; } set { this.money = value; } }
    public bool Leagal { get { return this.legal; } set { this.legal = value; } }
    public bool InnerBudget { get { return this.innerBudget; } set { this.innerBudget = value; } }
    public string CheckBill { get { return this.checkBill; } set { this.checkBill = value; } }
    public string ProjectAccount { get { return this.projectAccount; } set { this.projectAccount = value; } }
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }

    private string staffName;
    private string department;
    private string position;
    private string reason;
    private DateTime settleDate;
    private double money;
    private bool legal;
    private bool innerBudget;
    private string checkBill;
    private string approveProcess;
    private string projectAccount;

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;

}