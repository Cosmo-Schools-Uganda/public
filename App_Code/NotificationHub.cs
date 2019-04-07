using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

[HubName("notificationHub")]
public class NotificationHub : Hub
{
    //public void Hello()
    //{
    //    Clients.All.hello();
    //}

    Notifications Nt = new Notifications();
    List<Notifications> MyNotifications;

    public void Notify()
    {
        //MyNotifications = new List<Notifications>();

        //MyNotifications = Nt.PopulateNotifications(15);

       // Clients.All.broadcastNotifications(MyNotifications);      
    }


    public void requestnotifications(int count)
    {
     
        MyNotifications = new List<Notifications>();

        MyNotifications = Nt.PopulateNotifications(count);
        
        System.Diagnostics.Debug.WriteLine("Mt"+MyNotifications[0].Message);

        Clients.All.receivenotifications(MyNotifications);

    }

}
