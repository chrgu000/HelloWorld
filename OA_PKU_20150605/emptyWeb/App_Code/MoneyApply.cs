using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 
/// 资金使用审批表
/// </summary>
public class MoneyApply
{
	public MoneyApply()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 更新或插入一条新的资金使用申请记录
    /// </summary>
    /// <param name="id"></param>
    /// <param name="mi"></param>
    public static void SetMoneyApplyByID(int id, MoneyApply mi)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist=HasMoneyApplyInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [MoneyApplies] SET [StaffName] = @StaffName, [Department]=@Department, [Telephone]=@Telephone, [Money]=@Money, [ProjectCode] = @ProjectCode, [Style]=@Style, [Usage]=@Usage, [PayPlan]=@PayPlan, [Payee]=@Payee, [PayDate]=@PayDate, [ApproveProcess]=@ApproveProcess WHERE [RecordID] = @RecordID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [MoneyApplies] ( [StaffName], [Department], [Telephone],  [Money], [ProjectCode], [Style], [Usage], [PayPlan], [Payee], [PayDate]) VALUES (@StaffName, @Department, @Telephone,  @Money, @ProjectCode, @Style, @Usage, @PayPlan, @Payee, @PayDate)  Select @@Identity as 'Identity'", conn);
        }
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = mi.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = mi.department;
        cmd.Parameters.Add("@Telephone", SqlDbType.VarChar).Value = mi.telephone;
        cmd.Parameters.Add("@Money", SqlDbType.Float).Value = mi.money;
        cmd.Parameters.Add("@ProjectCode", SqlDbType.VarChar).Value = mi.projectCode;
        cmd.Parameters.Add("@Style", SqlDbType.VarChar).Value = mi.style;
        cmd.Parameters.Add("@Usage", SqlDbType.VarChar).Value = mi.usage;
        cmd.Parameters.Add("@PayPlan", SqlDbType.VarChar).Value = mi.plan;
        cmd.Parameters.Add("@Payee", SqlDbType.VarChar).Value = mi.payee;
        cmd.Parameters.Add("@PayDate", SqlDbType.DateTime).Value = mi.payDate;
        cmd.Parameters.Add("@ApproveProcess",SqlDbType.VarChar).Value=mi.approveProcess;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = mi.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "资金使用审批";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;
            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = ProjectInfo.getProjectInfoByCode(mi.projectCode).Manager;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }


        conn.Close();
    }

    /// <summary>
    /// 根据申请编号，获取相应的资金使用申请记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static MoneyApply GetMoneyApplyByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [MoneyApplies] WHERE [RecordID] = @RecordID", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        MoneyApply mi = null;
        if (sdr.Read())
        {
            mi = new MoneyApply();
            mi.staffName = (string)sdr["StaffName"];
            mi.department = (string)sdr["Department"];
            mi.telephone = (string)sdr["Telephone"];
            mi.money = Convert.ToDouble(sdr["Money"]);
            mi.payee = (string)sdr["Payee"];
            mi.projectCode = (string)sdr["ProjectCode"];
            mi.style=(string)sdr["Style"];
            mi.usage = (string)sdr["Usage"];
            mi.plan = (string)sdr["PayPlan"];
            mi.payDate = Convert.ToDateTime(sdr["PayDate"]);
            mi.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();
        return mi;
    }


    /// <summary>
    /// 判断是否资金使用申请是否存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasMoneyApplyInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [MoneyApplies] WHERE [RecordID] = @RecordID", conn);
        cmd.Parameters.Add("@RecordID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    public string Department { get { return this.department; } set { this.department = value; } }
    public string Telephone { get { return this.telephone; } set { this.telephone = value; } }
    public double Money { get { return this.money; } set { this.money = value; } }
    public string ProjectCode { get { return this.projectCode; } set { this.projectCode = value; } }
    public string Style { get { return this.style; } set { this.style = value; } }
    public string Usage { get { return this.usage; } set { this.usage = value; } }
    public string Plan { get { return this.plan; } set { this.plan = value; } }
    public string Payee { get { return this.payee; } set { this.payee = value; } }
    public DateTime PayDate { get { return this.payDate; } set { this.payDate = value; } }
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }

    private string staffName;
    private string department;
    private string telephone;
    private double money;
    private string projectCode;
    private string style;
    private string usage;
    private string plan;
    private string payee;
    private DateTime payDate;
    private string approveProcess;


    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}