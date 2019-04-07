using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class Students_Tests_QuestionControl_QuestionCont : System.Web.UI.UserControl
{
    
    private bool QsBool = false;

    public struct QuestionStructure
    {
        public int ObjectiveType { get { return 1; } }
        public int StructuredType { get { return 2; } }

        public int Both { get { return 3; } }

    }

    public Students_Tests_QuestionControl_QuestionCont()
    {


    }

    public Students_Tests_QuestionControl_QuestionCont(string QuestImageSrc)
    {
        if (QsBool == true)
        {
            QuestImage.Visible = true;
   
        }

        else
        {

            QuestImage.Visible = false;

        }
        
    }



    private string QuestNumber;
    private int structure;
    
  
    


    public int StructureType
    {

      
        get
        {
            
            
            return structure;
        }

        set
        {
        

        
            structure = value;


        }

    }
    public string QuestionNumber
    {

        get
        {

            return QuestNumber;
        }
        set
        {

            QuestNumber = value;

        }

    }
    public string Question
    {

        get
        {

            return QuestionContent.InnerText;
        }

        set
        {

            QuestionContent.InnerText = QuestNumber +'.'+ " " + value;
        }
    }

    private void HideImage(bool result)
    {
        if (QuestImageSource != null)
        {
            QuestImage.Attributes.Add("class", "img-responsive  Qsimage");
            result = false;
        }
        else
        {
            
            result = true;
        }

        QuestImage.Visible = !result;

        
       
    }

    private List<string> Options;

    public List<string> OptionsList
    {

        get
        {

            return Options;

        }

        set
        {

            Options = value;

        }
    }

    private void StructureBoxDisplay(bool IsStructure)
    {

        
        if (structure == 1)
        {
            StructureBox.Visible = !IsStructure;
            //ObjectivesRadio.Visible = IsStructure;
            PopulateObjectives(OptionsList);
        }
        else if (structure == 2)
        {
            StructureBox.Visible = IsStructure;
            //ObjectivesRadio.Visible = !IsStructure;

        }

        else
        {
            
            StructureBox.Visible = IsStructure;
            //ObjectivesRadio.Visible = IsStructure;
            PopulateObjectives(OptionsList);
        }
    }

    private void PopulateObjectives(List<string> ls)
    {
        if (ls != null)
        {
            //ObjectivesRadio.RepeatColumns = ls.Count;
            //ObjectivesRadio.Border.BorderStyle = BorderStyle.None;

            foreach (string listelement in ls)
            {

                //ObjectivesRadio.Items.Add(listelement);

            }
        }
        else
        {

        }
    }

    public string QuestImageSource{

        get 
        {

            return QuestImage.ImageUrl;
        }

        set
        {

            QuestImage.ImageUrl = value;
            

        }
    }
    public Image QsImage
    {

        get
        {

            return QuestImage;
        }

        set
        {
            QuestImage = value;

        }

    }

    public bool IsQuestImage
    {

        get
        {
            if (QuestImageSource == null)
            {

                return false;
            }

            else
            {

                return true;
            }
        }

      
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //ASPxRadioButtonList1.RepeatColumns = 3;
        //ASPxRadioButtonList1.Border.BorderStyle = BorderStyle.None;
        //ASPxRadioButtonList1.Items.Add("Hello");
        //ASPxRadioButtonList1.Items.Add("Hey");

        HideImage(IsQuestImage);

        StructureBoxDisplay(true);
    
    }




}