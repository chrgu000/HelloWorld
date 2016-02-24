using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// OfficeSupplyApply 的摘要说明
/// 办公用品购买申购单
/// </summary>
public class OfficeSupplyApply
{
	public OfficeSupplyApply()
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
    public static int SetOfficeSupplyApplyByID(int id, OfficeSupplyApply oi, string manager)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasOfficeSupplyApplyInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [OfficeSupplyApplies] SET [StaffName] = @StaffName, [Department]=@Department, [Reason]=@Reason, [ApplyDate]=@ApplyDate, [ApproveProcess]=@ApproveProcess WHERE [ApplyID] = @ApplyID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [OfficeSupplyApplies] ([StaffName], [Department], [Reason], [ApplyDate], [Money]) VALUES (@StaffName, @Department, @Reason, @ApplyDate, @Money)  Select @@Identity as 'Identity'", conn);
        }
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = oi.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = oi.department;
        cmd.Parameters.Add("@Money", SqlDbType.Float).Value = oi.allExpensive;
        cmd.Parameters.Add("@Reason", SqlDbType.VarChar).Value = oi.reason;
        cmd.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = oi.applyDate;
        
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = oi.approveProcess;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = oi.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "办公用品申购";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;


            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = manager;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }


        conn.Close();
        return recordId;
    }



    /// <summary>
    /// 根据编号获取办公用品申购记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static OfficeSupplyApply GetOfficeSupplyApplyByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [OfficeSupplyApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        OfficeSupplyApply oi = null;
        if (sdr.Read())
        {
            oi = new OfficeSupplyApply();
            oi.officeList = new List<OfficeSupplySingle>();
            oi.staffName = (string)sdr["StaffName"];
            oi.department = (string)sdr["Department"];            
            oi.reason = (string)sdr["Reason"];
            oi.applyDate = Convert.ToDateTime(sdr["ApplyDate"]);            
            oi.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();

        double all = 0.0;
        List<OfficeSupplySingle> result = OfficeSupplySingle.GetOfficeSupplyListByID(id);
        oi.officeList.AddRange(result);
        foreach(OfficeSupplySingle o in result)
        {
            all += o.AllExpense;
        }
        oi.allExpensive = all;
        return oi;
    }

    /// <summary>
    /// 判断特定编号的办公用品申请是否已存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasOfficeSupplyApplyInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [OfficeSupplyApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    public string Department { get { return this.department; } set { this.department = value; } }
    public DateTime ApplyDate { get { return this.applyDate; } set { this.applyDate = value; } }
    public string Reason { get { return this.reason; } set { this.reason = value; } }
    public List<OfficeSupplySingle> OfficeList { get { return this.officeList; } set { foreach (OfficeSupplySingle s in value) { this.officeList.Add(s); } } }
    public double AllExpensive { get { return this.allExpensive; } set { this.allExpensive = value; } }
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }

    private string staffName;
    private string department;
    private DateTime applyDate;
    private string reason;
    private List<OfficeSupplySingle> officeList;
    private double allExpensive;
    private string approveProcess;

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;

    

}