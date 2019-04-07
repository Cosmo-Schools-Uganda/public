using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Students_Tests_QuestionPaper : System.Web.UI.Page
{
    Sections Secs = new Sections();


    protected void Page_Init(object sender, EventArgs e)
    {
       // DateLabel.Text = new DateTime(DateTime.Now.Year, 3, 14).ToLongDateString();
       
    }

    private void AddQuestion(int Section,int StructureType,int QuestionNumber, string QuestionContent, string QuestionImageSource,List<string> QuestionObjectives)
    {

        Students_Tests_QuestionControl_QuestionCont wt = LoadControl("~/Students/Tests/QuestionControl/QuestionCont.ascx") as Students_Tests_QuestionControl_QuestionCont;
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

    protected void Page_Load(object sender, EventArgs e)
    {
      
        DataBase.Exams DbExams = new DataBase.Exams();

        DbExams.RetrieveExams(Convert.ToInt32(Session["IncomingPaper"]));
    
        string path = String.Format("C://Cosmo//Teachers/QuestionPaper/Exams/Config/{0}", DbExams.ExamData);

        ConfigFile.Sections ConfigSections = new ConfigFile.Sections(path);

        Secs.Add(ConfigSections.SectionCount, ConfigSections.SectionWeight, QuestionPanel);

        DataBase.Questions Quests = new DataBase.Questions(DbExams.ExamCode);

        Quests.RetrieveData();

        foreach (DataRow Row in Quests.DataSet.Tables[0].Rows)
        {

            List<string> ls = new List<string>();

            if (Row["Objective Data"] != DBNull.Value)
            {
                ls = ((string[])Row["Objective Data"]).ToList();
            }

            else
            {
                ls = null;
            }


            AddQuestion(Convert.ToInt32(Row["Section"]),Convert.ToInt32(Row["Question Type"]), Convert.ToInt32(Row["Question Number"]), Row["Question"].ToString(),null, ls);
        }

        
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
        public void Add(int Count, int[] Weights, HtmlGenericControl lt)
        {

            if (Count > 1)
            {

                for (int i = 0; i < Count; i++)
                {

                    SectionType = new char[] { 'A', 'B', 'C', 'D', 'E' };

                    SectionName = "Section" + " " + SectionType[i];

                    Panel p = new Panel();

                    p.ID = SectionName;

                    LiteralControl Section = new LiteralControl("<h3 class=''><b>" + SectionName + "</b></h3><span><h5>" + Weights[i] + " Marks</h5></span><br/><br/>");

                    p.Controls.Add(Section);

                    lt.Controls.Add(p);


                }

            }
            else
            {

            }

        }
    }

}