using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Management;
using System.Configuration;

/// <summary>
/// Summary description for GlobalConnection
/// </summary>
public class GlobalConnection
{
    public string ConnectionString=null;
	public GlobalConnection()
	{
        ConnectionString=System.Configuration.ConfigurationManager.ConnectionStrings["Cosmo_School_TechnologyConnectionString"].ConnectionString;
        
		//
		// TODO: Add constructor logic here
		//
	}
}