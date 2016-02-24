using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 
/// 离职申请
/// </summary>
public class DismissionApply
{
	public DismissionApply()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 新增或更新离职记录
    /// </summary>
    /// <param name="id"></param>
    /// <param name="si"></param>
    /// <param name="userID"></param>
    public static void SetDismissionApplyByID(int id, DismissionApply si, int userID)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasDismissionApplyInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [DismissionApplies] SET [StaffName] = @StaffName, [Department]=@Department, [BusinessUnit]=@BusinessUnit, [Position]=@Position, [Reason]=@Reason, [StartDate]=@StartDate, [EndDate]=@EndDate, [Address] = @Address, [Telephone]=@Telephone, [HandOver]=@HandOver, [Borrow]=@Borrow, [Others]=@Others, [Reimburese]=@Reimburse, [Books]=@Books, [RemovibleDisk]=@RemovibleDisk, [Computer]=@Computer, [Communication]=@Communication, [ReturnThings]=@ReturnThings, [ReCheckHandOver]=@ReCheckHandOver, [Keys]=@Keys, [OfficeThings]=@OfficeThings, [ApproveProcess]=@ApproveProcess WHERE [ApplyID] = @ApplyID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [DismissionApplies] ([StaffName], [Department], [BusinessUnit], [Position], [Reason], [StartDate], [EndDate], [Address], [Telephone], [HandOver], [ReturnThings], [Reimburse], [Borrow], [RemovibleDisk], [Computer], [Communication], [Books], [ReCheckHandOver], [Keys], [OfficeThings]) VALUES (@StaffName, @Department, @BusinessUnit, @Position, @Reason, @StartDate, @EndDate, @Address, @Telephone, @HandOver, @ReturnThings, @Reimburse, @Borrow, @RemovibleDisk, @Computer, @Communication, @Books, @ReCheckHandOver, @Keys, @OfficeThings)  Select @@Identity as 'Identity'", conn);
        }
        
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = si.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = si.department;
        cmd.Parameters.Add("@BusinessUnit", SqlDbType.VarChar).Value = si.businessUnit;
        cmd.Parameters.Add("@Position", SqlDbType.VarChar).Value = si.position;
        cmd.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = si.startDate;
        cmd.Parameters.Add("@EndDate", SqlDbType.DateTime).Value = si.endDate;
        cmd.Parameters.Add("@Address", SqlDbType.VarChar).Value = si.address;
        cmd.Parameters.Add("@Telephone", SqlDbType.VarChar).Value = si.telephone;
        cmd.Parameters.Add("@Reason", SqlDbType.VarChar).Value = si.reason;
        cmd.Parameters.Add("@HandOver", SqlDbType.Bit).Value = si.handOver;
        cmd.Parameters.Add("@ReturnThings", SqlDbType.Bit).Value = si.returnThings;
        cmd.Parameters.Add("@Reimburse", SqlDbType.Bit).Value = si.reimburse;
        cmd.Parameters.Add("@Borrow", SqlDbType.Bit).Value = si.borrow;
        cmd.Parameters.Add("@RemovibleDisk", SqlDbType.Bit).Value = si.removibleDisk;
        cmd.Parameters.Add("@Computer", SqlDbType.Bit).Value = si.computer;
        cmd.Parameters.Add("@Communication", SqlDbType.Bit).Value = si.communication;
        cmd.Parameters.Add("@Books", SqlDbType.Bit).Value = si.books;
        cmd.Parameters.Add("@ReCheckHandOver", SqlDbType.Bit).Value = si.reCheckHandOver;
        cmd.Parameters.Add("@Keys", SqlDbType.Bit).Value = si.keys;
        cmd.Parameters.Add("@OfficeThings", SqlDbType.Bit).Value = si.officeThings;
        
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = si.approveProcess;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = si.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "离职申请";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;


            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = Department.GetDepartmentByName(si.department).ResponsiblePerson;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }


        conn.Close();
    }

    /// <summary>
    /// 根据编号获取特定的离职申请记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static DismissionApply GetDismissionApplyByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [DismissionApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        DismissionApply di = null;
        if (sdr.Read())
        {
            di = new DismissionApply();
            di.staffName = (string)sdr["StaffName"];
            di.department = (string)sdr["Department"];
            di.position = (string)sdr["Position"];
            di.businessUnit=(string)sdr["BusinessUnit"];
            di.startDate = Convert.ToDateTime(sdr["StartDate"]);
            di.endDate = Convert.ToDateTime(sdr["EndDate"]);
            di.address=(string)sdr["Address"];
            di.telephone=(string)sdr["Telephone"];
            di.reason=(string)sdr["Reason"];
            di.handOver=(bool)sdr["Handover"];
            di.returnThings=(bool)sdr["ReturnThings"];
            di.reimburse=(bool)sdr["Reimburse"];
            di.borrow=(bool)sdr["Borrow"];
            di.removibleDisk=(bool)sdr["RemovibleDisk"];
            di.computer=(bool)sdr["Computer"];
            di.communication=(bool)sdr["Communication"];
            di.books=(bool)sdr["Books"];
            di.reCheckHandOver=(bool)sdr["ReCheckHandOver"];
            di.keys=(bool)sdr["Keys"];
            di.officeThings=(bool)sdr["OfficeThings"];
            di.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();
        return di;
    }

    /// <summary>
    /// 判断特定的离职申请是否存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasDismissionApplyInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [DismissionApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    private string staffName;
    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    private string department;
    public string Department_str { get { return this.department; } set { this.department = value; } }
    private string businessUnit;
    public string BusinessUnit { get { return this.businessUnit; } set { this.businessUnit = value; } }
    private DateTime startDate;
    public DateTime StartDate { get { return this.startDate; } set { this.startDate = value; } }
    private string position;
    public string Position { get { return this.position; } set { this.position = value; } }
    private DateTime endDate;
    public DateTime EndDate { get { return this.endDate; } set { this.endDate = value; } }
    private string address;
    public string Address { get { return this.address; } set { this.address = value; } }
    private string telephone;
    public string Telephone { get { return this.telephone; } set { this.telephone = value; } }
    private string reason;
    public string Reason { get { return this.reason; } set { this.reason = value; } }
    private bool handOver;
    public bool HandOver { get { return this.handOver; } set { this.handOver = value; } }
    private bool returnThings;
    public bool ReturnThings { get { return this.returnThings; } set { this.returnThings = value; } }
    private bool reimburse;
    public bool Reimburse { get { return this.reimburse; } set { this.reimburse = value; } }
    private bool borrow;
    public bool Borrow { get { return this.borrow; } set { this.borrow = value; } }
    private bool removibleDisk;
    public bool RemovibleDisk { get { return this.removibleDisk; } set { this.removibleDisk = value; } }
    private bool computer;
    public bool Computer { get { return this.computer; } set { this.computer = value; } }
    private bool communication;
    public bool Communication { get { return this.communication; } set { this.communication = value; } }
    private bool books;
    public bool Books { get { return this.books; } set { this.books = value; } }
    private bool reCheckHandOver;
    public bool ReCheckHandOver { get { return this.reCheckHandOver; } set { this.reCheckHandOver = value; } }
    private bool keys;
    public bool Keys { get { return this.keys; } set { this.keys = value; } }
    private bool officeThings;
    public bool OfficeThings { get { return this.officeThings; } set { this.officeThings = value; } }
    private string others;
    public string Others { get { return this.others; } set { this.others = value; } }
    private string approveProcess;
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }


    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}