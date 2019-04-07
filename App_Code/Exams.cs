using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;


/// <summary>
/// Summary description for Exams
/// </summary>
public class Exams
{

    DataBase Db = new DataBase();

    public int ExamId  { get;set; }
  
    public string ExamCode { get; set; }

    public string ExamName { get; set; }

    public int Sections { get; set; }

    public Exams()
    {
        
        //
        // TODO: Add constructor logic here
        //
    }

    //Constructor for Obtaining Already Existing exams
    public Exams(string ExamName)
    {
       
    }

    //Function To Create A New Exam
    public void NewExam()
    {
        
    }

   public void SaveExam()
    {

        
    }
}