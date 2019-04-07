using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Users_UserMasterPage : System.Web.UI.MasterPage
{

    Users User;
    protected void Page_Load(object sender, EventArgs e)
    {

        int CurrentId = Convert.ToInt32(Context.User.Identity.Name);
        int SelectorIndex = 0;


        User = new Users();

        Users.UserInformation Uinfo = User.UserInfo(CurrentId);

        foreach (string Role in Roles.GetRolesForUser(CurrentId.ToString()))
        {

            HtmlGenericControl li = null;

            if (Role == "Students")
            {
                List<Schools> SchoolSAttended = new List<Schools>();
                SchoolSAttended = User.GetSchools(CurrentId);

                foreach (Schools School in SchoolSAttended)
                {
                    
                    li = new HtmlGenericControl("li");  
                    
                    HtmlAnchor Anch = new HtmlAnchor();

                    Anch.InnerText = School.Info.SchoolName;
                    Anch.ID = School.Info.SchoolId.ToString();

                    li.Controls.Add(Anch);
                    
                    Anch.ServerClick += new EventHandler(SchoolSelected);

                    PageSelector.Controls.AddAt(SelectorIndex, li);

                    SelectorIndex++;

                }

            }

            else if (Role == "Teachers")
            {
                li = new HtmlGenericControl("<li><a href="+"Teachers/Teachers_Home_Default.aspx"+">" + Role + "</a></li>");

            }
            else if (Role == "Administrators")
            {
                  li = new HtmlGenericControl("<li><a href=#>" + Role + "</a></li>");
            }

            try
            {
                PageSelector.Controls.AddAt(SelectorIndex, li);
                SelectorIndex++;
            }
            catch
            {

            }
        }


        UserNameLabel.InnerText = Uinfo.FirstName + " " + Uinfo.LastName;


        ProfPicture.ImageUrl = "~/Users/PictureHandler.ashx/?UserId=" + CurrentId.ToString();
  
    }

   
    protected void SchoolSelected(object sender,EventArgs e)
    {

        HtmlAnchor Anchor = sender as HtmlAnchor;
        
        Session.Add("School",Anchor.ID);

        Response.Redirect("Students/Students_Default.aspx");
        
    }

    protected void LogoutLink_ServerClick(object sender, EventArgs e)
    {

        FormsAuthentication.SignOut();
        Response.Redirect("http://localhost/CosmoSchools/SignInPage.aspx");
    }
}
