using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// RepairApply 的摘要说明
/// 固定资产保修申请单
/// </summary>
public class RepairApply
{
	public RepairApply()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 新增或更新特定编号的固定资产报修记录
    /// </summary>
    /// <param name="id"></param>
    /// <param name="ri"></param>
    public static void SetRepairApplyByID(int id, RepairApply ri)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasRepairApplyInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [RepairApplies] SET [EquipmentName]=@EquipmentName, [EquipmentType]=@EquipmentType, [StaffName] = @StaffName, [Department]=@Department, [BuyDate]=@BuyDate, [BugDate]=@BugDate, [BugDetail]=@BugDetail, [FixDate]=@FixDate, [DuringGuarantee] = @DuringGuarantee, [RepairSelf]=@RepairSelf, [Budget]=@Budget, [SettleType]=@SettleType, [SentToRepair]=@SentToRepair, [ApproveProcess]=@ApproveProcess WHERE [ApplyID] = @ApplyID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [RepairApplies] ([EquipmentName], [EquipmentType], [StaffName], [Department], [BuyDate], [BugDate], [BugDetail], [FixDate], [DuringGuarantee], [RepairSelf], [Budget], [SettleType], [SentToRepair]) VALUES (@EquipmentName, @EquipmentType, @StaffName, @Department, @BuyDate, @BugDate, @BugDetail, @FixDate, @DuringGuarantee, @RepairSelf, @Budget, @SettleType, @SentToRepair)  Select @@Identity as 'Identity'", conn);
        }
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@EquipmentName", SqlDbType.VarChar).Value = ri.equipmentName;
        cmd.Parameters.Add("@EquipmentType", SqlDbType.VarChar).Value = ri.equipmentType;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = ri.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = ri.departmentName;
        cmd.Parameters.Add("@BuyDate", SqlDbType.DateTime).Value = ri.buyDate;
        cmd.Parameters.Add("@BugDate", SqlDbType.DateTime).Value = ri.bugDate;
        cmd.Parameters.Add("@SentToRepair", SqlDbType.DateTime).Value = ri.sentToRepair;
        cmd.Parameters.Add("@BugDetail", SqlDbType.VarChar).Value = ri.bugDetail;
        cmd.Parameters.Add("@FixDate", SqlDbType.DateTime).Value = ri.fixDate;
        cmd.Parameters.Add("@DuringGuarantee", SqlDbType.Bit).Value = ri.duringGuarantee;
        cmd.Parameters.Add("@RepairSelf", SqlDbType.Bit).Value = ri.repairSelf;
        cmd.Parameters.Add("@Budget", SqlDbType.Float).Value = ri.budget;
        cmd.Parameters.Add("@SettleType", SqlDbType.VarChar).Value = ri.settleType;
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = ri.approveProcess;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value =ri.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "固定资产保修申请";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;


            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = Department.GetDepartmentByName(ri.departmentName).ResponsiblePerson;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }


        conn.Close();
    }

    /// <summary>
    /// 根据编号返回特定的保修记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static RepairApply GetRepairApplyByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [RepairApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        RepairApply ri = null;
        if (sdr.Read())
        {
            ri = new RepairApply();
            ri.equipmentName=(string)sdr["EquipmentName"];
            ri.equipmentType=(string)sdr["EquipmentType"];
            ri.staffName = (string)sdr["StaffName"];
            ri.departmentName = (string)sdr["Department"];
            ri.buyDate = Convert.ToDateTime(sdr["BuyDate"]);
            ri.bugDate = Convert.ToDateTime(sdr["BugDate"]);
            ri.bugDetail=(string)sdr["BugDetail"];
            ri.fixDate = Convert.ToDateTime(sdr["FixDate"]);
            ri.duringGuarantee=(bool)sdr["DuringGuarantee"];
            ri.repairSelf=(bool)sdr["RepairSelf"];
            ri.budget = Convert.ToDouble(sdr["Budget"]);
            ri.settleType=(string)sdr["SettleType"];
            ri.sentToRepair = Convert.ToDateTime(sdr["SentToRepair"]);
            
            ri.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();
        return ri;
    }

    /// <summary>
    /// 判断特定编号的保修申请是否已存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasRepairApplyInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [RepairApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    private string equipmentName;
    public string EquipmentName { get { return this.equipmentName; } set { this.equipmentName = value; } }
    private string equipmentType;
    public string EquipmentType { get { return this.equipmentType; } set { this.equipmentType = value; } }
    private string staffName;
    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    private string departmentName;
    public string DepartmentName { get { return this.departmentName; } set { this.departmentName = value; } }
    private DateTime buyDate;
    public DateTime BuyDate { get { return this.buyDate; } set { this.buyDate = value; } }
    private DateTime bugDate;
    public DateTime BugDate { get { return this.bugDate; } set { this.bugDate = value; } }
    private string bugDetail;
    public string BugDetail { get { return this.bugDetail; } set { this.bugDetail = value; } }
    private DateTime fixDate;
    public DateTime FixDate { get { return this.fixDate; } set { this.fixDate = value; } }
    private bool duringGuarantee;
    public bool DuringGuarantee { get { return this.duringGuarantee; } set { this.duringGuarantee = value; } }
    private bool repairSelf;
    public bool RepairSelf { get { return this.repairSelf; } set { this.repairSelf = value; } }
    private double budget;
    public double Budget { get { return this.budget; } set { this.budget = value; } }
    private string settleType;
    public string SettleType { get { return this.settleType; } set { this.settleType = value; } }
    private DateTime sentToRepair;
    public DateTime SentToRepair { get { return this.sentToRepair; } set { this.sentToRepair = value; } }
    private string approveProcess;
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;

}