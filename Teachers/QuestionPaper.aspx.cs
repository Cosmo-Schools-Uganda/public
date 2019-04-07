using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class Teachers_QuestionPaper : System.Web.UI.Page
{
    ConfigFile ConfigFile = new ConfigFile();

    Exams ExData;
    DataBase Db;
    DataBase.Exams DbExams;

    List<object> RetrievedQuestions = new List<object>();

    Sections Secs = new Sections();

    /*Client-Side Code Operations[Scripts Inclusive] Not Used*/

    [WebMethod]
    [ScriptMethod]
    public static void DisplayData(int QuestionNumber)
    {
        //Teachers_QuestionBank_QuestionBanker QB = new Teachers_QuestionBank_QuestionBanker();

        //QB.TestCodeData = "TST008/005";
        //  QB.LoadData(QuestionNumber);

    }


    [WebMethod]
    [ScriptMethod]
    public static bool CheckForExistance(string TestCode, int QuestionNumber, int Section)
    {
        DataBase.Questions Questions = new DataBase.Questions(TestCode);
        bool rets = Questions.CheckForQuestionExistance(TestCode, QuestionNumber, Section);

        return rets;

    }

    [WebMethod]
    [ScriptMethod]
    public static void AddQuestion(Questionnaire Questionnaire)

    {

        DataBase.Questions Questions = new DataBase.Questions("");
        DataBase.QuestionStructure Qs = new DataBase.QuestionStructure();
        DataBase.Questions.ObjectivesContent Oc;

        Qs.QuestionNumber = Questionnaire.QuestionNumber;
        Qs.Question = Questionnaire.QuestionData;
        Qs.QuestionType = Questionnaire.SetType;

        List<Objective> ols = Questionnaire.Objectives;

        List<DataBase.Questions.ObjectivesContent> Ocl = new List<DataBase.Questions.ObjectivesContent>();

        foreach (Objective Obj in ols)
        {
            Oc = new DataBase.Questions.ObjectivesContent();
            Oc.Detail = Obj.ObjectiveData;
            Oc.validity = Obj.ObjectiveValidity;

            Ocl.Add(Oc);

        }

        Qs.Objectives = Ocl.ToArray();

        try
        {

            Questions.CaptureQuestionData(Qs);

        }
        catch
        {

        }
    }


    [WebMethod]
    [ScriptMethod]
    public static DataBase.QuestionStructure RetrieveData(int QuestionNumber, int Section)
    {
        DataBase.Questions Questions = new DataBase.Questions("TST008/005");

        DataBase.Questions.ObjectivesContent ObjCont = new DataBase.Questions.ObjectivesContent();
        DataBase.QuestionStructure Qs = new DataBase.QuestionStructure();

        Questions.RetrieveData(QuestionNumber, Section);
        Qs.QuestionNumber = Questions.QuestionSructure.QuestionNumber;

        Qs.Question = Questions.QuestionSructure.Question;
        Qs.QuestionType = Questions.QuestionSructure.QuestionType;
        Qs.Objectives = Questions.QuestionSructure.Objectives;

        return Qs;

    }

    [WebMethod]
    [ScriptMethod]
    public static int NextQuestionNumber()
    {

        //QuestionGenerator Qg = new QuestionGenerator();

        //int PreviousNumber = Qg.GetLastQuestionNumber("TST012/001/005");

        //int NextNumber = PreviousNumber + 1;

        //return NextNumber;

        return 1;

    }


    public string TestCode;

    protected void Page_Load(object sender, EventArgs e)
    {

        ExData = (Exams)Session["ExamData"];

        try
        {
            TestCode = ExData.ExamCode;

           // TestCode = "TST0041/005";

            MyBank.TestCodeData = this.TestCode;
            
            DbExams = new DataBase.Exams();

            DbExams.RetrieveExams(TestCode);
            
            PaperHeader.InnerText =DbExams.ExamName;

            string path = String.Format("C://Cosmo//Teachers/QuestionPaper/Exams/Config/{0}", DbExams.ExamData);

            System.Diagnostics.Debug.WriteLine("There is sec " + ExData.Sections);

            DropDownList SectionSelector = (DropDownList)MyBank.FindControl("SectionSelection");
                
            ConfigFile MyConfigurations = new ConfigFile(path,ExData.Sections);

            ConfigFile.Sections ConfigSections = new ConfigFile.Sections(path);

            Secs.Add(ConfigSections.SectionCount,ConfigSections.SectionWeight,QuestionPanel);
          
            DataBase.Questions Qs = new DataBase.Questions(TestCode);


            if (ConfigSections.SectionCount > 1)
            {
                SectionSelector.Visible = true;
            }
            else
            {
                SectionSelector.Visible = false;
            }

            /*Retrieve Question Paper Data from DataSet and Pass it into Table*/

            foreach (int Weight in ConfigSections.SectionWeight)
            {
                System.Diagnostics.Debug.WriteLine("The Ratio is: "+Weight.ToString());
            }

            Qs.RetrieveData();

            DataSet Ds = new DataSet();

            Ds = Qs.DataSet;

            /*Instance of Table Holding Question Data for The Exam Selected*/

            DataTable dt = new DataTable(); 

            dt = Ds.Tables[0];

            if (dt.Rows.Count > 0)
            {
                QuestionPanel.Style.Add(HtmlTextWriterStyle.BackgroundImage, "url(QuestionPaper/Images/CosmoPaperBackground.png)");
            }

            foreach (DataRow Dr in dt.Rows)
            {

                List<string> ls = new List<string>();

                if (Dr[3] != DBNull.Value)
                {
                    ls = ((string[])Dr[3]).ToList();
                }

                else
                {
                    ls = null;
                }


                AddQuestion(Convert.ToInt32(Dr[4]), Convert.ToInt32(Dr[2]), Convert.ToInt32(Dr[0]), Dr[1].ToString(), ls, null);

            }


        }
        catch
        {
            Response.Redirect("Tests.aspx");
        }
    }


    /*Function for Adding A Particular QuestionControl to the appropriate Section*/

    private void AddQuestion(int Section, int StructureType, int QuestionNumber, string QuestionContent, List<string> QuestionObjectives = null, string QuestionImageSource = null)
    {


        Students_Tests_QuestionControl_QuestionCont wt = LoadControl("~/Teachers/QuestionControl/QuestionCont.ascx") as Students_Tests_QuestionControl_QuestionCont;
        wt.StructureType = StructureType;
        wt.QuestionNumber = QuestionNumber.ToString();
        wt.Question = QuestionContent;
        wt.QuestImageSource = QuestionImageSource;
        wt.OptionsList = QuestionObjectives;
        Panel SectionPanel;

        try
        {
            
        SectionPanel = (Panel)QuestionPanel.Controls[Section];

      
            SectionPanel.Controls.Add(wt);

        }
        catch
        {
            QuestionPanel.Controls.Add(wt);
            
        }
        

    }



    private void ClearPreview()
    {
        QuestionPanel.Controls.Clear();
    }



    public class Sections
    {
        public string SectionName { get; set; }
        public int SectionWeight;
        public char[] SectionType;

        public Sections()
        {

        }


        public Sections(string SectionConfigurationFilePath)
        {
            Configurations Config = new Configurations();

            
        }
        public void Add(int Count,int [] Weights, HtmlGenericControl lt)
        {

            if (Count > 1)
            {

                for (int i = 0; i < Count; i++)
                {

                    SectionType = new char[] { 'A', 'B', 'C', 'D', 'E' };

                    SectionName = "Section" + " " + SectionType[i];

                    Panel p = new Panel();

                    p.ID = SectionName;

                    LiteralControl Section = new LiteralControl("<h3 class=''><b>" + SectionName + "</b></h3><span><h5>" + Weights[i]+ " Marks</h5></span><br/><br/>");
                    
                    p.Controls.Add(Section);

                    lt.Controls.Add(p);


                }

            }
            else
            {

            }

        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Tests.aspx");
    }
}