using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using Microsoft.AspNet.SignalR;
using System.Media;
using System.Threading.Tasks;

/// <summary>
/// Summary description for Notifications
/// </summary>
public class Notifications 
{

    GlobalConnection GC = new GlobalConnection();
  

    public Notifications()
    {
       

        //
        // TODO: Add constructor logic here
        //
    }


    public string Message;
    public Users.UserInformation Sender;
    public int id;
    public DateTime DateCreated;
    static string ConnectionString = "server=COSMO; database=Cosmo_School_Technology; integrated security=true;";
    string NotificationSoundFile = @"E:\Cosmo\App_Data\Sounds\Notifications\Blopwav.wav";
    static int DefaultNotificationsNumber = 15;
    GlobalConnection Gc = new GlobalConnection();

    public List<Notifications> GetNotifications()
    {
        //  SqlDependency.Stop(ConnectionString);
        SqlDependency.Start(GC.ConnectionString);

        List<Notifications> MyNotification = new List<Notifications>();

        Notifications Notis = null;

        Users User = new Users();

        string Command = "Select [id],[Notification] from [dbo].[Notifications] where [Target_Group] = 1";

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            using (var com = Con.CreateCommand())
            {
                com.CommandType = CommandType.Text;
                com.CommandText = Command;

                com.Notification = null;

                SqlDependency SQLDep = new SqlDependency(com);

                SQLDep.OnChange += SQLDep_OnChange;

                using (SqlDataReader Reader = com.ExecuteReader())
                {
                    while (Reader.Read())
                    {
                        Notis = new Notifications();

                        Notis.Message = Reader["Notification"].ToString();

                        MyNotification.Add(Notis);
                    }
                }

            }

        }

        return MyNotification;
    }

  
     void SQLDep_OnChange(object sender,SqlNotificationEventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("Working");
        
        if (e.Info == SqlNotificationInfo.Insert)
        {
            var notificationHub = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();

            notificationHub.Clients.All.newnotification("added");
                              
            SoundPlayer sp = new SoundPlayer(NotificationSoundFile);

            sp.PlaySync();

            GetNotifications();
         
        }

      
    }

    public List<Notifications> PopulateNotifications(int num)
    {
        DefaultNotificationsNumber = num;
        List<Notifications> MyNotis = new List<Notifications>();
        Notifications Note;
        
             using (var con = new SqlConnection(GC.ConnectionString))
             {
                 con.Open();

                 string Query = "select top 15 * from Notifications inner join users on Notifications.user_id=users.id where Target_Group=1 order by notifications.id desc";


                 using (var com = new SqlCommand(Query, con))
                 {

                     SqlDataReader MyReader = com.ExecuteReader();

                     while (MyReader.Read())
                     {
                         Note = new Notifications();

                         Note.id = Convert.ToInt32(MyReader[0].ToString());

                         Note.Message = MyReader["Notification"].ToString();

                         Users Sender = new Users();

                         Users.UserInformation SenderInfo = Sender.UserInfo(Convert.ToInt32(MyReader["User_id"].ToString()));

                         Note.Sender = SenderInfo;

                         MyNotis.Add(Note);
                     }

                     com.Dispose();
                 }

                 con.Close();
             }
             
        return MyNotis;

    }

    public void TerminateDependency()
    {
        // Release the dependency.
        SqlDependency.Stop(GC.ConnectionString);
    }

    //public List<Exams> GetExams(DateTime AfterDate)
    //{
    //    using (MyPushNotificationEntities dc)
    //}






}