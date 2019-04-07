using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.IO;

/// <summary>
/// Summary description for Users
/// </summary>
public class Users
{

    private SqlConnection Con;
    private SqlCommand Com;
    private SqlDataReader Reader;
    private string Query = string.Empty;
    GlobalConnection GC = new GlobalConnection();
    public List<Roles> UserRoles { get; set; }

    public Roles Role
    {
        get
        {
            return MyRole;
        }
        set
        {
            MyRole = value;
        }
    }

    private Roles MyRole;
    public Users()
    {

    }

    public class Roles
    {
        public int Role_id { get; set; }
        public string Role_Name { get; set; }

    }

    public class MessengerBank
    {
        public int Inbox;
        public int OutBox;
        public int Drafts;
        public int Trash;
        public int Received;
    }

    public Users(int UserID)
    {
        UserRoles = new List<Roles>();

        UserRoles.Clear();

        using (var con = new SqlConnection(GC.ConnectionString))
        {
            con.Open();

            Query = "Select * from Roles inner join User_Roles on Roles.id=User_Roles.Role_id where User_id = '" + UserID + "'";

            using (var com = new SqlCommand(Query, con))
            {

                Reader = com.ExecuteReader();

                while (Reader.Read())
                {
                   
                    MyRole = new Roles();

                   
                    MyRole.Role_id = Convert.ToInt32(Reader["id"].ToString());
                    MyRole.Role_Name = Reader["Name"].ToString();

                    UserRoles.Add(MyRole);

                }

                com.Dispose();
            }

            con.Close();

        }

    }
    public int CurrentId;
    public class Message
    {
        public int Code;
        public string MessageData;
    }

    public struct UserInformation
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string OtherName { get; set; }
        public string Email { get; set; }
        public string AlternativeEmail { get; set; }
        public DateTime DateOfBirth { get; set; }
        public Gender Gender { get; set; }
        public string PhoneNumber { get; set; }
        public Bitmap ProfilePicture { get; set; }
        public int Nationality { get; set; }
        public string WorkNumber { get; set; }
        public string HomeNumber { get; set; }
        public byte[] ProfilePictureByte { get; set; }   
        public List<Schools> Schools { get; set; }
            
    }




    public bool RegisterInSchool(int UserId,int SchoolId,int ClassId,string RegistrationNumber,string LicenseNumber)
    {
        int Result = 0;

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "StudentEnrollment";

            using (var com = new SqlCommand(Query, Con))
            {
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.Add(new SqlParameter("@User_id", UserId));
                com.Parameters.Add(new SqlParameter("@School_id", SchoolId));
                com.Parameters.Add(new SqlParameter("@Class_id", ClassId));
                com.Parameters.Add(new SqlParameter("@RegistrationNumber", RegistrationNumber));
                com.Parameters.Add(new SqlParameter("@Licence", LicenseNumber));

                Reader = com.ExecuteReader();

                while (Reader.Read())
                {

                    Result = Convert.ToInt32(Reader["return_value"].ToString());

                }
                com.Dispose();

            }

            Con.Close();


        }

        if (Result == 0)
        {
            return false;
        }
        else
        {
            return true;
        }

    }


    public UserInformation UserInfo(int UserId)
    {

        UserInformation Uinfo = new UserInformation();

        using (var con = new SqlConnection(GC.ConnectionString))
        {
            con.Open();

            Query = "Select * from UserView where Id = '" + UserId + "'";

            using (var com = new SqlCommand(Query, con))
            {

                Reader = com.ExecuteReader();

                while (Reader.Read())
                {
                    Uinfo.FirstName = Reader["FirstName"].ToString();
                    Uinfo.LastName = Reader["LastName"].ToString();
                    Uinfo.OtherName = Reader["OtherName"].ToString();
                    Uinfo.UserName = Reader["UserName"].ToString();
                    Uinfo.Id = Convert.ToInt32(Reader["Id"].ToString());


                    if (Reader["ProfilePicture"] != DBNull.Value)
                    {

                        byte[] PictureByte = (byte[])(Reader["ProfilePicture"]);

                        MemoryStream Ms = new MemoryStream(PictureByte);

                        Bitmap bm = new Bitmap(Ms);

                        Uinfo.ProfilePicture = bm;

                        Uinfo.ProfilePictureByte = PictureByte;



                    }

                    else
                    {
                        Uinfo.ProfilePicture = null;
                    }
                    if (Reader["DateOfBirth"].ToString() != null)
                    {
                        Uinfo.DateOfBirth = Convert.ToDateTime(Reader["DateOfBirth"].ToString());
                    }



                    Uinfo.Nationality = Convert.ToInt32(Reader["Nationality"].ToString());

                    if (!string.IsNullOrEmpty(Reader["Gender"].ToString()))
                    {

                        if (Convert.ToInt32(Reader["Gender"].ToString()) == 0)
                        {
                            Uinfo.Gender = Gender.Female;
                        }
                        else
                        {
                            Uinfo.Gender = Gender.Male;
                        }

                    }


                    Uinfo.Email = Reader["Email"].ToString();
                    Uinfo.AlternativeEmail = Reader["AlternativeEmail"].ToString();
                    Uinfo.PhoneNumber = Reader["PhoneNumber"].ToString();
                    Uinfo.WorkNumber = Reader["WorkNumber"].ToString();
                    Uinfo.HomeNumber = Reader["HomeNumber"].ToString();

                }

                com.Dispose();
            }

            con.Close();

           

        }

        return Uinfo;
    }

    public int OnlineUsersCount()
    {
        int Count;

        using (var Con = new SqlConnection(GC.ConnectionString))
        {

            Con.Open();

            Query = "Select count (*) from Online_Users";

            using (var Com = new SqlCommand(Query, Con))
            {
                Count = int.Parse(Com.ExecuteScalar().ToString());
            
            }
            Con.Close();
        
        }

        return Count;
    }

    public void UpdateOnlineUsers(int UserId,string ConectionId)
    {
        using (var Con = new SqlConnection(GC.ConnectionString))
        {

            Con.Open();

            Query = "dbo.GoOnline";

            using (var Com = new SqlCommand(Query, Con))
            {
                Com.CommandType = CommandType.StoredProcedure;

                Com.Parameters.Add(new SqlParameter("@UserId", UserId));
                Com.Parameters.Add(new SqlParameter("@ConnectionId", ConectionId));


                Com.ExecuteNonQuery();
            }

            Con.Close();
        }
    }

    public bool IsOnline(int UserId)
    {
        bool Result ;

        using (var Con=new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select Count (User_id) from Online_Users where User_id='" + UserId + "'";

            using (var Com=new SqlCommand(Query, Con))
            {

                int Res = Convert.ToInt32(Com.ExecuteNonQuery());

                if (Res == 1 || Res > 0)
                {
                    Result = true;
                }
                else
                {
                    Result = false;
                }

            }
        }

        return Result;

    }

    public List<Users.UserInformation> OnlineUsers(int UserId)
    {

        List<Users.UserInformation> UserList = new List<Users.UserInformation>();

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select * from Online_Users inner Join Users on Online_Users.User_Id = Users.Id where Online_Users.User_Id != '"+UserId+"'";

            using (var Com = new SqlCommand(Query, Con))
            {
                Reader=Com.ExecuteReader();

                while (Reader.Read())
                {
                    Users User = new Users();
                    Users.UserInformation UserInfo = new Users.UserInformation();
                    UserInfo = User.UserInfo(Convert.ToInt32(Reader["User_id"].ToString()));

                    UserList.Add(UserInfo);

                }

               
            }
            Con.Close();
        }

        return UserList;
    }

    public MessengerBank GetMessageBank(int UserId)
    {
        MessengerBank Mb=new MessengerBank();

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select * from Messenger_Statistics where User_id='" + UserId + "'";

            using (var Com = new SqlCommand(Query, Con))
            {
                Reader = Com.ExecuteReader();

                while (Reader.Read())
                {
                    Mb = new MessengerBank();
                    Mb.Inbox = Convert.ToInt32(Reader["Inbox"].ToString());
                    Mb.OutBox = Convert.ToInt32(Reader["OutBox"].ToString());
                    Mb.Received = Convert.ToInt32(Reader["REceived"].ToString());
                }

                Con.Close();

            }
        }

        return Mb;
    }

   

    public List<Schools> GetSchools(int UserId)
    {
        List<Schools> SkoolList = new List<Schools>();

       

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select * from SchoolsView inner join StudentsView on SchoolsView.Id=StudentsView.School_id where User_id='" + UserId + "'";

            using (var Com = new SqlCommand(Query, Con))
            {

                Reader = Com.ExecuteReader();

                while (Reader.Read())
                {
                    Schools.SchoolInformation Sku = new Schools.SchoolInformation();
                    Schools School = new Schools();

                    Sku.SchoolId = Convert.ToInt32(Reader["id"].ToString());
                    Sku.SchoolName = Reader["sch_name"].ToString();
                    Sku.Moto = Reader["Moto"].ToString();
                    Sku.RegistrationNumber = Reader["sch_reg_no"].ToString();

                    School.Info = Sku;

                    SkoolList.Add(School);
                    
                }

                Com.Dispose();
            }

            Con.Close();
        }

        return SkoolList;
    }

    public Message NewUser(UserInformation UserInformation, string Password, string VerificationPassword)
    {
        bool IsRegistered = false;

        Message Message = new Message();

        using (var con = new SqlConnection(GC.ConnectionString))
        {
            con.Open();

            Query = "CreateUser";

            byte[] ProfilePictureByte = null;

            using (var com = new SqlCommand(Query, con))
            {
                com.CommandType = CommandType.StoredProcedure;

                if (UserInformation.ProfilePicture != null)
                {
                    MemoryStream Ms = new MemoryStream();

                    UserInformation.ProfilePicture.Save(Ms, System.Drawing.Imaging.ImageFormat.Jpeg);

                    ProfilePictureByte = Ms.ToArray();
                }

                else
                {
                    ProfilePictureByte = null;
                }


                com.Parameters.Add(new SqlParameter("@FirstName", UserInformation.FirstName));
                com.Parameters.Add(new SqlParameter("@LastName", UserInformation.LastName));
                com.Parameters.Add(new SqlParameter("@OtherName", UserInformation.OtherName));
                com.Parameters.Add(new SqlParameter("@UserName", UserInformation.UserName));
                com.Parameters.Add(new SqlParameter("@DOB", UserInformation.DateOfBirth));
                com.Parameters.Add(new SqlParameter("@Nationality", UserInformation.Nationality));
                com.Parameters.Add(new SqlParameter("@Gender", UserInformation.Gender));
                com.Parameters.Add(new SqlParameter("@Password", Password));
                com.Parameters.Add(new SqlParameter("@RptPassword", VerificationPassword));
                com.Parameters.Add(new SqlParameter("@Email", UserInformation.Email));
                com.Parameters.Add(new SqlParameter("@AlternativeEmail", UserInformation.AlternativeEmail));
                com.Parameters.Add(new SqlParameter("@PhoneNumber", UserInformation.PhoneNumber));
                com.Parameters.Add(new SqlParameter("@WorkNumber", UserInformation.WorkNumber));
                com.Parameters.Add(new SqlParameter("@HomeNumber", UserInformation.HomeNumber));
                com.Parameters.Add(new SqlParameter("@ProfilePicture", ProfilePictureByte));

                Reader = com.ExecuteReader();

                while (Reader.Read())
                {
                    switch (Convert.ToInt32(Reader["Result"].ToString()))
                    {
                        case 0:
                            Message.Code = 0;
                            Message.MessageData = "User Account hasa been Succesfully Created";

                            CurrentId = Convert.ToInt32(Reader["Id"].ToString());

                            break;

                        case 1:
                            Message.Code = 1;
                            Message.MessageData = "Please Fill in your First Name";
                            break;

                        case 2:
                            Message.Code = 2;
                            Message.MessageData = "Please Fill in your Last Name";
                            break;

                        case 3:
                            Message.Code = 3;
                            Message.MessageData = "Please Fill in your User Name";
                            break;

                        case 4:
                            Message.Code = 4;
                            Message.MessageData = "Please Fill in your Password";
                            break;

                        case 5:
                            Message.Code = 5;
                            Message.MessageData = "Please Fill in a Phone Number";
                            break;

                        case 6:
                            Message.Code = 6;
                            Message.MessageData = "Password Should Contain atleast 8 digits and MUST Be Alphanumeric";
                            break;

                        case 7:
                            Message.Code = 7;
                            Message.MessageData = "Sorry, User Name Already Exists";
                            break;

                        case 8:
                            Message.Code = 8;
                             Message.MessageData = "Wrong Email Used";
                            break;

                        case 9:
                            Message.Code = 9;
                            Message.MessageData = "Please Enter your Email address";
                            break;
                    }
                }

                IsRegistered = true;

                com.Dispose();
            }


            con.Close();
        }

        return Message;

    }

    public bool RecoverPassword(string Email = null)
    {
        bool Result=false;

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "dbo.RecoverPassword";

            using (var Com = new SqlCommand(Query, Con))
            {
                Com.CommandType = CommandType.StoredProcedure;

                Com.Parameters.Add(new SqlParameter("@UserEmail", Email));
               
                Com.ExecuteNonQuery();

                Result = true;
            }
        }
        return Result;
    }


    //Authentication Code on Sign in
    public bool AuthenticateUser(string UserCredential, string Password, out int Return, out bool InRecovery)
    {
        int Ret = 0;
        InRecovery = false;
        bool IsAuthenticated = false;

        using (var con = new SqlConnection(GC.ConnectionString))
        {
            con.Open();

            Query = "[dbo].[LoginValidationProc]";

            using (Com = new SqlCommand(Query, con))
            {
                Com.CommandType = CommandType.StoredProcedure;

                Com.Parameters.Add(new SqlParameter("@Credential", UserCredential));
                Com.Parameters.Add(new SqlParameter("@Password", Password));

                Reader = Com.ExecuteReader();

                while (Reader.Read())
                {

                    if (Convert.ToInt32(Reader["ReturnVal"].ToString()) == 1)
                    {

                        Ret = Convert.ToInt32(Reader["Id"].ToString());
                       
                        IsAuthenticated = true;
                        break;
                    }
                    else if (Convert.ToInt32(Reader["ReturnVal"].ToString()) == 11)
                    {
                        InRecovery = true;
                        Ret = Convert.ToInt32(Reader["Id"].ToString());

                        IsAuthenticated = true;
                        break;
                    }
                        
                    else
                    {
                        Ret = 0;
                        IsAuthenticated = false;

                    }
                }
                Com.Dispose();
            }

            con.Close();
        }

        Return = Ret;

        return IsAuthenticated;
    }

    public enum Gender
    {
        Male, Female
    }
}