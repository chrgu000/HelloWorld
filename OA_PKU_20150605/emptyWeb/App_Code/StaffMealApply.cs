using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// StaffMealApply 的摘要说明
/// 员工用餐申请
/// </summary>
public class StaffMealApply
{
	public StaffMealApply()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 新增或更新一条员工用餐申请
    /// </summary>
    /// <param name="id"></param>
    /// <param name="si"></param>
    /// <param name="usrID"></param>
    public static void SetStaffMealApplyByID(int id, StaffMealApply si)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasStaffMealApplyInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [MealApplies] SET [StaffName] = @StaffName, [Department]=@Department, [Position]=@Position, [Money]=@Money, [MealDate] = @MealDate, [Persons]=@Persons, [Reason]=@Reason, [Standard]=@Standard, [Legal]=@Legal, [Style]=@Style, [ApproveProcess]=@ApproveProcess WHERE [ApplyID] = @ApplyID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [MealApplies] ( [StaffName], [Department], [Position], [MealDate], [Persons], [Money], [Reason], [Standard], [Legal], [Style]) VALUES (@StaffName, @Department, @Position, @MealDate, @Persons, @Money, @Reason, @Standard, @Legal, @Style)  Select @@Identity as 'Identity'", conn);
        }
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = si.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = si.departmentName;
        cmd.Parameters.Add("@Position", SqlDbType.VarChar).Value = si.position;
        cmd.Parameters.Add("@MealDate", SqlDbType.DateTime).Value = si.mealDate;
        cmd.Parameters.Add("@Persons", SqlDbType.Int).Value = si.persons;
        cmd.Parameters.Add("@Money", SqlDbType.Float).Value = si.money;
        cmd.Parameters.Add("@Reason", SqlDbType.VarChar).Value = si.reason;
        cmd.Parameters.Add("@Standard", SqlDbType.VarChar).Value = si.standard;
        cmd.Parameters.Add("@Style", SqlDbType.Bit).Value = si.style;
        cmd.Parameters.Add("@Legal", SqlDbType.Bit).Value = si.legal;
       
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = si.approveProcess;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = si.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "员工用餐申请";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;
            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value = Department.GetDepartmentByName(si.DepartmentName).ResponsiblePerson;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }
        

        conn.Close();
    }

    /// <summary>
    /// 根据编号获取特定的员工宴请申请记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static StaffMealApply GetStaffMealApplyByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [MealApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        StaffMealApply si = null;
        if (sdr.Read())
        {
            si = new StaffMealApply();
            si.staffName = (string)sdr["StaffName"];
            si.departmentName = (string)sdr["Department"];
            si.position=(string)sdr["Position"];
            si.reason=(string)sdr["Reason"];
            si.persons=(int)sdr["Persons"];
            si.money=(double)sdr["Money"];
            si.standard=(string)sdr["Standard"];
            si.mealDate = Convert.ToDateTime(sdr["MealDate"]);
            si.legal=(bool)sdr["Legal"];
            si.style=(bool)sdr["Style"];
            si.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();
        return si;
    }

    /// <summary>
    /// 判断是否存在特定编号的员工用餐申请
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasStaffMealApplyInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [MealApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    public string DepartmentName { get { return this.departmentName; } set { this.departmentName = value; } }
    public string Position { get { return this.position; } set { this.position = value; } }
    public DateTime MealDate { get { return this.mealDate; } set { this.mealDate = value; } }
    public int Persons { get { return this.persons; } set { this.persons = value; } }
    public double Money { get { return this.money; } set { this.money = value; } }
    public string Reason { get { return this.reason; } set { this.reason = value; } }
    public string Standard { get { return this.standard; } set { this.standard = value; } }
    public bool Legal { get { return this.legal; } set { this.legal = value; } }
    public bool Style { get { return this.style; } set { this.style = value; } }
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }

    private string staffName;
    private string departmentName;
    private string position;
    private DateTime mealDate;
    private int persons;
    private double money;
    private string reason;
    private string standard;
    private bool legal;
    private bool style;
    private string approveProcess;


    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}