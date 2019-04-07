<%@ WebHandler Language="C#" Class="PictureHandler" %>

using System;
using System.Web;
using System.IO;

public class PictureHandler : IHttpHandler
{


    public void ProcessRequest(HttpContext context)
    {


        context.Response.ContentType = "image/jpg";

        Users User = new Users();

        Users.UserInformation Uinfo = new Users.UserInformation();

        Uinfo = User.UserInfo(Convert.ToInt32(context.Request.QueryString["UserId"]));

        //Users.UserInformation Uinfo = User.UserInfo(82);

        MemoryStream Ms = new MemoryStream();

        if (Uinfo.ProfilePicture != null)
        {
            Uinfo.ProfilePicture.Save(Ms, System.Drawing.Imaging.ImageFormat.Jpeg);

            context.Response.BinaryWrite(Ms.ToArray());
        }
        else
        {
                context.Response.WriteFile("~/Images/Users/Unknown-person2.gif");
        }


    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}