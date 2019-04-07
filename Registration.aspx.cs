using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web.Security;

public partial class Registration : System.Web.UI.Page
{

    Users Users;
    string pathString2;

    protected string ProfileUserPath { get; set; }

    private void CreateUserFile(string Name)
    {
        string[] SubFolders = new string[] { "Profile", "Images", "Video", "Audio", "Documents", "Messages" };

        string FolderName = @"e:/Cosmo/Users";

        System.IO.Path.Combine(FolderName, Name);

        pathString2 = @"e:/Cosmo/Users/" + Name + "";

        System.IO.Directory.CreateDirectory(pathString2);

        ProfileUserPath = pathString2 + "/" + "Profile";

        foreach (string Subfolder in SubFolders)
        {
            System.IO.Path.Combine(pathString2, Subfolder);

            string pathString3 = pathString2 + "/" + Subfolder;

            System.IO.Directory.CreateDirectory(pathString3);
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            AlertMessage.Visible = false;
        }
        else
        {
            AlertMessage.Visible = true;
        }



    }


    //User data captured here
    protected void SubmitInfo_ServerClick(object sender, EventArgs e)
    {

        //try
        //{

        Users = new Users();

        Users.UserInformation UserInfo = new Users.UserInformation();

        Bitmap Bm = null;

        UserInfo.FirstName = FirstNameBox.Value;
        UserInfo.LastName = LastNameBox.Value;
        UserInfo.OtherName = MiddleNameBox.Value;
        UserInfo.UserName = UserNameBox.Value;
        UserInfo.Email = EmailBox.Value;


        if (ProfilePictureUpload.HasFile)
        {

            Bm = new Bitmap(ProfilePictureUpload.PostedFile.InputStream);

        }

        else
        {
            Bm = null;
        }

        UserInfo.ProfilePicture = Bm;

        if (BirthDaySelection.Value != null)
        {
            UserInfo.DateOfBirth = (DateTime)BirthDaySelection.Value;
        }
        else
        {
            UserInfo.DateOfBirth = DateTime.Today;
        }
        
        UserInfo.PhoneNumber = PhoneNumberBox.Value;

        AlertContainer.Visible = true;


        if (Users.NewUser(UserInfo, PasswordBox.Value, RptPasswordBox.Value).Code == 0)
        {

            if (Session["UserId"] == null)
            {
                Session.Add("UserId", Users.CurrentId);
            }
            else
            {
                Session["UserId"] = Users.CurrentId;
            }

            CreateUserFile(UserInfo.FirstName + " " + UserInfo.LastName + "[" + UserInfo.UserName + "]");


            UploadImage(ProfilePictureUpload, ProfileUserPath, UserInfo.UserName, ".jpg");

            // Response.Redirect("UserPage.aspx");

            FormsAuthentication.RedirectFromLoginPage(Users.CurrentId.ToString(), true);

            AlertContainer.Attributes["class"] = "alert alert-success";
            AlertMessage.InnerText = "User Account has been Created Succesfully";
        }

        else
        {
            AlertContainer.Attributes["class"] = "alert alert-danger";
            AlertMessage.InnerText = Users.NewUser(UserInfo, PasswordBox.Value, RptPasswordBox.Value).MessageData;

            System.Diagnostics.Debug.WriteLine(Users.NewUser(UserInfo, PasswordBox.Value, RptPasswordBox.Value).MessageData);

        }

        //}
        //catch
        //{

        //}
    }



    private void UploadImage(FileUpload Source, string OutputLocation, string FileName, string FileType)
    {
        int contentLength = Source.PostedFile.ContentLength;//You may need it for validation
        string contentType = Source.PostedFile.ContentType;//You may need it for validation
        string fileName = Source.PostedFile.FileName;


        Source.PostedFile.SaveAs(OutputLocation + '/' + FileName + FileType);//Or code to save in the DataBase.



    }

    protected void CountrySelectionDrop_SelectedIndexChanged(object sender, EventArgs e)
    {
        CityDrop.Items.Clear();

        Geography Geog = new Geography(CountrySelectionDrop.SelectedItem.ToString());

        foreach (Geography.Cities City in new Geography.Cities().GetCities(Convert.ToInt32(CountrySelectionDrop.SelectedValue)))
        {
            System.Diagnostics.Debug.WriteLine(City.Name);

            CityDrop.Items.Add(City.Name);

        }

      

      
        
       

    }
}
