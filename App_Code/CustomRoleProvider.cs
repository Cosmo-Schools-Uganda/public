using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;  
using System.Collections.Specialized;  
using System.Configuration.Provider;  
using System.Data;  
using System.Data.SqlClient;  
using System.Security.Cryptography;  
using System.Text;  
using System.Web.Configuration;  
using System.Web.Security;  

// <summary>
/// Summary description for RoleProvider
/// </summary>
public sealed class CustomRoleProvider : RoleProvider
{

    string Query = null;
    GlobalConnection GC = new GlobalConnection();
    SqlDataReader Reader;

    public CustomRoleProvider()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public override string ApplicationName
    {
        get
        {
            throw new NotImplementedException();
        }

        set
        {
            throw new NotImplementedException();
        }
    }



    public override void AddUsersToRoles(string[] usernames, string[] roleNames)
    {
        throw new NotImplementedException();
    }

    public override void CreateRole(string roleName)
    {
        
            throw new NotImplementedException();
    }

    public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
    {
        throw new NotImplementedException();
    }

    public override string[] FindUsersInRole(string roleName, string usernameToMatch)
    {
        throw new NotImplementedException();
    }

    public override string[] GetAllRoles()
    {
     
        List<string> RolesList = new List<string>();
        
        using (var con = new SqlConnection(GC.ConnectionString))
        {
            con.Open();

            Query = "Select * from Roles";

            using (var com = new SqlCommand(Query, con))
            {

                Reader = com.ExecuteReader();
                

                while (Reader.Read())
                {
                    RolesList.Add(Reader["Name"].ToString());
                    
                }

                com.Dispose();
            }

            con.Close();

        }

        return RolesList.ToArray();
    }

    public override string[] GetRolesForUser(string username)
    {
        List<string> Roles = new List<string>();
        Roles.Clear();

        try
        {

            using (var Con = new SqlConnection(GC.ConnectionString))
            {
                Con.Open();

                Query = "select * from Roles inner join User_Roles on Roles.Id=User_Roles.Role_id where User_Roles.User_id='" + username + "'";

                using (var com = new SqlCommand(Query, Con))
                {
                    Reader = com.ExecuteReader();

                    while (Reader.Read())
                    {
                        Roles.Add(Reader["Name"].ToString());
                    }

                    com.Dispose();
                }

                Con.Close();


            }

            
        }
        catch { }

        return Roles.ToArray();
    }

    public override string[] GetUsersInRole(string roleName)
    {
        List<string> Users = new List<string>();

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "select * from Users inner join User_Roles on Users.Id=User_Roles.User_id left join Roles on User_Roles.Role_id=Roles.id where Roles.Name='" + roleName + "'";

            using (var com = new SqlCommand(Query, Con))
            {
                Reader = com.ExecuteReader();

                while (Reader.Read())
                {
                    Users.Add(Reader["UserName"].ToString());
                }

                com.Dispose();
            }
            Con.Close();
        }

        return Users.ToArray();

      
    }

    public override bool IsUserInRole(string username, string roleName)
    {
        throw new NotImplementedException();
    }

    public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
    {
        throw new NotImplementedException();
    }

    public override bool RoleExists(string roleName)
    {
        throw new NotImplementedException();
    }
}