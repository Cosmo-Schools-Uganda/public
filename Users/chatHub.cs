using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System.Runtime.Remoting.Contexts;
using System.Data;

[HubName("chatHub")]
public class chatHub : Hub
{
   
    Users Users = new Users();

    Chat chat = null;
     
    string ClientId;

    public void GetMessages()
    {
        chat= new Chat(Convert.ToInt32(Context.User.Identity.Name));

        Clients.User(Context.User.Identity.Name).receiveIncomingMessages(chat.GetChatData());
       
    }
    

    public void GetChat(int userId)
    {

        Users = new Users();
        chat = new Chat(Convert.ToInt32(Context.User.Identity.Name));
            
        Clients.Caller.getChatHistory(Users.UserInfo(userId), chat.GetChatThread(Convert.ToInt32(Context.User.Identity.Name), userId));
        
       
    }

   

    public override System.Threading.Tasks.Task OnConnected()
    {
        //string username = Context.QueryString["username"].ToString();
        ClientId = Context.ConnectionId;
        string data = ClientId;
        string count = "";
        try
        {
            count = GetCount().ToString();
        }
        catch (Exception d)
        {
            count = d.Message;
        }

       // Clients.Caller.receiveOnlineUsers("ChatHub", data, count);

        Get_Connect();

        return base.OnConnected();

    }

    [HubMethodName("hubconnect")]
    public void Get_Connect()
    {

        string count = "";
        string msg = "";
        List<Users.UserInformation> list = new List<Users.UserInformation>();
      

            count = GetCount().ToString();
            Users.UpdateOnlineUsers(Convert.ToInt32(Context.User.Identity.Name),ClientId);

            list = Users.OnlineUsers(Convert.ToInt32(Context.User.Identity.Name));
            Users.MessengerBank Statistics = new Users.MessengerBank();
              
            Statistics=Users.GetMessageBank(Convert.ToInt32(Context.User.Identity.Name));
       

        //catch (Exception d)
        //{
        //    msg = "DB Error " + d.Message;
        //}


        var id = Context.ConnectionId;

        string[] Exceptional = new string[1];

        Exceptional[0] = id;

        Chat chat = new Chat(Convert.ToInt32(Context.User.Identity.Name));

        Clients.Caller.receiveSideMessages(chat.GetChatData());
        Clients.Caller.receiveOnlineUsers("RU", msg, list, Statistics);

        Clients.Caller.getChatHistory(Users.UserInfo(83),chat.GetChatThread(Convert.ToInt32(Context.User.Identity.Name),83));

        Clients.AllExcept(Exceptional).receiveOnlineUsers("NewConnection", msg,Users.UserInfo(Convert.ToInt32(Context.User.Identity.Name)), count);

        System.Diagnostics.Debug.WriteLine(list.Count.ToString());
        
    }

    public int GetCount()
    {
       
        return Users.OnlineUsersCount();
            
    }
   

}
