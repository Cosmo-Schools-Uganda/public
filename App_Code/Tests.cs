using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Microsoft.AspNet.SignalR;

/// <summary>
/// Summary description for Tests
/// </summary>
public class Tests
{
    GlobalConnection GC = new GlobalConnection();
    string Query;
    SqlDataReader Reader;

    public int ExamId { get; set; }
    public string ExamName { get; set; }

    public Schedule schedule { get; set; }

    public Tests()
    {


        //
        // TODO: Add constructor logic here
        //
    }


    public class Schedule
    {
        private int duration;
        private DateTime end;

        public int ScheduleId { get; set; }
        public DateTime Start { get; set; }

        public int Duration { get; set; }

        public DateTime End
        {
            get
            {
                end = Start.AddMinutes(Duration);

                return end;
            }


            set
            {
                end = value;
            }
        }

    }

    static string ConnectionString = "server=STEK; database=Cosmo_School_Technology; integrated security=true;";

    List<Tests> MyTests;
    public List<Tests> GetIncomingTests(int Class_id)
    {
        MyTests = new List<Tests>();

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select top 5 * from Exams inner join ExamSchedule on Exams.Id=ExamSchedule.Exam_id inner join Subjects on Subjects.sbjct_id=Exams.Subject_id where ExamSchedule.Class_id='" + Class_id + "' and ScheduledDate>CURRENT_TIMESTAMP order by ExamSchedule.ScheduledDate desc ";

            using (var com = Con.CreateCommand())
            {
                com.CommandType = CommandType.Text;
                com.CommandText = Query;

                com.Notification = null;


                using (Reader = com.ExecuteReader())
                {
                    while (Reader.Read())
                    {

                        Tests Ts = new Tests();
                        Ts.ExamName = Reader["sbjct_title"].ToString();
                        Ts.ExamId = Convert.ToInt32(Reader["Id"].ToString());
                        Ts.schedule = new Schedule();
                        Ts.schedule.Start = Convert.ToDateTime(Reader["ScheduledDate"].ToString());
                        Ts.schedule.Duration = Convert.ToInt32(Reader["Duration(mins)"].ToString());


                        MyTests.Add(Ts);

                    }
                    com.Dispose();

                }
                Con.Close();
            }



        }

        return MyTests;
    }




    public List<Tests> UpdateIncomingTests(int Class_id)
    {
        MyTests = new List<Tests>();

        //SqlDependency.Stop(ConnectionString);

        SqlDependency.Start(ConnectionString);

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select [id],[Class_id],[ScheduledDate],[Duration(mins)] from [dbo].[ExamSchedule] ";

            using (var com = Con.CreateCommand())
            {
                com.CommandType = CommandType.Text;
                com.CommandText = Query;

                com.Notification = null;


                SqlDependency Dependency = new SqlDependency(com);
                

                Dependency.OnChange += SQLDep_Change;

                Reader = com.ExecuteReader();
            }
             
            Con.Close();

        }

        return MyTests;
    }


    public virtual void SQLDep_Change(object sender, SqlNotificationEventArgs e)
    {

        if (e.Info == SqlNotificationInfo.Insert || e.Info == SqlNotificationInfo.Update || e.Info== SqlNotificationInfo.Delete)
        {
         
            var Context = GlobalHost.ConnectionManager.GetHubContext<TestsHub>();

         
            Context.Clients.All.receiveSchedule();

        
            
           

        }

        UpdateIncomingTests(12);
    }

    public void TerminateDependency()
    {
        // Release the dependency.
        SqlDependency.Stop(GC.ConnectionString);
    }
}