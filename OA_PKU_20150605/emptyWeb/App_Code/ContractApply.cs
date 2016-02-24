using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 
/// 合同审批单
/// </summary>
public class ContractApply
{
	public ContractApply()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 插入或更新一条合同审批记录，根据编号
    /// </summary>
    /// <param name="id"></param>
    /// <param name="ci"></param>
    public static void SetContractApplyByID(int id, ContractApply ci, int userID)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasContractApplyInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [ContractApplies] SET [StaffName] = @StaffName, [Department]=@Department,[ContractName]=@ContractName, [ProjectName]=@ProjectName, [ProjectCode]=@ProjectCode, [Money]=@Money, [PartyBName]=@PartyBName, [PartyBAddress]=@PartyBAddress, [PartyBContact] = @PartyBContact, [PartyBTelephone]=@PartyBTelephone, [BusinessLicense]=@BusinessLicense, [IndustoryLicense]=@IndustoryLicense, [Others]=@Others, [ApproveProcess]=@ApproveProcess WHERE [ApplyID] = @ApplyID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [ContractApplies] ([StaffName], [Department], [ContractName],  [ProjectName], [ProjectCode], [Money], [PartyBName], [PartyBAddress], [PartyBContact], [PartyBTelephone], [BusinessLicense], [IndustoryLicense],[Others]) VALUES ( @StaffName, @Department, @ContractName,  @ProjectName, @ProjectCode, @Money, @PartyBName, @PartyBAddress, @PartyBContact, @PartyBTelephone, @BusinessLicense, @IndustoryLicense,@Others)  Select @@Identity as 'Identity'", conn);
        }
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = ci.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = ci.department;
        cmd.Parameters.Add("@ContractName", SqlDbType.VarChar).Value = ci.contractName;
        cmd.Parameters.Add("@ProjectName", SqlDbType.VarChar).Value = ci.projectName;
        cmd.Parameters.Add("@ProjectCode", SqlDbType.VarChar).Value = ci.projectCode;
        cmd.Parameters.Add("@Money", SqlDbType.Float).Value = ci.money;
        cmd.Parameters.Add("@PartyBName", SqlDbType.VarChar).Value = ci.partyBName;
        cmd.Parameters.Add("@PartyBAddress", SqlDbType.VarChar).Value = ci.partyBAddress;
        cmd.Parameters.Add("@PartyBContact", SqlDbType.VarChar).Value = ci.partyBContact;
        cmd.Parameters.Add("@PartyBTelephone", SqlDbType.VarChar).Value = ci.partyBTelephone;
        cmd.Parameters.Add("@BusinessLicense", SqlDbType.Bit).Value = ci.businessLicense;
        cmd.Parameters.Add("@IndustoryLicense", SqlDbType.Bit).Value = ci.industoryLicense;
        cmd.Parameters.Add("@Others", SqlDbType.VarChar).Value = ci.others;
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = ci.approveProcess;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = ci.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "合同审批";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;

            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = getNextApprover(userID, ci.department);
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
        Department dp = Department.GetDepartmentByName(department);
        string origin = dp.ResponsiblePerson;
        BasicInfo bi = BasicInfo.GetBasicInfoByID(userID);
        string result = "";
        if (bi.StaffName != origin)
            result = origin;
        else
        {
            if (bi.Position.Trim() == "财务主管")
                result = dp.BULeader;
            else
                result = "财务主管";
        }

        return result;
    }
    /// <summary>
    /// 根据编号获取特定合同记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static ContractApply GetContractApplyByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [ContractApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        ContractApply ci = null;
        if (sdr.Read())
        {
            ci = new ContractApply();
            ci.staffName = (string)sdr["StaffName"];
            ci.department = (string)sdr["Department"];
            ci.projectName=(string)sdr["ProjectName"];
            ci.projectCode = (string)sdr["ProjectCode"];
            ci.contractName=(string)sdr["ContractName"];
            ci.money = Convert.ToDouble(sdr["Money"]);
            ci.partyBName=(string)sdr["PartyBName"];
            ci.partyBAddress=(string)sdr["PartyBAddress"];
            ci.partyBContact=(string)sdr["PartyBContact"];
            ci.partyBTelephone=(string)sdr["PartyBTelephone"];
            ci.businessLicense=(bool)sdr["BusinessLicense"];
            ci.industoryLicense=(bool)sdr["IndustoryLicense"];
            ci.others=(string)sdr["Others"];
            ci.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();
        return ci;
    }
    /// <summary>
    /// 判断特定编号的合同申请是否已存在
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasContractApplyInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [ContractApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }





    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    public string Department_str { get { return this.department; } set { this.department = value; } }
    public string ContractName { get { return this.contractName; } set { this.contractName = value; } }
    public string ProjectName { get { return this.projectName; } set { this.projectName = value; } }
    public string ProjectCode { get { return this.projectCode; } set { this.projectCode = value; } }
    public double Money { get { return this.money; } set { this.money = value; } }
    public string PartyBName { get { return this.partyBName; } set { this.partyBName = value; } }
    public string PartyBAddress { get { return this.partyBAddress; } set { this.partyBAddress = value; } }
    public string PartyBContact { get { return this.partyBContact; } set { this.partyBContact = value; } }
    public string PartyBTelephone { get { return this.partyBTelephone; } set { this.partyBTelephone = value; } }
    public bool BusinessLicense { get { return this.businessLicense; } set { this.businessLicense = value; } }
    public bool IndustoryLicense { get { return this.industoryLicense; } set { this.industoryLicense = value; } }
    public string Others { get { return this.others; } set { this.others = value; } }
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }

    private string staffName;
    private string department;
    private string contractName;
    private string projectName;
    private string projectCode;
    private double money;
    private string partyBName;
    private string partyBAddress;
    private string partyBContact;
    private string partyBTelephone;

    private bool businessLicense;
    private bool industoryLicense;
    private string others;
    private string approveProcess;



    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}