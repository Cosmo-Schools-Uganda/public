using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Students_MasterPage : System.Web.UI.MasterPage
{

    Students Student;
    protected void Page_Load(object sender, EventArgs e)
    {

        int CurrentId =  Convert.ToInt32(Context.User.Identity.Name);
       
        ProfPicture.ImageUrl = "~/Users/PictureHandler.ashx/?UserId=" + CurrentId.ToString();

        Users Users = new Users();

        Users.UserInformation Uinfo = Users.UserInfo(CurrentId);

        UserNameLabel.InnerText = Uinfo.FirstName + " " + Uinfo.LastName;

        Student = new Students(CurrentId, 1);

        PageTitle.Text = Student.FirstName + " " + Student.LastName;

        if (Session["School"] == null)
        {
            Response.Redirect("../UserPage.aspx");
        }

        else
        {
            SchoolName.InnerText = Student.School.GetSchool(Convert.ToInt32(Session["School"].ToString())).Info.SchoolName;
        }
    }

   

    protected void LogoutLink_ServerClick(object sender, EventArgs e)
    {
      
        FormsAuthentication.SignOut();
        Response.Redirect("../SignInPage.aspx");

    }
}
