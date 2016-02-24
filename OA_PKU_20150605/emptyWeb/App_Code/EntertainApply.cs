using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 
/// 宴请申请
/// </summary>
public class EntertainApply
{
	public EntertainApply()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 插入或更新一条宴请申请记录
    /// </summary>
    /// <param name="id"></param>
    /// <param name="ei"></param>
    public static void SetEntertainApplyByID(int id, EntertainApply ei)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasEntertainApplyInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [EntertainApplies] SET [StafffName] = @StaffName, [Departments] = @Departments, [Manager] = @Manager, [ApplyDate] = @ApplyDate, [TreatDate] = @TreatDate, [Reason] = @Reason, [Treated] = @Treated, [Budget] = @Budget,[TreatStandard]=@TreatStandard, [TreatStyle] = @TreatStyle, [ApproveProcess] = @ApproveProcess WHERE [ApplyID] = @ApplyID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [EntertainApplies] ([StaffName], [Department], [ApplyDate],[TreatDate],[Manager],[Reason],[Treated],[Budget],[TreatStandard], [TreatStyle],[ApproveProcess]) VALUES (@StaffName, @Department, @ApplyDate,@TreatDate,@Manager,@Reason,@Treated,@Budget,@TreatStandard, @TreatStyle,@ApproveProcess)", conn);
        }

        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = ei.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = ei.department;
        cmd.Parameters.Add("@Manager", SqlDbType.VarChar).Value = ei.manager;
        cmd.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = ei.applyDate;
        cmd.Parameters.Add("@TreatDate", SqlDbType.DateTime).Value = ei.treatDate;
        cmd.Parameters.Add("@TreatStandard", SqlDbType.VarChar).Value = ei.treatStandard;
        cmd.Parameters.Add("@Reason", SqlDbType.VarChar).Value = ei.reason;
        cmd.Parameters.Add("@Treated", SqlDbType.VarChar).Value = ei.treated;
        cmd.Parameters.Add("@Budget", SqlDbType.Float).Value = ei.budget;
        cmd.Parameters.Add("@TreatStyle", SqlDbType.VarChar).Value = ei.treatStyle;
        cmd.Parameters.Add("@TreatStandard", SqlDbType.VarChar).Value = ei.treatStandard;
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = ei.approveProcess;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = ei.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "宴请申请";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;
            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = BasicInfo.GetOrganizationResponsible();
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }

        conn.Close();
    }
    /// <summary>
    /// 根据编号获取特定的宴请申请记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static EntertainApply GetEntertainApplyByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [EntertainApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        EntertainApply ei = null;
        if (sdr.Read())
        {
            ei = new EntertainApply();
            ei.staffName = (string)sdr["StaffName"];
            ei.department = (string)sdr["Department"];
            ei.manager=(string)sdr["Manager"];
            ei.applyDate = Convert.ToDateTime(sdr["ApplyDate"]);
            ei.treatDate = Convert.ToDateTime(sdr["TreatDate"]);
            ei.treatStandard=(string)sdr["TreatStandard"];
            ei.reason=(string)sdr["Reason"];
            ei.treated=(string)sdr["Treated"];
            ei.budget = Convert.ToDouble(sdr["Budget"]);
            ei.treatStyle=(string)sdr["TreatStyle"];
            ei.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();
        return ei;
    }
    /// <summary>
    /// 判断特定编号的宴请申请记录是否存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasEntertainApplyInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [EntertainApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.VarChar).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    public string Department { get { return this.department; } set { this.department = value; } }
    public string Manager { get { return this.manager; } set { this.manager = value; } }
    public DateTime ApplyDate { get { return this.applyDate; } set { this.applyDate = value; } }
    public DateTime TreatDate { get { return this.treatDate; } set { this.treatDate = value; } }
    public string TreatStandard { get { return this.treatStandard; } set { this.treatStandard = value; } }
    public string Reason { get { return this.reason; } set { this.reason = value; } }
    public string Treated { get { return this.treated; } set { this.treated = value; } }
    public double Budget { get { return this.budget; } set { this.budget = value; } }
    public string TreatStyle { get { return this.treatStyle; } set { this.treatStyle = value; } }
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }

    private string staffName;
    private string department;
    private DateTime applyDate;
    private string manager;
    private DateTime treatDate;
    private string treatStandard;
    private string reason;
    private string treated;
    private double budget;
    private string treatStyle;
    private string approveProcess;



    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}