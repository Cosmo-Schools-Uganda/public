using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;


public partial class SignInPage : System.Web.UI.Page
{

    static int CurrentUserId = 0;

    static bool RecoveryMode = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        /*Attribute added to enable Enter Press for password Box*/
        this.PasswordBox.Attributes.Add("onkeypress", "button_click(this,'" + this.ContinueButton.ClientID + "')");
    }

   
    protected void EnterButton_Press(object sender, KeyPressEventArgs e)
    {
        if (e.KeyChar == (char)Keys.Enter)
        {
        
        }
     }

    protected void ContinueButton_ServerClick(object sender, EventArgs e)
    {
        Users User = new Users();
      
        if (User.AuthenticateUser(UserNameBox.Value, PasswordBox.Value, out CurrentUserId,out RecoveryMode ))
        {

            User = new Users(CurrentUserId);

            if (RecoveryMode)
            {
               
                Session.Add("RecoveryFlag", 1);
               
            }

            else
            {

                Session.Add("RecoveryFlag", 0);
               
            }
            
            FormsAuthentication.RedirectFromLoginPage(CurrentUserId.ToString(),true);

        }

        else
        {
            ErrorMessage.InnerText ="Sorry, Wrong Password or User Credentials";
        }
    }

   
    [WebMethod]
   
    public static bool ThisThing()
    {
        return true;
    }

    [WebMethod]
    public static bool DoAuthentication(string UserName,string Password)
    {
        Users User = new Users();

        bool returns = false;

        if (User.AuthenticateUser(UserName,Password, out CurrentUserId,out RecoveryMode))
        {
            if (RecoveryMode)
            {
                //Response.Redirect("../PasswordModifier.aspx");
            }
            else
            {

                FormsAuthentication.RedirectFromLoginPage(CurrentUserId.ToString(), true);
                returns= true;
            }

        }
        else
        {
            returns= false;
           // UserNameBox.Value = "Incorrect";
        }

        return returns;
    }
}