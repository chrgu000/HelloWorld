using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// PayAssign 的摘要说明
/// 到款分配
/// </summary>
public class PayAssign
{
	public PayAssign()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}


    /// <summary>
    /// 新增或更新一条到款分配记录，校内项目类型
    /// </summary>
    /// <param name="id"></param>
    /// <param name="pi"></param>
    public static void SetPayAssignInSchool(int id, PayAssign pi)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasPayAssigned(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [PayAssigned] SET [School]=@School, [StaffName]=@StaffName, [ProjectName]=@ProjectName, [Payee] = @Payee, [Payed]=@Payed, [Income]=@Income, [Assigned]=@Assigned, [Instrument]=@Instrument, [Hardware]=@Hardware, [FundingID] = @FundingID, [Management]=@Management, [Labor]=@Labor, [Consult]=@Consult, [BusinessTax]=@BusinessTax, [AddedValueTax]=@AddedValueTax, [Note]=@Note, [ApproveProcess]=@ApproveProcess WHERE [ApplyID] = @ApplyID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [PayAssigned] ([School], [StaffName], [ProjectName], [Payee], [Payed], [Income], [Assigned], [Instrument], [Hardware], [FundingID], [Management], [Labor], [Consult], [BusinessTax], [AddedValueTax], [Note]) VALUES (@School, @StaffName, @ProjectName, @Payee, @Payed, @Income, @Assigned, @Instrument, @Hardware, @FundingID, @Management, @Labor, @Consult, @BusinessTax, @AddedValueTax, @Note) Select @@Identity as 'Identity'", conn);
        }
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@School", SqlDbType.VarChar).Value = pi.school;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = pi.staffName;
        cmd.Parameters.Add("@ProjectName", SqlDbType.VarChar).Value = pi.projectName;
        cmd.Parameters.Add("@Payee", SqlDbType.VarChar).Value = pi.payee;
        cmd.Parameters.Add("@Payed", SqlDbType.Float).Value = pi.payed;
        cmd.Parameters.Add("@Income", SqlDbType.Float).Value = pi.income;
        cmd.Parameters.Add("@Assigned", SqlDbType.Float).Value = pi.assigned;
        cmd.Parameters.Add("@Instrument", SqlDbType.VarChar).Value = pi.instrument;
        cmd.Parameters.Add("@Hardware", SqlDbType.VarChar).Value = pi.hardware;
        cmd.Parameters.Add("@FundingID", SqlDbType.VarChar).Value = pi.fundingID;
        cmd.Parameters.Add("@Management", SqlDbType.Float).Value = pi.management;
        cmd.Parameters.Add("@Labor", SqlDbType.Float).Value = pi.labor;
        cmd.Parameters.Add("@Consult", SqlDbType.Float).Value = pi.consult;
        cmd.Parameters.Add("@BusinessTax", SqlDbType.Float).Value = pi.businessTax;
        cmd.Parameters.Add("@AddedValueTax", SqlDbType.Float).Value = pi.addedValueTax;
        cmd.Parameters.Add("@Note", SqlDbType.VarChar).Value = pi.note;
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = pi.approveProcess;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = pi.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "到款分配-校内";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;

            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = pi.staffName;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }


        conn.Close();
    }
    /// <summary>
    /// 新增或更新一条到款分配记录，校外项目型
    /// </summary>
    /// <param name="id"></param>
    /// <param name="pi"></param>
    public static void SetPayAssignOutSchool(int id, PayAssign pi)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasPayAssigned(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [PayAssigned] SET [School]=@School, [StaffName]=@StaffName, [ProjectName]=@ProjectName, [Payee] = @Payee, [Payed]=@Payed, [Income]=@Income, [Assigned]=@Assigned, [Instrument]=@Instrument, [Hardware]=@Hardware, [FundingID] = @FundingID, [ToUniversity]=@ToUniversity, [ToUniversityDetail]=@ToUniversityDetail, [ToSchool]=@ToSchool, [ToSchoolDetail]=@ToSchoolDetail, [Fundings]=@Fundings, [FundingsDetail]=@FundingsDetail, [Welfare]=@Welfare, [WelfareDetail]=@WelfareDetail, [Note]=@Note, [ApproveProcess]=@ApproveProcess WHERE [ApplyID] = @ApplyID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [PayAssigned] ([School], [StaffName], [ProjectName], [Payee], [Payed], [Income], [Assigned], [Instrument], [Hardware], [FundingID], [ToUniversity], [ToUniversityDetail], [ToSchool], [ToSchoolDetail], [Fundings], [FundingsDetail], [Welfare], [WelfareDetail], [Note]) VALUES (@School,  @StaffName, @ProjectName, @Payee, @Payed, @Income, @Assigned, @Instrument, @Hardware, @FundingID, @ToUniversity, @ToUniversityDetail, @ToSchool, @ToSchoolDetail, @Fundings, @FundingsDetail, @Welfare, @WelfareDetail, @Note) Select @@Identity as 'Identity' ", conn);
        }
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@School", SqlDbType.VarChar).Value = pi.school;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = pi.staffName;
        cmd.Parameters.Add("@ProjectName", SqlDbType.VarChar).Value = pi.projectName;
        cmd.Parameters.Add("@Payee", SqlDbType.VarChar).Value = pi.payee;
        cmd.Parameters.Add("@Payed", SqlDbType.Float).Value = pi.payed;
        cmd.Parameters.Add("@Income", SqlDbType.Float).Value = pi.income;
        cmd.Parameters.Add("@Assigned", SqlDbType.Float).Value = pi.assigned;
        cmd.Parameters.Add("@Instrument", SqlDbType.VarChar).Value = pi.instrument;
        cmd.Parameters.Add("@Hardware", SqlDbType.VarChar).Value = pi.hardware;
        cmd.Parameters.Add("@FundingID", SqlDbType.VarChar).Value = pi.fundingID;
        cmd.Parameters.Add("@ToUniversity", SqlDbType.Float).Value = pi.toUniversity;
        cmd.Parameters.Add("@ToUniversityDetail", SqlDbType.VarChar).Value = pi.toUniversityDetail;
        cmd.Parameters.Add("@ToSchool", SqlDbType.Float).Value = pi.toSchool;
        cmd.Parameters.Add("@ToSchoolDetail", SqlDbType.VarChar).Value = pi.toSchoolDetail;
        cmd.Parameters.Add("@Fundings", SqlDbType.Float).Value = pi.fundings;
        cmd.Parameters.Add("@FundingsDetail", SqlDbType.VarChar).Value = pi.fundingsDetail;
        cmd.Parameters.Add("@Welfare", SqlDbType.Float).Value = pi.welfare;
        cmd.Parameters.Add("@WelfareDetail", SqlDbType.VarChar).Value = pi.welfareDetail;
        cmd.Parameters.Add("@Note", SqlDbType.VarChar).Value = pi.note;
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = pi.approveProcess;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = pi.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "到款分配-校外";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;

            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = pi.StaffName;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }

        conn.Close();
    }
    /// <summary>
    /// 根据编号返回特定的到款分配记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static PayAssign GetPayAssignByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [PayAssigned] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        PayAssign pi = null;
        if (sdr.Read())
        {
            pi = new PayAssign();
            pi.applyID=Convert.ToInt16(sdr["ApplyID"]);
            pi.school = (string)sdr["School"];
            pi.staffName=(string)sdr["StaffName"];
            pi.projectName = (string)sdr["ProjectName"];
            pi.payee = (string)sdr["Payee"];
            pi.payed = Convert.ToDouble(sdr["Payed"]);
            pi.income = Convert.ToDouble(sdr["Income"]);
            pi.assigned = Convert.ToDouble(sdr["Assigned"]);
            pi.instrument = (string)sdr["Instrument"];
            pi.hardware = (string)sdr["Hardware"];
            pi.fundingID = (string)sdr["FundingID"];
            pi.note=(string)sdr["Note"];
            pi.approveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];

            pi.toUniversity = sdr["ToUniversity"]==DBNull.Value?0: Convert.ToDouble(sdr["ToUniversity"]);
            pi.toUniversityDetail = sdr["ToUniversityDetail"] == DBNull.Value ? "" : (string)sdr["ToUniversityDetail"];
            pi.toSchool = sdr["ToSchool"] == DBNull.Value ? 0 : Convert.ToDouble(sdr["ToSchool"]);
            pi.toSchoolDetail = sdr["ToSchoolDetail"] == DBNull.Value ? "" : (string)sdr["ToSchoolDetail"];
            pi.fundings = sdr["Fundings"] == DBNull.Value ? 0 : Convert.ToDouble(sdr["Fundings"]);
            pi.fundingsDetail = sdr["FundingsDetail"] == DBNull.Value ? "" : (string)sdr["FundingsDetail"];
            pi.welfare = sdr["Welfare"] == DBNull.Value ? 0 : Convert.ToDouble(sdr["Welfare"]);
            pi.welfareDetail = sdr["WelfareDetail"] == DBNull.Value ? "" : (string)sdr["WelfareDetail"];
            pi.management = sdr["Management"] == DBNull.Value ? 0 : Convert.ToDouble(sdr["Management"]); 
            pi.labor = sdr["Labor"] == DBNull.Value ? 0 : Convert.ToDouble(sdr["Labor"]); 
            pi.consult = sdr["Consult"] == DBNull.Value ? 0 : Convert.ToDouble(sdr["Consult"]);
            pi.businessTax = sdr["BusinessTax"] == DBNull.Value ? 0 : Convert.ToDouble(sdr["BusinessTax"]);
            pi.addedValueTax = sdr["AddedValueTax"] == DBNull.Value ? 0 : Convert.ToDouble(sdr["AddedValueTax"]);
            
        
        
        }
        sdr.Close();
        conn.Close();
        return pi;
    }

    /// <summary>
    /// 判断特定编号的到款分配记录是否已存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasPayAssigned(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [PayAssigned] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    private int applyID;
    public int ApplyID { get { return this.applyID; } set { this.applyID = value; } }

    private string school;
    public string School { get { return this.school; } set { this.school = value; } }
    private string staffName;
    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    private string projectName;
    public string ProjectName { get { return this.projectName; } set { this.projectName = value; } }
    private string payee;
    public string Payee { get { return this.payee; } set { this.payee = value; } }
    private double payed;
    public double Payed { get { return this.payed; } set { this.payed = value; } }
    private double income;
    public double Income { get { return this.income; } set { this.income = value; } }
    private double assigned;
    public double Assigned { get { return this.assigned; } set { this.assigned = value; } }
    private string instrument;
    public string Instrument { get { return this.instrument; } set { this.instrument = value; } }
    private string hardware;
    public string Hardware { get { return this.hardware; } set { this.hardware = value; } }
    private string fundingID;
    public string FundingID { get { return this.fundingID; } set { this.fundingID = value; } }
    private double toUniversity;
    public double ToUniversity { get { return this.toUniversity; } set { this.toUniversity = value; } }
    private string toUniversityDetail;
    public string ToUniversityDetail { get { return this.toUniversityDetail; } set { this.toUniversityDetail = value; } }
    private double toSchool;
    public double ToSchool { get { return this.toSchool; } set { this.toSchool = value; } }
    private string toSchoolDetail;
    public string ToSchoolDetail { get { return this.toSchoolDetail; } set { this.toSchoolDetail = value; } }
    private double fundings;
    public double Fundings { get { return this.fundings; } set { this.fundings = value; } }
    private string fundingsDetail;
    public string FundingsDetail { get { return this.fundingsDetail; } set { this.fundingsDetail = value; } }
    private double welfare;
    public double Welfare { get { return this.welfare; } set { this.welfare = value; } }
    private string welfareDetail;
    public string WelfareDetail { get { return this.welfareDetail; } set { this.welfareDetail = value; } }
    private double management;
    public double Management { get { return this.management; } set { this.management = value; } }
    private double labor;
    public double Labor { get { return this.labor; } set { this.labor = value; } }
    private double consult;
    public double Consult { get { return this.consult; } set { this.consult = value; } }
    private double businessTax;
    public double BusinessTax { get { return this.businessTax; } set { this.businessTax = value; } }
    private double addedValueTax;
    public double AddedValueTax { get { return this.addedValueTax; } set { this.addedValueTax = value; } }
    private string note;
    public string Note { get { return this.note; } set { this.note = value; } }
    private string approveProcess;
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}