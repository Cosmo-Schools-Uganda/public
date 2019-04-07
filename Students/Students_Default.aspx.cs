using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Students_Students_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Students Student = new Students(Convert.ToInt32(Context.User.Identity.Name.ToString()));       
        
      

    }
}