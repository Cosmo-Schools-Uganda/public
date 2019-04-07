using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Classes
/// </summary>
public class Classes
{
    GlobalConnection GC = new GlobalConnection();
    SqlDataReader Reader;
    string Query;

    public int ClassID { get; set; }
    public string Name { get; set; }

    public Classes()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    //Constructor for Selecting The Current Class of a student
    public Classes(int StudentID)
    {

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select top 1 * from Student_Class_Enroll inner join StudentsView on Student_Class_Enroll.Student_Id=StudentsView.Id inner join ClassesView on ClassesView.id=Student_Class_Enroll.Class_Id where StudentsView.id='" + StudentID + "' order by Year_Enrolled desc";

            using (var Com = new SqlCommand(Query, Con))
            {

                Reader = Com.ExecuteReader();

                while (Reader.Read())
                {

                    this.Name = Reader["class_name"].ToString();
                    this.ClassID = Convert.ToInt32(Reader["Class_id"].ToString());

                }

            }
            Con.Close();

        }
    }


    //Get A List of all classes within a school [By School Id]
    public List<Classes> GetSchoolClasses(int SchoolId)
    {
        List<Classes> Ls = new List<Classes>();

        Classes Class;

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select * from ClassesView where School_id='" + SchoolId + "'";

            using (var Com = new SqlCommand(Query, Con))
            {

                Reader = Com.ExecuteReader();

                while (Reader.Read())
                {
                    Class = new Classes();

                    Class.Name = Reader["class_name"].ToString();
                    Class.ClassID = Convert.ToInt32(Reader["id"].ToString());

                    Ls.Add(Class);
                }


            }
        }
        return Ls;
    }

    //Get All the Classes that a student has studied from

    public List<Classes> GetStudentClasses(int StudentId)
    {
        List<Classes> Ls = new List<Classes>();

        Classes Class;

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select * from Student_Class_Enroll inner join StudentsView on Student_Class_Enroll.Student_Id=StudentsView.Id left join ClassesView on Student_Class_Enroll.Class_Id=ClassesView.id where StudentsView.id='" + StudentId + "'";

            using (var Com = new SqlCommand(Query, Con))
            {

                Reader = Com.ExecuteReader();

                while (Reader.Read())
                {
                    Class = new Classes();

                    Class.Name = Reader["class_name"].ToString();
                    Class.ClassID = Convert.ToInt32(Reader["id"].ToString());

                    Ls.Add(Class);
                }


            }
        }
        return Ls;
    }

}