<%@ Application Language="C#" %>


<script runat="server">


    Notifications Nt = new Notifications();
    

    void Application_Start(object sender, EventArgs e)
    {

     

        System.Diagnostics.Debug.WriteLine("Application has started");
        
        Nt.GetNotifications();


        // Code that runs on application startup

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        
        System.Diagnostics.Debug.WriteLine("Session has Started");

        //Nt.GetNotifications();

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
