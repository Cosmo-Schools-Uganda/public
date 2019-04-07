using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using Microsoft.AspNet.SignalR;
using System.Media;

/// <summary>
/// Summary description for Chat
/// </summary>
public class Chat
{

    SqlDataReader Reader;
    string Query;
    int UserId;
    GlobalConnection GC = new GlobalConnection();
    string NotificationSoundFile = @"E:\Cosmo\App_Data\Sounds\Notifications\Blopwav.wav";

    public Chat(int Id)
    {

        this.UserId = Id;
        
    }

    public class ChatNode
    {
        public Users.UserInformation Sender;
        public Users.UserInformation Receiver;
        public string Message;
        public int Indicator;
    }


    public string Message { get; set; }
    public DateTime TimeStamp { get; set; }
    public Users.UserInformation Sender { get; set; }

    private Chat Mychat {get;set;}

    public void GetInbox()
    {
        
        using (var Con=new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select [Sender_id],[Message],[TimeSpan] from [dbo].[User_Chat] where [Receiver_id]='" + this.UserId + "'";

            using (var Com=new SqlCommand(Query, Con))
            {
                SqlDependency Dependency = new SqlDependency(Com);

                Dependency.OnChange += new OnChangeEventHandler(NewMessageReceived);

                using (SqlDataReader Reader = Com.ExecuteReader())
                {
                   
                    
                }
            }

        }
        
    }
  
    protected void NewMessageReceived(object sender, SqlNotificationEventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("Working");

        if (e.Info == SqlNotificationInfo.Insert)
        {
            var chatHub = GlobalHost.ConnectionManager.GetHubContext<chatHub>();

            chatHub.Clients.User(this.UserId.ToString()).NewMessage("new message");

            SoundPlayer sp = new SoundPlayer(NotificationSoundFile);

            sp.PlaySync();
            
            GetChatData();

            GetInbox();
            
        }

    }
    

    public List<Chat> GetChatData()
    {

        List<Chat> ChatList = new List<Chat>();

        using (var con = new SqlConnection(GC.ConnectionString))
        {
            con.Open();

            Query = "SELECT  top 15 * from User_Chat join(select max(msg_id) as lastmsg from User_Chat group by Sender_id) as recentchat on recentchat.lastmsg=User_Chat.Msg_id where Receiver_id='"+this.UserId+"' order by Msg_id desc";

            using (var Com = new SqlCommand(Query, con))
            {
                Reader = Com.ExecuteReader();

                while (Reader.Read())
                {
                    Mychat = new Chat(this.UserId);

                    Mychat.Message = Reader["Message"].ToString();
                    
                    Mychat.Sender = new Users().UserInfo(Convert.ToInt32(Reader["Sender_id"].ToString()));
                    
                    // Mychat.TimeStamp = Convert.ToDateTime(Reader["TimeSpan"].ToString());
                    
                    ChatList.Add(Mychat);
                }
            }

            con.Close();
        }

        return ChatList;
    }

    public List<ChatNode> GetChatThread(int UserId, int CorrespondentId)
    {

        ChatNode Node = new ChatNode();

        List<ChatNode> ChatThread = new List<ChatNode>();

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select * from User_Chat where Sender_id='" + CorrespondentId + "' and Receiver_id='" + UserId + "' or Sender_id='" + UserId + "' and Receiver_id='" + CorrespondentId + "' order by TimeSpan asc";

            using (var Com = new SqlCommand(Query, Con))
            {
               Reader=Com.ExecuteReader();

               while (Reader.Read())
               {
                   Node = new ChatNode();

                   Node.Message = Reader["Message"].ToString();

                   Users User = new Users();

                   Node.Receiver = User.UserInfo(Convert.ToInt32(Reader["Receiver_id"].ToString()));
                   Node.Sender = User.UserInfo(Convert.ToInt32(Reader["Sender_id"].ToString()));

                   if (Convert.ToInt32(Reader["Receiver_id"].ToString()) == UserId)
                   {
                       Node.Indicator = 0;
                   }
                   else
                   {
                       Node.Indicator = 1;
                   }

                  

                   ChatThread.Add(Node);
               }
                
            }

            Con.Close();
        }

        return ChatThread;
    }
}