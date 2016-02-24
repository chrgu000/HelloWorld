using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_BasicInfoEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {//初次加载
            DataSet allDep = Department.GetAllDepartment();
            depList.DataSource = allDep.Tables[0].DefaultView;
            depList.DataTextField = "DepartmentName";
            //depList.DataValueField = "DepartmentID";
            depList.DataValueField = "DepartmentName";
            depList.DataBind();

            DataSet allPos = Roles.GetAllRoles();
            posList.DataSource = allPos.Tables[0].DefaultView;
            posList.DataTextField = "RoleName";
            //posList.DataValueField = "RoleID";
            posList.DataValueField = "RoleName";
            posList.DataBind();

            Users user = (Users)Session["Identify"];
            int UserID = Convert.ToInt32(Request["UserID"] == null ? "-1" : Request["UserID"]);
            BasicInfo bi = null;
            if (-1 == UserID)
            {
                if (BasicInfo.HasBasicInfo(user.UserID))
                {
                    bi = new BasicInfo();
                    bi = BasicInfo.GetBasicInfoByID(user.UserID);
                    initializePage(bi);
                }
            }
            else
            {
                bi = new BasicInfo();
                bi = BasicInfo.GetBasicInfoByID(UserID);
                initializePage(bi);
                posList.Enabled = true;
                onJob.Enabled = true;
            }
        }
        
    }
    /// <summary>
    /// 初始化已存在的个人信息
    /// </summary>
    /// <param name="bi"></param>
    private void initializePage(BasicInfo bi)
    {
        staffName.Value = bi.StaffName;
        oldName.Value = bi.OldName;
        onJob.SelectedIndex = bi.OnJob?0:1;
        gender.SelectedIndex = bi.Gender ? 0 : 1;
        birthday.Value = bi.Birthday.ToShortDateString();
        raceList.SelectedValue = bi.Race;
        comList.SelectedValue = bi.Company;
        depList.SelectedValue = bi.Department;
        posList.SelectedValue = bi.Position.Trim();
        titleList.SelectedValue = bi.Title;
        contact.Value = bi.Contact;
        email.Value = bi.Email;
        address.Value = bi.Address;
        urgenContact.Value = bi.UrgentContact;
        urgenPerson.Value = bi.UrgentPerson;
        cardID.Value = bi.CardID;
        politicsList.SelectedValue = bi.Politics;
        marriage.SelectedValue = bi.Marriage;
        school.Value = bi.School;
        education.SelectedValue = bi.Education;
        major.Value = bi.Major;
        computer.Value = bi.Computer;
        foreignLan.Value = bi.ForeignLan;
        foreignLev.Value = bi.ForeignLev;
        enterDate.Value = bi.EnterDate.ToShortDateString();
        fileAddr.Value = bi.FileAddr;
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        BasicInfo bi = new BasicInfo();
        

        bi.StaffName = staffName.Value;
        bi.Gender = (gender.SelectedValue == "男" ? true : false);
        bi.Race = raceList.SelectedValue;
        bi.Birthday = Convert.ToDateTime(birthday.Value);
        bi.Company = comList.SelectedValue;
        bi.Department = depList.SelectedValue;
        bi.Title = titleList.SelectedValue;
        bi.Position = posList.SelectedValue;
        bi.Contact = contact.Value;
        bi.Email = email.Value;
        bi.Address = address.Value;
        bi.UrgentContact = urgenContact.Value;
        bi.UrgentPerson = urgenPerson.Value;
        bi.School = school.Value;
        bi.Major = major.Value;
        bi.Education = education.SelectedValue;
        bi.CardID = cardID.Value;
        bi.Marriage = marriage.SelectedValue;
        bi.Politics = politicsList.SelectedValue;
        bi.OldName = oldName.Value;
        bi.Computer = computer.Value;
        bi.ForeignLan = foreignLan.Value;
        bi.ForeignLev = foreignLev.Value;
        bi.FileAddr = fileAddr.Value;
        bi.EnterDate = Convert.ToDateTime(enterDate.Value);
        bi.OnJob = onJob.SelectedIndex == 0 ? true : false;

        Users user = (Users)Session["Identify"];
        int UserID = Convert.ToInt32(Request["UserID"] == null ? "-1" : Request["UserID"]);
        if (-1 == UserID)
        {
            bi.StaffID = user.UserID;
            BasicInfo.SetBasicInfoByID(user.UserID, bi);
            Response.Write("<script Language='JavaScript'>alert('基本信息已更新!');window.location.href ='BasicInfo.aspx'</script>");
        }
        else
        {
            bi.StaffID = UserID;
            BasicInfo.SetBasicInfoByID(UserID, bi);
            Response.Write("<script Language='JavaScript'>alert('基本信息已更新!');window.location.href ='../Admin/UserFilter.aspx'</script>");
        }
        
        
    }
}