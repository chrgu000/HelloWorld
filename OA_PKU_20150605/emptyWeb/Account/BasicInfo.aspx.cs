using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Acount_BasicInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users usr = (Users)Session["Identify"];

        BasicInfo bi = BasicInfo.GetBasicInfoByID(usr.UserID);

        staffName.Text = bi.StaffName;
        oldName.Text = bi.OldName;
        gender.Text = bi.Gender ? "男" : "女";
        race.Text = bi.Race;
        department.Text = bi.Department;
        company.Text = bi.Company;
        position.Text = bi.Position;
        title.Text = bi.Title;
        native.Text = bi.Native;
        birth.Text = bi.Birthday.ToShortDateString();
        political.Text = bi.Politics;
        education.Text = bi.Education;
        address.Text = bi.Address;
        //household.Text = bi.HouseHold;
        fileAddr.Text = bi.FileAddr;
        contact.Text = bi.Contact;
        mail.Text = bi.Email;
        marriage.Text = bi.Marriage;        
        identifyID.Text = bi.CardID;        
        school.Text = bi.School;
        major.Text = bi.Major;
        foreignLan.Text = bi.ForeignLan;
        foreignLev.Text = bi.ForeignLev;
        urgenContact.Text = bi.UrgentContact;
        urgenPerson.Text = bi.UrgentPerson;
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Account/BasicInfoEdit.aspx");
    }
}