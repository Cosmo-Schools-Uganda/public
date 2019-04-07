using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teachers_Teachers_Home_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        foreach(string Role in Roles.GetRolesForUser("85"))
        {
            System.Diagnostics.Debug.WriteLine("these" +Role);
        }


    }
}