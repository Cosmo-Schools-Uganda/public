using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Recovery : System.Web.UI.Page
{
    Users User;
    protected void Page_Load(object sender, EventArgs e)
    {
        User = new Users();

        if (!IsPostBack)
        {
            ErrorMessage.Visible = false;
        }
        else
        {
            ErrorMessage.Visible = true;
        }

    }
    protected void Continue_Click(object sender, EventArgs e)
    {
        try
        {
            if (User.RecoverPassword(EmailBox.Text))
            {
                Response.Redirect("FeedBack.aspx");
            }
            else
            {

            }
        }
        catch
        {
            ErrorMessage.Visible = true;
        }
    }
}