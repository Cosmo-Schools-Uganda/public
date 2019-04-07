using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

/// <summary>
/// Summary description for QuestionGenerator
/// </summary>
/// 



    

    //public void AddToTable(int questionnumber, string question, int questiontype, string[] objectives=null, string MediaLocation=null)
    //{
    //    DataRow Row = QuestionnaireData.NewRow();
    //    Row["Question Number"] = questionnumber;
    //    Row["Question"] = question;
    //    Row["Question Type"] = questiontype;
    //    Row["Objective Data"] = objectives;
    //    Row["Media Data"] = MediaLocation;

    //    QuestionnaireData.Rows.Add(Row);
      
    //}


public class QuestionGenerator
{
    DataColumn QuestionNumber = new DataColumn("Question Number");
    DataColumn Question = new DataColumn("Question");
    DataColumn MediaData = new DataColumn("Media Data");
    DataColumn QuestionType = new DataColumn("Question Type");
    DataColumn ObjectiveData = new DataColumn("Objective Data");

    GlobalConnection Gc = new GlobalConnection();

    GlobalConnection GC = new GlobalConnection();
    string Query = null;
    
    private string [] DataElementNames = new string [] {"QuestionNumber","Question","Quesetiontype","ObjectiveData","MediaData"};
	public QuestionGenerator()
	{
       
        

		//
		// TODO: Add constructor logic here
		//
	}


    
         

    public void AddObjective(string TestCode, int QuestionNumber, List<Objective> Objectives)
    {
        foreach (var ObjectiveData in Objectives)
        {
            using (var con = new SqlConnection(GC.ConnectionString))
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                else
                {

                }
                con.Open();

                Query = "AddOBjectives";

                using (var com = new SqlCommand(Query, con))
                {
                    com.CommandType = CommandType.StoredProcedure;

                    com.Parameters.Add(new SqlParameter("@setcode", TestCode));
                    com.Parameters.Add(new SqlParameter("@qtn_number", QuestionNumber));
                    com.Parameters.Add(new SqlParameter("@objective",ObjectiveData.ObjectiveData));                
                    com.Parameters.Add(new SqlParameter("@validation", ObjectiveData.ObjectiveValidity));

                    com.ExecuteNonQuery();

                    com.Dispose();

                }

                con.Close();
            }
        }
    }

    public int GetLastQuestionNumber(string TestCode)
    {

        int SelectedNumber;
        using (var con = new SqlConnection(GC.ConnectionString))
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            else
            {

            }
            con.Open();

            Query = "select [dbo].LastQstNumber(@Test_Code)";

            using (var com = new SqlCommand(Query, con))
            {
                com.Parameters.Add(new SqlParameter("@Test_code",TestCode));

                var number = com.ExecuteScalar();
                SelectedNumber = (int)number;
            
            }

        }

        return SelectedNumber;
    }

    public DataTable RetrieveQuestionnaireData(string TestCode)
    {
        DataTable Dt = new DataTable();

        QuestionNumber.DataType = System.Type.GetType("System.Int32");
        Dt.Columns.Add(QuestionNumber);


        Question.DataType = System.Type.GetType("System.String");
        Dt.Columns.Add(Question);


        QuestionType.DataType = System.Type.GetType("System.Int32");
        Dt.Columns.Add(QuestionType);


        ObjectiveData.DataType = System.Type.GetType("System.String");
        Dt.Columns.Add(ObjectiveData);


        MediaData.DataType = System.Type.GetType("System.String");
        Dt.Columns.Add(MediaData);

        using (var con = new SqlConnection(GC.ConnectionString))
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            else
            {

            }
            
            con.Open();

            Query="Select * from Temporary_Questions where Temporary_Questions.set_id=(select set_id from Tests where test_code='"+TestCode+"')";
            
            using (var com = new SqlCommand(Query, con))
            {
                SqlDataReader Reader = com.ExecuteReader();

                while (Reader.Read())
                {

                    DataRow Drow = Dt.NewRow();

                    Drow["Question Number"] = Convert.ToInt32(Reader["qtn_number"].ToString());
                    Drow["Question"] = Reader["detail"].ToString();
                    Drow["Question Type"] = Convert.ToInt32(Reader["qtn_type"].ToString());
                   // Drow["Objective Data"] = objectives;
                    Drow["Media Data"] = null;

                   // Questionaire.AddToTable(Convert.ToInt32(Reader["qtn_nummber"].ToString()), Reader["detail"].ToString(),Convert.ToInt32(Reader["qtn_type"].ToString()), Reader[""], Reader[""]);
                }
            }
        }

        return Dt;
    }

    public void AddQuestion(string TestCode, int QuestionNumber, string Question, int QuestionType)
    {
        using (var con = new SqlConnection(GC.ConnectionString))
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            else
            {

            }
            con.Open();

            Query = "CaptureQuestion";

            using (var com = new SqlCommand(Query, con))
            {
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.Add(new SqlParameter("@TestCode", TestCode));
                com.Parameters.Add(new SqlParameter("@QuestionType", QuestionType));
                com.Parameters.Add(new SqlParameter("@QuestionNumber", QuestionNumber));
                com.Parameters.Add(new SqlParameter("@Question", Question));
                com.Parameters.Add(new SqlParameter("@imagepath", null));

                com.ExecuteNonQuery();

                com.Dispose();
            }

            con.Close();
        }
    }

}