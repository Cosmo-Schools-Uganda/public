using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for UserInformation
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 

[System.Web.Script.Services.ScriptService]
public class UserInformation : System.Web.Services.WebService {

    public UserInformation () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }


    [WebMethod]
    public string UserName()
    {
        return "Steven K";
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
    
}
