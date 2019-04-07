using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for QuestionBank
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 

[System.Web.Script.Services.ScriptService]
public class QuestionBank : System.Web.Services.WebService {

   
    public string TestCode { get; set; }

    DataBase.QuestionStructure Qs;
    DataBase.Questions Questions;

    public QuestionBank()
    {

    }


    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
    

    [WebMethod]
    public DataBase.QuestionStructure GetQuestionData(string TestCode,int QuestionNumber,int Section)
    {
        
        Questions = new DataBase.Questions(TestCode);
        
        Qs = new DataBase.QuestionStructure();

        if (Questions.CheckForQuestionExistance(TestCode,QuestionNumber,Section))
        {
            Questions.RetrieveData(QuestionNumber,Section);
            Qs.QuestionNumber = Questions.QuestionSructure.QuestionNumber;
            Qs.Question = Questions.QuestionSructure.Question;
            Qs.QuestionType = Questions.QuestionSructure.QuestionType;
            Qs.Objectives = Questions.QuestionSructure.Objectives;
          
        }

        else
        {
            
        }

        return Qs;
    }

    [WebMethod]
    public void CaptureQuestionData(DataBase.QuestionStructure QStruct)
    {

        Questions = new DataBase.Questions(this.TestCode);

        Questions.CaptureQuestionData(QStruct);

    }


    
}
