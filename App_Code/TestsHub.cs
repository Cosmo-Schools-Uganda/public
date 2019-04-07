using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

[HubName("TestsHub")]
public class TestsHub : Hub
{
    public void Hello(string msg)
    {
      
        Clients.All.broadcastMessage(msg);
    }

    public void RefreshSchedule()
    {
        Tests Ts = new Tests();

       
        Clients.All.receiveSchedule(Ts.GetIncomingTests(12));

        Ts.UpdateIncomingTests(12);


    }

}
