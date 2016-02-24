using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

/// <summary>
/// 用户基本信息表
/// </summary>
public class BasicInfo
{
   
    public BasicInfo()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 更新或插入记录，根据ID
    /// </summary>
    /// <param name="id">用户ID</param>
    /// <param name="bi">基本信息对象</param>
    public static void SetBasicInfoByID(int id, BasicInfo bi)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        if (HasBasicInfo(id))
        {
            cmd = new SqlCommand("UPDATE [BasicInfo] SET [StaffName] = @StaffName,[Gender] = @Gender, [Race] = @Race, [Birthday] = @Birthday, [Company]=@Company, [Department]=@Department, [Title]=@Title,[Position]=@Position, [Contact] = @Contact, [Email]=@Email, [Address]=@Address, [UrgentContact]=@UrgentContact, [UrgentPerson]=@UrgentPerson, [Politics]=@Politics, [CardID] = @CardID, [Marriage]=@Marriage,  [School] = @School, [Education] = @Education, [Major] = @Major, [OldName] = @OldName, [Computer] = @Computer, [ForeignLan] = @ForeignLan,[ForeignLev]=@ForeignLev, [EnterDate] = @EnterDate, [FileAddr]=@FileAddr, [OnJob]=@OnJob WHERE [UserID] = @UserID", conn);
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO [BasicInfo] ([UserID], [StaffName], [Gender], [Race],  [Birthday], [Company], [Department], [Title], [Position], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [Politics], [CardID], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan],[ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (@UserID, @StaffName, @Gender, @Race,  @Birthday, @Company, @Department, @Title, @Position, @Contact, @Email, @Address, @UrgentContact, @UrgentPerson, @Politics, @CardID, @Marriage, @School, @Education, @Major, @OldName, @Computer, @ForeignLan,@ForeignLev, @EnterDate, @FileAddr, @OnJob)", conn);
        }
        cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = bi.staffName;        
        cmd.Parameters.Add("@Gender", SqlDbType.Bit).Value = bi.gender;
        cmd.Parameters.Add("@Race", SqlDbType.VarChar).Value = bi.race;
        cmd.Parameters.Add("@Birthday", SqlDbType.DateTime).Value = bi.birthday;

        cmd.Parameters.Add("@Company", SqlDbType.VarChar).Value = bi.company;
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = bi.department;       
        cmd.Parameters.Add("@Title", SqlDbType.VarChar).Value = bi.title;
        cmd.Parameters.Add("@Position", SqlDbType.VarChar).Value = bi.position;

        cmd.Parameters.Add("@Contact", SqlDbType.VarChar).Value = bi.contact;
        cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = bi.email;
        cmd.Parameters.Add("@Address", SqlDbType.VarChar).Value = bi.address;
        cmd.Parameters.Add("@UrgentContact", SqlDbType.VarChar).Value = bi.urgentContact;
        cmd.Parameters.Add("@UrgentPerson", SqlDbType.VarChar).Value = bi.urgentPerson;
        
        cmd.Parameters.Add("@Politics", SqlDbType.VarChar).Value = bi.politics;
        cmd.Parameters.Add("@CardID", SqlDbType.VarChar).Value = bi.cardID;
        cmd.Parameters.Add("@Marriage", SqlDbType.VarChar).Value = bi.marriage;
        cmd.Parameters.Add("@OldName", SqlDbType.VarChar).Value = bi.oldName;

        cmd.Parameters.Add("@School", SqlDbType.VarChar).Value = bi.school;
        cmd.Parameters.Add("@Major", SqlDbType.VarChar).Value = bi.major;
        cmd.Parameters.Add("@Education", SqlDbType.Char).Value = bi.education;

        cmd.Parameters.Add("@Computer", SqlDbType.VarChar).Value = bi.computer;
        cmd.Parameters.Add("@ForeignLan", SqlDbType.VarChar).Value = bi.foreignLan;
        cmd.Parameters.Add("@ForeignLev", SqlDbType.VarChar).Value = bi.foreignLev;
 
        cmd.Parameters.Add("@EnterDate", SqlDbType.DateTime).Value = bi.enterDate;
        cmd.Parameters.Add("@FileAddr", SqlDbType.VarChar).Value = bi.fileAddr;
        cmd.Parameters.Add("@OnJob", SqlDbType.Bit).Value = bi.onJob ;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    /// <summary>
    /// 根据ID返回个人基本信息
    /// </summary>
    /// <param name="id">用户ID</param>
    /// <returns>基本信息实体</returns>
    public static BasicInfo GetBasicInfoByID(int id)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [BasicInfo] WHERE [UserID] = @UserID", conn);
        cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        BasicInfo bi = null;
        if (sdr.Read())
        {
            bi = new BasicInfo();
            bi.staffID = id;
            bi.staffName=(string)sdr["StaffName"];
            bi.gender=(bool)sdr["Gender"];
            bi.race=(string)sdr["Race"];
            bi.birthday=(DateTime)sdr["Birthday"];
            bi.company= sdr["Company"]==DBNull.Value?"未填写":(string)sdr["Company"];
            bi.department=(string)sdr["Department"];
            bi.position=(string)sdr["Position"];
            bi.title=(string)sdr["Title"];
            bi.contact=(string)sdr["Contact"];
            bi.email=(string)sdr["Email"];
            bi.address=(string)sdr["Address"];
            bi.urgentContact=(string)sdr["UrgentContact"];
            bi.urgentPerson=(string)sdr["UrgentPerson"];
            bi.cardID=(string)sdr["CardID"];
            bi.oldName=(string)sdr["OldName"];
            bi.politics=(string)sdr["Politics"];
            bi.marriage=(string)sdr["Marriage"];
            bi.school=(string)sdr["School"];
            bi.education=(string)sdr["Education"];
            bi.major=(string)sdr["Major"];
            bi.computer=(string)sdr["Computer"];
            bi.foreignLan=(string)sdr["ForeignLan"];
            bi.foreignLev=(string)sdr["ForeignLev"];
            bi.fileAddr=(string)sdr["FileAddr"];
            bi.enterDate=(DateTime)sdr["EnterDate"];
            bi.onJob=(bool)sdr["OnJob"];
        }
        sdr.Close();
        conn.Close();
        return bi;
    }
    public static BasicInfo GetBasicInfoByName(string name)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [BasicInfo] WHERE [StaffName] = @StaffName", conn);
        cmd.Parameters.Add("@StaffName", SqlDbType.VarChar).Value = name;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        BasicInfo bi = null;
        if (sdr.Read())
        {
            bi = new BasicInfo();
            bi.staffID = (int)sdr["UserID"];
            bi.staffName = (string)sdr["StaffName"];
            bi.gender = (bool)sdr["Gender"];
            bi.race = (string)sdr["Race"];
            bi.birthday = (DateTime)sdr["Birthday"];
            bi.company = sdr["Company"] == DBNull.Value ? "未填写" : (string)sdr["Company"];
            bi.department = (string)sdr["Department"];
            bi.position = (string)sdr["Position"];
            bi.title = (string)sdr["Title"];
            bi.contact = (string)sdr["Contact"];
            bi.email = (string)sdr["Email"];
            bi.address = (string)sdr["Address"];
            bi.urgentContact = (string)sdr["UrgentContact"];
            bi.urgentPerson = (string)sdr["UrgentPerson"];
            bi.cardID = (string)sdr["CardID"];
            bi.oldName = (string)sdr["OldName"];
            bi.politics = (string)sdr["Politics"];
            bi.marriage = (string)sdr["Marriage"];
            bi.school = (string)sdr["School"];
            bi.education = (string)sdr["Education"];
            bi.major = (string)sdr["Major"];
            bi.computer = (string)sdr["Computer"];
            bi.foreignLan = (string)sdr["ForeignLan"];
            bi.foreignLev = (string)sdr["ForeignLev"];
            bi.fileAddr = (string)sdr["FileAddr"];
            bi.enterDate = (DateTime)sdr["EnterDate"];
            bi.onJob = (bool)sdr["OnJob"];
        }
        sdr.Close();
        conn.Close();
        return bi;
    }


    /// <summary>
    /// 判断特定ID是否已存在，存在返回真
    /// </summary>
    /// <param name="id">用户ID</param>
    /// <returns></returns>
    public static bool HasBasicInfo(int id)
    {
        bool ret;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [BasicInfo] WHERE [UserID] = @UserID", conn);
        cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = id;
        conn.Open();
        ret = (int)cmd.ExecuteScalar() > 0;
        conn.Close();
        return ret;
    }
    /// <summary>
    /// 根据用户编号得到其所在部门(注：可能是一级事业部或者二级部门)
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static Department GetDepartment(int id)
    { 
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT [Departments].* FROM [BasicInfo],[Departments] WHERE [UserID] = @UserID and [BasicInfo].[Department]=[Departments].[DepartmentName]", conn);
        cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = id;
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        Department department = null;
        if (sdr.Read())
        {
            department = new Department();
            department.DepartmentName =(string)sdr["DepartmentName"];
            department.DepartmentID=(int)sdr["DepartmentID"];
            department.ParentID=(int)sdr["Parent"];
            department.ResponsiblePerson=(string)sdr["Responsible"];
        }
        sdr.Close();
        conn.Close();
        return department;
    }
    /// <summary>
    /// 根据用户编号返回事业部对象
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static BusinessUnit GetBUByUserID(int id)
    {

        Department department = BasicInfo.GetDepartment(id);

        BusinessUnit bu = BusinessUnit.GetBUByID(department.ParentID);

        return bu;
        
    }
    /// <summary>
    /// 获取机构负责人姓名
    /// </summary>
    /// <returns></returns>
    public static string GetOrganizationResponsible()
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT [StaffName] FROM [BasicInfo] WHERE [Position] = @Position", conn);
        cmd.Parameters.Add("@Position", SqlDbType.Int).Value = "机构负责人";
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        string organizationResponsible = null;
        if (sdr.Read())
        {
            organizationResponsible = (string)sdr["StaffName"];
        }
        sdr.Close();
        conn.Close();
        return organizationResponsible;
    }
    
    /// <summary>
    /// 获取全部员工名单
    /// </summary>
    /// <returns></returns>
    public static List<BasicInfo> GetAllEmployee()
    {
        List<BasicInfo> result = new List<BasicInfo>();

        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [BasicInfo]", conn);
        conn.Open();
        result = excuteSql(cmd);
        conn.Close();
        return result;
    }
    /// <summary>
    /// 返回某部门所有员工列表
    /// </summary>
    /// <param name="department"></param>
    /// <returns></returns>
    public static List<BasicInfo> GetByDepartment(string department)
    {
        List<BasicInfo> result = new List<BasicInfo>();

        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [BasicInfo] WHERE [Department] = @Department", conn);
        cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = department;
        conn.Open();
        result = excuteSql(cmd);
        conn.Close();
        return result;
    }
    /// <summary>
    /// 得到特定事业部的全体员工列表
    /// </summary>
    /// <param name="bu"></param>
    /// <returns></returns>
    public static List<BasicInfo> GetByBU(string bu)
    {
        List<BasicInfo> result = new List<BasicInfo>();

        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [BasicInfo] WHERE [BusinessUnit] = @BusinessUnit", conn);
        cmd.Parameters.Add("@BusinessUnit", SqlDbType.VarChar).Value = bu;
        conn.Open();
        result = excuteSql(cmd);
        conn.Close();
        return result;
    }
    /// <summary>
    /// 返回特定职位的员工列表
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public static List<BasicInfo> GetByPos(string position)
    {
        List<BasicInfo> result = new List<BasicInfo>();

        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [BasicInfo] WHERE [Position] = @Position", conn);
        cmd.Parameters.Add("@Position", SqlDbType.VarChar).Value = position;
        conn.Open();
        result = excuteSql(cmd);
        conn.Close();
        return result;
    }
    /// <summary>
    /// 返回离职或在职的员工列表
    /// </summary>
    /// <param name="status"></param>
    /// <returns></returns>
    public static List<BasicInfo> GetByStatus(bool status)
    {
        List<BasicInfo> result = new List<BasicInfo>();

        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [BasicInfo] WHERE [Status] = @Status", conn);
        cmd.Parameters.Add("@Status", SqlDbType.Bit).Value = status;
        conn.Open();
        result = excuteSql(cmd);
        conn.Close();
        return result;
    }
    /// <summary>
    /// 返回入职时间在特定日期之前的员工列表
    /// </summary>
    /// <param name="startDate"></param>
    /// <returns></returns>
    public static List<BasicInfo> GetByStartDate(DateTime startDate)
    {
        List<BasicInfo> result = new List<BasicInfo>();

        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [BasicInfo] WHERE [StartDate] < @StartDate", conn);
        cmd.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = startDate;
        conn.Open();
        result = excuteSql(cmd);
        conn.Close();
        return result;
    }

    /// <summary>
    /// 执行sql命令，返回员工基本信息列表
    /// </summary>
    /// <param name="cmd"></param>
    /// <returns></returns>
    private static List<BasicInfo> excuteSql(SqlCommand cmd)
    {
        List<BasicInfo> result = new List<BasicInfo>();
        
        SqlDataReader sdr = cmd.ExecuteReader();
        BasicInfo bi = null;
        while (sdr.Read())
        {
            bi = new BasicInfo();
            bi.staffID = Convert.ToInt16(sdr["UserID"]);
            bi.staffName = (string)sdr["StaffName"];
            bi.gender = (bool)sdr["Gender"];
            bi.race = (string)sdr["Race"];
            bi.birthday = (DateTime)sdr["Birthday"];
            bi.company=(string)sdr["Company"];
            bi.department = (string)sdr["Department"];
            bi.position = (string)sdr["Position"];
            bi.title = (string)sdr["Title"];
            bi.contact = (string)sdr["Contact"];
            bi.email = (string)sdr["Email"];
            bi.address = (string)sdr["Address"];
            bi.urgentContact = (string)sdr["UrgentContact"];
            bi.urgentPerson = (string)sdr["UrgentPerson"];
            bi.cardID = (string)sdr["CardID"];
            bi.oldName = (string)sdr["OldName"];
            bi.politics = (string)sdr["Politics"];
            bi.marriage = (string)sdr["Marriage"];
            bi.school = (string)sdr["School"];
            bi.education = (string)sdr["Education"];
            bi.major = (string)sdr["Major"];
            bi.computer = (string)sdr["Computer"];
            bi.foreignLan = (string)sdr["ForeignLan"];
            bi.foreignLev = (string)sdr["ForeignLev"];
            bi.fileAddr = (string)sdr["FileAddr"];
            bi.enterDate = (DateTime)sdr["EnterDate"];
            bi.onJob=(bool)sdr["OnJob"];

            result.Add(bi);
        }
        sdr.Close();

        return result;
    }


    public int StaffID { get { return this.staffID; } set { this.staffID = value; } }
    public string StaffName { get { return this.staffName; } set { this.staffName = value; } }
    public DateTime Birthday { get { return this.birthday; } set { this.birthday = value; } }
    public bool Gender { get { return this.gender; } set { this.gender = value; } }
    public string Race { get { return this.race; } set { this.race = value; } }
    public string Company { get { return this.company; } set { this.company = value; } }
    public string Department { get { return this.department; } set { this.department = value; } }
    public string Position { get { return this.position; } set { this.position = value; } }
    public string Title { get { return this.title; } set { this.title = value; } }
    public string Contact { get { return this.contact; } set { this.contact = value; } }
    public string Address { get { return this.address; } set { this.address = value; } }
    public string Email { get { return this.email; } set { this.email = value; } }
    public string UrgentContact { get { return this.urgentContact; } set { this.urgentContact = value; } }
    public string UrgentPerson { get { return this.urgentPerson; } set { this.urgentPerson = value; } }
    public string CardID { get { return this.cardID; } set { this.cardID = value; } }
    public string OldName { get { return this.oldName; } set { this.oldName = value; } }
    public string Politics { get { return this.politics; } set { this.politics = value; } }
    public string Marriage { get { return this.marriage; } set { this.marriage = value; } }
    public string Education { get { return this.education; } set { this.education = value; } }
    public string School { get { return this.school; } set { this.school = value; } }
    public string Major { get { return this.major; } set { this.major = value; } }
    public string Computer { get { return this.computer; } set { this.computer = value; } }
    public string ForeignLan { get { return this.foreignLan; } set { this.foreignLan = value; } }
    public string ForeignLev { get { return this.foreignLev; } set { this.foreignLev = value; } }
    public DateTime EnterDate { get { return this.enterDate; } set { this.enterDate = value; } }
    public string FileAddr { get { return this.fileAddr; } set { this.fileAddr = value; } }
    public string HouseHold { get { return this.household; } set { this.household = value; } }
    public string Native { get { return this.native; } set { this.native = value; } }
    public string Family { get { return this.family; } set { this.family = value; } }
    public string Hobby { get { return this.hobby; } set { this.hobby = value; } }
    public string Honor { get { return this.honor; } set { this.honor = value; } }
    public string Punish { get { return this.punish; } set { this.punish = value; } }

    private int staffID;
    private string staffName;
    private DateTime birthday;
    private bool gender;
    private string race;
    private string company;
    private string department;
    private string position;
    private string title;
    private string contact;
    private string address;
    private string email;
    private string urgentContact;
    private string urgentPerson;
    private string cardID;
    private string oldName;
    private string politics;
    private string marriage;
    private string education;
    private string school;
    private string major;
    private string computer;
    private string foreignLan;
    private string foreignLev;
    private DateTime enterDate;
    private string fileAddr;

    private string native;
    private string household;
    private string family;
    private string hobby;
    private string honor;
    private string punish;
    private bool onJob;
    public bool OnJob { get { return this.onJob; } set { this.onJob = value; } }
    private string health;
    public string Health { get { return this.health; } set { this.health = value; } }
    private string chinese;
    public string Chinese { get { return this.chinese; } set { this.chinese = value; } }

    private static string connString = ConfigurationManager.ConnectionStrings["TT"].ConnectionString;
    /// <summary>
    /// 根据筛选条件返回结果集
    /// </summary>
    /// <param name="sql"></param>
    /// <returns></returns>
    public static List<BasicInfo> GetFilterResult(string sql)
    {
        List<BasicInfo> result = new List<BasicInfo>();

        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();

        SqlDataReader sdr = cmd.ExecuteReader();
        BasicInfo bi = null;
        while (sdr.Read())
        {
            bi = new BasicInfo();
            bi.staffID = Convert.ToInt16(sdr["UserID"]);
            bi.staffName = (string)sdr["StaffName"];
            bi.gender = (bool)sdr["Gender"];
            bi.race = (string)sdr["Race"];
            bi.birthday = (DateTime)sdr["Birthday"];
            bi.department = (string)sdr["Department"];
            bi.position = (string)sdr["Position"];
            bi.title = (string)sdr["Title"];
            bi.contact = (string)sdr["Contact"];
            bi.email = (string)sdr["Email"];
            bi.address = (string)sdr["Address"];
            bi.urgentContact = (string)sdr["UrgentContact"];
            bi.urgentPerson = (string)sdr["UrgentPerson"];
            bi.cardID = (string)sdr["CardID"];
            bi.oldName = (string)sdr["OldName"];
            bi.politics = (string)sdr["Politics"];
            bi.marriage = (string)sdr["Marriage"];
            bi.school = (string)sdr["School"];
            bi.education = (string)sdr["Education"];
            bi.major = (string)sdr["Major"];
            bi.computer = (string)sdr["Computer"];
            bi.foreignLan = (string)sdr["ForeignLan"];
            bi.foreignLev = (string)sdr["ForeignLev"];
            bi.fileAddr = (string)sdr["FileAddr"];
            bi.enterDate = (DateTime)sdr["EnterDate"];
            bi.onJob = (bool)sdr["OnJob"];

            result.Add(bi);
        }
        sdr.Close();

        conn.Close();
        return result;
    }
}