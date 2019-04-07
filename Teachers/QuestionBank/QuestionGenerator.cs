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
public class QuestionGenerator
{

    GlobalConnection GC = new GlobalConnection();
    string Query = null;
    
    

    public QuestionGenerator()
	{

        
		//
		// TODO: Add constructor logic here
		//
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


                com.ExecuteNonQuery();

                com.Dispose();
            }

            con.Close();
        }
    }

}