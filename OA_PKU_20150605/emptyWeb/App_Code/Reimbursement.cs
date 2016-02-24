using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Reimbursement 的摘要说明
/// 费用报销表
/// </summary>
public class Reimbursement
{
	public Reimbursement()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 新增或更新费用报销记录
    /// </summary>
    /// <param name="id"></param>
    /// <param name="ri"></param>
    public static void SetReimbursement(int id,Reimbursement ri)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasReimbursement(id);
        if(!isExist)
        {
            cmd= new SqlCommand("INSERT INTO [Reimbursements] ([StaffName], [Department], [Manager],  [ProjectCode],[ProjectAccount], [HappenDate], [ReimburseDate], [PayeeDate], [Bill], [Expense], [AllExpense], [Remark]) VALUES (@StaffName, @Department, @Manager, @ProjectCode,@ProjectAccount, @HappenDate, @ReimburseDate, @PayeeDate, @Bill, @Expense, @AllExpense, @Remark) Select @@Identity as 'Identity'", conn);
        }
        else
        {
            cmd = new SqlCommand("UPDATE [Reimbursements] SET [ApproveProcess]=@ApproveProcess,[ProjectAccount]=@ProjectAccount WHERE [ReimbursementID] = @ReimbursementID", conn);
        }

        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = ri.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = ri.department;
        cmd.Parameters.Add("@Manager", SqlDbType.VarChar).Value = ri.manager;
        cmd.Parameters.Add("@ProjectCode", SqlDbType.VarChar).Value = ri.projectCode;
        cmd.Parameters.Add("@ProjectAccount", SqlDbType.VarChar).Value=ri.projectAccount;
        cmd.Parameters.Add("@Bill", SqlDbType.Int).Value = ri.bill;
        cmd.Parameters.Add("@Expense", SqlDbType.Float).Value = ri.expense;
        cmd.Parameters.Add("@AllExpense", SqlDbType.Float).Value = ri.allExpense;        
        cmd.Parameters.Add("@HappenDate", SqlDbType.DateTime).Value = ri.happenDate;
        cmd.Parameters.Add("@ReimburseDate", SqlDbType.DateTime).Value = ri.reimburseDate;
        cmd.Parameters.Add("@PayeeDate", SqlDbType.DateTime).Value = ri.payeeDate;
        cmd.Parameters.Add("@Remark", SqlDbType.VarChar).Value = ri.remark;
        cmd.Parameters.Add("@ReimbursementID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = ri.approveProcess;
        
        conn.Open();
        //cmd.ExecuteNonQuery();
        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if(!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = ri.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "费用报销";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;
            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = ProjectInfo.getProjectInfoByCode(ri.projectCode).Manager;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }

        conn.Close();
    }
    /// <summary>
    /// 根据记录编号，获取费用报销记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static Reimbursement GetReimbursementByID(int id)
    { 
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [Reimbursements] WHERE [ReimbursementID] = @ReimbursementID", conn);
        cmd.Parameters.Add("@ReimbursementID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        Reimbursement ri = null;
        if (sdr.Read())
        {
            ri = new Reimbursement();
            ri.staffName=(string)sdr["StaffName"];
            ri.department=(string)sdr["Department"];
            ri.manager=(string)sdr["Manager"];            
            ri.projectCode=(string)sdr["ProjectCode"];
            ri.projectAccount=(string)sdr["ProjectAccount"];
            ri.happenDate = Convert.ToDateTime(sdr["HappenDate"]);
            ri.reimburseDate = Convert.ToDateTime(sdr["ReimburseDate"]);
            ri.payeeDate = Convert.ToDateTime(sdr["PayeeDate"]);
            ri.bill=(int)sdr["Bill"];
            ri.expense = Convert.ToDouble(sdr["Expense"]);
            ri.allExpense = Convert.ToDouble(sdr["AllExpense"]);
            ri.remark=(string)sdr["Remark"];
            ri.ApproveProcess = sdr["ApproveProcess"]==DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();
        return ri;
    }
    /// <summary>
    /// 判断特定编号的记录是否已存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasReimbursement(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [Reimbursements] WHERE [ReimbursementID] = @ReimbursementID", conn);
        cmd.Parameters.Add("@ReimbursementID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    public string Department { get { return this.department; } set { this.department = value; } }
    public string Manager { get { return this.manager; } set { this.manager = value; } }
    public string ProjectCode { get { return this.projectCode; } set { this.projectCode = value; } }
    public string ProjectAccount { get { return this.projectAccount; } set { this.projectAccount = value; } }
    public DateTime HappenDate { get { return this.happenDate; } set { this.happenDate = value; } }
    public DateTime ReimburestDate { get { return this.reimburseDate; } set { this.reimburseDate = value; } }
    public DateTime PayeeDate { get { return this.payeeDate; } set { this.payeeDate = value; } }
    public string Payee { get { return this.payee; } set { this.payee = value; } }
    public int Bill { get { return this.bill; } set { this.bill = value; } }
    public double Expense { get { return this.expense; } set { this.expense = value; } }
    public double AllExpense { get { return this.allExpense; } set { this.allExpense = value; } }
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }
    public string Remark { get { return this.remark; } set { this.remark = value; } }
    public string Note { get { return this.note; } set { this.note = value; } }

    private string staffName;
    private string department;
    private string manager;
    private string projectCode;
    private string projectAccount;
    private DateTime happenDate;
    private DateTime reimburseDate;
    private DateTime payeeDate;
    private string payee;
    private int bill;
    private double expense;
    private double allExpense;
    private string approveProcess;
    private string remark;
    private string note;

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}