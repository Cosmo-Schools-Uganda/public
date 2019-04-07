using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPage : System.Web.UI.Page
{

    protected override void OnPreLoad(EventArgs e)
    {
        if (Session["RecoveryFlag"] != null)
        {
            if (Convert.ToInt32(Session["RecoveryFlag"].ToString()) == 1)
            {
                Response.Redirect("PasswordModifier.aspx");
            }
            else
            {

            }
        }
        else
        {

        }
        base.OnPreInit(e);


    }

    protected void Page_Load(object sender, EventArgs e)
    {

       
        int CurrentId = Convert.ToInt32(Session["UserId"]);

        CurrentId = Convert.ToInt32(Context.User.Identity.Name);

        Chat chat = new Chat(Convert.ToInt32(Context.User.Identity.Name));

        chat.GetInbox();

        foreach (Chat ch in chat.GetChatData())
        {
            System.Diagnostics.Debug.WriteLine(ch.Message +"from"+ ch.Sender.FirstName + ch.Sender.LastName);
        }

        foreach (string Role in Roles.GetRolesForUser(CurrentId.ToString()))
        {
            if(Role=="Students" || Role == "Teachers" || Role=="Administrators")
            {
                NewUserPrompt.Visible = false;

                System.Diagnostics.Debug.WriteLine(Role);
                
            }

            
            else
            {
                
                NewUserPrompt.Visible = true;
            }
        }


        foreach(string User in Roles.GetUsersInRole("Administrators"))
        {
            System.Diagnostics.Debug.WriteLine("Users:"+User);
        }

        Users Users = new Users();

        Users.UserInformation Uinfo = Users.UserInfo(CurrentId);

        this.Title = Uinfo.FirstName + " " + Uinfo.LastName;

          

        UserProfileNames.InnerText = Uinfo.UserName;

        Birthday.InnerText = Uinfo.DateOfBirth.ToString("MMMM,dd,yyyy");

       

        ProfilePicture2.ImageUrl = "~/Users/PictureHandler.ashx/?UserId=" + CurrentId.ToString();


        Salutation.InnerText= Uinfo.UserName;

    }
}