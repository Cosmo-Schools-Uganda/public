using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

[Serializable]
public class DataBase
{
    public SqlConnection Con;
    private SqlCommand Com;
    private SqlDataReader Reader;
    private static string Query = string.Empty;
    static GlobalConnection GC = new GlobalConnection();
    static Configurations Config;

    [Serializable]
    public struct QuestionStructure
    {
        private int QNumber;
        private string Qst;
        private int QstType;
        private object[] Objs;

        public int Section { get; set; }
        public string ConfigurationFile { get; set; }
        public int QuestionNumber
        {
            get
            {
                return QNumber;
            }
            set
            {
                QNumber = value;
            }
        }

        public string Question
        {
            get
            {
                return Qst;
            }
            set
            {
                Qst = value;
            }

        }

        public int QuestionType
        {
            get
            {
                return QstType;
            }
            set
            {
                QstType = value;
            }
        }

        public Object[] Objectives
        {
            get
            {
                return Objs;
            }
            set
            {
                Objs = value;
            }
        }
    }


    public class Users
    {

        public struct UserInformation
        {
            public string UserName { get; set; }
            public int UserId { get; set; }

        }

        public Users()
        {
            
        }

        //public UserInformation GetUserInfo (string UserName)
        //{

        //}
        
    }

    //Test For Database Connection
    private bool CreateConnection()
    {
        Con = new SqlConnection();


        if (Con.State == ConnectionState.Open)
        {
            return true;
            Con.Close();

        }
        else
        {
            return false;
        }

        Con.Open();
    }

    /*Questions Class*/

    public class Questions
    {

        [Serializable]
        public class ObjectivesContent
        {
            public int ObjID { get; set; }

            public string Detail { get; set; }

            public int validity { get; set; }
        }



        DataTable Dt;
        DataBase Db = new DataBase();
        GlobalConnection GC = new GlobalConnection();

        private int SectionNumber;
        private int questionNumber;
        private string Question;
        private int Question_Type;
        private string TestCode;
        private string ConfigurationFile;

        private DataSet Ds = new DataSet();
        QuestionStructure Qs;

        public Questions()
        {

        }


        public QuestionStructure QuestionSructure
        {
            get
            {
                return Qs;
            }
        }


        public int MyQuestionNumber
        {
            get
            {
                return questionNumber;
            }
        }

        public DataSet DataSet
        {
            get
            {

                return Ds;
            }
        }

       

        public Questions(string TestCode)
        {
            this.TestCode = TestCode;

            Dt = new DataTable("QuestionnaireTable");

            Dt.Columns.Add("Question Number", typeof(int));
            Dt.Columns.Add("Question", typeof(string));
            Dt.Columns.Add("Question Type", typeof(int));
            Dt.Columns.Add("Objective Data", typeof(object[]));
            Dt.Columns.Add("Section", typeof(int));
            Dt.Columns.Add("ConfigFile", typeof(string));
            Ds.Tables.Add(Dt);
        }

        public void DeleteQuestion(string TestCode, int QuestionNumber)
        {
            using (var con = new SqlConnection(GC.ConnectionString))
            {
                con.Open();

                string query = "[dbo].[DeleteQuestion]";

                using (var com = new SqlCommand(query, con))
                {
                    com.CommandType = CommandType.StoredProcedure;

                    com.Parameters.Add(new SqlParameter("@ExamCode", TestCode));
                    com.Parameters.Add(new SqlParameter("@QtnNumber", QuestionNumber));

                    com.ExecuteNonQuery();

                    com.Dispose();
                }
                con.Close();
            }
        }
        public void DeleteObjective(int ObjectiveId)
        {
            using (var con = new SqlConnection(GC.ConnectionString))
            {
                con.Open();

                string query = "[dbo].[DeleteObjective]";

                using (var com = new SqlCommand(query, con))
                {
                    com.CommandType = CommandType.StoredProcedure;

                    com.Parameters.Add(new SqlParameter("@Objective_id", ObjectiveId));

                    com.ExecuteNonQuery();

                    com.Dispose();
                }
                con.Close();
            }
        }

        public void CaptureQuestionData(DataBase.QuestionStructure Qs)
        {
            using (var Con = new SqlConnection(GC.ConnectionString))
            {
                Con.Open();

                string Query = "[dbo].[CaptureQuestion]";

                using (var com = new SqlCommand(Query, Con))
                {
                    com.CommandType = CommandType.StoredProcedure;

                    com.Parameters.Add(new SqlParameter("@ExamCode", this.TestCode));
                    com.Parameters.Add(new SqlParameter("@QuestionType", Qs.QuestionType));
                    com.Parameters.Add(new SqlParameter("@QuestionNumber", Qs.QuestionNumber));
                    com.Parameters.Add(new SqlParameter("@Question", Qs.Question));
                    com.Parameters.Add(new SqlParameter("@imagepath", null));
                    com.Parameters.Add(new SqlParameter("@SectionNumber", 1));

                    com.ExecuteNonQuery();

                    com.Dispose();
                }

                Con.Close();

            }

            if (Qs.QuestionType == 2)
            {

            }

            else
            {

                foreach (ObjectivesContent OC in Qs.Objectives)
                {
                    using (var con = new SqlConnection(GC.ConnectionString))
                    {
                        con.Open();

                        string query = "[dbo].[CaptureObjective]";

                        using (var com = new SqlCommand(query, con))
                        {
                            com.CommandType = CommandType.StoredProcedure;


                            com.Parameters.Add(new SqlParameter("@objective_id", OC.ObjID));
                            com.Parameters.Add(new SqlParameter("@ExamCode", this.TestCode));
                            com.Parameters.Add(new SqlParameter("@qtn_number", Qs.QuestionNumber));
                            com.Parameters.Add(new SqlParameter("@detail", OC.Detail));
                            com.Parameters.Add(new SqlParameter("@validity", OC.validity));

                            com.ExecuteNonQuery();

                            com.Dispose();
                        }
                        con.Close();
                    }

                }

            }

        }

        //Retrieve Single Question Data
        public bool RetrieveData(int QuestionNumber, int Section)
        {

            if (CheckForQuestionExistance(this.TestCode, QuestionNumber, Section))
            {
                using (var Con = new SqlConnection(GC.ConnectionString))
                {

                    Con.Open();

                    string Query = "Select Section,qtn_number,detail,qtn_type,ExamData from Temporary_Questions inner join Exams on Temporary_Questions.ExamCode=Exams.Exam_Code where Exams.id=(select Exams.id from Exams where Exams.Exam_code='" + this.TestCode + "') and Temporary_Questions.qtn_number='" + QuestionNumber + "' and Temporary_Questions.Section='" + Section + "' ";

                    using (var Com = new SqlCommand(Query, Con))
                    {
                        Qs = new QuestionStructure();

                        Db.Reader = Com.ExecuteReader();

                        while (Db.Reader.Read())
                        {
                            DataRow Drow = Dt.NewRow();

                            questionNumber = Convert.ToInt32(Db.Reader["qtn_number"].ToString());
                            Drow["Question Number"] = Convert.ToInt32(Db.Reader["qtn_number"].ToString());
                            Drow["Question"] = Db.Reader["detail"].ToString();
                            Drow["Question Type"] = Convert.ToInt32(Db.Reader["qtn_type"].ToString());
                            Drow["Section"] = Convert.ToInt32(Db.Reader["Section"].ToString());
                            Drow["ConfigFile"] = Db.Reader["ExamData"].ToString();

                            Qs.QuestionNumber = Convert.ToInt32(Db.Reader["qtn_number"].ToString());
                            Qs.Question = Db.Reader["detail"].ToString();
                            Qs.QuestionType = Convert.ToInt32(Db.Reader["qtn_type"].ToString());
                            Qs.Section = Convert.ToInt32(Db.Reader["Section"].ToString());
                            Qs.ConfigurationFile= Db.Reader["ExamData"].ToString();


                            if (Convert.ToInt32(Db.Reader["qtn_type"].ToString()) == 1 || Convert.ToInt32(Db.Reader["qtn_type"].ToString()) == 3)
                            {
                                //Task Run on a different thread to operate Objectives

                                Task QuestionObjectives = Task.Run(() =>
                                     {
                                         object[] Objs = new object[] { };

                                         List<ObjectivesContent> ObjsList = new List<ObjectivesContent>();

                                         using (var con = new SqlConnection(GC.ConnectionString))
                                         {
                                             con.Open();

                                             string Query2 = "select x.id,x.detail,validity from temporary_objectives x inner join Temporary_Questions on x.Qtn_id=Temporary_Questions.id where x.ExamCode=(select Exam_Code from Exams where Exams.Exam_code='" + this.TestCode + "') and Temporary_Questions.qtn_number='" + this.MyQuestionNumber + "'";

                                             using (var com = new SqlCommand(Query2, con))
                                             {

                                                 SqlDataReader reader = com.ExecuteReader();

                                                 while (reader.Read())
                                                 {

                                                     ObjectivesContent Ob = new ObjectivesContent();

                                                     Ob.Detail = reader["detail"].ToString();
                                                     Ob.validity = Convert.ToInt32(reader["validity"].ToString());
                                                     Ob.ObjID = Convert.ToInt32(reader["id"].ToString());


                                                     ObjsList.Add(Ob);

                                                 }

                                                 Objs = ObjsList.ToArray();

                                                 Drow["Objective Data"] = Objs;

                                                 Qs.Objectives = Objs;

                                                 com.Dispose();

                                             }

                                             con.Close();
                                         }


                                     });

                                QuestionObjectives.Wait();


                            }

                            else
                            {

                            }

                            Dt.Rows.Add(Drow);
                        }




                        Com.Dispose();
                    }

                    Con.Close();


                }
                return true;
            }

            else
            {
                return false;
            }
        }

        public bool CheckForQuestionExistance(string TestCode, int QuestionNumber, int Section)
        {
            using (var con = new SqlConnection(GC.ConnectionString))
            {
                con.Open();

                string Query = "select [dbo].[CheckForQuestionExistance](@ExamCode,@QuestionNumber,@SectionNumber)";

                using (var com = new SqlCommand(Query, con))
                {

                    com.Parameters.Add(new SqlParameter("@ExamCode", TestCode));
                    com.Parameters.Add(new SqlParameter("@QuestionNumber", QuestionNumber));
                    com.Parameters.Add(new SqlParameter("@SectionNumber", Section));

                    var t = com.ExecuteScalar();

                    int returns = (int)t;

                    if (returns == 1)
                    {
                        return true;
                    }

                    else

                    {
                        return false;
                    }
                }

            }

        }


        //Retrieve Multiple Questions Data
        public void RetrieveData()
        {
            using (var Con = new SqlConnection(GC.ConnectionString))
            {
                // Db.CreateConnection();

                Con.Open();

                string Query = "Select section,qtn_number,detail,qtn_type,ExamData from Temporary_Questions inner join Exams on Temporary_Questions.ExamCode=Exams.Exam_Code where Exams.id=(select Exams.id from Exams where Exams.Exam_code='" + this.TestCode + "') order by qtn_number asc";

                using (var Com = new SqlCommand(Query, Con))
                {
                    
                    Db.Reader = Com.ExecuteReader();

                    while (Db.Reader.Read())
                    {
                        DataRow Drow1 = Dt.NewRow();

                        questionNumber = Convert.ToInt32(Db.Reader["qtn_number"].ToString());
                        Drow1["Question Number"] = Convert.ToInt32(Db.Reader["qtn_number"].ToString());
                        Drow1["Question"] = Db.Reader["detail"].ToString();
                        Drow1["Question Type"] = Convert.ToInt32(Db.Reader["qtn_type"].ToString());
                        Drow1["Section"] = Convert.ToInt32(Db.Reader["Section"].ToString());
                        Drow1["ConfigFile"] = Db.Reader["ExamData"].ToString();


                        if (Convert.ToInt32(Db.Reader["qtn_type"].ToString()) == 1 || Convert.ToInt32(Db.Reader["qtn_type"].ToString()) == 3)
                        {
                            //Task Run on a different thread to operate Objectives

                            Task QuestionObjectives = Task.Run(() =>
                                 {

                                     string[] Objs = null;

                                     List<string> ObjsList = new List<string>();
                                     using (var con = new SqlConnection(GC.ConnectionString))
                                     {
                                         con.Open();

                                         string Query2 = "select x.id,x.detail,x.validity from temporary_objectives as x inner join Temporary_Questions on x.Qtn_id=Temporary_Questions.id where x.ExamCode=(select Exams.Exam_Code from Exams where Exams.Exam_code='" + this.TestCode + "') and Temporary_Questions.qtn_number='" + this.MyQuestionNumber + "'";

                                         using (var com = new SqlCommand(Query2, con))
                                         {

                                             SqlDataReader reader = com.ExecuteReader();

                                             while (reader.Read())
                                             {

                                                 ObjsList.Add(reader["detail"].ToString());


                                             }

                                             Objs = ObjsList.ToArray();

                                             Drow1["Objective Data"] = Objs;


                                             com.Dispose();
                                         }

                                         con.Close();
                                     }


                                 });

                            QuestionObjectives.Wait();


                        }


                        Dt.Rows.Add(Drow1);
                    }

                    Ds.Tables.Clear();
                    Ds.Tables.Add(Dt);


                    Com.Dispose();
                }

                Con.Close();
            }
        }

    }

    public class ObjectivesObj
    {
        GlobalConnection GC = new GlobalConnection();
        private string TestCode;
        private string[] Objectives;
        private DataSet Ds = new DataSet();



        //public ObjectivesObj(string TestCode)
        //{
        //    this.TestCode = TestCode;

        //    RetrieveObjectives();
        //}

        public ObjectivesObj(string TestCode, int QuestionNumber)
        {
            this.TestCode = TestCode;

            RetrieveObjectives(QuestionNumber);
        }


        public DataSet DataSet
        {
            get
            {
                return Ds;
            }
        }


        //private void RetrieveObjectives()
        //{
        //    using (var con = new SqlConnection(GC.ConnectionString))
        //    {
        //        con.Open();

        //        string Query = "select qtn_number,obj_detail,validity from temporary_objectives inner join Temporary_Questions on Temporary_Objectives.qtn_id=Temporary_Questions.qtn_id where Temporary_Objectives.set_id=(select Tests.set_id from Tests where Tests.Test_code='"+this.TestCode+"')";

        //        using (var com = new SqlCommand(Query,con))
        //        {


        //            DataTable Dt = new DataTable("ObjectivesTable");

        //            Dt.Columns.Add("Question Number", typeof(int));
        //            Dt.Columns.Add("Objective", typeof(string));
        //            Dt.Columns.Add("Validity", typeof(int));



        //            SqlDataReader reader = com.ExecuteReader();

        //            while (reader.Read())
        //            {
        //                DataRow Drow = Dt.NewRow();
        //                Drow["Question Number"] = Convert.ToInt32(reader["qtn_number"].ToString());
        //                Drow["Objective"] = reader["obj_detail"].ToString();
        //                Drow["Validity"]=Convert.ToInt32(reader["validity"].ToString());

        //                Dt.Rows.Add(Drow);
        //            }

        //            Ds.Tables.Add(Dt);

        //            com.Dispose();
        //        }

        //        con.Close();
        //    }
        //}


        private void RetrieveObjectives(int QuestionNumber)
        {
            using (var con = new SqlConnection(GC.ConnectionString))
            {
                con.Open();

                string Query = "select qtn_number,obj_detail,validity from temporary_objectives inner join Temporary_Questions on Temporary_Objectives.id=Temporary_Questions.id where Temporary_Objectives.set_id=(select Exams.id from Exams where Exams.Exam_code='" + this.TestCode + "') and Temporary_Questions.qtn_number='" + QuestionNumber + "'";

                using (var com = new SqlCommand(Query, con))
                {


                    DataTable Dt = new DataTable("ObjectivesTable");

                    Dt.Columns.Add("Question Number", typeof(int));
                    Dt.Columns.Add("Objective", typeof(string));
                    Dt.Columns.Add("Validity", typeof(int));



                    SqlDataReader reader = com.ExecuteReader();

                    while (reader.Read())
                    {
                        DataRow Drow = Dt.NewRow();
                        Drow["Question Number"] = Convert.ToInt32(reader["qtn_number"].ToString());
                        Drow["Objective"] = reader["obj_detail"].ToString();
                        Drow["Validity"] = Convert.ToInt32(reader["validity"].ToString());

                        Dt.Rows.Add(Drow);
                    }

                    Ds.Tables.Add(Dt);

                    com.Dispose();
                }

                con.Close();
            }
        }




    }

    public class Exams
    {

        private string SubjectCode;
        private int SubjectType;

     
        public string ExamCode { get; set; }
        public int ExamType { get; set; }
        public string ExamName { get; set; }
        public string DateCreated { get; set; }

        public string ExamData { get; set; }


        public struct ExamStructure
        {
          
            public string ExamCode { get; set; }
            public int ExamType { get; set; }
            public string ExamName { get; set; }
            public string DateCreated { get; set; }

            public string ExamData { get; set; }
        }

        public Exams()
        {

        }

        //public ExamStructure ViewExams (ViewType VT)
        //{

        //    ExamStructure ExStruct = new ExamStructure();

        //    switch (VT)
        //    {
        //        case ViewType.Users:

        //            Users User = new Users();

        //            Users.UserInformation UInfo = new Users.UserInformation();

        //            Query="select '"+UInfo.UserId+"'"
        //    }


        //}

        public ExamStructure[] RetrieveExams()
        {
            ExamStructure[] ExStruct = new ExamStructure[100];

            int i = 0;

            using (var con = new SqlConnection(GC.ConnectionString))
            {
                con.Open();

                Query = "Select * from Exams";

                using (var com = new SqlCommand(Query, con))
                {
                    SqlDataReader Reader = com.ExecuteReader();

                    while (Reader.Read())
                    {
                       
                        ExStruct[i].ExamName = Reader["Exam"].ToString();
                        ExStruct[i].ExamCode = Reader["Exam_Code"].ToString();
                        ExStruct[i].DateCreated = Reader["DateCreated"].ToString();


                        i++;
                    }

                    com.Dispose();

                }


                con.Close();
            }

            return ExStruct;
        }


        public Exams RetrieveExams(string ExamCode)
        {
            Exams ExStruct = new Exams();
            
            using (var con = new SqlConnection(GC.ConnectionString))
            {
                con.Open();

                Query = "Select * from Exams where Exams.Exam_Code='"+ExamCode+"'";

                using (var com = new SqlCommand(Query, con))
                {
                    SqlDataReader Reader = com.ExecuteReader();

                    while (Reader.Read())
                    {
                        this.ExamName = Reader["Exam"].ToString();
                        this.ExamCode = Reader["Exam_Code"].ToString();
                        this.DateCreated = Reader["DateCreated"].ToString();
                        this.ExamData = Reader["ExamData"].ToString();

                       
                    }

                    com.Dispose();

                }


                con.Close();
            }

            return this;
        }

        public Exams RetrieveExams(int ExamId)
        {
            Exams ExStruct = new Exams();

            using (var con = new SqlConnection(GC.ConnectionString))
            {
                con.Open();

                Query = "Select * from Exams where Exams.Id='" + ExamId + "'";

                using (var com = new SqlCommand(Query, con))
                {
                    SqlDataReader Reader = com.ExecuteReader();

                    while (Reader.Read())
                    {
                        this.ExamName = Reader["Exam"].ToString();
                        this.ExamCode = Reader["Exam_Code"].ToString();
                        this.DateCreated = Reader["DateCreated"].ToString();
                        this.ExamData = Reader["ExamData"].ToString();


                    }

                    com.Dispose();

                }


                con.Close();
            }

            return this;
        }

        public string NewExam(string SubjectCode, int SubjectType, string ExamName, int Sections)
        {


          

            string ExamData = null;

            string returnedCode = null;

            using (var con = new SqlConnection(GC.ConnectionString))
            {
                con.Open();

                Query = "dbo.NewExam";

                using (var com = new SqlCommand(Query, con))
                {

                    com.CommandType = CommandType.StoredProcedure;

                    com.Parameters.Add(new SqlParameter("@SubjectCode", SubjectCode));

                    com.Parameters.Add(new SqlParameter("@SubjectType", SubjectType));

                    com.Parameters.Add(new SqlParameter("@Name", ExamName));

                    //com.Parameters.Add(new SqlParameter("@ExamData",ConfigFile));
                    
                    SqlDataReader Reader = com.ExecuteReader();

                    while (Reader.Read())
                    {

                        returnedCode = Reader["result"].ToString();
               //         ExamData = @"E://Cosmo/Teachers/QuestionPaper/Exams/Config/" + Reader["ExamData"].ToString() + "";

                    }

                 //   ConfigFile Config = new ConfigFile(ExamData);
                    
                    com.Dispose();



                }

                con.Close();

            }

            return returnedCode;
        }

        //public void BindGrid(ASPxListBox lb, ASPxListBox lb2)
        //{
        //    string conString = GC.ConnectionString;

        //    string query = "SELECT Exam,Exam_Code,DateCreated,sbjct_title FROM ExamsView";

        //    string condition = string.Empty;

        //    foreach (ListEditItem item in lb.Items)
        //    {
        //        condition += item.Selected ? string.Format("'{0}',", item.Value) : "";

        //    }

        //    if (!string.IsNullOrEmpty(condition))
        //    {
        //        condition = string.Format(" WHERE Sbjct_title IN ({0})", condition.Substring(0, condition.Length - 1));
        //    }

        //    using (SqlConnection con = new SqlConnection(conString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand(query + condition))
        //        {
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //            {
        //                cmd.Connection = con;

        //                using (DataTable dt = new DataTable())
        //                {
        //                    sda.Fill(dt);

        //                    lb2.DataSource = dt;

        //                    lb2.DataBind();
        //                }
        //            }
        //        }
        //    }
        //}

    }





    public enum ViewType
    {
        Users, Departments, Subjects, Classes
    }

}
