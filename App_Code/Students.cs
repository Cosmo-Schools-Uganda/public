using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Students
/// </summary>
public class Students
{
    [Key]
    public int ID { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public int Age { get; set; }
    public List<Classes> SClasses { get; set; }
    public string RegistrationNumber { get; set; }
    public Schools School { get; set; }
    public List<Classes> Classes { get; set; }

    GlobalConnection GC = new GlobalConnection();

    string Query;

    SqlDataReader Reader;

    public Students()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Students(int UserID,int LicenseValidity)
    {
        int SchholID=0;

        using (var con=new SqlConnection(GC.ConnectionString))
        {

            con.Open();

            Query = "Select * from StudentsView where User_id='" +UserID+ "' and LicenseStatus='"+LicenseValidity+"'";

            using(var com=new SqlCommand(Query, con))
            {
                Reader = com.ExecuteReader();

                while (Reader.Read())
                {
                    ID = Convert.ToInt32(Reader["Id"].ToString());
                    FirstName = Reader["FirstName"].ToString();
                    LastName = Reader["LastName"].ToString();
                    Age = Convert.ToInt32(Reader["Age"].ToString());
                    RegistrationNumber = Reader["RegistrationNumber"].ToString();
                    SchholID = Convert.ToInt32(Reader["School_id"].ToString());
                    
                    School=new Schools().GetSchool(SchholID);

                }
            }
        }

    }

    public Students(int UserID)
    {
        int SchholID = 0;

        using (var con = new SqlConnection(GC.ConnectionString))
        {
           
            con.Open();
            
            Query = "Select * from StudentsView where User_id='" + UserID+"'";

            using (var com = new SqlCommand(Query, con))
            {
                Reader = com.ExecuteReader();

                while (Reader.Read())
                {
                    ID = Convert.ToInt32(Reader["Id"].ToString());
                    FirstName = Reader["FirstName"].ToString();
                    LastName = Reader["LastName"].ToString();
                    Age = Convert.ToInt32(Reader["Age"].ToString());
                    RegistrationNumber = Reader["RegistrationNumber"].ToString();
                    SchholID = Convert.ToInt32(Reader["School_id"].ToString());
                   
                    School = new Schools().GetSchool(SchholID);

                }
            }

            con.Close();
        }

        Classes = new Classes().GetStudentClasses(ID);
    }
  

  
}