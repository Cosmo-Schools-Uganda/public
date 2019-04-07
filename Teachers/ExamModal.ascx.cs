using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExamModal : System.Web.UI.UserControl
{
    Exams ExData;

    DataBase.Exams Exams = new DataBase.Exams();


    protected void Page_Init(object sender, EventArgs e)
    {

        
        

    }


    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!this.IsPostBack)
        //{
        //    Exams.BindGrid(ASPxListBox2, ASPxListBox1);
          
        //}

        //ASPxListBox1.DataBind();

    }



    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        DataBase Db = new DataBase();

        System.Diagnostics.Debug.WriteLine(PerformTask(Convert.ToInt32(label3.Value)));

        if (PerformTask(Convert.ToInt32(label3.Value)) == MenuOption.New)
        {

            System.Diagnostics.Debug.WriteLine(mel.Value);

            ExData = new Exams();

            ExData.ExamName = mel.Value;

            ExData.Sections = Convert.ToInt32(SectionSelection.Value);


            ExData.ExamCode = Exams.NewExam("SBT0005", 1 , ExData.ExamName,ExData.Sections);
            
            Session.Add("ExamData", ExData);


            Response.Redirect("QuestionPaper.aspx");
        }

        else if (PerformTask(Convert.ToInt32(label3.Value)) == MenuOption.Open)
        {

            ExData = new Exams();

            ExData.ExamCode = Label2.Value.ToString().Remove(0, 1);

            System.Diagnostics.Debug.WriteLine(Label2.Value);

            if (Session["ExamData"] == null)
            {
                Session.Add("ExamData", ExData);

            }
            else
            {
                Session["ExamData"] = ExData;
            }

            Response.Redirect("QuestionPaper.aspx");
        }

    }




    private MenuOption PerformTask(int OptionIndex)
    {

        MenuOption Opt = new MenuOption();

        switch (OptionIndex)
        {
            case 0:
                Opt = MenuOption.New;
                break;

            case 1:
                Opt = MenuOption.Open;
                break;

            case 3:
                Opt = MenuOption.Online;
                break;

            case 4:
                Opt = MenuOption.None;
                break;
        }

        return Opt;
    }


    public enum MenuOption
    {

        None, New, Open, Online
    }


    //protected void ASPxListBox2_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    Exams.BindGrid(ASPxListBox2, ASPxListBox1);

    
    //}

    //protected void Exams_Callback(object sender,DevExpress.Web.CallbackEventArgsBase e)
    //{
    //    Exams.BindGrid(ASPxListBox2, ASPxListBox1);
     
    //}
}