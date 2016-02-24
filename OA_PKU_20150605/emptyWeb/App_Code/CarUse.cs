using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// 
/// 车辆使用登记
/// </summary>
public class CarUse
{
	public CarUse()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 新增或更新车辆使用登记记录
    /// </summary>
    /// <param name="id"></param>
    /// <param name="ci"></param>
    /// <param name="userID"></param>
    public static int SetCarUseByID(int id, CarUse ci)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        bool isExist = HasCarUseInfo(id);
        if (isExist)
        {
            cmd = new SqlCommand("UPDATE [CarUseApplies] SET [StaffName] = @StaffName, [Department]=@Department, [StartDate]=@StartDate, [EndDate]=@EndDate, [AlongCount]=@AlongCount, [AlongName]=@AlongName, [Reason]=@Reason, [Destination]=@Destination, [Driver]=@Driver, [CarNum] = @CarNum, [Note]=@Note, [ApproveProcess]=@ApproveProcess WHERE [ApplyID] = @ApplyID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [CarUseApplies] ([StaffName], [Department], [StartDate], [EndDate], [AlongCount], [AlongName], [Reason], [Destination], [Driver], [CarNum], [Note]) VALUES (@StaffName, @Department, @StartDate, @EndDate, @AlongCount, @AlongName, @Reason, @Destination, @Driver, @CarNum, @Note)  Select @@Identity as 'Identity'", conn);
        }
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = ci.staffName;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = ci.departmentName;
        cmd.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = ci.startDate;
        cmd.Parameters.Add("@EndDate", SqlDbType.DateTime).Value = ci.endDate;
        cmd.Parameters.Add("@AlongCount", SqlDbType.Int).Value = ci.alongCount;
        cmd.Parameters.Add("@AlongName", SqlDbType.VarChar).Value = ci.alongName;
        cmd.Parameters.Add("@Reason", SqlDbType.VarChar).Value = ci.reason;
        cmd.Parameters.Add("@Destination", SqlDbType.VarChar).Value = ci.destination;
        cmd.Parameters.Add("@Driver", SqlDbType.VarChar).Value = ci.driver;
        cmd.Parameters.Add("@CarNum", SqlDbType.VarChar).Value = ci.carNum;
        cmd.Parameters.Add("@Note", SqlDbType.VarChar).Value = ci.note==null?"":ci.note;
        cmd.Parameters.Add("@ApproveProcess", SqlDbType.VarChar).Value = ci.approveProcess;

        conn.Open();

        //同时在标准化申请表中插入一条记录
        int recordId = Convert.ToInt32(cmd.ExecuteScalar());
        if (!isExist)
        {
            SqlCommand cmd2 = new SqlCommand("INSERT INTO [AllApplies] ( [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [RecordID], [Result]) VALUES (@ApplyStaff, @ApplyDate, @ApplyType, @NextApprover, @RecordID, @Result)", conn);
            cmd2.Parameters.Add("@ApplyStaff", SqlDbType.VarChar).Value = ci.staffName;
            cmd2.Parameters.Add("@ApplyDate", SqlDbType.DateTime).Value = DateTime.Now;
            cmd2.Parameters.Add("@ApplyType", SqlDbType.VarChar).Value = "车辆使用登记";
            cmd2.Parameters.Add("@RecordID", SqlDbType.Int).Value = recordId;


            cmd2.Parameters.Add("@NextApprover", SqlDbType.VarChar).Value =  Department.GetDepartmentByName(BasicInfo.GetBasicInfoByName(ci.staffName).Department).ResponsiblePerson;
            cmd2.Parameters.Add("@Result", SqlDbType.Bit).Value = false;
            cmd2.ExecuteNonQuery();
        }


        conn.Close();
        return recordId;
    }

    /// <summary>
    /// 根据编号返回特定的车辆使用登记记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static CarUse GetCarUseByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [CarUseApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        CarUse ci = null;
        if (sdr.Read())
        {
            ci = new CarUse();            
            ci.staffName = (string)sdr["StaffName"];
            ci.departmentName = (string)sdr["Department"];
            ci.startDate = Convert.ToDateTime(sdr["StartDate"]);
            ci.endDate = Convert.ToDateTime(sdr["EndDate"]);
            ci.alongCount=(int)sdr["AlongCount"];
            ci.alongName=(string)sdr["AlongName"];
            ci.reason = (string)sdr["Reason"];
            ci.destination=(string)sdr["Destination"];
            ci.driver=(string)sdr["Driver"];
            ci.driveHistoryList = new List<CarUseRecord>();
            ci.carNum=(string)sdr["CarNum"];
            ci.ApproveProcess = sdr["ApproveProcess"] == DBNull.Value ? "" : (string)sdr["ApproveProcess"];
        }
        sdr.Close();
        conn.Close();

        List<CarUseRecord> result = new List<CarUseRecord>();
        result = CarUseRecord.GetCarUseRecordListByID(id);
        ci.driveHistoryList.AddRange(result);


        return ci;
    }

    /// <summary>
    /// 判断是否存在特定的车辆使用登记记录
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static bool HasCarUseInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [CarUseApplies] WHERE [ApplyID] = @ApplyID", conn);
        cmd.Parameters.Add("@ApplyID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }

    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    public string DepartmentName { get { return this.departmentName; } set { this.departmentName = value; } }
    public int AlongCount { get { return this.alongCount; } set { this.alongCount = value; } }
    public string AlongName { get { return this.alongName; } set { this.alongName = value; } }    
    public DateTime StartDate { get { return this.startDate; } set { this.startDate = value; } }    
    public DateTime EndDate { get { return this.endDate; } set { this.endDate = value; } }
    public string Destination { get { return this.destination; } set { this.destination = value; } }
    public string Driver { get { return this.driver; } set { this.driver = value; } }
    public string Reason { get { return this.reason; } set { this.reason = value; } }
    public string CarNum { get { return this.carNum; } set { this.carNum = value; } }
    public string Note { get { return this.note; } set { this.note = value; } }
    public string ApproveProcess { get { return this.approveProcess; } set { this.approveProcess = value; } }
    public List<CarUseRecord> DriveHistoryList { get { return this.driveHistoryList; } set { foreach (CarUseRecord d in value) { this.driveHistoryList.Add(d); } } }

    private string staffName;
    private string departmentName;
    private int alongCount;
    private DateTime startDate;
    private DateTime endDate;
    private string alongName;
    private string destination;
    private string reason;
    private string driver;
    private string carNum;
    private string note;
    private List<CarUseRecord> driveHistoryList;
    private string approveProcess;

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
}